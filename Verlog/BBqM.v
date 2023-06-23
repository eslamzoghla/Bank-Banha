module BBqM(CLK,reset,enter_queue,leave_queue,tcount,full_led,empty_led,alarm,Segement1,Segement2,Segement3);
  // -------------------------- Inputs Declarations ---------------------------- //
  input CLK,reset,enter_queue,leave_queue;
  input [1:0]tcount;
  
  // -------------------------- Outputs Declarations ---------------------------- //
  output full_led,empty_led,alarm;
  output [6:0]Segement1;
  output [6:0]Segement2;
  output [6:0]Segement3;
  
  // -------------------------- Wires Declarations ---------------------------- //
  wire CLK10ms;
  wire Up_flip_flop;
  wire Down_flip_flop;
  wire full_led,empty_led,alarm;
  wire enter_queue,leave_queue;
  wire [2:0] pcount;
  wire [4:0]wtime;
  
  // ------------------------- Instantiation Modules --------------------------- //
  
  // ------------------------- Instantiation From Clock Divder --------------------------- //
  clock_divider clk_div(CLK,reset,CLK10ms);
  
  // ------------------------- Instantiation From Flip Flop --------------------------- //
  flip_flop upflip(reset,enter_queue,CLK10ms,Up_flip_flop);
  flip_flop downflip(reset,leave_queue,CLK10ms,Down_flip_flop);
  
  // ------------------------- Instantiation From Up Down Counter --------------------------- // 
  UpDownCounter_FSM updowncount(CLK10ms,reset,Up_flip_flop,Down_flip_flop,pcount);

  // ------------------------- Instantiation From Flags --------------------------- //
  Flags led_flag(CLK10ms,reset,Up_flip_flop,Down_flip_flop,pcount,full_led,empty_led,alarm);
  
  // ------------------------- Instantiation From Rom --------------------------- //
  Rom rom(.addr({tcount,pcount[2:0]}),.wtime(wtime));
  
  // ------------------------- Instantiation From Display module --------------------------- //
  all_in_one_display display(pcount,wtime,Segement1,Segement2,Segement3);
  
endmodule
// ----------------------------- End of File --------------------------------- //
// --------------------------------------------------------------------------- //

/*
module BBqM_dut();
  // -------------------------- reg Declarations ---------------------------- //
  reg clk,reset,PUSH_UP,PUSH_DOWN;
  reg [1:0]tcount;
  
  // -------------------------- wire Declarations ---------------------------- //
  wire full_led,empty_led,alarm;
  wire [6:0]Segement1;
  wire [6:0]Segement2;
  wire [6:0]Segement3;
  
  initial 
   begin
      clk=0;
      reset=1; #100;
      reset=0;
      tcount = 01;
#100; PUSH_UP=0;PUSH_DOWN=0;
#100; PUSH_UP=1;PUSH_DOWN=0;
#100; PUSH_UP=1;PUSH_DOWN=0;

       
      end
  always
     #100 clk=~clk;
     BBqM pp(clk,reset,PUSH_UP,PUSH_DOWN,tcount,full_led,empty_led,alarm,Segement1,Segement2,Segement3);
endmodule*/