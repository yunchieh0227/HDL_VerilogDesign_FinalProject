module countdown(clock_div,reset,start,count);
input clock_div,reset;
output start;
output[3:0]count;
reg [3:0]count;

always@(posedge clock_div or negedge reset)
begin
    if(!reset)
		begin
        count<=3;
		end
    else
    begin
		if(count==0)
		count<=0;
		else
		count<=count-1;
		
	end
end

endmodule
