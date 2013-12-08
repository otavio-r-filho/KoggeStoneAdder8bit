module EntryBox(Ai, Bi, Pi, Gi);
  
  input Ai, Bi;
  output Pi, Gi;
  
  wire Pi, Gi;
  
  xor(Pi, Ai, Bi);
  and(Gi, Ai, Bi);
  
endmodule