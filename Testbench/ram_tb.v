module ram_tb;
    reg [9:0] din;
    reg clk;
    reg rst_n;
    reg rx_valid;
    wire [7:0] dout;
    wire tx_valid;

    // Instantiate the RAM module (Device Under Test)
    ram uut (
        .din(din),
        .clk(clk),
        .rst_n(rst_n),
        .rx_valid(rx_valid),
        .dout(dout),
        .tx_valid(tx_valid)
    );

    // Clock generation with negedge sensitivity
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time units period
    end

    // Initialize RAM with values from ram.dat
    initial begin
        $readmemh("ram.dat", uut.mem);  // Load initial values from ram.dat
    end

    // Test procedure
    initial begin
        // Initialize signals
        rst_n = 0;
        din = 10'b0;
        rx_valid = 0;
        
        // Reset
        #10;
        rst_n = 1;  // Release reset

        // Test Case 1: Provide an address (0x05), then wait
        @(negedge clk);
        din = 10'b0010000101;  // din[9:8] = 00 (set address), address = 5
        rx_valid = 1;
        @(negedge clk);
        rx_valid = 0;

        // Test Case 2: Write a value (0xBB) to the previously set address (0x05)
        #20;  // Wait a bit
        @(negedge clk);
        din = 10'b0011001011;  // din[9:8] = 01 (write), data = 0xBB
        rx_valid = 1;
        @(negedge clk);
        rx_valid = 0;

        // Test Case 3: Set another address (0x06)
        #10;
        @(negedge clk);
        din = 10'b0010000110;  // Set address 0x06
        rx_valid = 1;
        @(negedge clk);
        rx_valid = 0;

        // Test Case 4: Write a value (0xCC) to the new address (0x06)
        #10;
        @(negedge clk);
        din = 10'b0011001100;  // Write value 0xCC
        rx_valid = 1;
        @(negedge clk);
        rx_valid = 0;

        // Test Case 5: Read the value from address (0x05)
        #10;
        @(negedge clk);
        din = 10'b1100000101;  // din[9:8] = 11 (read), address = 5
        rx_valid = 1;
        @(negedge clk);
        rx_valid = 0;

        // Wait for data to be available and check output
        #10;
        if (tx_valid) begin
            $display("Data read from address 0x05: %h", dout);  // Expecting 0xBB
        end else begin
            $display("No valid data read");
        end

        // Finish simulation after some time
        #50;
        $finish;
    end
endmodule
