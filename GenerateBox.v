module GenerateBox(Pi, Gi, Gki, G);
  input Pi, Gi, Gki;
  output G;
  
  wire G;
  
  wire w1, w2;
  
  and(w1, Pi, Gki);
  or(G, w1, Gi);
  
endmodule