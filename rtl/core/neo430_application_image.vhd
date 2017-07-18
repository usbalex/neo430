-- NEO430 Processor, by Stephan Nolting
-- Auto-generated memory init file (for APPLICATION)

library ieee;
use ieee.std_logic_1164.all;

package neo430_application_image is

  type application_init_image_t is array (0 to (2**16)-1) of std_ulogic_vector(15 downto 0);
  constant application_init_image : application_init_image_t := (
    000000 => x"4303",
    000001 => x"4218",
    000002 => x"ffe8",
    000003 => x"4211",
    000004 => x"ffea",
    000005 => x"4302",
    000006 => x"5801",
    000007 => x"40b2",
    000008 => x"4700",
    000009 => x"ffd0",
    000010 => x"4382",
    000011 => x"ff9e",
    000012 => x"4382",
    000013 => x"ffa6",
    000014 => x"4382",
    000015 => x"ffb4",
    000016 => x"4382",
    000017 => x"ffb2",
    000018 => x"4382",
    000019 => x"ffc4",
    000020 => x"4382",
    000021 => x"fff8",
    000022 => x"4382",
    000023 => x"fffa",
    000024 => x"4382",
    000025 => x"fffc",
    000026 => x"4382",
    000027 => x"fffe",
    000028 => x"9801",
    000029 => x"2404",
    000030 => x"4388",
    000031 => x"0000",
    000032 => x"5328",
    000033 => x"3ffa",
    000034 => x"4035",
    000035 => x"0244",
    000036 => x"4036",
    000037 => x"0244",
    000038 => x"4037",
    000039 => x"8000",
    000040 => x"9506",
    000041 => x"2404",
    000042 => x"45b7",
    000043 => x"0000",
    000044 => x"5327",
    000045 => x"3ffa",
    000046 => x"430c",
    000047 => x"12b0",
    000048 => x"00a2",
    000049 => x"40b2",
    000050 => x"4700",
    000051 => x"ffd0",
    000052 => x"4302",
    000053 => x"4032",
    000054 => x"0010",
    000055 => x"4303",
    000056 => x"403e",
    000057 => x"ffa6",
    000058 => x"403f",
    000059 => x"ffa2",
    000060 => x"4c6d",
    000061 => x"930d",
    000062 => x"2001",
    000063 => x"4130",
    000064 => x"903d",
    000065 => x"000a",
    000066 => x"2006",
    000067 => x"b2be",
    000068 => x"0000",
    000069 => x"23fd",
    000070 => x"40b2",
    000071 => x"000d",
    000072 => x"ffa2",
    000073 => x"b2be",
    000074 => x"0000",
    000075 => x"23fd",
    000076 => x"4d8f",
    000077 => x"0000",
    000078 => x"531c",
    000079 => x"4030",
    000080 => x"0078",
    000081 => x"120a",
    000082 => x"421e",
    000083 => x"ffec",
    000084 => x"421f",
    000085 => x"ffee",
    000086 => x"434c",
    000087 => x"4f0a",
    000088 => x"930f",
    000089 => x"2034",
    000090 => x"403d",
    000091 => x"95ff",
    000092 => x"9e0d",
    000093 => x"2830",
    000094 => x"407d",
    000095 => x"00ff",
    000096 => x"9c0d",
    000097 => x"2832",
    000098 => x"4a0d",
    000099 => x"5a0d",
    000100 => x"5d0d",
    000101 => x"5d0d",
    000102 => x"5d0d",
    000103 => x"5d0d",
    000104 => x"5d0d",
    000105 => x"5d0d",
    000106 => x"5d0d",
    000107 => x"dc0d",
    000108 => x"4d82",
    000109 => x"ffa4",
    000110 => x"40b2",
    000111 => x"fe81",
    000112 => x"ffa6",
    000113 => x"403a",
    000114 => x"0070",
    000115 => x"403c",
    000116 => x"0206",
    000117 => x"128a",
    000118 => x"b2b2",
    000119 => x"ffe2",
    000120 => x"242a",
    000121 => x"4382",
    000122 => x"ffb2",
    000123 => x"434c",
    000124 => x"403f",
    000125 => x"ffb2",
    000126 => x"4c4d",
    000127 => x"4d8f",
    000128 => x"0000",
    000129 => x"407d",
    000130 => x"000b",
    000131 => x"531c",
    000132 => x"533d",
    000133 => x"930d",
    000134 => x"27f7",
    000135 => x"433e",
    000136 => x"4303",
    000137 => x"533e",
    000138 => x"930e",
    000139 => x"23fc",
    000140 => x"4030",
    000141 => x"0108",
    000142 => x"503e",
    000143 => x"6a00",
    000144 => x"633f",
    000145 => x"531c",
    000146 => x"4030",
    000147 => x"00ae",
    000148 => x"936a",
    000149 => x"2402",
    000150 => x"926a",
    000151 => x"2007",
    000152 => x"12b0",
    000153 => x"0182",
    000154 => x"535a",
    000155 => x"f03a",
    000156 => x"00ff",
    000157 => x"4030",
    000158 => x"00bc",
    000159 => x"12b0",
    000160 => x"018a",
    000161 => x"4030",
    000162 => x"0134",
    000163 => x"403c",
    000164 => x"0222",
    000165 => x"128a",
    000166 => x"435c",
    000167 => x"413a",
    000168 => x"4130",
    000169 => x"c312",
    000170 => x"100c",
    000171 => x"c312",
    000172 => x"100c",
    000173 => x"c312",
    000174 => x"100c",
    000175 => x"c312",
    000176 => x"100c",
    000177 => x"c312",
    000178 => x"100c",
    000179 => x"c312",
    000180 => x"100c",
    000181 => x"c312",
    000182 => x"100c",
    000183 => x"c312",
    000184 => x"100c",
    000185 => x"c312",
    000186 => x"100c",
    000187 => x"c312",
    000188 => x"100c",
    000189 => x"c312",
    000190 => x"100c",
    000191 => x"c312",
    000192 => x"100c",
    000193 => x"c312",
    000194 => x"100c",
    000195 => x"c312",
    000196 => x"100c",
    000197 => x"c312",
    000198 => x"100c",
    000199 => x"4130",
    000200 => x"533d",
    000201 => x"c312",
    000202 => x"100c",
    000203 => x"930d",
    000204 => x"23fb",
    000205 => x"4130",
    000206 => x"c312",
    000207 => x"100d",
    000208 => x"100c",
    000209 => x"c312",
    000210 => x"100d",
    000211 => x"100c",
    000212 => x"c312",
    000213 => x"100d",
    000214 => x"100c",
    000215 => x"c312",
    000216 => x"100d",
    000217 => x"100c",
    000218 => x"c312",
    000219 => x"100d",
    000220 => x"100c",
    000221 => x"c312",
    000222 => x"100d",
    000223 => x"100c",
    000224 => x"c312",
    000225 => x"100d",
    000226 => x"100c",
    000227 => x"c312",
    000228 => x"100d",
    000229 => x"100c",
    000230 => x"c312",
    000231 => x"100d",
    000232 => x"100c",
    000233 => x"c312",
    000234 => x"100d",
    000235 => x"100c",
    000236 => x"c312",
    000237 => x"100d",
    000238 => x"100c",
    000239 => x"c312",
    000240 => x"100d",
    000241 => x"100c",
    000242 => x"c312",
    000243 => x"100d",
    000244 => x"100c",
    000245 => x"c312",
    000246 => x"100d",
    000247 => x"100c",
    000248 => x"c312",
    000249 => x"100d",
    000250 => x"100c",
    000251 => x"4130",
    000252 => x"533e",
    000253 => x"c312",
    000254 => x"100d",
    000255 => x"100c",
    000256 => x"930e",
    000257 => x"23fa",
    000258 => x"4130",
    000259 => x"420a",
    000260 => x"696c",
    000261 => x"6b6e",
    000262 => x"6e69",
    000263 => x"2067",
    000264 => x"454c",
    000265 => x"2044",
    000266 => x"6564",
    000267 => x"6f6d",
    000268 => x"7020",
    000269 => x"6f72",
    000270 => x"7267",
    000271 => x"6d61",
    000272 => x"000a",
    000273 => x"7245",
    000274 => x"6f72",
    000275 => x"2172",
    000276 => x"4e20",
    000277 => x"206f",
    000278 => x"5047",
    000279 => x"4f49",
    000280 => x"7520",
    000281 => x"696e",
    000282 => x"2074",
    000283 => x"7973",
    000284 => x"746e",
    000285 => x"6568",
    000286 => x"6973",
    000287 => x"657a",
    000288 => x"2164",
    000289 => x"0000",
    others => x"0000" -- nop
  );

end neo430_application_image;
