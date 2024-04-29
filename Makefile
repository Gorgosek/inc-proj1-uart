
all: pack work test

test: pack 
	@bash ./test.sh

work: pack
	@bash ./uart.sh

pack: 
	-zip xnezbea00.zip uart_rx.vhd uart_rx_fsm.vhd zprava.pdf