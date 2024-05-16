module FINAL(clock,total_reset,ball_input,gp_input,dot_row,dot_col,countdown_out,score_out1,score_out2,current_player_out);

input clock,total_reset;
input [1:0]ball_input;//1-6
input [1:0]gp_input;//1-3
output [7:0]dot_row;
output [7:0]dot_col;
output [6:0]countdown_out;
output [6:0]score_out1;
output [6:0]score_out2;
output [6:0]current_player_out;

wire clock_div_10000Hz;
wire clock_div_1Hz;


wire [3:0]row_ball;
wire [7:0]dot_col_ball;
wire [3:0]row_gp;
wire [7:0]dot_col_gp;

wire [7:0]dot_col_win;	
wire start;
wire [3:0]count;
wire goal;
wire [2:0]current_score1;
wire [2:0]current_score2;
wire [1:0]finish;
wire round_reset;
wire [6:0]current_time;
wire [3:0]current_player;

//這塊是給你們放除頻器的
Freq_div_10000Hz(.clock(clock),.reset(total_reset),.clk_div(clock_div_10000Hz));//點矩陣同步//10000Hz
Freq_div_1Hz(.clock(clock),.reset(total_reset),.clk_div(clock_div_1Hz));//1Hz
//有要多塞的到時自己放進來


counter(.clock_div_1Hz(clock_div_1Hz),.total_reset(total_reset),.current_time(current_time),.round_reset(round_reset));

//part a
countdown(.clock_div(clock_div_1Hz),.reset(round_reset),.start(start),.count(count));//倒數完後傳出start訊號
//輸入  倒數的除頻，下一局?//輸出  開始?，倒數
Seg7(.count(count),.out(countdown_out));//轉七段顯示



//part c
//輸入     點陣clock，球的row，球的col，守門員的row，守門員的col，遊戲結束了嗎? //輸出 動畫跑完之後輸出round_reset重置小局，點矩陣的row，點矩陣的col，進球的時候傳1(沒接到就傳0)
animation(.clock(clock),.reset(round_reset), .user1(ball_input), .user2(gp_input), .count_out2(current_time),.finish(finish), .dot_row(dot_row), .dot_col(dot_col), .goal(goal));


//part a

switch_player(.current_player(current_player),.round_reset(round_reset));
score(.goal(goal),.total_reset(total_reset),.current_score1(current_score1),.current_score2(current_score2),.current_player(current_player),.finish(finish));
//輸入 重置整把(分數歸0)，round這把有進球嗎?//輸出當前成績，如果>=5分就結束遊戲
Seg7(.count(current_score1),.out(score_out1));
Seg7(.count(current_score2),.out(score_out2));
Seg7(.count(current_player),.out(current_player_out));


//轉七段 

endmodule 