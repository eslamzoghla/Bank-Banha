module UpDownCounter_FSM(clk,reset,PUSH_UP,PUSH_DOWN,pcount);
// -------------------------- Inputs Declarations ---------------------------- //
  input clk,reset,PUSH_UP,PUSH_DOWN;
// ------------------------- Outputs Declarations ---------------------------- //
  output reg[2:0]pcount;
// ----------------------- Sequential  Logic  -------------------------------- //
  always @(posedge clk or posedge reset)
  begin 
    if(reset)//reset pcount to inital value zero
    begin
     pcount <= 0;
    end
    else if ( PUSH_UP )//if someone enter the queue
    begin
      if( pcount == 7 )//if queue if full overflow
      pcount <= pcount;
      else
      pcount <= pcount + 1;
    end 
    else if( PUSH_DOWN )//if some one exit from queue
    begin
      if(pcount == 0)//if queue is empty underflow
      pcount <= pcount;
      else
      pcount <= pcount-1;
    end   
      end
// --------------------------------------------------------------------------- //
endmodule
// ----------------------------- End of File --------------------------------- //
// --------------------------------------------------------------------------- //