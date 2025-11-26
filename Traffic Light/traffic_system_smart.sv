// Smart traffic system testbench
module traffic_system_smart(
    input logic clk,
    input logic reset,
    input logic start,
    input logic person_present,
    input logic car_present,
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
logic t_freeze;
    
    traffic_light_smart fsm2(
        .clk(clk),
        .reset(reset),
        .start(start), 
        .t_start(t_start), 
        .t_length(t_length), 
        .t_flicker(t_flicker),
        .t_done(t_done),
		.L_out(L_out),
		.person_present(person_present),
        .car_present(car_present),
		.t_freeze(t_freeze)
    );
    
    timer_smart counter2(
		.clk(clk),
        .reset(reset),
        .t_start(t_start), 
        .t_length(t_length), 
        .t_flicker(t_flicker),
        .t_done(t_done),
		.person_present(person_present),
        .car_present(car_present),
		.t_freeze(t_freeze)
    );

// End of your code
endmodule
