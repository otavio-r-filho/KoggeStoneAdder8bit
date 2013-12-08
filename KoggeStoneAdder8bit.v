// 8 bit Kogge-Stone adder with carry in and carry out
// Creating wire intead of buses to make the design more simple. 
// All the wires will be replaced by buses for each level.
// Eg: wire [7:0] PBus0 - meaning propagate bus level 0

module KoggeStoneAdder8bit(clk, rst, A, B, Ci, S, Co);
  input clk, rst, Ci;
  input [7:0] A, B;
  output [7:0] S;
  output Co;
  
  reg [7:0] S;
  reg Co;
  
  
  //Layer 0 of wires
  wire P00, P01, P02, P03, P04, P05, P06, P07;
  wire G00, G01, G02, G03, G04, G05, G06, G07;
  
  //Layer 1 of wires
  wire P11, P12, P13, P14, P15, P16, P17;
  wire G10, G11, G12, G13, G14, G15, G16, G17;
  
  //Layer 2 of wires
  wire P23, P24, P25, P26, P27;
  wire G21, G22, G23, G24, G25, G26, G27;
  
  //Layer 3 of wires
  wire P37;
  wire G33, G34, G35, G36;
  
  //Sum wires
  wire [7:0] ws;
  wire wCo;
  
  //Layer 0
  EntryBox E0(.Ai(A[0]), .Bi(B[0]), .Pi(P00), .Gi(G00));
  EntryBox E1(.Ai(A[1]), .Bi(B[1]), .Pi(P01), .Gi(G01));
  EntryBox E2(.Ai(A[2]), .Bi(B[2]), .Pi(P02), .Gi(G02));
  EntryBox E3(.Ai(A[3]), .Bi(B[3]), .Pi(P03), .Gi(G03));
  EntryBox E4(.Ai(A[4]), .Bi(B[4]), .Pi(P04), .Gi(G04));
  EntryBox E5(.Ai(A[5]), .Bi(B[5]), .Pi(P05), .Gi(G05));
  EntryBox E6(.Ai(A[6]), .Bi(B[6]), .Pi(P06), .Gi(G06));
  EntryBox E7(.Ai(A[7]), .Bi(B[7]), .Pi(P07), .Gi(G07));
  
  //Layer 1
  GenerateBox  GB10 (.Pi(P00), .Gi(G00), .Gki(Ci),  .G(G10));
  PropagateBox PB11 (.Pi(P01), .Gi(G01), .Pki(P00), .Gki(G00), .P(P11), .G(G11));
  PropagateBox PB12 (.Pi(P02), .Gi(G02), .Pki(P01), .Gki(G01), .P(P12), .G(G12));
  PropagateBox PB13 (.Pi(P03), .Gi(G03), .Pki(P02), .Gki(G02), .P(P13), .G(G13));
  PropagateBox PB14 (.Pi(P04), .Gi(G04), .Pki(P03), .Gki(G03), .P(P14), .G(G14));
  PropagateBox PB15 (.Pi(P05), .Gi(G05), .Pki(P04), .Gki(G04), .P(P15), .G(G15));
  PropagateBox PB16 (.Pi(P06), .Gi(G06), .Pki(P05), .Gki(G05), .P(P16), .G(G16));
  PropagateBox PB17 (.Pi(P07), .Gi(G07), .Pki(P06), .Gki(G06), .P(P17), .G(G17));
  
  //Layer 2
  GenerateBox  GB21 (.Pi(P11), .Gi(G11), .Gki(Ci),  .G(G21));
  GenerateBox  GB22 (.Pi(P12), .Gi(G12), .Gki(G10), .G(G22));
  PropagateBox PB23 (.Pi(P13), .Gi(G13), .Pki(P11), .Gki(G11), .P(P23), .G(G23));
  PropagateBox PB24 (.Pi(P14), .Gi(G14), .Pki(P12), .Gki(G12), .P(P24), .G(G24));
  PropagateBox PB25 (.Pi(P15), .Gi(G15), .Pki(P13), .Gki(G13), .P(P25), .G(G25));
  PropagateBox PB26 (.Pi(P16), .Gi(G16), .Pki(P14), .Gki(G14), .P(P26), .G(G26));
  PropagateBox PB27 (.Pi(P17), .Gi(G17), .Pki(P15), .Gki(G15), .P(P27), .G(G27));
  
  //Layer 3
  GenerateBox  GB33 (.Pi(P23), .Gi(G23), .Gki(Ci),  .G(G33));
  GenerateBox  GB34 (.Pi(P24), .Gi(G24), .Gki(G10), .G(G34));
  GenerateBox  GB35 (.Pi(P25), .Gi(G25), .Gki(G21), .G(G35));
  GenerateBox  GB36 (.Pi(P26), .Gi(G26), .Gki(G22), .G(G36));
  PropagateBox PB37 (.Pi(P27), .Gi(G27), .Pki(P23), .Gki(G23), .P(P37), .G(G37));
  
  //Carry out logic
  GenerateBox  GB47 (.Pi(P37), .Gi(G37), .Gki(Ci), .G(wCo)); 
  
  //Sum logic
  SumBlock S0(.Pi(P00), .Gki(Ci),  .Si(ws[0]));
  SumBlock S1(.Pi(P01), .Gki(G10), .Si(ws[1]));
  SumBlock S2(.Pi(P02), .Gki(G21), .Si(ws[2]));
  SumBlock S3(.Pi(P03), .Gki(G22), .Si(ws[3]));
  SumBlock S4(.Pi(P04), .Gki(G33), .Si(ws[4]));
  SumBlock S5(.Pi(P05), .Gki(G34), .Si(ws[5]));
  SumBlock S6(.Pi(P06), .Gki(G35), .Si(ws[6]));
  SumBlock S7(.Pi(P07), .Gki(G36), .Si(ws[7]));
  
  always @(posedge clk) begin
	if(rst) begin
		S[7:0] <= 1'b0;
		Co <= 1'b0;
	end else begin
		S[7:0] <= ws[7:0];
		Co <= wCo;
	end
  end
      
endmodule
