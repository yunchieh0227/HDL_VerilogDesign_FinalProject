module initial_reset(total_reset, round_reset);
// This module accepts the first total_reset input(switch or button), then change round_reset from 0 to 1a
input total_reset;
output round_reset;
reg round_reset;

always@(posedge total_reset)
begin
	round_reset<=1;
end


endmodule
