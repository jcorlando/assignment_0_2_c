`timescale 1ns / 1ps

module tb_data_Mem;

// Parameters
parameter WL = 32, WL_addr = 32, MEM_Depth = 64;
//Inputs
reg CLK;
reg DMWE;
reg [WL_addr - 1 : 0] DMA;
reg [WL - 1 : 0] DMWD;
//Outputs
wire [WL - 1 : 0] DMRD;
// Clock generation
initial
begin
    CLK <= 0;
    DMWE <= 0;
    DMA  <= 32'h000000dc;
    DMWD <= 32'h11111111;
end
always #50 CLK <= ~CLK;
//Instantiate DUT
data_Mem # ( .WL(WL), .WL_addr(WL_addr), .MEM_Depth(MEM_Depth) )
            DUT( .CLK(CLK), .DMWE(DMWE), .DMA(DMA), .DMWD(DMWD), .DMRD(DMRD) );

initial
begin
    @(posedge CLK);
    DMWE <= 1;
    DMA  <= 32'h000000dc;
    @(posedge CLK);
    DMWE <= 0;
    DMA  <= 32'h000000dc;
    @(posedge CLK);
    DMA  <= 32'h000000dc;
    @(posedge CLK);
    DMA  <= 32'h000000e8;
    @(posedge CLK);
    DMA  <= 32'h000000ec;
    @(posedge CLK);
    DMA  <= 32'h000000f0;
    @(posedge CLK);
    DMA  <= 32'h000000f4;
    @(posedge CLK);
    DMA  <= 32'h000000f8;
    @(posedge CLK);
    DMA  <= 32'h000000fc;
    @(posedge CLK);
    DMA  <= 32'h00000100;
end

endmodule
