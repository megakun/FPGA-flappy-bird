onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label HEX0 /DE1_SoC_testbench/HEX0
add wave -noupdate -label L {/DE1_SoC_testbench/KEY[3]}
add wave -noupdate -label R {/DE1_SoC_testbench/KEY[0]}
add wave -noupdate -label 8 {/DE1_SoC_testbench/LEDR[8]}
add wave -noupdate -label 7 {/DE1_SoC_testbench/LEDR[7]}
add wave -noupdate -label 6 {/DE1_SoC_testbench/LEDR[6]}
add wave -noupdate -label 5 {/DE1_SoC_testbench/LEDR[5]}
add wave -noupdate -label 4 {/DE1_SoC_testbench/LEDR[4]}
add wave -noupdate -label 3 {/DE1_SoC_testbench/LEDR[3]}
add wave -noupdate -label 2 {/DE1_SoC_testbench/LEDR[2]}
add wave -noupdate -label 1 {/DE1_SoC_testbench/LEDR[1]}
add wave -noupdate -label 0 {/DE1_SoC_testbench/LEDR[0]}
add wave -noupdate -label rst {/DE1_SoC_testbench/SW[9]}
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
