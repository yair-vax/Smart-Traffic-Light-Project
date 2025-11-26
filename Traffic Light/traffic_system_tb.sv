//traffic system testbench

module traffic_system_tb;

    logic clk;            // Clock
    logic reset;          // Reset
    logic start;          // Light start signal

// Put your code here
// ------------------
	logic [1:0] L_out;
traffic_system uut(
        .clk(clk),
        .reset(reset),
        .start(start),
		.L_out(L_out)
    );
    
    initial begin
        clk = 1'b0;
        reset = 1'b1;
		start = 1'b0;
		
		#5
        start = 1'b1;
        
        #5
        reset = 1'b0;
        
        #5
        start = 1'b0;       
    end
    
    always begin
        #1
        clk = ~clk;
    end
    


// End of your code
endmodule
