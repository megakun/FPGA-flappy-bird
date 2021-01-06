onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label {LED 0} {/DE1_SoC_testbench/LEDR[0]}
add wave -noupdate -label {LED 1} {/DE1_SoC_testbench/LEDR[1]}
add wave -noupdate -label {SW 9} {/DE1_SoC_testbench/SW[9]}
add wave -noupdate -label {SW 8} {/DE1_SoC_testbench/SW[8]}
add wave -noupdate -label {SW 7} {/DE1_SoC_testbench/SW[7]}
add wave -noupdate -label {SW 6} {/DE1_SoC_testbench/SW[6]}
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
