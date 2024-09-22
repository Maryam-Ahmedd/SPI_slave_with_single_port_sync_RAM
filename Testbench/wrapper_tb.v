module SPI_Wrapper_tb ();
    parameter MEM_DEPTH = 256;
    parameter ADDR_SIZE = 8;

    reg clk, rst_n, SS_n, MOSI;
    wire MISO;
    integer i;

    // Instantiate the DUT (spi_wrapper)
    spi_wrapper DUT (clk, rst_n ,MOSI, SS_n,  MISO);

    // Clock Generation
    initial begin
        clk = 0;
        forever #1 clk = ~clk; // 1 unit time clock period
    end

    // Initialize memory with values from "ram.dat"
    initial begin
        // Load memory with initial values
        $readmemb("ram.dat", DUT.ramBlock.mem); 

        rst_n = 0;
        SS_n = 1;
        MOSI = 0;

        // Reset sequence
        repeat(5) @(negedge clk);
        rst_n = 1;
        repeat(5) @(negedge clk);

        // --- first Test Case: Write and Read from Address 0xFF ---

        // Start Writing to Address 0xFF
        SS_n = 0; // Assert SS_n (slave select)
        repeat(4) @(negedge clk); // Give some initial delay

        // Send 8-bit address (0xFF)
        for (i = 0; i < 8; i = i + 1) begin
            MOSI = 1; // Bit value for 0xFF
            @(negedge clk);
        end
        SS_n = 1; // Deassert SS_n
        repeat(4) @(negedge clk); // Wait for a few clock cycles

        // Write Data 8'hab to Address 0xFF
        SS_n = 0; // Assert SS_n again to write data
         MOSI = 0;
        repeat(3) @(negedge clk);
        MOSI = 1; @(negedge clk); 
        MOSI = 1; @(negedge clk); 
        MOSI = 0; @(negedge clk); 
        MOSI = 1; @(negedge clk); 
        MOSI = 0; @(negedge clk); 
        MOSI = 1; @(negedge clk); 
        MOSI = 0; @(negedge clk); 
        MOSI = 1; @(negedge clk); 
        MOSI = 1; @(negedge clk); 

        SS_n = 1; // Deassert SS_n
        repeat(4) @(negedge clk); // Wait a few clock cycles

        // Display the memory content after writing to address 0xFF
        $display("Written Data at Address 0xFF: %h", DUT.ramBlock.mem[8'hFF]);

        // --- Read the Data from Address 0xFF ---
        MOSI = 1;
        SS_n = 0; // Assert SS_n
        repeat(3) @(negedge clk);
        MOSI = 0; @(negedge clk); 
        for (i = 0; i < 8; i = i + 1) begin
            MOSI = 1; // Bit value for 0xFF
            @(negedge clk);
        end
        SS_n = 1; // Deassert SS_n
        repeat(4) @(negedge clk); // Wait a few clock cycles

        MOSI = 1;
        SS_n = 0; // Assert SS_n
        repeat(3) @(negedge clk);
        for (i = 0; i < 9; i = i + 1) begin
            MOSI = 1; 
            @(negedge clk);
        end
        repeat(9) @(negedge clk); // Wait for some cycles for MISO output

        // Check if data is valid
        if (DUT.spiBlock.tx_valid) begin
            $display("Data read from Address 0xFF: %h", DUT.ramBlock.dout); // Should match 10'h3FF
        end else begin
            $display("No valid data read from Address 0xFF.");
        end

        SS_n = 1; // Deassert SS_n
        repeat(4) @(negedge clk); // Wait a few clock cycles
        

        // --- second Test Case: Write and Read from Address 0x00 ---

        rst_n = 0;
        repeat(5) @(negedge clk);

        // Start Writing to Address 0x00
        rst_n = 1;     @(negedge clk);
        MOSI = 0;
        SS_n = 0; // Assert SS_n (slave select)
        repeat(4) @(negedge clk); // Give some initial delay

        for (i = 0; i < 8; i = i + 1) begin
            MOSI = 0; 
            @(negedge clk);
        end
        SS_n = 1; // Deassert SS_n
        repeat(4) @(negedge clk); // Wait for a few clock cycles

        // Write Data 8'h44 to Address 0x00
        SS_n = 0; // Assert SS_n again to write data
         MOSI = 0;
        repeat(3) @(negedge clk);
        MOSI = 1; @(negedge clk); 
        MOSI = 0; @(negedge clk); 
        MOSI = 1; @(negedge clk); 
        MOSI = 0; @(negedge clk); 
        MOSI = 0; @(negedge clk); 
        MOSI = 0; @(negedge clk); 
        MOSI = 1; @(negedge clk); 
        MOSI = 0; @(negedge clk); 
        MOSI = 0; @(negedge clk); 

        SS_n = 1; // Deassert SS_n
        repeat(4) @(negedge clk); // Wait a few clock cycles

        // Display the memory content after writing to address 0xFF
        $display("Written Data at Address 0xF0: %h", DUT.ramBlock.mem[8'h00]);

        // --- Read the Data from Address 0x00 
        MOSI = 1;
        SS_n = 0; // Assert SS_n
        repeat(3) @(negedge clk);
        MOSI = 0; @(negedge clk); 
        for (i = 0; i < 8; i = i + 1) begin
            MOSI = 0; 
            @(negedge clk);
        end
        SS_n = 1; // Deassert SS_n
        repeat(4) @(negedge clk); // Wait a few clock cycles
        MOSI = 1;
        SS_n = 0; // Assert SS_n
        repeat(3) @(negedge clk);
        for (i = 0; i < 9; i = i + 1) begin
            MOSI = 1; 
            @(negedge clk);
        end
        repeat(9) @(negedge clk); // Wait for some cycles for MISO output

        // Check if data is valid
        if (DUT.spiBlock.tx_valid) begin
            $display("Data read from Address 0x00: %h", DUT.ramBlock.dout); // Should match 10'h3FF
        end else begin
            $display("No valid data read from Address 0x00.");
        end
        SS_n = 1; // Deassert SS_n
        // Finish simulation
        #10;
        $stop;
    end
endmodule
