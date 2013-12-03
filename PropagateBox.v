module PropagateBox(Pi, Gi, Pki, Gki, P, G);
  
  input Pi, Gi, Pki, Gki;
  output P, G;
  
  reg P, G;
  
  wire w1;
  
  and(w1, Pi, Pki);
  assign w1 = P;
  
  GenerateBox gbox(.Pi(Pi), .Gi(Gi), .Gki(Gki), .G(G));

endmodule