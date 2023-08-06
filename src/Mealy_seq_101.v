module Mealy_seq_101(
input clk, reset_n,
input x,
output y
    );
reg [1:0] state_reg, state_next;    
localparam s0 = 2'b00;
localparam s1 = 2'b01;
localparam s2 = 2'b10;
//localparam s3 = 2'b11;
    
always @(posedge clk, negedge reset_n)
begin
    if(!reset_n) 
    state_reg <= 2'b00;
    else
    state_reg <= state_next;   
end 
always @(*)
begin
    case (state_reg)
        s0: if(x)
            state_next = s1;
            else
            state_next = s0;
        s1: if(x)
            state_next = s1;
            else
            state_next = s2;
        s2: if(x)
            state_next = s1;
            else
            state_next = s0;
        default: state_next = state_reg;
    endcase
end
assign y = (state_reg == s2 && x);
endmodule
