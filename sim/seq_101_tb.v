module seq_101_tb();
reg clk, reset_n, x;
wire Mealy, Moore;

Mealy_seq_101 uut1(
    .clk(clk),
    .reset_n(reset_n),
    .x(x),
    .y(Mealy)
);

Moore_seq_101 uut2(
    .clk(clk),
    .reset_n(reset_n),
    .x(x),
    .y(Moore)
);
localparam T = 10;
always 
begin
    clk = 1'b0;
    #(T/2)
    clk = 1'b1;
    #(T/2);
end
initial 
begin
reset_n = 1'b0;
#T
reset_n = 1'b1;
x = 1'b0;
#T
x = 1'b1;
#T
x = 1'b0;
#T
x = 1'b1;
#(4*T)
x = 1'b0;
#5
x = 1'b1;
#(4*T)
x = 1'b0;
#T;
$stop;
end
endmodule
