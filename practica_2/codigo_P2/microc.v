// Valeria Bosch Pérez (alu0101485287@ull.edu.es)
// Samuel Pérez López (alu0101481524@ull.edu.es)

module microc(output wire [5:0] Opcode, output wire zero, carry, input wire clk, reset, s_skip, s_inc, s_inm, we, input wire [2:0] ALUOp);
// Microcontrolador sin memoria de datos de un solo ciclo

// Cables a conectar

wire [9:0] mux_a_mux;
wire [9:0] mux_a_sum;
wire [9:0] new_pc;
wire [9:0] current_pc;
wire [15:0] instruccion;
wire [9:0] direccion;
wire [7:0] WD3;
wire [7:0] alu_a_mux;
wire [7:0] RD1;
wire [7:0] RD2;

assign Opcode[5:0] = instruccion[15:10];
	
// Modulos

// Multiplexores del Sumador
mux2 #(10) MuxSumador(mux_a_sum, instruccion[9:0], mux_a_mux, s_inc);

mux2 #(10) MuxSumador2(mux_a_mux, 10'b0000000001, 10'b0000000010, s_skip);

// Sumador
sum Sumador(new_pc, mux_a_sum, current_pc);

// PC
registro #(10) PC(current_pc, clk, reset, new_pc);

// Memoria del programa
memprog MemoriaProg(instruccion[15:0], clk, current_pc[9:0]);

// Multiplexor de la ALU
mux2 #(8) MuxALU(WD3[7:0], alu_a_mux[7:0], instruccion[11:4], s_inm);

// ALU
alu ALU(alu_a_mux, zero, carry, RD1, RD2, ALUOp);

// Banco de registros
regfile BancoRegistros(RD1, RD2, clk, we, instruccion[11:8], instruccion[7:4], instruccion[3:0], WD3);

endmodule
