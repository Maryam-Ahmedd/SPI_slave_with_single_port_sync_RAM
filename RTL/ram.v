module ram (
    input [9:0] din,        
    input clk,               
    input rst_n,             
    input rx_valid,          
    output reg [7:0] dout,   
    output reg tx_valid      
);
    parameter MEM_DEPTH = 256;
    parameter ADDR_SIZE = 8;

    reg [ADDR_SIZE-1:0] mem [MEM_DEPTH-1:0]; 
    reg [ADDR_SIZE-1:0] addr;      
    always @(posedge clk ) begin
        if (!rst_n) begin
            addr <= 0;
            dout <= 0;
            tx_valid <= 0;
        end else if (rx_valid) begin
            if (din[9] == 1'b0) begin 
                if (din[8] == 1'b0) begin
                    addr <= din[7:0]; 
                end else if (din[8] == 1'b1) begin
                    mem[addr] <= din[7:0]; 
                end
                tx_valid <= 1'b0; 
            end else if (din[9] == 1'b1) begin 
                if (din[8] == 1'b0) begin
                    addr <= din[7:0]; 
                    tx_valid <= 1'b0; 
                end else if (din[8] == 1'b1) begin
                    dout <= mem[addr]; 
                    tx_valid <= 1'b1; 
                end
            end
        end else begin
            tx_valid <= 1'b0; 
        end
    end
endmodule
