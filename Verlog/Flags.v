module Flags(clk,reset,up_count,down_count,pcount,full_flag,empty_flag,alarm);
// -------------------------- Inputs Declarations ---------------------------- //
input clk,reset,up_count,down_count;
input [2:0] pcount;
// -------------------------- output Declarations ---------------------------- //
output empty_flag,full_flag,alarm;
// ---------------------------- Reg Declarations ----------------------------- //
reg full_flag,empty_flag,alarm;
always @(posedge clk,posedge reset)
  begin
    if(reset )//Reset all values
    begin
      empty_flag <= 1;
      full_flag <= 0;
      alarm <= 0;
    end

    else if(up_count && pcount == 7)// overflow state
    begin
       empty_flag <=0;
       full_flag <= 1;
       alarm <= 1;
    end

    else if( pcount == 7 && ~(up_count) ) //full state
    begin
      empty_flag <= 0;
      full_flag <= 1;
      alarm <= 0; 
    end

    else if( pcount ==0 && down_count )//underflow state
    begin
        empty_flag <=1;
        full_flag <=0;
        alarm <=1;
    end

    else if( pcount == 0 && ~( down_count ) )//empty state
    begin
        empty_flag <= 1;
        full_flag <= 0;
        alarm <= 0;
    end

    else
    begin
        empty_flag <= 0;
        full_flag <= 0;
        alarm <= 0;
    end

  end
endmodule
