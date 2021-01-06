onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label grn /DE1_SoC_testbench/dut/GrnPixels
add wave -noupdate -label red /DE1_SoC_testbench/dut/RedPixels
add wave -noupdate -label ones /DE1_SoC_testbench/HEX0
add wave -noupdate -label tens /DE1_SoC_testbench/HEX1
add wave -noupdate -format Literal -label rst {/DE1_SoC_testbench/SW[9]}
add wave -noupdate -label button {/DE1_SoC_testbench/KEY[0]}
add wave -noupdate -label gameover /DE1_SoC_testbench/dut/gameover
add wave -noupdate -label clk /DE1_SoC_testbench/clkSelect
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
