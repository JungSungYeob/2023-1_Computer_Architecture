module FA (a, b, cin, cout, sum);
	input a, b, cin;
	output cout,sum;

	assign cout = (a&b)+(b&cin)+(a&cin);
	assign sum =  (~a&~b&cin)+(~a&b&~cin)+(a&b&cin)+(a&~b&~cin);
	
endmodule;

module RippleCarryAdder (a, b, c_out,sum);
	input[3:0] a, b;
	output c_out;
	output [3:0] sum;

	wire c0, c1, c2;

	FA fa0(.a(a[0]),.b(b[0]),.cin(1'b0),.cout(c0),.sum(sum[0]));
	FA fa1(.a(a[1]),.b(b[1]),.cin(c0),.cout(c1),.sum(sum[1]));
	FA fa2(.a(a[2]),.b(b[2]),.cin(c1),.cout(c2),.sum(sum[2]));
	FA fa3(.a(a[3]),.b(b[3]),.cin(c2),.cout(c_out),.sum(sum[3]));
	
endmodule;