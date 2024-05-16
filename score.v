module score(goal,total_reset,current_score1,current_score2,current_player,finish);
output [3:0] current_score1;
output [3:0] current_score2;
input goal,total_reset;

output [1:0]finish;
input[3:0] current_player;
reg [3:0]current_score1;
reg [3:0]current_score2;
reg [1:0]finish;

always@(posedge goal or negedge total_reset)
begin
	if(!total_reset)
	begin
		current_score1<=0;
		current_score2<=0;
		finish=0;
	end
	else if(current_player==0)
    begin
        current_score1=current_score1+4'd1;
        if(current_score1==4'd5)
        begin
            finish=1;
				current_score1<=0;
				current_score2<=0;
        end
        else
            finish=0;
    end
    else
    begin
        current_score2=current_score2+4'd1;
        if(current_score2==4'd5)
        begin
            finish=2'd2;
				current_score1<=0;
				current_score2<=0;
        end
        else
            finish=0;
    end
end


endmodule
