onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label HEX0 /DE1_SoC_testbench/HEX0
add wave -noupdate -label award_bot_point /DE1_SoC_testbench/dut/b/award_bot_point
add wave -noupdate -label lscore /DE1_SoC_testbench/dut/V/l_Score
add wave -noupdate -label HEX1 /DE1_SoC_testbench/HEX5
add wave -noupdate -label rscore /DE1_SoC_testbench/dut/V/r_Score
add wave -noupdate -label KEY0 {/DE1_SoC_testbench/KEY[0]}
add wave -noupdate -label LEDR /DE1_SoC_testbench/LEDR
add wave -noupdate -label clk /DE1_SoC_testbench/clkSelect
add wave -noupdate -label rst {/DE1_SoC_testbench/SW[9]}
add wave -noupdate -label difficulty /DE1_SoC_testbench/dut/b/difficulty
add wave -noupdate -label random_num /DE1_SoC_testbench/dut/b/rand_num
add wave -noupdate -label nextRound /DE1_SoC_testbench/dut/nextRound
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {31831 ps} 0}
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
WaveRestoreZoom {0 ps} {53813 ps}
