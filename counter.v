module counter(clock_div_1Hz,total_reset,current_time,round_reset);

input clock_div_1Hz,total_reset;
output[6:0]current_time;
output round_reset;

reg [6:0]current_time;
reg round_reset;

always@(posedge clock_div_1Hz or negedge total_reset)
begin
	if(~total_reset)
	begin
		current_time<=7'b0000000;
		round_reset<=0;
	end
	else
	begin
		current_time<=current_time+7'b0000001;
		if(current_time==7'd12)
		begin
			current_time<=7'b0000000;
			round_reset=0;
		end
		else
			round_reset<=1;
	end

end

endmodule 