module bulb_controller (
  input    S,
  input   S1,
  input   S2,
  output reg B1,
  output reg B2,
  output reg B3
);

  always @(*) begin
    if (S) 
    begin
        // Main switch is ON
        if (S1 && ~S2) begin
          // Only B1 should be glowing
          B1 = 1;
          B2 = 0;
          B3 = 0;
        end
        else if (~S1 && S2) begin
          // Only B2 should be glowing
          B1 = 0;
          B2 = 1;
          B3 = 0;
        end
        else begin
          // Default: Only B3 should be glowing
          B1 = 0;
          B2 = 0;
          B3 = 1;
        end
    end
    else begin
      // Main switch is OFF, no bulbs should be glowing
      B1 = 0;
      B2 = 0;
      B3 = 0;
    end
  end

endmodule

