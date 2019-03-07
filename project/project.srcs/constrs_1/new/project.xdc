
#------------------------------------------------------------
#---------------------- Clock signal ------------------------
#------------------------------------------------------------
set_property PACKAGE_PIN W5 [get_ports clk]  	 	 	 	  
set_property IOSTANDARD LVCMOS33 [get_ports clk] 
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk] 


#------------------------------------------------------------
#-------------------- 7 segment display ---------------------
#------------------------------------------------------------
set_property PACKAGE_PIN W7 [get_ports {a}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {a}] 
set_property PACKAGE_PIN W6 [get_ports {b}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {b}] 
set_property PACKAGE_PIN U8 [get_ports {c}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {c}] 
set_property PACKAGE_PIN V8 [get_ports {d}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {d}] 
set_property PACKAGE_PIN U5 [get_ports {e}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {e}] 
set_property PACKAGE_PIN V5 [get_ports {f}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {f}] 
set_property PACKAGE_PIN U7 [get_ports {g}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {g}] 
set_property PACKAGE_PIN V7 [get_ports dp]  	 	 	 	  
 	set_property IOSTANDARD LVCMOS33 [get_ports dp] 
	
set_property PACKAGE_PIN U2 [get_ports {an[0]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}] 
set_property PACKAGE_PIN U4 [get_ports {an[1]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}] 
set_property PACKAGE_PIN V4 [get_ports {an[2]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}] 
set_property PACKAGE_PIN W4 [get_ports {an[3]}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}] 

	
#------------------------------------------------------------
#---------------------- keyboard matrix ---------------------
#------------------------------------------------------------	
set_property PACKAGE_PIN J1 [get_ports {keyb_row[0]}] 	 	 	 	 	 
 	set_property IOSTANDARD  LVCMOS33 [get_ports {keyb_row[0]}] 
set_property PACKAGE_PIN L2 [get_ports {keyb_row[1]}] 	 	 	 	 	 
 	set_property IOSTANDARD  LVCMOS33 [get_ports {keyb_row[1]}] 
set_property PACKAGE_PIN J2 [get_ports {keyb_row[2]}] 	 	 	 	 	 
 	set_property IOSTANDARD  LVCMOS33 [get_ports {keyb_row[2]}] 
set_property PACKAGE_PIN G2 [get_ports {keyb_row[3]}] 	 	 	 	 	 
 	set_property IOSTANDARD  LVCMOS33 [get_ports {keyb_row[3]}] 

set_property PACKAGE_PIN H1 [get_ports {keyb_col[0]}] 	 	 	 	 	 
 	set_property IOSTANDARD  LVCMOS33 [get_ports {keyb_col[0]}] 
set_property PACKAGE_PIN K2 [get_ports {keyb_col[1]}] 	 	 	 	 	 
 	set_property IOSTANDARD  LVCMOS33 [get_ports {keyb_col[1]}] 
set_property PACKAGE_PIN H2 [get_ports {keyb_col[2]}] 	 	 	 	 	 
 	set_property IOSTANDARD  LVCMOS33 [get_ports {keyb_col[2]}] 
set_property PACKAGE_PIN G3 [get_ports {keyb_col[3]}] 	 	 	 	 	 
 	set_property IOSTANDARD  LVCMOS33 [get_ports {keyb_col[3]}] 



#------------------------------------------------------------
#---------------------- Display Connector--------------------
#------------------------------------------------------------
set_property PACKAGE_PIN L17 [get_ports reset_out]
set_property IOSTANDARD LVCMOS33 [get_ports reset_out]

set_property PACKAGE_PIN M18 [get_ports OE]
set_property IOSTANDARD LVCMOS33 [get_ports OE]

set_property PACKAGE_PIN P18 [get_ports SH_CP]
set_property IOSTANDARD LVCMOS33 [get_ports SH_CP]

set_property PACKAGE_PIN N17 [get_ports ST_CP]
set_property IOSTANDARD LVCMOS33 [get_ports ST_CP]

set_property PACKAGE_PIN K17 [get_ports DS]
set_property IOSTANDARD LVCMOS33 [get_ports DS]

