// Testbench para modulo cuenta1
`timescale 1 ns / 10 ps
module cuenta1_tb;
// Declaracion de señales
reg [2:0] t_Valor;
reg t_start, t_clk;
reg [3:0] t_cuenta;
wire t_fin;

// Modulo testear
cuenta1 mat(t_Valor, t_start, t_clk, t_cuenta, t_fin);
initial
begin
  $dumpfile("cuenta1.vcd");
  $dumpvars;
  $monitor("tiempo=%0d Valor=%b Cuenta=%b Fin=%b", $time, t_Valor, t_cuenta, t_fin);

  errores = 0;
  
end