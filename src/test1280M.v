///
//



///
module test1280M(
//input ECLK0,// AB16, LVDS
input FPGA_RESETn,//AC12 CMOS1.8V
////--data
//output EDIN00,// AE15 diff sstl1.2
////-- data
//input EDIN00_test,//T6 RB :EDIN00 
//
////----- RB emulator bank3B
//input FPGA_CLK, //use L2 LVDS
input FMCAclk40,



input pb,
output led,
// probe
//output wire probe,
//output FMCAclk40,
output source_out
);

////////////////////////////////////////////////////////////////////////////////////////	old data
//wire clk1280_RB;
//wire clk40_RB;

//wire clk_locked4;
//	genclkRB genclk_u4 (
//		.rst      (~FPGA_RESETn),      //   input,  width = 1,   reset.reset
//		.refclk   (FPGA_CLK),   //   input,  width = 1,  refclk.clk
//		.locked   (clk_locked4),   //  output,  width = 1,  locked.export
//		.outclk_0 (clk1280_RB), //  output,  width = 1, outclk0.clk
//		.outclk_1 (clk40_RB) //  output,  width = 1, outclk1.clk
//	);	

//reg [31:0] cnt32=0;

//always @(posedge clk40)
//begin
//     cnt32<=cnt32+1'b1;
//end

//wire [31:0] dframe;
//assign dframe=cnt32;

//wire DataTx;
//DataSerializer DataSerializer_inst(
//.clk1280(FMCAclk1280),
//.frame(dframe),
//.DataTx(DataTx)
//);	
//assign EDIN00=DataTx;

//wire [31:0] RxData;
//wire DataRx;//20210523
//assign DataRx=EDIN00_test;//20210524

//DataDeSerializer DataDeSerializer_inst(
//    .clk40(clk40_RB),
//    .clk1280(clk1280_RB),
//    .Rx(DataRx),
//    .Data(RxData)
//    );
//	 
//assign probe=&RxData;
///////////////////////////////////////////////////////////////////////////////////////OLD DATA


//////////////////////////////////////////////////
wire rst;
assign rst=FPGA_RESETn;
//wire clk1280;
//wire clk40;
wire FMCAclk40;
wire FMCAclk1280;
/////////////////////////////////////////////////////

wire clk_locked;	//PLL for FMCA
	genclktree genclk_u0 (
		.rst      (~rst),      //   input,  width = 1,   reset.reset
		.refclk   (FMCAclk40),   //   input,  width = 1,  refclk.clk
		.locked   (clk_locked),   //  output,  width = 1,  locked.export
		.outclk_0 (FMCAclk1280), //  output,  width = 1, outclk0.clk
		.outclk_1 (clk40) //  output,  width = 1, outclk1.clk
	);


//below are the source instances
simple_counter simple_counter_inst0 (	//counter for source_gen: ch1
	.clk1280(FMCAclk1280),
	.counter_out(ch1) 
	);

wire [15:0] ch1;

prbs_source prbs_source_inst0 (	//prbs for source_gen: ch2
	.clk1280(FMCAclk1280),
	.prbs_source(ch2)
);
wire [15:0] ch2;


const_source const_source_inst0 (
		.clk1280(FMCAclk1280),
		.const(ch3),
		.const_bar(ch4)
);

wire [15:0] ch3;
wire [15:0] ch4;
//above are the source instances
////////////////////////////////////////////////////////

wire [1:0] pb;		//push button
wire [1:0] led;	//led

source_gen source_gen_inst0 (
		.clk1280(FMCAclk1280),
		.ch1(ch1),	//counter
		.ch2(ch2),	//prbs
		.ch3(ch3),	//const
		.ch4(ch4),	//const_bar
		.sel(pb),	//selector from push button
		
		.indic(led),//indicators to led's
		.source_out(source_out)  //to FMCA
);

wire [15:0] source_out;
endmodule
