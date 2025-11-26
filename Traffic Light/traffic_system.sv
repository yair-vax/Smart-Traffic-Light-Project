// 32X32 Multiplier test template
module traffic_system(
    input logic clk,
    input logic reset,
    input logic start,
    output logic [1:0] L_out
);

// Enter X and Y here
	localparam X = 9;
	localparam Y = 7;

// Put your code here
// ------------------
	logic t_start;
    logic [4:0] t_length;
    logic t_flicker;
    logic t_done;
    
    traffic_light fsm(
        .clk(clk),
        .reset(reset),
        .start(start), 
        .t_start(t_start), 
        .t_length(t_length), 
        .t_flicker(t_flicker),
        .t_done(t_done),
		.L_out(L_out)
    );
    
    timer counter(
		.clk(clk),
        .reset(reset),
        .t_start(t_start), 
        .t_length(t_length), 
        .t_flicker(t_flicker),
        .t_done(t_done)
    );
// end of your code
endmodule
