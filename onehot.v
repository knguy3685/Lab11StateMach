
module onehot(
    input w,
    input clk,
    input reset,
    output z,
    output Ast, Bst, Cst, Dst, Est
);
    wire Anext, Bnext, Cnext, Dnext, Enext;
 

    dff Adff(
        .Default(1'b1),
        .D(Anext),
        .clk(clk),
        .Q(Ast),
        .reset(reset)
    );

    dff Bdff(
        .Default(1'b0),
        .D(Bnext),
        .clk(clk),
        .Q(Bst),
        .reset(reset)
    );

    dff Cdff(
        .Default(1'b0),
        .D(Cnext),
        .clk(clk),
        .Q(Cst),
        .reset(reset)
    );
    
    dff Ddff(
        .Default(1'b0),
        .D(Dnext),
        .clk(clk),
        .Q(Dst),
        .reset(reset)
    );
    
    dff Edff(
        .Default(1'b0),
        .D(Enext),
        .clk(clk),
        .Q(Est),
        .reset(reset)
    );



    // change from here
    
    assign z = Est|Cst;

    assign Anext = 0;
    assign Bnext = (~w&Ast) | (~w&Est) | (~w&Dst);
    assign Cnext = (~w&Bst) | (~w&Cst);
    assign Dnext = (w&Bst) | (w&Cst) | (w&Ast);
    assign Enext = (w&Dst) | (w&Est);
     
endmodule