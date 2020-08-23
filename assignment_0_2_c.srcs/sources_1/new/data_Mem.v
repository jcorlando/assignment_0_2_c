`timescale 1ns / 1ps

module data_Mem
(
    input CLK, DMWE,
    input [31:0] DMA, DMWD,
    output [31:0] DMRD
);
    
    reg [31 : 0] ram[63 : 0];
    
    assign DMRD = ram[DMA[31 : 2]];
    
    always @ (posedge CLK)
    if (DMWE) ram[DMA[31 : 2]] <= DMWD;
    
    
endmodule


