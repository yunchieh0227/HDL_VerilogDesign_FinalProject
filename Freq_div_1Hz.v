`define TimeExpire 32'd25000000

module Freq_div_1Hz(clock,reset,clk_div);
input clock,reset;

reg clk_div;
output clk_div;
reg [31:0]count;

always@(posedge clock or negedge reset)
begin
    if(~reset)
    begin
        count<=0;
        clk_div<=0;
    end
    else
    begin

        if(count==`TimeExpire)
        begin
            clk_div<=~clk_div;
            count<=0;
        end
        else
        begin
            count<=count+1;
        end
    end

end
endmodule
