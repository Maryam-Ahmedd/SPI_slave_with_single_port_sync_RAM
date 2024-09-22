module SPI (
    input MOSI, 
    input SS_n, 
    input clk, 
    input rst_n, 
    input tx_valid,
    input [7:0] tx_data,
    output reg MISO,
    output reg rx_valid,
    output reg [9:0] rx_data
);
    parameter IDLE = 0;
    parameter CHK_CMD = 1;
    parameter WRITE = 2;
    parameter READ_ADD = 3;
    parameter READ_DATA = 4;

    reg [2:0] cs, ns;  // State registers
    reg count;
    reg wait_tx ; 
    

    //state memory
    always @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            cs<= IDLE;
        end
        else
            cs<= ns;
    end

    //next state
    always @(cs or SS_n or MOSI) begin
        case (cs)
            IDLE : begin
                if (SS_n == 0)
                    ns <= CHK_CMD;
                else
                    ns <= IDLE;
            end 
            CHK_CMD : begin
                if (SS_n == 1)
                    ns <= IDLE;
                else if (MOSI == 0)
                    ns <= WRITE;
                else if (count == 0) begin
                    ns <= READ_ADD;
                    count <= 1;
                end else begin
                  ns <= READ_DATA;
                   count <= 0;  
                end 
                    
            end 
            WRITE : begin
                if (SS_n == 1)
                    ns <= IDLE;
                else 
                    ns <= WRITE;
            end 
            READ_ADD : begin
                if (SS_n == 1)
                    ns <= IDLE;
                else 
                    ns <= READ_ADD;
            end 
            READ_DATA : begin
                if (SS_n == 1)
                    ns <= IDLE;
                else 
                    ns <= READ_DATA;
            end 
        endcase
    end

    // Counter to keep track of bit position
    reg [3:0] bit_counter;
    reg [2:0] out_counter;
    
    //output logic
    always @(posedge clk) begin
        if (~rst_n) begin
            bit_counter <= 4'b1001;  // Initialize to 9 during reset
            out_counter <= 3'b111; 
            count <= 0;
            rx_valid <= 0;
            wait_tx =0;
        end else begin
            // Write address and data
            if (cs == WRITE && SS_n == 0) begin
                if (bit_counter > 0) begin
                    rx_data[bit_counter] <= MOSI;   // Shift in MOSI bit by bit
                    bit_counter <= bit_counter - 1; // Countdown
                    rx_valid <= 0;
                end else begin
                    rx_data[bit_counter] <= MOSI;   // Last bit
                    bit_counter <= 9;               // Reset counter to 9 after 10 bits
                    rx_valid <= 1;                  // Data is ready
                end
            end

            // Read address
            if (cs == READ_ADD && SS_n == 0) begin
                if (bit_counter > 0) begin
                    rx_data[bit_counter] <= MOSI;   // Shift in MOSI bit by bit
                    bit_counter <= bit_counter - 1; // Countdown
                    rx_valid <= 0;
                end else begin
                    rx_data[bit_counter] <= MOSI;   // Last bit
                    bit_counter <= 9;               // Reset counter
                    rx_valid <= 1;                  // Address is ready
                end
            end

            // Read data
            if (cs == READ_DATA && SS_n == 0) begin
                if (tx_valid == 1) begin  
                    if (out_counter > 0) begin
                        MISO <= tx_data[out_counter];  // Output data bit by bit
                        out_counter <= out_counter - 1; // Countdown
                    end else begin
                        MISO <= tx_data[out_counter];  // Last bit
                        out_counter <= 7;              // Reset counter after data transfer
                        wait_tx =0;
                    end
                end else if (tx_valid == 0&& (~wait_tx)) begin
                    if (bit_counter > 0) begin
                        rx_data[bit_counter] <= MOSI;   // Shift in MOSI bit by bit
                        bit_counter <= bit_counter - 1; // Countdown
                        rx_valid <= 0;
                    end else begin
                        rx_data[bit_counter] <= MOSI;   // Last bit
                        bit_counter <= 9;               // Reset counter
                        rx_valid <= 1;                  // Data is ready
                        wait_tx =1;
                    end
                end
            end
        end
    end
endmodule