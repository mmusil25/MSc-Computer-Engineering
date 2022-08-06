transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/musil/OneDrive - Ohio University/First Year/Winter/Design of Digital Circuits/m4/lab4/SWtoLED.vhd}

