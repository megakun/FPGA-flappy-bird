onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /victory_testbench/clk
add wave -noupdate -label edgel /victory_testbench/edgelight_L
add wave -noupdate -label edger /victory_testbench/edgelight_R
add wave -noupdate -label pl /victory_testbench/PL
add wave -noupdate -label pr /victory_testbench/PR
add wave -noupdate -label LHEX /victory_testbench/LHEX
add wave -noupdate -label lscore /victory_testbench/dut/l_Score
add wave -noupdate -label RHEX /victory_testbench/RHEX
add wave -noupdate -label rscore /victory_testbench/dut/r_Score
add wave -noupdate -label nextRound /victory_testbench/nextRound
add wave -noupdate -label rst /victory_testbench/rst
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {137 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {0 ps} {5093 ps}
