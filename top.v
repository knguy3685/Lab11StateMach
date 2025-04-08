module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

    // Hook up binary and one-hot state machines
    onehot jeff (
        .w(sw),
        .clk(btnC),
        .z(led[0]),
        .Ast(led[2]),
        .Bst(led[3]),
        .Cst(led[4]),
        .Dst(led[5]),
        .Est(led[6]),
        .reset(btnU)
        );
     
     binary bob (
        .w(sw),
        .clk(btnC),
        .z(led[1]),
        .BinState(led[9:7]),
        .reset(btnU)
        
        );
        
        
        

endmodule