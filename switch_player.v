module switch_player(round_reset,current_player);
input round_reset;
output [3:0]current_player;
reg [3:0]current_player;

always@(negedge round_reset)
begin
if(current_player==4'd1)
	current_player<=4'd0;
else
	current_player<=4'd1;
end

endmodule
