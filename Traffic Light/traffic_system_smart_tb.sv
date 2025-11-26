// Smart traffic system testbench
module traffic_system_smart_tb;

    logic clk;            // Clock
    logic reset;          // Reset
    logic start;          // Light start signal
	logic person_present;	  // Is there a person trying to enter
	logic car_present;		  // Is there a car trying to enter

// Put your code here
// ------------------
logic [1:0] L_out;
traffic_system_smart uut(
        .clk(clk),
        .reset(reset),
        .start(start),
		.L_out(L_out),
		.car_present(car_present),
		.person_present(person_present)
    );
    
    initial begin
        clk = 1'b0;
        reset = 1'b1;
        start = 1'b0;
        
        #10
		reset = 1'b0;
        start = 1'b1;
        
        #10
        start = 1'b0;
		car_present = 0;
		person_present = 1;
		
		#5
		car_present = 1;
		person_present = 0;
		
		#8
		car_present = 0;
    end
    
    always begin
        #1
        clk = ~clk;
    end
    


// End of your code
endmodule
