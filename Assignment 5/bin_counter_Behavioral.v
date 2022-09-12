`timescale 1ns/1ps

module bin_sync_behav(clock, reset_counter, out);

input clock;                  // Declare input port for the clock to allow counter to count up  
input reset_counter;          // Declare input port for the reset to allow the counter to be reset to 0 when required  
output out[3:0] = 4'b0000;              // Declare 4-bit output port to get the counter values  
  
 // This always block will be triggered at the rising edge of clock (0->1)  
 // Once inside this block, it checks if the reset is 0, then change out to zero   
 // If reset is 1, then the design should be allowed to count up, so increment the counter   
  
  always @ (posedge clock) begin  
    if (! reset_counter)  
      out <= 4'b0000;  
    else  
      out <= out + 4'b0001;  
  end  
endmodule  