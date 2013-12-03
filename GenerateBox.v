module GenerateBox(Pi, Gi, Gki, G);
  input Pi, Gi, Gki;
  output G;
  
  reg G;
  
  wire w1, w2;
  
  and(w1, Pi, Gki);
  or(w2, w1, Gi);

  assign w2 = G;
  
endmodule