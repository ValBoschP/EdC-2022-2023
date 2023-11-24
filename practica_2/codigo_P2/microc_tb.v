`timescale 1 ns/10 ps // Fija la unidad de tiempo de simulación y su precision

module microc_tb; // Instanciamos el modulo a testear
  // Declaramos las señales
  wire [5:0] test_Opcode;
  reg test_clk, test_reset, test_s_skip, test_s_inc, test_s_inm, test_we;
  wire test_zero, test_carry;
  reg[2:0] test_ALUOp;

  microc t_microc(test_Opcode, test_zero, test_carry, test_clk, test_reset, test_s_skip, test_s_inc, test_s_inm, test_we, test_ALUOp);
  
  initial 
  begin
    test_reset <= 1;
    #10;
    test_reset <= 0;
  end

  always
  begin
    test_clk = 1;
    #20;
    test_clk = 0;
    #20;
  end

  initial
  begin
    $dumpfile("microc.vcd");
    $dumpvars;
    $monitor("tiempo=%0d inm=%b skip=%b inc=%b we=%b ALUOp=%b", $time, test_s_inm, test_s_skip, test_s_inc, test_we, test_ALUOp);
    #20;
    // LI #3, R1
    test_s_inm = 1;
    test_s_skip = 0;
    test_s_inc = 1;
    test_we = 1;
    test_ALUOp = 3'b000;
    
    #40;
    // LI #1, R2
    test_s_inm = 1;
    test_s_skip = 0;
    test_s_inc = 1;
    test_we = 1;
    test_ALUOp = 3'b000;
    
    #40;
    // AND R0, R3, R3
    test_s_inm = 0;
    test_s_skip = 0;
    test_s_inc = 1;
    test_we = 1;
    test_ALUOp = 3'b100;
    
    #40;
    // JR TEST
    test_s_inm = 0;
    test_s_skip = 0;
    test_s_inc = 0;
    test_we = 0;
    test_ALUOp = 3'b000;
    
    #40;
    // SKIPGT R1, R0
    test_s_inm = 0;
    test_s_skip = 1;
    test_s_inc = 1;
    test_we = 0;
    test_ALUOp = 3'b011;

    #40;
    // JR IT
    test_s_inm = 0;
    test_s_skip = 0;
    test_s_inc = 0;
    test_we = 0;
    test_ALUOp = 3'b000;
    
    #40;
    // XOR R3, R2, R3
    test_s_inm = 0;
    test_s_skip = 0;
    test_s_inc = 1;
    test_we = 1;
    test_ALUOp = 3'b110;

    #40;
    // SUB R1, R2, R1
    test_s_inm = 0;
    test_s_skip = 0;
    test_s_inc = 1;
    test_we = 1;
    test_ALUOp = 3'b011;

    #40;
    // SKIPGT R1, R0
    test_s_inm = 0;
    test_s_skip = 1;
    test_s_inc = 1;
    test_we = 0;
    test_ALUOp = 3'b011;

    #40;
    // JR IT
    test_s_inm = 0;
    test_s_skip = 0;
    test_s_inc = 0;
    test_we = 0;
    test_ALUOp = 3'b000;

    #40;
    // XOR R3, R2, R3
    test_s_inm = 0;
    test_s_skip = 0;
    test_s_inc = 1;
    test_we = 1;
    test_ALUOp = 3'b110;

    #40;
    // SUB R1, R2, R1
    test_s_inm = 0;
    test_s_skip = 0;
    test_s_inc = 1;
    test_we = 1;
    test_ALUOp = 3'b011;

    #40;
    // SKIPGT R1, R0
    test_s_inm = 0;
    test_s_skip = 1;
    test_s_inc = 1;
    test_we = 0;
    test_ALUOp = 3'b011;

    #40;
    // JR IT
    test_s_inm = 0;
    test_s_skip = 0;
    test_s_inc = 0;
    test_we = 0;
    test_ALUOp = 3'b000;

    #40;
    // XOR R3, R2, R3
    test_s_inm = 0;
    test_s_skip = 0;
    test_s_inc = 1;
    test_we = 1;
    test_ALUOp = 3'b110;

    #40;
    // SUB R1, R2, R1
    test_s_inm = 0;
    test_s_skip = 0;
    test_s_inc = 1;
    test_we = 1;
    test_ALUOp = 3'b011;

    #40;
    // SKIPGT R1, R0
    test_s_inm = 0;
    test_s_skip = 0;
    test_s_inc = 1;
    test_we = 0;
    test_ALUOp = 3'b011;

    #40;
    // JR FIN
    test_s_inm = 0;
    test_s_skip = 0;
    test_s_inc = 0;
    test_we = 0;
    test_ALUOp = 3'b000;

    #40;
    // JR FIN
    test_s_inm = 0;
    test_s_skip = 0;
    test_s_inc = 0;
    test_we = 0;
    test_ALUOp = 3'b000;
    #20;

    $finish;
  end 
endmodule