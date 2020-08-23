`timescale 1ns / 1ps

module tb_data_Mem;

//Inputs
reg CLK;
reg DMWE;
reg [31:0] DMA;
reg [31:0] DMWD;
//Outputs
wire [31:0] DMRD;
// Clock generation
initial
begin
    CLK <= 0;
    DMWE <= 0;
    DMA  <= 32'h000000d8;
    DMWD <= 32'h11111111;
end
always #50 CLK <= ~CLK;
//Instantiate DUT
data_Mem DUT( .CLK(CLK), .DMWE(DMWE), .DMA(DMA), .DMWD(DMWD), .DMRD(DMRD) );

initial
begin
    @(posedge CLK);
    DMA  <= 32'h000000dc;
    @(posedge CLK);
    DMA  <= 32'h000000e0;
    @(posedge CLK);
    DMA  <= 32'h000000e4;
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
