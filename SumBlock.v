module SumBlock(Pi, Gki, Si);
  input Pi, Gki;
  output Si;
  
  reg Si;
  
  wire w1;
  
  xor(w1, Pi, Gki);
  assign w1 = Si;  
  
endmodule
