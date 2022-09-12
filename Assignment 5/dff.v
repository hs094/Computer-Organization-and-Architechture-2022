module dff (input d, input reset, input clock, output q);  
    always @ (posedge clock or negedge reset)  
       if (!reset)  
          q <= 0;  
       else  
          q <= d;  
endmodule  