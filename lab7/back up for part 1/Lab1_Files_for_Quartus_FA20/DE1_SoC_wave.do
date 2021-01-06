onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label HEXR /DE1_SoC_testbench/HEX0
add wave -noupdate -label HEXL /DE1_SoC_testbench/HEX5
add wave -noupdate -label lscore /DE1_SoC_testbench/dut/V/l_Score
add wave -noupdate -label K0 {/DE1_SoC_testbench/KEY[0]}
add wave -noupdate -label K1 {/DE1_SoC_testbench/KEY[3]}
add wave -noupdate -label LEDR /DE1_SoC_testbench/LEDR
add wave -noupdate -label rst {/DE1_SoC_testbench/SW[9]}
add wave -noupdate -label clk /DE1_SoC_testbench/CLOCK_50
add wave -noupdate -label rscore /DE1_SoC_testbench/dut/V/r_Score
add wave -noupdate -label nR /DE1_SoC_testbench/dut/V/nextRound
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3194 ps} 0}
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
WaveRestoreZoom {0 ps} {10028 ps}
