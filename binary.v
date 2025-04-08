module binary(
    input w,
    input clk,
    input reset,
    output z,
    output [2:0] BinState
);

    wire [2:0] State;
    wire [2:0] Next;
    /*
    assign st[0] = State[0];
    assign st[1] = State[1];
    assign st[2] = State[2];
*/
    dff zero(
        .D(Next[0]),
        .Default(1'b0),
        .clk(clk),
        .Q(State[0]),
        .reset(reset)
    );

    dff one(
        .D(Next[1]),
        .Default(1'b0),
        .clk(clk),
        .Q(State[1]),
        .reset(reset)
    );
    
    dff two(
        .D(Next[2]),
        .Default(1'b0),
        .clk(clk),
        .Q(State[2]),
        .reset(reset)
    );
 

    assign z = (~State[2]&State[1]&~State[0]) | (State[2]&~State[1]&~State[0]); 
    assign Next[0] = (~w&~State[2]&~State[1]&~State[0]) | (~w&~State[2]&State[1]&State[0]) | (~w&State[2]&~State[1]&~State[0]) | (w&~State[2]&~State[1]&~State[0]) | (w&~State[2]&~State[1]&State[0]) | (w&~State[2]&State[1]&~State[0]);
    assign Next[1] = (w&~State[2]&~State[1]&~State[0]) | (w&~State[2]&~State[1]&State[0]) | (w&~State[2]&State[1]&~State[0]) | (~w&~State[2]&~State[1]&State[0]) | (~w&~State[2]&State[1]&~State[0]);
    assign Next[2] = (w&~State[2]&State[1]&State[0]) | (w&State[2]&~State[1]&~State[0]);
    
    assign BinState[0] = State[0];
    assign BinState[1] = State[1];
    assign BinState[2] = State[2];
    

endmodule