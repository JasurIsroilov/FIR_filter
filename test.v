module tb;
    reg clk = 0;
    parameter DATA_SIZE = 9;
    parameter N_TAPS = 3;
    reg signed [DATA_SIZE - 1:0] data = 'h753;

    reg data_ready = 0;

    reg signed [7:0] i = 0;
    reg signed [DATA_SIZE-1:0] buff[11:0];

    initial
    begin
        buff[0] <= 16'h10;
        buff[1] <= 16'h15;
        buff[2] <= 16'h20;
        buff[3] <= 16'h25;
        buff[4] <= 16'h30; 
        buff[5] <= 16'h35;
        buff[6] <= 16'h40;
        buff[7] <= 16'h45;
        buff[8] <= 16'h50;
        buff[9] <= 16'h55;
        buff[10] <= 16'h60;
        buff[11] <= 16'h65;
    end

    initial 
    begin
        forever #20 clk = ~clk; 
    end

    initial
    begin
        for(i=0; i<12; i=i+1)
        begin
            data_ready = 0;
            #380;
            data_ready = 1;
            data <= buff[i];
            #20;
        end
    end

    initial
    begin
        #5000 $finish;
    end

    initial
    begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
    end

    firfilter #( .DATA_SIZE(DATA_SIZE),
    .N_TAPS(N_TAPS) )
    fir0 (
        .clk(clk),
        .data(data),
        .data_ready(data_ready)
    );

endmodule