set_property PACKAGE_PIN A14 [get_ports {col_select[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col_select[0]}]

set_property PACKAGE_PIN A16 [get_ports {col_select[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col_select[1]}]

set_property PACKAGE_PIN B15 [get_ports {col_select[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col_select[2]}]

set_property PACKAGE_PIN B16 [get_ports {col_select[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col_select[3]}]

set_property PACKAGE_PIN A15 [get_ports {col_select[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col_select[4]}]

set_property PACKAGE_PIN A17 [get_ports {col_select[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col_select[5]}]

set_property PACKAGE_PIN C15 [get_ports {col_select[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col_select[6]}]

set_property PACKAGE_PIN C16 [get_ports {col_select[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col_select[7]}]


#------------------------------------------------------------
#---------------------- Buttons--------------------
#------------------------------------------------------------
set_property PACKAGE_PIN U18 [get_ports resetTimer]  	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports resetTimer] 
set_property PACKAGE_PIN T18 [get_ports start]  	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports start] 
set_property PACKAGE_PIN U17 [get_ports reset]  	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports reset] 
 
 
## To test through basys without beti board
#set_property PACKAGE_PIN W19 [get_ports floorminus]  	 	 	 	 	 
#    set_property IOSTANDARD LVCMOS33 [get_ports floorminus] 
#set_property PACKAGE_PIN T17 [get_ports floorplus]                           
#    set_property IOSTANDARD LVCMOS33 [get_ports floorplus]
#set_property PACKAGE_PIN V17 [get_ports floorone] 	 	 	 	 	 
#         set_property IOSTANDARD LVCMOS33 [get_ports floorone] 
#set_property PACKAGE_PIN V16 [get_ports floortwo]                          
#     set_property IOSTANDARD LVCMOS33 [get_ports floortwo] 
#set_property PACKAGE_PIN W16 [get_ports floorthree]                          
#     set_property IOSTANDARD LVCMOS33 [get_ports floorthree] 
     

#set_property PACKAGE_PIN W18 [get_ports {floor1binary[0]}]                      
#  set_property IOSTANDARD LVCMOS33 [get_ports {floor1binary[0]}] 
#set_property PACKAGE_PIN U15 [get_ports {floor1binary[1]}]                      
#  set_property IOSTANDARD LVCMOS33 [get_ports {floor1binary[1]}] 
#set_property PACKAGE_PIN U14 [get_ports {floor1binary[2]}]                      
#  set_property IOSTANDARD LVCMOS33 [get_ports {floor1binary[2]}] 
#set_property PACKAGE_PIN V14 [get_ports {floor1binary[3]}]                      
#  set_property IOSTANDARD LVCMOS33 [get_ports {floor1binary[3]}] 
#set_property PACKAGE_PIN V13 [get_ports {floor2binary[0]}]                      
#  set_property IOSTANDARD LVCMOS33 [get_ports {floor2binary[0]}] 
#set_property PACKAGE_PIN V3 [get_ports {floor2binary[1]}]                          
#  set_property IOSTANDARD LVCMOS33 [get_ports {floor2binary[1]}] 
#set_property PACKAGE_PIN W3 [get_ports {floor2binary[2]}]                      
#  set_property IOSTANDARD LVCMOS33 [get_ports {floor2binary[2]}] 
#set_property PACKAGE_PIN U3 [get_ports {floor2binary[3]}]                      
#  set_property IOSTANDARD LVCMOS33 [get_ports {floor2binary[3]}] 
#set_property PACKAGE_PIN P3 [get_ports {floor3binary[0]}]                      
#  set_property IOSTANDARD LVCMOS33 [get_ports {floor3binary[0]}] 
#set_property PACKAGE_PIN N3 [get_ports {floor3binary[1]}]                      
#  set_property IOSTANDARD LVCMOS33 [get_ports {floor3binary[1]}] 
#set_property PACKAGE_PIN P1 [get_ports {floor3binary[2]}]                      
#  set_property IOSTANDARD LVCMOS33 [get_ports {floor3binary[2]}] 
#set_property PACKAGE_PIN L1 [get_ports {floor3binary[3]}]                                   
# set_property IOSTANDARD LVCMOS33 [get_ports {floor3binary[3]}] 
#set_property PACKAGE_PIN U16 [get_ports {statebinary[0]}]  	 	 	 	 
# 	set_property IOSTANDARD LVCMOS33 [get_ports {statebinary[0]}] 
#set_property PACKAGE_PIN E19 [get_ports {statebinary[1]}]  	 	 	 	 
# 	set_property IOSTANDARD LVCMOS33 [get_ports {statebinary[1]}] 

	


