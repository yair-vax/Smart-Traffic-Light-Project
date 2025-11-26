// Smart timer module

module timer_smart(
    input logic clk,
    input logic reset,
    input logic t_start,
    input logic[4:0] t_length,
    input logic t_freeze,
	input logic car_present,
	input logic person_present,
    output logic t_flicker,
    output logic t_done
);

// Put your code here
// ------------------
logic [4:0] counter;
    
    always_ff @(posedge clk, posedge reset) begin
        if (reset == 1'b1) begin
            counter <= 32'd1;
        end
        else begin 
            if (t_start == 1'b1) begin
                counter <= 32'd1;
            end
            else if (counter < t_length - 1 && t_freeze != 1) begin
                counter <= counter + 1;
            end
        end
		if (counter >= t_length - 6) begin
            t_flicker = 1'b1;
        end
        else begin
            t_flicker = 1'b0;
        end
        if (counter == t_length - 1) begin
            t_done = 1'b1;
			t_flicker = 1'b0;
        end
        else begin
            t_done = 1'b0;
        end
    end
   
   
//end of your code
endmodule