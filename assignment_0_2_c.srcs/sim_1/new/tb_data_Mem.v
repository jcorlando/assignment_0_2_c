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
    DMA  <= 32'h00000100;
    DMWD <= 32'haaaaaaaa;
end
always #50 CLK <= ~CLK;
//Instantiate DUT
data_Mem DUT( .CLK(CLK), .DMWE(DMWE), .DMA(DMA), .DMWD(DMWD), .DMRD(DMRD) );

initial
begin
    @(posedge CLK);
    @(posedge CLK);
    @(posedge CLK);
    @(posedge CLK);
    @(posedge CLK);
end




endmodule



