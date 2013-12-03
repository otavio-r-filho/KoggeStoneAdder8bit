module EntryBox(Ai, Bi, Pi, Gi);
  
  input Ai, Bi;
  output Pi, Gi;
  
  reg Pi, Gi;
  
  wire w1, w2;
  
  xor(w1, Ai, Bi);
  and(w2, Ai, Bi);
  
  assign w1 = Pi;
  assign w2 = Gi;
  
endmodule