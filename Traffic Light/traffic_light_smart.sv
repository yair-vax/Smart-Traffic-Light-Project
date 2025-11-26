//smart traffic light module

module traffic_light_smart(
    //inputs
    input logic clk, // Clock
    input logic reset, // Reset
    input logic start, // Start signal
    input logic t_flicker,
    input logic t_done,
    input logic car_present,
    input logic person_present,

    //outputs
    output logic t_start,
    output logic[4:0] t_length,
    output logic t_freeze,
    output logic[1:0] L_out
);

// Light Duration Parameters - Defaults
// ------------------
parameter RED_DURATION = 5'd29;
parameter YELLOW_DURATION = 5'd3;
parameter GREEN_DURATION = 5'd27;


// Put your code here
    typedef enum {
        off_st,
        red_st,
        yellow_to_green_st,
        green_st,
        yellow_to_red_st,
        off_flashing_st
    } sm_type;
    sm_type current_state;
    sm_type next_state;

always_ff @(posedge clk, posedge reset) begin
        if (reset == 1'b1) begin
            current_state <= off_st;
        end
        else begin
            current_state <= next_state;
        end
    end

  always_comb begin
        next_state = current_state;
        t_start = 1'b0;
		t_freeze =1'b0;

        case (current_state)
            off_st: begin
				L_out = 2'b00;
                if (start == 1'b1) begin
                    next_state = red_st;
                    t_start = 1'b1;
					t_length = 5'd29;
                end

            end
            red_st: begin
				L_out = 2'b01;
                if (t_done == 1'b1) begin
                    next_state = yellow_to_green_st;
                    t_start = 1'b1;
					t_length = 5'd3;
                end
				if (person_present == 1 && car_present == 0) begin
                    t_freeze = 1;
                end
				else if (person_present == 0 && car_present == 1) begin
                    t_start = 1;
					t_length =2'b11;
					next_state = yellow_to_green_st;

                end
            end

            yellow_to_green_st: begin
				L_out = 2'b10;
                if (t_done == 1'b1) begin
                    next_state = green_st;
                    t_start = 1'b1;
					t_length = 5'd27;
                end
            end
            green_st: begin
			L_out = 2'b11;
                if (t_flicker == 1) begin
                    next_state = off_flashing_st;
                end
				if (person_present == 0 && car_present == 1 && t_flicker == 0) begin
                    t_freeze = 1;
                end
				if (person_present == 1 && car_present == 0 && t_flicker == 0) begin
                    t_start = 1;
					t_length =2'b11;
					next_state = yellow_to_red_st;
                end
            end

            off_flashing_st: begin
			L_out = 2'b00;
                if (t_done == 1) begin
                    next_state = yellow_to_red_st;
					t_start = 1'b1;
					t_length = 5'd3;
				end
                else if (t_flicker == 1) begin
                    next_state = green_st;
                end
            end
            yellow_to_red_st: begin
				L_out = 2'b10;
                if (t_done == 1) begin
                    next_state = red_st;
                    t_start = 1'b1;
					t_length = 5'd29;
                end
            end
        endcase
    end
// end of your code
endmodule