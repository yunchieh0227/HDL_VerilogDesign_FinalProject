`define TimeExpire 32'd5000
`define TimeExpire2 32'd50000000

module animationFinale(clock, reset, user1, user2, count_out2, finish, dot_row, dot_col, goal);

	input clock, reset;
	input [1:0]finish;//0=not finish,1=p1win,2=p2win
	input [1:0]user1;//ball
	input [1:0]user2;//
	input [6:0]count_out2;//second

	output [7:0]dot_row;
	output [7:0]dot_col;
	output goal;

	reg [2:0]count_out1;//which row to print
	//reg [6:0]count_out2;//second

	reg div_clk;
	reg goal = 0;

	reg [7:0]dot_col = 8'b00000000;
	reg [7:0]dot_row = 8'b00000000;

	reg [31:0] count1;
	//reg [31:0] count2; 

always@(count_out2)
		begin
			if(count_out2 == 8)
				begin
					if(user1 == user2)
						goal <= 0;
					else
						goal<=1;
				end
			else 
			begin
				goal<=0;
			end
		end
		
always@(posedge clock or negedge reset)
		begin
			if(!reset) 
				begin
					dot_col <= 8'b00000000;
					dot_row <= 8'b11111111;
					count1 <= 32'd0;
					//count2 <= 32'd0;
					div_clk <= 1'b0;
					count_out1 <= 3'd0;
					//count_out2 <= 6'd0;
				end
			else
				begin      
					if(count1 == `TimeExpire)
						begin
							count1 <= 32'd1;
							count_out1 <= count_out1 + 3'd1;
						end
					else
						begin	
							count1 <= count1 + 32'd1;
						end
						
						
					if(finish ==1)
					begin
						case(count_out1)
														3'd0: dot_col <= 8'b11001100;
														3'd1: dot_col <= 8'b10100100;
														3'd2: dot_col <= 8'b11000100;
														3'd3: dot_col <= 8'b10001110;
														3'd4: dot_col <= 8'b00000000;
														3'd5: dot_col <= 8'b01010100;
														3'd6: dot_col <= 8'b01111100;
														3'd7: dot_col <= 8'b01111100;
						endcase
										
						case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
						endcase
					end
					else if(finish==2)
					begin
						case(count_out1)
														3'd0: dot_col <= 8'b11001110;
														3'd1: dot_col <= 8'b10100010;
														3'd2: dot_col <= 8'b11001110;
														3'd3: dot_col <= 8'b10001000;
														3'd4: dot_col <= 8'b10001110;
														3'd5: dot_col <= 8'b01010100;
														3'd6: dot_col <= 8'b01111100;
														3'd7: dot_col <= 8'b01111100;
						endcase
										
						case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
						endcase
					end
					else if(count_out2 < 6'd01)
						begin
							case(count_out1)
											3'd0: dot_col <= 8'b11000000;
											3'd1: dot_col <= 8'b10000000;
											3'd2: dot_col <= 8'b10000000;
											3'd3: dot_col <= 8'b11000001;
											3'd4: dot_col <= 8'b11000000;
											3'd5: dot_col <= 8'b10000000;
											3'd6: dot_col <= 8'b10000000;
											3'd7: dot_col <= 8'b11000000;
							endcase
							
							case(count_out1)
											3'd0: dot_row <= 8'b01111111;
											3'd1: dot_row <= 8'b10111111;
											3'd2: dot_row <= 8'b11011111;
											3'd3: dot_row <= 8'b11101111;
											3'd4: dot_row <= 8'b11110111;
											3'd5: dot_row <= 8'b11111011;
											3'd6: dot_row <= 8'b11111101;
											3'd7: dot_row <= 8'b11111110;
							endcase
							
						end
					else if(count_out2 < 6'd02)
						begin
							case(count_out1)
											3'd0: dot_col <= 8'b11000000;
											3'd1: dot_col <= 8'b10000000;
											3'd2: dot_col <= 8'b10000000;
											3'd3: dot_col <= 8'b11000010;
											3'd4: dot_col <= 8'b11000000;
											3'd5: dot_col <= 8'b10000000;
											3'd6: dot_col <= 8'b10000000;
											3'd7: dot_col <= 8'b11000000;
							endcase
							
							case(count_out1)
											3'd0: dot_row <= 8'b01111111;
											3'd1: dot_row <= 8'b10111111;
											3'd2: dot_row <= 8'b11011111;
											3'd3: dot_row <= 8'b11101111;
											3'd4: dot_row <= 8'b11110111;
											3'd5: dot_row <= 8'b11111011;
											3'd6: dot_row <= 8'b11111101;
											3'd7: dot_row <= 8'b11111110;
							endcase
							
						end
					else if(count_out2 < 6'd03)
						begin
							case(count_out1)
											3'd0: dot_col <= 8'b11000000;
											3'd1: dot_col <= 8'b10000000;
											3'd2: dot_col <= 8'b10000000;
											3'd3: dot_col <= 8'b11000100;
											3'd4: dot_col <= 8'b11000000;
											3'd5: dot_col <= 8'b10000000;
											3'd6: dot_col <= 8'b10000000;
											3'd7: dot_col <= 8'b11000000;
							endcase
							
							case(count_out1)
											3'd0: dot_row <= 8'b01111111;
											3'd1: dot_row <= 8'b10111111;
											3'd2: dot_row <= 8'b11011111;
											3'd3: dot_row <= 8'b11101111;
											3'd4: dot_row <= 8'b11110111;
											3'd5: dot_row <= 8'b11111011;
											3'd6: dot_row <= 8'b11111101;
											3'd7: dot_row <= 8'b11111110;
							endcase
							
						end
					else if(count_out2 < 6'd04)
						begin
							case(count_out1)
											3'd0: dot_col <= 8'b11000000;
											3'd1: dot_col <= 8'b10000000;
											3'd2: dot_col <= 8'b10000000;
											3'd3: dot_col <= 8'b11001000;
											3'd4: dot_col <= 8'b11000000;
											3'd5: dot_col <= 8'b10000000;
											3'd6: dot_col <= 8'b10000000;
											3'd7: dot_col <= 8'b11000000;
							endcase
							
							case(count_out1)
											3'd0: dot_row <= 8'b01111111;
											3'd1: dot_row <= 8'b10111111;
											3'd2: dot_row <= 8'b11011111;
											3'd3: dot_row <= 8'b11101111;
											3'd4: dot_row <= 8'b11110111;
											3'd5: dot_row <= 8'b11111011;
											3'd6: dot_row <= 8'b11111101;
											3'd7: dot_row <= 8'b11111110;
							endcase
							
						end
					else
						begin
						
							if(user1==2'd0 && user2==2'd0)
								begin
									if(count_out2 < 6'd05)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10000000;
														3'd3: dot_col <= 8'b11000000;
														3'd4: dot_col <= 8'b11010000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else if(count_out2 < 6'd06)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10000000;
														3'd3: dot_col <= 8'b10000000;
														3'd4: dot_col <= 8'b11000000;
														3'd5: dot_col <= 8'b11100000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10000000;
														3'd3: dot_col <= 8'b10000000;
														3'd4: dot_col <= 8'b10000000;
														3'd5: dot_col <= 8'b11000000;
														3'd6: dot_col <= 8'b11000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
									end
								end
							else if(user1<=2'd2 && user2==2'd0)
								begin
									if(count_out2 < 6'd05)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10000000;
														3'd3: dot_col <= 8'b11010000;
														3'd4: dot_col <= 8'b11000000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else if(count_out2 < 6'd06)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10100000;
														3'd3: dot_col <= 8'b10000000;
														3'd4: dot_col <= 8'b11000000;
														3'd5: dot_col <= 8'b11000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else if(count_out2 < 6'd07)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b11000000;
														3'd2: dot_col <= 8'b10000000;
														3'd3: dot_col <= 8'b10000000;
														3'd4: dot_col <= 8'b10000000;
														3'd5: dot_col <= 8'b11000000;
														3'd6: dot_col <= 8'b11000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10000000;
														3'd3: dot_col <= 8'b10000000;
														3'd4: dot_col <= 8'b10000000;
														3'd5: dot_col <= 8'b11000000;
														3'd6: dot_col <= 8'b11000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
								end
							else if(user1==2'd3 && user2==2'd0)
								begin
									if(count_out2 < 6'd05)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10010000;
														3'd3: dot_col <= 8'b11000000;
														3'd4: dot_col <= 8'b11000000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else if(count_out2 < 6'd06)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10100000;
														3'd3: dot_col <= 8'b10000000;
														3'd4: dot_col <= 8'b11000000;
														3'd5: dot_col <= 8'b11000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else if(count_out2 < 6'd07)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b11000000;
														3'd2: dot_col <= 8'b10000000;
														3'd3: dot_col <= 8'b10000000;
														3'd4: dot_col <= 8'b10000000;
														3'd5: dot_col <= 8'b11000000;
														3'd6: dot_col <= 8'b11000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10000000;
														3'd3: dot_col <= 8'b10000000;
														3'd4: dot_col <= 8'b10000000;
														3'd5: dot_col <= 8'b11000000;
														3'd6: dot_col <= 8'b11000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
								end
							else if(user1==2'd0 && user2<=2'd2)
								begin
									if(count_out2 < 6'd05)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10000000;
														3'd3: dot_col <= 8'b11000000;
														3'd4: dot_col <= 8'b11010000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else if(count_out2 < 6'd06)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10000000;
														3'd3: dot_col <= 8'b11000000;
														3'd4: dot_col <= 8'b11000000;
														3'd5: dot_col <= 8'b10100000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else if(count_out2 < 6'd07)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10000000;
														3'd3: dot_col <= 8'b11000000;
														3'd4: dot_col <= 8'b11000000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b11000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10000000;
														3'd3: dot_col <= 8'b11000000;
														3'd4: dot_col <= 8'b11000000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
								end
							else if(user1<=2'd2 && user2<=2'd2)
								begin
									if(count_out2 < 6'd05)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10000000;
														3'd3: dot_col <= 8'b11010000;
														3'd4: dot_col <= 8'b11000000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else if(count_out2 < 6'd06)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10000000;
														3'd3: dot_col <= 8'b11100000;
														3'd4: dot_col <= 8'b11000000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10000000;
														3'd3: dot_col <= 8'b11000000;
														3'd4: dot_col <= 8'b11000000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
								end
							else if(user1==2'd3 && user2<=2'd2)
								begin
									if(count_out2 < 6'd05)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10000000;
														3'd3: dot_col <= 8'b11010000;
														3'd4: dot_col <= 8'b11000000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else if(count_out2 < 6'd06)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10100000;
														3'd3: dot_col <= 8'b11000000;
														3'd4: dot_col <= 8'b11000000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else if(count_out2 < 6'd07)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b11000000;
														3'd2: dot_col <= 8'b10000000;
														3'd3: dot_col <= 8'b11000000;
														3'd4: dot_col <= 8'b11000000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10000000;
														3'd3: dot_col <= 8'b11000000;
														3'd4: dot_col <= 8'b11000000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
								end
							else if(user1==2'd0 && user2==2'd03)
								begin
									if(count_out2 < 6'd05)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10000000;
														3'd3: dot_col <= 8'b11000000;
														3'd4: dot_col <= 8'b11010000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else if(count_out2 < 6'd06)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b11000000;
														3'd3: dot_col <= 8'b11000000;
														3'd4: dot_col <= 8'b10000000;
														3'd5: dot_col <= 8'b10100000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else if(count_out2 < 6'd07)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b11000000;
														3'd2: dot_col <= 8'b11000000;
														3'd3: dot_col <= 8'b10000000;
														3'd4: dot_col <= 8'b10000000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b11000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b11000000;
														3'd2: dot_col <= 8'b11000000;
														3'd3: dot_col <= 8'b10000000;
														3'd4: dot_col <= 8'b10000000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
								end
							else if(user1<=2'd2 && user2==2'd03)
								begin
									if(count_out2 < 6'd05)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10000000;
														3'd3: dot_col <= 8'b11010000;
														3'd4: dot_col <= 8'b11000000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else if(count_out2 < 6'd06)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b11000000;
														3'd3: dot_col <= 8'b11100000;
														3'd4: dot_col <= 8'b10000000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else if(count_out2 < 6'd07)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b11000000;
														3'd2: dot_col <= 8'b11000000;
														3'd3: dot_col <= 8'b11000000;
														3'd4: dot_col <= 8'b10000000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b11000000;
														3'd2: dot_col <= 8'b11000000;
														3'd3: dot_col <= 8'b10000000;
														3'd4: dot_col <= 8'b10000000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
							end
							else if(count_out2 == 6'd8)
								begin
									if(goal == 1)
									begin
										case(count_out1)
										3'd0: dot_col <= 8'b11110111;
										3'd1: dot_col <= 8'b10000101;
										3'd2: dot_col <= 8'b10110101;
										3'd3: dot_col <= 8'b11110111;
										3'd4: dot_col <= 8'b00100100;
										3'd5: dot_col <= 8'b01010100;
										3'd6: dot_col <= 8'b01110100;
										3'd7: dot_col <= 8'b10001111;
										endcase
									end
									else
									begin
									case(count_out1)
										3'd0: dot_col <= 8'b11100100;
										3'd1: dot_col <= 8'b10001010;
										3'd2: dot_col <= 8'b11101110;
										3'd3: dot_col <= 8'b10010001;
										3'd4: dot_col <= 8'b11101000;
										3'd5: dot_col <= 8'b01001000;
										3'd6: dot_col <= 8'b01001000;
										3'd7: dot_col <= 8'b11101111;
									endcase
									end
						
									case(count_out1)
										3'd0: dot_row <= 8'b01111111;
										3'd1: dot_row <= 8'b10111111;
										3'd2: dot_row <= 8'b11011111;
										3'd3: dot_row <= 8'b11101111;
										3'd4: dot_row <= 8'b11110111;
										3'd5: dot_row <= 8'b11111011;
										3'd6: dot_row <= 8'b11111101;
										3'd7: dot_row <= 8'b11111110;
									endcase
						
								end
							else if(count_out2 == 6'd8)
								begin
						if(goal == 1)
							begin
								case(count_out1)
										3'd0: dot_col <= 8'b11110111;
										3'd1: dot_col <= 8'b10000101;
										3'd2: dot_col <= 8'b10110101;
										3'd3: dot_col <= 8'b11110111;
										3'd4: dot_col <= 8'b00100100;
										3'd5: dot_col <= 8'b01010100;
										3'd6: dot_col <= 8'b01110100;
										3'd7: dot_col <= 8'b10001111;
								endcase
							end
						else
							begin
								case(count_out1)
										3'd0: dot_col <= 8'b11100100;
										3'd1: dot_col <= 8'b10001010;
										3'd2: dot_col <= 8'b11101110;
										3'd3: dot_col <= 8'b10010001;
										3'd4: dot_col <= 8'b11101000;
										3'd5: dot_col <= 8'b01001000;
										3'd6: dot_col <= 8'b01001000;
										3'd7: dot_col <= 8'b11101111;
								endcase
							end
						
						case(count_out1)
										3'd0: dot_row <= 8'b01111111;
										3'd1: dot_row <= 8'b10111111;
										3'd2: dot_row <= 8'b11011111;
										3'd3: dot_row <= 8'b11101111;
										3'd4: dot_row <= 8'b11110111;
										3'd5: dot_row <= 8'b11111011;
										3'd6: dot_row <= 8'b11111101;
										3'd7: dot_row <= 8'b11111110;
						endcase
						
							end
			else if(count_out2 == 6'd8)
			begin
				if(goal == 1)
					begin
						case(count_out1)
								3'd0: dot_col <= 8'b11110111;
								3'd1: dot_col <= 8'b10000101;
								3'd2: dot_col <= 8'b10110101;
								3'd3: dot_col <= 8'b11110111;
								3'd4: dot_col <= 8'b00100100;
								3'd5: dot_col <= 8'b01010100;
								3'd6: dot_col <= 8'b01110100;
								3'd7: dot_col <= 8'b10001111;
						endcase
					end
				else
					begin
						case(count_out1)
								3'd0: dot_col <= 8'b11100100;
								3'd1: dot_col <= 8'b10001010;
								3'd2: dot_col <= 8'b11101110;
								3'd3: dot_col <= 8'b10010001;
								3'd4: dot_col <= 8'b11101000;
								3'd5: dot_col <= 8'b01001000;
								3'd6: dot_col <= 8'b01001000;
								3'd7: dot_col <= 8'b11101111;
						endcase
					end
				
				case(count_out1)
								3'd0: dot_row <= 8'b01111111;
								3'd1: dot_row <= 8'b10111111;
								3'd2: dot_row <= 8'b11011111;
								3'd3: dot_row <= 8'b11101111;
								3'd4: dot_row <= 8'b11110111;
								3'd5: dot_row <= 8'b11111011;
								3'd6: dot_row <= 8'b11111101;
								3'd7: dot_row <= 8'b11111110;
				endcase
						
			end
							else
								begin
									if(count_out2 < 6'd05)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b10000000;
														3'd3: dot_col <= 8'b11010000;
														3'd4: dot_col <= 8'b11000000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else if(count_out2 < 6'd06)
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b10000000;
														3'd2: dot_col <= 8'b11100000;
														3'd3: dot_col <= 8'b11000000;
														3'd4: dot_col <= 8'b10000000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
									else
										begin
										case(count_out1)
														3'd0: dot_col <= 8'b11000000;
														3'd1: dot_col <= 8'b11000000;
														3'd2: dot_col <= 8'b11000000;
														3'd3: dot_col <= 8'b10000000;
														3'd4: dot_col <= 8'b10000000;
														3'd5: dot_col <= 8'b10000000;
														3'd6: dot_col <= 8'b10000000;
														3'd7: dot_col <= 8'b11000000;
										endcase
										
										case(count_out1)
														3'd0: dot_row <= 8'b01111111;
														3'd1: dot_row <= 8'b10111111;
														3'd2: dot_row <= 8'b11011111;
														3'd3: dot_row <= 8'b11101111;
														3'd4: dot_row <= 8'b11110111;
														3'd5: dot_row <= 8'b11111011;
														3'd6: dot_row <= 8'b11111101;
														3'd7: dot_row <= 8'b11111110;
										endcase
										end
								end
						
						end
						
					
				
					
				end
		end
endmodule 