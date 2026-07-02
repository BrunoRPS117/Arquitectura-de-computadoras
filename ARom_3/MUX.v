module MUX #(
    DATA_WIDTH = 5
)

(
    input SEL
    input[DATA_WITH-1:0]E1,
    input[DATA_WITH-1:0]E2,
    output[DATA_WITH-1:0] S

);

assign S = SEL = 1?E1:E2;

endmodule 