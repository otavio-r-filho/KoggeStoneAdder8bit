module PropagateBox(Pi, Gi, Pki, Gki, P, G);
  
  input Pi, Gi, Pki, Gki;
  output P, G;
  
  wire P, G;
  
  and(P, Pi, Pki);  
  GenerateBox gbox(.Pi(Pi), .Gi(Gi), .Gki(Gki), .G(G));
  
endmodule