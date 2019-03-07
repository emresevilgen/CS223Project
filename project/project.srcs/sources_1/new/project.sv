`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2018 03:11:23 PM
// Design Name: 
// Module Name: project
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module project(
    input clk, 
    
    // Buttons at the Basys 3
    input start, 
    input reset, 
    input resetTimer,  

    
    // FPGA pins for 8x8 display
    output reset_out, //shift register's reset
    output OE,     //output enable, active low 
    output SH_CP,  //pulse to the shift register
    output ST_CP,  //pulse to store shift register
    output DS,     //shift register's serial input data
    output [7:0] col_select, // active column, active high
    
    //7-segment signals
    output a, b, c, d, e, f, g, dp, 
    output [3:0] an,    
        
    //matrix  4x4 keypad
    output [3:0] keyb_row,
    input  [3:0] keyb_col
    
    
//    // to test in the basys without beti board
//    output logic [1:0] statebinary, 
//    input floorplus,
//    input floorminus,
//    input floorthree,
//    input floortwo,
//    input floorone,
//    output logic [3:0] floor1binary,
//    output logic [3:0] floor2binary,
//    output logic [3:0] floor3binary
    );
    
    int state;
    int nextstate;
    logic clk_out;
    logic clk_out_direction;
    int floor1 = 0;
    int floor2 = 0;
    int floor3 = 0;
    logic [3:0] time2 = 4'b0000;
    logic [3:0] time1 = 4'b0000;
    logic [3:0] time0 = 4'b0000;
    int temptime = 0;
    int executiontime = 0;
    int elevator = 0;
    int direction = 0;
    logic contWork = 0;
    logic stopWork = 0;
    logic [2:0] col_num;
    logic [2:0] path;
    logic [26:0] count = {27{1'b0}};
    logic [3:0]fourthdigit = 4'b1010; 
    logic decide = 1'b0;
     
    logic [0:7] [7:0]  image_red;
    logic [0:7] [7:0]  image_green;
    logic [0:7] [7:0]  image_blue;
    
    //matrix keypad scanner
    logic [3:0] key_value;
    logic key_valid;
    keypad4X4 keypad4X4_inst0(
        .clk(clk),
        .keyb_row(keyb_row), // just connect them to FPGA pins, row scanner
        .keyb_col(keyb_col), // just connect them to FPGA pins, column scanner
        .key_value(key_value), //user's output code for detected pressed key: row[1:0]_col[1:0]
        .key_valid(key_valid)  // user's output valid: if the key is pressed long enough (more than 20~40 ms), key_valid becomes '1' for just one clock cycle.
    );    
    
    //state register
    always @(posedge clk) begin
        count <= count + 1;
        if( reset ) begin 
            state <= 0;
            contWork <= 0;
            temptime <= 0;
            time2 <= 4'b0000;
            time1 <= 4'b0000;
            time0 <= 4'b0000;
            count <= 27'b000000000000000000000000000;
//            statebinary <= 2'b00;
        end else
        if (start) begin
            if (floor1 > 0 || floor2 > 0 || floor3 > 0) begin
                contWork <= 1;
                temptime <= 0;
                count <= 27'b000000000000000000000000000;
            end
        end
        else if ( resetTimer) begin
             time2 <= 4'b0000;
             time1 <= 4'b0000;
             time0 <= 4'b0000;
             count <= 27'b000000000000000000000000000;
         end
        else if (stopWork == 1 && state == 0)
            contWork <= 0;
        else if(count == {27{1'b1}}) begin
              if (contWork) begin
                  if(time0 == 4'b1001) begin
                      if(time1 == 4'b1001) begin
                          time2 <= time2 + 1;
                          time1 <= 4'b0000;
                      end else
                          time1 <= time1 + 1;
                       time0 <= 4'b0000; 
                  end else begin
                      time0 <= time0 + 1; 
                  end
                 temptime <= temptime + 1;
              end
          end
        else if (contWork == 1) begin
           if( temptime == executiontime ) begin
                
                state <= nextstate;
                //to test with just basys
//                if (nextstate == 0 ||nextstate == 4)
//                    statebinary <= 2'b00;
//                else if (nextstate == 1)
//                    statebinary <= 2'b01;
//                else if (nextstate == 2)
//                    statebinary <= 2'b10;
//                else if (nextstate == 3)
//                    statebinary <= 2'b11;        
           end 
        end
    end
       
       always @(posedge clk) begin
            if (reset) begin
                elevator <= 0;
                executiontime <= 0;
                path <= 3'b000;
                nextstate <= 0;
                direction <= 0;
                floor1 <= 0;
                floor2 <= 0;
                floor3 <= 0;
//                floor1binary <= 4'b0000;
//                floor2binary <= 4'b0000;
//                floor3binary <= 4'b0000;
                stopWork <= 0;
            end
            else if (stopWork == 1) begin
                elevator <= 0;
                executiontime <= 0;
                path <= 3'b000;
                nextstate <= 0;
                direction <= 0;
                floor1 <= 0;
                floor2 <= 0;
                floor3 <= 0;
//                floor1binary <= 4'b0000;
//                floor2binary <= 4'b0000;
//                floor3binary <= 4'b0000;
                stopWork <= 0;
            end
            else if (start)
                stopWork <= 0;
            else if (contWork == 0) begin
            // To remove
//                floor1 <= floor1binary;
//                floor2 <= floor2binary;
//                floor3 <= floor3binary;
                if ((key_valid == 1'b1)) begin
                    case(key_value) 
                    4'b01_01:  
                        if (floor1 > 0)
                            floor1 <= floor1 - 1;            
                    4'b01_00: 
                        if (floor1 < 12)
                            floor1 <= floor1 + 1;       
                    4'b10_01:
                        if (floor2 > 0)
                            floor2 <= floor2 - 1;
                    4'b10_00:
                        if (floor2 < 12)
                            floor2 <= floor2 + 1;    
                    4'b11_01: 
                        if (floor3 > 0)
                            floor3 <= floor3 - 1;
                    4'b11_00:
                        if (floor3 < 12)
                            floor3 <= floor3 + 1;        
                    endcase
                end
//                //to remove
//                if (floorplus) begin
//                    if (floorthree && floor3binary < 4'b1100 ) begin
//                         floor3binary <= floor3binary + 4'b0001;
//                    end
//                    else if (floortwo && floor2binary < 4'b1100) begin
//                         floor2binary <= floor2binary + 4'b0001;
        
//                    end
//                    else if (floorone && floor1binary < 4'b1100) begin
//                         floor1binary <= floor1binary + 4'b0001;
        
//                    end
//                end else if (floorminus) begin
//                    if (floorthree && floor3binary > 4'b0000) begin
//                         floor3binary <= floor3binary - 4'b0001;
//                    end
//                    else if (floortwo && floor2binary > 4'b0000) begin
//                         floor2binary <= floor2binary - 4'b0001;
//                    end
//                    else if (floorone && floor1binary > 4'b0000) begin
//                         floor1binary <= floor1binary - 4'b0001;
//                    end
//                end 
//                //
            end
            else if (contWork == 1 && temptime >= executiontime && decide == 0) begin
                decide <= 1;
           end
            else if (decide == 1) begin
                decide <= 0;
                if ( state == 4) begin
                    nextstate <= 0;
                    executiontime <= executiontime + 2;
                    direction <= 0;
                end
                else if ( state == 5 ) begin    
                    if (floor1 > 3) begin
                         floor1 <= floor1 - 4;
//                         floor1binary <= floor1binary - 4'b0100;
                         elevator <= 4;
                     end
                     else begin
                         elevator <= elevator + floor1;
                         floor1 <= 0;
//                         floor1binary <= 4'b0000;
                     end
                    nextstate <= 4;
                    direction <= 1;
                    executiontime <= executiontime + 3;
                end
                else if ( state == 6 ) begin                     
                    if (floor2 > 3) begin
                         floor2 = floor2 - 4;
//                        floor2binary <= floor2binary - 4'b0100;
                         elevator <= 4;
                     end
                     else if ( floor2 + elevator > 4) begin
                         floor2 <= floor2 + elevator - 4;                             
//                         floor2binary <= floor2binary - (4 - elevator);
                         elevator <= 4;
                     end
                     else begin
                        elevator <= elevator + floor2;
                        floor2 <= 0;
//                        floor2binary <= 4'b0000;
                     end
                    nextstate <= state - 5;
                    direction <= 1;
                    executiontime <= executiontime + 3;
                end
                else if ( state == 7 ) begin                     
                    if (floor3 > 3) begin
                         floor3 <= floor3 - 4;
//                         floor3binary <= floor3binary - 4'b0100;
                         elevator <= 4;
                     end
                     else begin
                         elevator <= elevator + floor3;
                         floor3 <= 0;
//                         floor3binary <= 4'b0000;
    
                     end
                    nextstate <= state - 5;
                    direction <= 1;
                    executiontime <= executiontime + 3;
                end
                else if (elevator == 4 && state != 0) begin
                    if (state == 1) begin
                        nextstate <= 4;
                        direction <= 1;
                        executiontime <= executiontime + 3;
                    end                       
                    else begin
                        nextstate <= state - 1;
                        direction <= 1;
                        executiontime <= executiontime + 3;
                     end
                end
                else if (path[2] == 1'b1) begin
                     if (state != 3)  begin
                         nextstate <= state + 1;
                         direction <= 2;
                         executiontime <= executiontime + 3;
                     end else begin
                         path[2] = 1'b0;   
                         nextstate <= state + 4;
                         direction <= 0;
                         executiontime <= executiontime + 2;                         
                     end
                 end
                 
                 else if (path[1] == 1'b1) begin
                     if (state == 1 || state == 0) begin
                         nextstate <= state + 1;
                         direction <= 2;
                          executiontime <= executiontime + 3;

                     end else if (state == 3) begin
                         nextstate <= state - 1;
                         direction <= 1;
                          executiontime <= executiontime + 3;

                     end else begin
                         path[1] = 1'b0;
                         nextstate <= state + 4;
                         direction <= 0;
                          executiontime <= executiontime + 2;                         
                     end
                 end
                 else if (path[0] == 1'b1) begin
                     if (state == 0) begin
                         nextstate <= state + 1;
                         direction <= 2;
                          executiontime <= executiontime + 3;
                     end else if (state == 2 || state == 3 ) begin
                         nextstate <= state - 1;
                         direction <= 1;
                          executiontime <= executiontime + 3;
                     end else begin
                         path[0] = 1'b0;
                         nextstate <= state + 4;
                         direction <= 0;
                          executiontime <= executiontime + 2;
                     end
                 end
                 else if (path == 3'b000 && state != 0) begin
                    if (state == 1 && elevator > 0) begin
                        nextstate <= 4;
                        direction <= 1;
                        executiontime <= executiontime + 3;
                    end                       
                    else begin
                         nextstate <= state - 1;
                         direction <= 1;
                         executiontime <= executiontime + 3;
                     end
                 end
                 else if ( state == 0 && path != 3'b000) begin
                    nextstate <= state + 1;
                    direction <= 2;
                     executiontime <= executiontime + 3;
                 end            
                 else if ( state == 0 && path == 3'b000) begin
                     elevator <= 0;
                     if (floor3 > 3)
                         path <= 3'b100;
                     else if (floor2 > 3)
                         path <= 3'b010;
                     else if (floor1 > 3)
                         path <= 3'b001;
                     else begin
                         if ( floor3 == 2 && floor2 == 2)
                             path <= 3'b110;
                         else if ( (floor3 == 3 && floor2 == 1) )
                             path <= 3'b110;
                         else if ( (floor3 == 1 && floor2 == 3) )
                             path <= 3'b110;
                         else if ( (floor3 == 2 && floor1 == 2))
                             path <= 3'b101;
                         else if ( (floor3 == 3 && floor1 == 1) )
                             path <= 3'b101;
                         else if ( (floor3 == 1 && floor1 == 3) )
                             path <= 3'b101;
                         else if ( (floor2 == 2 && floor1 == 2))
                             path <= 3'b011;
                         else if ( (floor2 == 3 && floor1 == 1) )
                             path <= 3'b011;
                         else if ( (floor2 == 1 && floor1 == 3) )
                             path <= 3'b011;
                         else if ( floor3 == 3 && floor2 == 3 && floor1 == 2)
                             path <= 3'b110;
                         else if ( floor3 == 3 && floor2 == 2 && floor1 == 3)
                             path <= 3'b110;
                         else if ( floor3 == 2 && floor2 == 3 && floor1 == 3)
                             path <= 3'b110;
                         else if (floor3 == 3)
                             path <= 3'b100; 
                         else if (floor2 == 3)
                             path <= 3'b010; 
                         else if (floor1 == 3)
                             path <= 3'b001;
                        else if (floor3 > 0 && floor2 > 0 && floor1 > 0)
                             path <= 3'b111; 
                         else if (floor3 > 0 && floor2 > 0)
                             path <= 3'b110; 
                         else if (floor3 > 0 && floor1 > 0)
                             path <= 3'b101;
                         else if (floor2 > 0 && floor1 > 0)
                             path <= 3'b011;
                          else if (floor3 > 0)
                             path <= 3'b100; 
                         else if (floor2 > 0)
                             path <= 3'b010;                     
                         else if (floor1 > 0)
                             path <= 3'b001;
                         else begin
                             path <= 3'b000;
                             stopWork <= 1;
                             direction <= 0;
                         end
                     end
                 end
            end
        end
        
    always @(posedge clk_out_direction) begin
        if (contWork) begin 
            if (direction == 2) begin
                if (fourthdigit == 4'b1010)
                    fourthdigit <= 4'b1011;
                else if (fourthdigit == 4'b1011)
                    fourthdigit <= 4'b1100;            
                else if (fourthdigit == 4'b1100)
                    fourthdigit <= 4'b1101;
                else if (fourthdigit == 4'b1101)
                    fourthdigit <= 4'b1110;
                else if (fourthdigit == 4'b1110)
                    fourthdigit <= 4'b1111;
                else if (fourthdigit == 4'b1111)
                    fourthdigit <= 4'b1010;
            end
            else if (direction == 1) begin
                if (fourthdigit == 4'b1010)
                    fourthdigit <= 4'b1111;
                else if (fourthdigit == 4'b1011)
                    fourthdigit <= 4'b1010;            
                else if (fourthdigit == 4'b1100)
                    fourthdigit <= 4'b1011;
                else if (fourthdigit == 4'b1101)
                    fourthdigit <= 4'b1100;
                else if (fourthdigit == 4'b1110)
                    fourthdigit <= 4'b1101;
                else if (fourthdigit == 4'b1111)
                    fourthdigit <= 4'b1110;
            end
        end
        else 
            fourthdigit <= 4'b1010;
        
    end
    
    //Clock Divider
    ClockDivider clockModule(clk, clk_out);
    ClockDividerDirection directiontime (clk, clk_out_direction);
      
    //output logics
    outputlogic o( state, elevator, floor3, floor2, floor1, image_red, image_blue);
    

    display_8x8 display_8x8_0(
        .clk(clk),
        
        // RGB data for display current column
        .red_vect_in(image_red[col_num]),
        .green_vect_in(image_green[col_num]),
        .blue_vect_in(image_blue[col_num]),
        
        .col_data_capture(), // unused
        .col_num(col_num),
        
        // FPGA pins for display
        .reset_out(reset_out),
        .OE(OE),
        .SH_CP(SH_CP),
        .ST_CP(ST_CP),
        .DS(DS),
        .col_select(col_select)   
    );
    
    // this module shows 4 hexadecimal numbers on 4-digit 7-Segment.  
    // 4 digits are scanned with high speed, then you do not notice that every time 
    // only one of them is ON. dp is always off.
    SevSeg_4digit SevSeg_4digit_inst0(
        .clk(clk),
        .in3(fourthdigit), .in2(time2), .in1(time1), .in0(time0), //user inputs for each digit (hexadecimal)
        .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .dp(dp), // just connect them to FPGA pins (individual LEDs).
        .an(an)   // just connect them to FPGA pins (enable vector for 4 digits active low) 
    );
    
endmodule

module outputlogic( input int state, input int elevator, input int floor3, input int floor2, input int floor1, output logic [0:7] [7:0] image_red , output logic [0:7] [7:0] image_blue);
    logic [0:1][7:0] image_red_elevator;
    logic [0:1][7:0] image_blue_elevator;
    logic [0:5][1:0] image_red_floor1;
    logic [0:5][1:0] image_red_floor2;
    logic [0:5][1:0] image_red_floor3;
    
    always_comb begin
        image_red_elevator [0] = 8'b00000000;
        image_red_elevator [1] = 8'b00000000;
        image_blue_elevator [0] = 8'b00000000;
        image_blue_elevator [1] = 8'b00000000;
        if (state == 0 || state == 4) begin
            if(elevator == 4) begin
                image_red_elevator [0][0] <= 1'b1;
                image_red_elevator [0][1] <= 1'b1;
                image_red_elevator [1][0] <= 1'b1;
                image_red_elevator [1][1] <= 1'b1;
             
            end
            else if (elevator == 3) begin
                image_red_elevator [0][0] <= 1'b1;
                image_red_elevator [0][1] <= 1'b1;
                image_blue_elevator [1][0] <= 1'b1;
                image_red_elevator [1][1] <= 1'b1;
            end
            else if (elevator == 2) begin
                image_blue_elevator [0][0] <= 1'b1;
                image_red_elevator [0][1] <= 1'b1;
                image_blue_elevator [1][0] <= 1'b1;
                image_red_elevator [1][1] <= 1'b1;
            end
            else if (elevator == 1) begin
                image_blue_elevator [0][0] <= 1'b1;
                image_red_elevator [0][1] <= 1'b1;
                image_blue_elevator [1][0] <= 1'b1;
                image_blue_elevator [1][1] <= 1'b1;
            end
            else if (elevator == 0) begin
                image_blue_elevator [0][0] <= 1'b1;
                image_blue_elevator [0][1] <= 1'b1;
                image_blue_elevator [1][0] <= 1'b1;
                image_blue_elevator [1][1] <= 1'b1;
            end
        end
        else if (state == 1 || state == 5) begin
            if(elevator == 4) begin
                image_red_elevator [0][2] <= 1'b1;
                image_red_elevator [0][3] <= 1'b1;
                image_red_elevator [1][2] <= 1'b1;
                image_red_elevator [1][3] <= 1'b1;
            end
            else if (elevator == 3) begin
                image_red_elevator [0][2] <= 1'b1;
                image_red_elevator [0][3] <= 1'b1;
                image_blue_elevator [1][2] <= 1'b1;
                image_red_elevator [1][3] <= 1'b1;
            end
            else if (elevator == 2) begin
                image_blue_elevator [0][2] <= 1'b1;
                image_red_elevator [0][3] <= 1'b1;
                image_blue_elevator [1][2] <= 1'b1;
                image_red_elevator [1][3] <= 1'b1;
            end
            else if (elevator == 1) begin
                image_blue_elevator [0][2] <= 1'b1;
                image_red_elevator [0][3] <= 1'b1;
                image_blue_elevator [1][2] <= 1'b1;
                image_blue_elevator [1][3] <= 1'b1;
            end
            else if (elevator == 0) begin
                image_blue_elevator [0][2] <= 1'b1;
                image_blue_elevator [0][3] <= 1'b1;
                image_blue_elevator [1][2] <= 1'b1;
                image_blue_elevator [1][3] <= 1'b1;
            end
        end
        else if (state == 2 || state == 6) begin
            if(elevator == 4) begin
                image_red_elevator [0][4] <= 1'b1;
                image_red_elevator [0][5] <= 1'b1;
                image_red_elevator [1][4] <= 1'b1;
                image_red_elevator [1][5] <= 1'b1;
            end
            else if (elevator == 3) begin
                image_red_elevator [0][4] <= 1'b1;
                image_red_elevator [0][5] <= 1'b1;
                image_blue_elevator [1][4] <= 1'b1;
                image_red_elevator [1][5] <= 1'b1;
            end
            else if (elevator == 2) begin
                image_blue_elevator [0][4] <= 1'b1;
                image_red_elevator [0][5] <= 1'b1;
                image_blue_elevator [1][4] <= 1'b1;
                image_red_elevator [1][5] <= 1'b1;
            end
            else if (elevator == 1) begin
                image_blue_elevator [0][4] <= 1'b1;
                image_red_elevator [0][5] <= 1'b1;
                image_blue_elevator [1][4] <= 1'b1;
                image_blue_elevator [1][5] <= 1'b1;
            end
            else if (elevator == 0) begin
                image_blue_elevator [0][4] <= 1'b1;
                image_blue_elevator [0][5] <= 1'b1;
                image_blue_elevator [1][4] <= 1'b1;
                image_blue_elevator [1][5] <= 1'b1;
            end
        end 
        else if (state == 3 || state == 7) begin
            if(elevator == 4) begin
                image_red_elevator [0][6] <= 1'b1;
                image_red_elevator [0][7] <= 1'b1;
                image_red_elevator [1][6] <= 1'b1;
                image_red_elevator [1][7] <= 1'b1;
            end
            else if (elevator == 3) begin
                image_red_elevator [0][6] <= 1'b1;
                image_red_elevator [0][7] <= 1'b1;
                image_blue_elevator [1][6] <= 1'b1;
                image_red_elevator [1][7] <= 1'b1;
            end
            else if (elevator == 2) begin
                image_blue_elevator [0][6] <= 1'b1;
                image_red_elevator [0][7] <= 1'b1;
                image_blue_elevator [1][6] <= 1'b1;
                image_red_elevator [1][7] <= 1'b1;
            end
            else if (elevator == 1) begin
                image_blue_elevator [0][6] <= 1'b1;
                image_red_elevator [0][7] <= 1'b1;
                image_blue_elevator [1][6] <= 1'b1;
                image_blue_elevator [1][7] <= 1'b1;
            end
            else if (elevator == 0) begin
                image_blue_elevator [0][6] <= 1'b1;
                image_blue_elevator [0][7] <= 1'b1;
                image_blue_elevator [1][6] <= 1'b1;
                image_blue_elevator [1][7] <= 1'b1;
            end
        end
    end

    always_comb begin
        image_red_floor1[0] <= 2'b00;
        image_red_floor1[1] <= 2'b00;
        image_red_floor1[2] <= 2'b00;
        image_red_floor1[3] <= 2'b00;
        image_red_floor1[4] <= 2'b00;
        image_red_floor1[5] <= 2'b00;
        image_red_floor1[6] <= 2'b00;
        image_red_floor1[7] <= 2'b00;
        if(floor1 == 1) begin
            image_red_floor1[0][1] <= 1'b1;
        end else if (floor1 == 2) begin
            image_red_floor1[0][1] <= 1'b1;
            image_red_floor1[0][0] <= 1'b1;
        end else if (floor1 == 3) begin
            image_red_floor1[0][1] <= 1'b1;
            image_red_floor1[0][0] <= 1'b1;
            image_red_floor1[1][1] <= 1'b1;
        end else if (floor1 == 4) begin
            image_red_floor1[0][1] <= 1'b1;
            image_red_floor1[0][0] <= 1'b1;
            image_red_floor1[1][1] <= 1'b1;
            image_red_floor1[1][0] <= 1'b1;
        end else if (floor1 == 5) begin
            image_red_floor1[0][1] <= 1'b1;
            image_red_floor1[0][0] <= 1'b1;
            image_red_floor1[1][1] <= 1'b1;
            image_red_floor1[1][0] <= 1'b1;
            image_red_floor1[2][1] <= 1'b1;
        end else if (floor1 == 6) begin
            image_red_floor1[0][1] <= 1'b1;
            image_red_floor1[0][0] <= 1'b1;
            image_red_floor1[1][1] <= 1'b1;
            image_red_floor1[1][0] <= 1'b1;
            image_red_floor1[2][1] <= 1'b1;
            image_red_floor1[2][0] <= 1'b1;
        end else if (floor1 == 7) begin
            image_red_floor1[0][1] <= 1'b1;
            image_red_floor1[0][0] <= 1'b1;
            image_red_floor1[1][1] <= 1'b1;
            image_red_floor1[1][0] <= 1'b1;
            image_red_floor1[2][1] <= 1'b1;
            image_red_floor1[2][0] <= 1'b1;
            image_red_floor1[3][1] <= 1'b1;
        end else if (floor1 == 8) begin
            image_red_floor1[0][1] <= 1'b1;
            image_red_floor1[0][0] <= 1'b1;
            image_red_floor1[1][1] <= 1'b1;
            image_red_floor1[1][0] <= 1'b1;
            image_red_floor1[2][1] <= 1'b1;
            image_red_floor1[2][0] <= 1'b1;
            image_red_floor1[3][1] <= 1'b1;
            image_red_floor1[3][0] <= 1'b1;
       end else if (floor1 == 9) begin
            image_red_floor1[0][1] <= 1'b1;
            image_red_floor1[0][0] <= 1'b1;
            image_red_floor1[1][1] <= 1'b1;
            image_red_floor1[1][0] <= 1'b1;
            image_red_floor1[2][1] <= 1'b1;
            image_red_floor1[2][0] <= 1'b1;
            image_red_floor1[3][1] <= 1'b1;
            image_red_floor1[3][0] <= 1'b1;
            image_red_floor1[4][1] <= 1'b1;
       end else if (floor1 == 10) begin
            image_red_floor1[0][1] <= 1'b1;
            image_red_floor1[0][0] <= 1'b1;
            image_red_floor1[1][1] <= 1'b1;
            image_red_floor1[1][0] <= 1'b1;
            image_red_floor1[2][1] <= 1'b1;
            image_red_floor1[2][0] <= 1'b1;
            image_red_floor1[3][1] <= 1'b1;
            image_red_floor1[3][0] <= 1'b1;
            image_red_floor1[4][1] <= 1'b1;
            image_red_floor1[4][0] <= 1'b1;
       end else if (floor1 == 11) begin
            image_red_floor1[0][1] <= 1'b1;
            image_red_floor1[0][0] <= 1'b1;
            image_red_floor1[1][1] <= 1'b1;
            image_red_floor1[1][0] <= 1'b1;
            image_red_floor1[2][1] <= 1'b1;
            image_red_floor1[2][0] <= 1'b1;
            image_red_floor1[3][1] <= 1'b1;
            image_red_floor1[3][0] <= 1'b1;
            image_red_floor1[4][1] <= 1'b1;
            image_red_floor1[4][0] <= 1'b1;
            image_red_floor1[5][1] <= 1'b1;
        end else if (floor1 == 12) begin
            image_red_floor1[0][1] <= 1'b1;
            image_red_floor1[0][0] <= 1'b1;
            image_red_floor1[1][1] <= 1'b1;
            image_red_floor1[1][0] <= 1'b1;
            image_red_floor1[2][1] <= 1'b1;
            image_red_floor1[2][0] <= 1'b1;
            image_red_floor1[3][1] <= 1'b1;
            image_red_floor1[3][0] <= 1'b1;
            image_red_floor1[4][1] <= 1'b1;
            image_red_floor1[4][0] <= 1'b1;
            image_red_floor1[5][1] <= 1'b1;
            image_red_floor1[5][0] <= 1'b1;
        end
    end
    
    always_comb begin
        image_red_floor2[0] <= 2'b00;
        image_red_floor2[1] <= 2'b00;
        image_red_floor2[2] <= 2'b00;
        image_red_floor2[3] <= 2'b00;
        image_red_floor2[4] <= 2'b00;
        image_red_floor2[5] <= 2'b00;
        image_red_floor2[6] <= 2'b00;
        image_red_floor2[7] <= 2'b00;               
        if(floor2 == 1) begin
            image_red_floor2[0][1] <= 1'b1;
        end else if (floor2 == 2) begin
            image_red_floor2[0][1] <= 1'b1;
            image_red_floor2[0][0] <= 1'b1;
        end else if (floor2 == 3) begin
            image_red_floor2[0][1] <= 1'b1;
            image_red_floor2[0][0] <= 1'b1;
            image_red_floor2[1][1] <= 1'b1;
        end else if (floor2 == 4) begin
            image_red_floor2[0][1] <= 1'b1;
            image_red_floor2[0][0] <= 1'b1;
            image_red_floor2[1][1] <= 1'b1;
            image_red_floor2[1][0] <= 1'b1;
        end else if (floor2 == 5) begin
            image_red_floor2[0][1] <= 1'b1;
            image_red_floor2[0][0] <= 1'b1;
            image_red_floor2[1][1] <= 1'b1;
            image_red_floor2[1][0] <= 1'b1;
            image_red_floor2[2][1] <= 1'b1;
        end else if (floor2 == 6) begin
            image_red_floor2[0][1] <= 1'b1;
            image_red_floor2[0][0] <= 1'b1;
            image_red_floor2[1][1] <= 1'b1;
            image_red_floor2[1][0] <= 1'b1;
            image_red_floor2[2][1] <= 1'b1;
            image_red_floor2[2][0] <= 1'b1;
        end else if (floor2 == 7) begin
            image_red_floor2[0][1] <= 1'b1;
            image_red_floor2[0][0] <= 1'b1;
            image_red_floor2[1][1] <= 1'b1;
            image_red_floor2[1][0] <= 1'b1;
            image_red_floor2[2][1] <= 1'b1;
            image_red_floor2[2][0] <= 1'b1;
            image_red_floor2[3][1] <= 1'b1;
        end else if (floor2 == 8) begin
            image_red_floor2[0][1] <= 1'b1;
            image_red_floor2[0][0] <= 1'b1;
            image_red_floor2[1][1] <= 1'b1;
            image_red_floor2[1][0] <= 1'b1;
            image_red_floor2[2][1] <= 1'b1;
            image_red_floor2[2][0] <= 1'b1;
            image_red_floor2[3][1] <= 1'b1;
            image_red_floor2[3][0] <= 1'b1;
       end else if (floor2 == 9) begin
            image_red_floor2[0][1] <= 1'b1;
            image_red_floor2[0][0] <= 1'b1;
            image_red_floor2[1][1] <= 1'b1;
            image_red_floor2[1][0] <= 1'b1;
            image_red_floor2[2][1] <= 1'b1;
            image_red_floor2[2][0] <= 1'b1;
            image_red_floor2[3][1] <= 1'b1;
            image_red_floor2[3][0] <= 1'b1;
            image_red_floor2[4][1] <= 1'b1;
       end else if (floor2 == 10) begin
            image_red_floor2[0][1] <= 1'b1;
            image_red_floor2[0][0] <= 1'b1;
            image_red_floor2[1][1] <= 1'b1;
            image_red_floor2[1][0] <= 1'b1;
            image_red_floor2[2][1] <= 1'b1;
            image_red_floor2[2][0] <= 1'b1;
            image_red_floor2[3][1] <= 1'b1;
            image_red_floor2[3][0] <= 1'b1;
            image_red_floor2[4][1] <= 1'b1;
            image_red_floor2[4][0] <= 1'b1;
       end else if (floor2 == 11) begin
            image_red_floor2[0][1] <= 1'b1;
            image_red_floor2[0][0] <= 1'b1;
            image_red_floor2[1][1] <= 1'b1;
            image_red_floor2[1][0] <= 1'b1;
            image_red_floor2[2][1] <= 1'b1;
            image_red_floor2[2][0] <= 1'b1;
            image_red_floor2[3][1] <= 1'b1;
            image_red_floor2[3][0] <= 1'b1;
            image_red_floor2[4][1] <= 1'b1;
            image_red_floor2[4][0] <= 1'b1;
            image_red_floor2[5][1] <= 1'b1;
        end else if (floor2 == 12) begin
            image_red_floor2[0][1] <= 1'b1;
            image_red_floor2[0][0] <= 1'b1;
            image_red_floor2[1][1] <= 1'b1;
            image_red_floor2[1][0] <= 1'b1;
            image_red_floor2[2][1] <= 1'b1;
            image_red_floor2[2][0] <= 1'b1;
            image_red_floor2[3][1] <= 1'b1;
            image_red_floor2[3][0] <= 1'b1;
            image_red_floor2[4][1] <= 1'b1;
            image_red_floor2[4][0] <= 1'b1;
            image_red_floor2[5][1] <= 1'b1;
            image_red_floor2[5][0] <= 1'b1;
        end
    end    
    
    always_comb begin
        image_red_floor3[0] <= 2'b00;
        image_red_floor3[1] <= 2'b00;
        image_red_floor3[2] <= 2'b00;
        image_red_floor3[3] <= 2'b00;
        image_red_floor3[4] <= 2'b00;
        image_red_floor3[5] <= 2'b00;
        image_red_floor3[6] <= 2'b00;
        image_red_floor3[7] <= 2'b00;
        if(floor3 == 1) begin
            image_red_floor3[0][1] <= 1'b1;
        end else if (floor3 == 2) begin
            image_red_floor3[0][1] <= 1'b1;
            image_red_floor3[0][0] <= 1'b1;
        end else if (floor3 == 3) begin
            image_red_floor3[0][1] <= 1'b1;
            image_red_floor3[0][0] <= 1'b1;
            image_red_floor3[1][1] <= 1'b1;
        end else if (floor3 == 4) begin
            image_red_floor3[0][1] <= 1'b1;
            image_red_floor3[0][0] <= 1'b1;
            image_red_floor3[1][1] <= 1'b1;
            image_red_floor3[1][0] <= 1'b1;
        end else if (floor3 == 5) begin
            image_red_floor3[0][1] <= 1'b1;
            image_red_floor3[0][0] <= 1'b1;
            image_red_floor3[1][1] <= 1'b1;
            image_red_floor3[1][0] <= 1'b1;
            image_red_floor3[2][1] <= 1'b1;
        end else if (floor3 == 6) begin
            image_red_floor3[0][1] <= 1'b1;
            image_red_floor3[0][0] <= 1'b1;
            image_red_floor3[1][1] <= 1'b1;
            image_red_floor3[1][0] <= 1'b1;
            image_red_floor3[2][1] <= 1'b1;
            image_red_floor3[2][0] <= 1'b1;
        end else if (floor3 == 7) begin
            image_red_floor3[0][1] <= 1'b1;
            image_red_floor3[0][0] <= 1'b1;
            image_red_floor3[1][1] <= 1'b1;
            image_red_floor3[1][0] <= 1'b1;
            image_red_floor3[2][1] <= 1'b1;
            image_red_floor3[2][0] <= 1'b1;
            image_red_floor3[3][1] <= 1'b1;
        end else if (floor3 == 8) begin
            image_red_floor3[0][1] <= 1'b1;
            image_red_floor3[0][0] <= 1'b1;
            image_red_floor3[1][1] <= 1'b1;
            image_red_floor3[1][0] <= 1'b1;
            image_red_floor3[2][1] <= 1'b1;
            image_red_floor3[2][0] <= 1'b1;
            image_red_floor3[3][1] <= 1'b1;
            image_red_floor3[3][0] <= 1'b1;
       end else if (floor3 == 9) begin
            image_red_floor3[0][1] <= 1'b1;
            image_red_floor3[0][0] <= 1'b1;
            image_red_floor3[1][1] <= 1'b1;
            image_red_floor3[1][0] <= 1'b1;
            image_red_floor3[2][1] <= 1'b1;
            image_red_floor3[2][0] <= 1'b1;
            image_red_floor3[3][1] <= 1'b1;
            image_red_floor3[3][0] <= 1'b1;
            image_red_floor3[4][1] <= 1'b1;
       end else if (floor3 == 10) begin
            image_red_floor3[0][1] <= 1'b1;
            image_red_floor3[0][0] <= 1'b1;
            image_red_floor3[1][1] <= 1'b1;
            image_red_floor3[1][0] <= 1'b1;
            image_red_floor3[2][1] <= 1'b1;
            image_red_floor3[2][0] <= 1'b1;
            image_red_floor3[3][1] <= 1'b1;
            image_red_floor3[3][0] <= 1'b1;
            image_red_floor3[4][1] <= 1'b1;
            image_red_floor3[4][0] <= 1'b1;
       end else if (floor3 == 11) begin
            image_red_floor3[0][1] <= 1'b1;
            image_red_floor3[0][0] <= 1'b1;
            image_red_floor3[1][1] <= 1'b1;
            image_red_floor3[1][0] <= 1'b1;
            image_red_floor3[2][1] <= 1'b1;
            image_red_floor3[2][0] <= 1'b1;
            image_red_floor3[3][1] <= 1'b1;
            image_red_floor3[3][0] <= 1'b1;
            image_red_floor3[4][1] <= 1'b1;
            image_red_floor3[4][0] <= 1'b1;
            image_red_floor3[5][1] <= 1'b1;
        end else if (floor3 == 12) begin
            image_red_floor3[0][1] <= 1'b1;
            image_red_floor3[0][0] <= 1'b1;
            image_red_floor3[1][1] <= 1'b1;
            image_red_floor3[1][0] <= 1'b1;
            image_red_floor3[2][1] <= 1'b1;
            image_red_floor3[2][0] <= 1'b1;
            image_red_floor3[3][1] <= 1'b1;
            image_red_floor3[3][0] <= 1'b1;
            image_red_floor3[4][1] <= 1'b1;
            image_red_floor3[4][0] <= 1'b1;
            image_red_floor3[5][1] <= 1'b1;
            image_red_floor3[5][0] <= 1'b1;
        end
    end
    
    assign image_blue[0] = image_blue_elevator[0];
    assign image_blue[1] = image_blue_elevator[1];
    assign image_red[0] = image_red_elevator[0];
    assign image_red[1] = image_red_elevator[1];
       
    assign image_red [2][3:2] = image_red_floor1[0];
    assign image_red [3][3:2] = image_red_floor1[1];
    assign image_red [4][3:2] = image_red_floor1[2];
    assign image_red [5][3:2] = image_red_floor1[3];
    assign image_red [6][3:2] = image_red_floor1[4];
    assign image_red [7][3:2] = image_red_floor1[5];
    
    assign image_red [2][5:4] = image_red_floor2[0];
    assign image_red [3][5:4] = image_red_floor2[1];
    assign image_red [4][5:4] = image_red_floor2[2];
    assign image_red [5][5:4] = image_red_floor2[3];
    assign image_red [6][5:4] = image_red_floor2[4];
    assign image_red [7][5:4] = image_red_floor2[5];    
    
    assign image_red [2][7:6] = image_red_floor3[0];
    assign image_red [3][7:6] = image_red_floor3[1];
    assign image_red [4][7:6] = image_red_floor3[2];
    assign image_red [5][7:6] = image_red_floor3[3];
    assign image_red [6][7:6] = image_red_floor3[4];
    assign image_red [7][7:6] = image_red_floor3[5];      
endmodule

module ClockDivider(
input clk_in , output clk_out
);
logic [25:0] count = {26{1'b0}};
logic clk_NoBuf;
always@ (posedge clk_in) begin
count <= count + 1;
end
// you can modify 25 to have different clock rate
assign clk_NoBuf = count[25];
BUFG BUFG_inst (
.I(clk_NoBuf), // 1-bit input: Clock input
.O(clk_out) // 1-bit output: Clock output
);
endmodule

module ClockDividerDirection(
input clk_in , output clk_out
);
logic [24:0] count = {25{1'b0}};
logic clk_NoBuf;
always@ (posedge clk_in) begin
count <= count + 1;
end
// you can modify 25 to have different clock rate
assign clk_NoBuf = count[24];
BUFG BUFG_inst (
.I(clk_NoBuf), // 1-bit input: Clock input
.O(clk_out) // 1-bit output: Clock output
);
endmodule
