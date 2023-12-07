
// Testbench (TB) Code
// this is written by me
module bulb_controller_tb;

  reg S, S1, S2;
  wire B1, B2, B3;

  // Instantiate the bulb controller module
  bulb_controller DUT (
    .S(S),
    .S1(S1),
    .S2(S2), 
    .B1(B1),
    .B2(B2),
    .B3(B3)
  );
// initial vlaues
initial 
begin
  {S,S1,S2}=0;
end
  initial begin
  //******************************s=1
    // Turn on the main switch (S)
    S = 1;
    // Turn on S1, turn off S2, B1 should be glowing
    S1 = 1;
    S2 = 0;
    #10;

    // Turn off S1, turn on S2, B2 should be glowing
    S1 = 0;
    S2 = 1;
    #10;

    // Turn off both S1 and S2, B3 should be glowing
    S1 = 0;
    S2 = 0;
    #10;
//************************s=0
    // Turn off the main switch (S), none of the bulbs should be glowing
    S = 0;
    S1 = 1;
    S2 = 0;
    #10;
     S1 = 1;
    S2 = 1;
    #10;
    S1 = 0;
    S2 = 1;
    #10;
    S1 = 0;
    S2 = 0;
    #10;
	 //**************************************** s=1
    // Turn on the main switch (S)
    S = 1;
    // Turn on S1, turn off S2, B1 should be glowing
    S1 = 1;
    S2 = 0;
    #10;

    // Turn off S1, turn on S2, B2 should be glowing
    S1 = 0;
    S2 = 1;
    #10;

    // Turn off both S1 and S2, B3 should be glowing
    S1 = 1;
    S2 = 1;
    #10;
    
  end
initial
    begin
	    $monitor("S=%d,S1=%d,S2=%d,B1=%d,B2=%d,B3=%d",S,S1,S2,B1,B2,B3);
    #100 $finish; // Finish the simulation after 10 time units
    end
endmodule