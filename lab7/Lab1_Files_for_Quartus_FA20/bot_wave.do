onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label award_bot_point /bot_testbench/award_bot_point
add wave -noupdate -label clk /bot_testbench/clk
add wave -noupdate -label diffculty /bot_testbench/difficulty
add wave -noupdate -label rst /bot_testbench/rst
add wave -noupdate -label random_num /bot_testbench/dut/rand_num
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3339 ps} 0}
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
