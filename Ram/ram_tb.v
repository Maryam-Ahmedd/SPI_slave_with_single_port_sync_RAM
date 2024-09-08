module ram_tb;
    reg [9:0] din;
    reg clk;
    reg rst_n;
    reg rx_valid;
    wire [7:0] dout;
    wire tx_valid;

    // Instantiate the RAM module (Device Under Test)
    ram dut (
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
        $readmemb("ram.dat", dut.mem);  // Load initial values from ram.dat
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

        // Test Case 1 : Provide address (0x05) and write value (0xBB)
        @(negedge clk);
        din = 10'b0000000101;  // Set address 0x05
        rx_valid = 1;
        @(negedge clk);
        rx_valid = 0;
        @(negedge clk);
        din = 10'b0110111011;  // Write value 0xBB
        rx_valid = 1;
        @(negedge clk);
        rx_valid = 0;

        // Test Case 2: Provide address (0x06) and write value (0xCC)
        #10;
        @(negedge clk);
        din = 10'b0000000110;  // Set address 0x06
        rx_valid = 1;
        @(negedge clk);
        rx_valid = 0;
        @(negedge clk);
        din = 10'b0111001100;  // Write value 0xCC
        rx_valid = 1;
        @(negedge clk);
        rx_valid = 0;

        // Check for Test Case 3: Read value from address (0x05)
        #10;
        @(negedge clk);
        din = 10'b1000000101;  // Read from address 0x05
        rx_valid = 1;
        @(negedge clk);
        rx_valid = 0;
        @(negedge clk);
        din = 10'b1111001100;  
        rx_valid = 1;
        #10;
        if (tx_valid) begin
            $display("Data read from address 0x05: %h", dout);  // Expecting 0xBB
        end else begin
            $display("No valid data read from address 0x05");
        end

        // Check for Test Case 4: Read value from address (0x06)
        #10;
        @(negedge clk);
        din = 10'b1000000110;  // Read from address 0x06
        rx_valid = 1;
        @(negedge clk);
        rx_valid = 0;
        @(negedge clk);
        din = 10'b1111001100;  
        rx_valid = 1;
        #10;
        if (tx_valid) begin
            $display("Data read from address 0x06: %h", dout);  // Expecting 0xCC
        end else begin
            $display("No valid data read from address 0x06");
        end

        // New Test Case: Modify value at address 0x05
        #10;
        @(negedge clk);
        din = 10'b0000000101;  // Set address 0x05
        rx_valid = 1;
        @(negedge clk);
        rx_valid = 0;
        @(negedge clk);
        din = 10'b0111001100;  // Write new value 0xCC at address 0x05
        rx_valid = 1;
        @(negedge clk);
        rx_valid = 0;

        // Check modified value from address 0x05
        #10;
        @(negedge clk);
        din = 10'b1000000101;  // Read from address 0x05 again
        rx_valid = 1;
        @(negedge clk);
        rx_valid = 0;
        @(negedge clk);
        din = 10'b1111001100;  
        rx_valid = 1;
        #10;
        if (tx_valid) begin
            $display("Modified data read from address 0x05: %h", dout);  // Expecting 0xCC
        end else begin
            $display("No valid data read after modification");
        end

        // Finish simulation
        #50;
        $stop;
    end
endmodule
