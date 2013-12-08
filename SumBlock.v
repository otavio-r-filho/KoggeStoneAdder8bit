module SumBlock(Pi, Gki, Si);
  input Pi, Gki;
  output Si;
  
  wire Si;
  
  xor(Si, Pi, Gki);
  
endmodule
