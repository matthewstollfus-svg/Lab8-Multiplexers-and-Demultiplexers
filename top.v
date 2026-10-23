module top(
    input [15:0] sw,
    input btnC,
    input btnL,
    input btnU,
    input btnD,
    input btnR,
    output [15:0] led
);

wire[1:0] mux_sel;
wire[1:0] demux_sel;
wire[3:0] mux_out;

wire[3:0] local_lib;
wire[3:0] fire_dept;
wire[3:0] school;
wire[3:0] rib_shack;

assign mux_sel = {btnL, btnU};

assign demux_sel = {btnD, btnR};

assign mux_out =
        (mux_sel == 2'b00) ? sw[3:0]   :
        (mux_sel == 2'b10) ? sw[7:4]   :
        (mux_sel == 2'b01) ? sw[11:8]  : sw[15:12];
        
assign local_lib = (demux_sel == 2'b00) ? mux_out : 4'b0000;
assign fire_dept = (demux_sel == 2'b10) ? mux_out : 4'b0000;
assign school = (demux_sel == 2'b01) ? mux_out : 4'b0000;
assign rib_shack = (demux_sel == 2'b11) ? mux_out : 4'b0000;

assign led[3:0] = local_lib & {4{btnC}};
assign led[7:4] = fire_dept & {4{btnC}};
assign led[11:8] = school & {4{btnC}};
assign led[15:12] = rib_shack & {4{btnC}};

endmodule