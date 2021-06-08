`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2021 10:34:07 AM
// Design Name: 
// Module Name: ROM_conv_224_blue
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ROM_conv_224_blue(
    out
    );
    
    output wire [18431:0] out;
    
    reg [31:0] weight0_blue [0:575];
    
    initial begin
        $readmemb("/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/weight/weight_details/weight0_2_ieee754.txt", weight0_blue);
    end

assign out = {weight0_blue[0],
weight0_blue[1],
weight0_blue[2],
weight0_blue[3],
weight0_blue[4],
weight0_blue[5],
weight0_blue[6],
weight0_blue[7],
weight0_blue[8],
weight0_blue[9],
weight0_blue[10],
weight0_blue[11],
weight0_blue[12],
weight0_blue[13],
weight0_blue[14],
weight0_blue[15],
weight0_blue[16],
weight0_blue[17],
weight0_blue[18],
weight0_blue[19],
weight0_blue[20],
weight0_blue[21],
weight0_blue[22],
weight0_blue[23],
weight0_blue[24],
weight0_blue[25],
weight0_blue[26],
weight0_blue[27],
weight0_blue[28],
weight0_blue[29],
weight0_blue[30],
weight0_blue[31],
weight0_blue[32],
weight0_blue[33],
weight0_blue[34],
weight0_blue[35],
weight0_blue[36],
weight0_blue[37],
weight0_blue[38],
weight0_blue[39],
weight0_blue[40],
weight0_blue[41],
weight0_blue[42],
weight0_blue[43],
weight0_blue[44],
weight0_blue[45],
weight0_blue[46],
weight0_blue[47],
weight0_blue[48],
weight0_blue[49],
weight0_blue[50],
weight0_blue[51],
weight0_blue[52],
weight0_blue[53],
weight0_blue[54],
weight0_blue[55],
weight0_blue[56],
weight0_blue[57],
weight0_blue[58],
weight0_blue[59],
weight0_blue[60],
weight0_blue[61],
weight0_blue[62],
weight0_blue[63],
weight0_blue[64],
weight0_blue[65],
weight0_blue[66],
weight0_blue[67],
weight0_blue[68],
weight0_blue[69],
weight0_blue[70],
weight0_blue[71],
weight0_blue[72],
weight0_blue[73],
weight0_blue[74],
weight0_blue[75],
weight0_blue[76],
weight0_blue[77],
weight0_blue[78],
weight0_blue[79],
weight0_blue[80],
weight0_blue[81],
weight0_blue[82],
weight0_blue[83],
weight0_blue[84],
weight0_blue[85],
weight0_blue[86],
weight0_blue[87],
weight0_blue[88],
weight0_blue[89],
weight0_blue[90],
weight0_blue[91],
weight0_blue[92],
weight0_blue[93],
weight0_blue[94],
weight0_blue[95],
weight0_blue[96],
weight0_blue[97],
weight0_blue[98],
weight0_blue[99],
weight0_blue[100],
weight0_blue[101],
weight0_blue[102],
weight0_blue[103],
weight0_blue[104],
weight0_blue[105],
weight0_blue[106],
weight0_blue[107],
weight0_blue[108],
weight0_blue[109],
weight0_blue[110],
weight0_blue[111],
weight0_blue[112],
weight0_blue[113],
weight0_blue[114],
weight0_blue[115],
weight0_blue[116],
weight0_blue[117],
weight0_blue[118],
weight0_blue[119],
weight0_blue[120],
weight0_blue[121],
weight0_blue[122],
weight0_blue[123],
weight0_blue[124],
weight0_blue[125],
weight0_blue[126],
weight0_blue[127],
weight0_blue[128],
weight0_blue[129],
weight0_blue[130],
weight0_blue[131],
weight0_blue[132],
weight0_blue[133],
weight0_blue[134],
weight0_blue[135],
weight0_blue[136],
weight0_blue[137],
weight0_blue[138],
weight0_blue[139],
weight0_blue[140],
weight0_blue[141],
weight0_blue[142],
weight0_blue[143],
weight0_blue[144],
weight0_blue[145],
weight0_blue[146],
weight0_blue[147],
weight0_blue[148],
weight0_blue[149],
weight0_blue[150],
weight0_blue[151],
weight0_blue[152],
weight0_blue[153],
weight0_blue[154],
weight0_blue[155],
weight0_blue[156],
weight0_blue[157],
weight0_blue[158],
weight0_blue[159],
weight0_blue[160],
weight0_blue[161],
weight0_blue[162],
weight0_blue[163],
weight0_blue[164],
weight0_blue[165],
weight0_blue[166],
weight0_blue[167],
weight0_blue[168],
weight0_blue[169],
weight0_blue[170],
weight0_blue[171],
weight0_blue[172],
weight0_blue[173],
weight0_blue[174],
weight0_blue[175],
weight0_blue[176],
weight0_blue[177],
weight0_blue[178],
weight0_blue[179],
weight0_blue[180],
weight0_blue[181],
weight0_blue[182],
weight0_blue[183],
weight0_blue[184],
weight0_blue[185],
weight0_blue[186],
weight0_blue[187],
weight0_blue[188],
weight0_blue[189],
weight0_blue[190],
weight0_blue[191],
weight0_blue[192],
weight0_blue[193],
weight0_blue[194],
weight0_blue[195],
weight0_blue[196],
weight0_blue[197],
weight0_blue[198],
weight0_blue[199],
weight0_blue[200],
weight0_blue[201],
weight0_blue[202],
weight0_blue[203],
weight0_blue[204],
weight0_blue[205],
weight0_blue[206],
weight0_blue[207],
weight0_blue[208],
weight0_blue[209],
weight0_blue[210],
weight0_blue[211],
weight0_blue[212],
weight0_blue[213],
weight0_blue[214],
weight0_blue[215],
weight0_blue[216],
weight0_blue[217],
weight0_blue[218],
weight0_blue[219],
weight0_blue[220],
weight0_blue[221],
weight0_blue[222],
weight0_blue[223],
weight0_blue[224],
weight0_blue[225],
weight0_blue[226],
weight0_blue[227],
weight0_blue[228],
weight0_blue[229],
weight0_blue[230],
weight0_blue[231],
weight0_blue[232],
weight0_blue[233],
weight0_blue[234],
weight0_blue[235],
weight0_blue[236],
weight0_blue[237],
weight0_blue[238],
weight0_blue[239],
weight0_blue[240],
weight0_blue[241],
weight0_blue[242],
weight0_blue[243],
weight0_blue[244],
weight0_blue[245],
weight0_blue[246],
weight0_blue[247],
weight0_blue[248],
weight0_blue[249],
weight0_blue[250],
weight0_blue[251],
weight0_blue[252],
weight0_blue[253],
weight0_blue[254],
weight0_blue[255],
weight0_blue[256],
weight0_blue[257],
weight0_blue[258],
weight0_blue[259],
weight0_blue[260],
weight0_blue[261],
weight0_blue[262],
weight0_blue[263],
weight0_blue[264],
weight0_blue[265],
weight0_blue[266],
weight0_blue[267],
weight0_blue[268],
weight0_blue[269],
weight0_blue[270],
weight0_blue[271],
weight0_blue[272],
weight0_blue[273],
weight0_blue[274],
weight0_blue[275],
weight0_blue[276],
weight0_blue[277],
weight0_blue[278],
weight0_blue[279],
weight0_blue[280],
weight0_blue[281],
weight0_blue[282],
weight0_blue[283],
weight0_blue[284],
weight0_blue[285],
weight0_blue[286],
weight0_blue[287],
weight0_blue[288],
weight0_blue[289],
weight0_blue[290],
weight0_blue[291],
weight0_blue[292],
weight0_blue[293],
weight0_blue[294],
weight0_blue[295],
weight0_blue[296],
weight0_blue[297],
weight0_blue[298],
weight0_blue[299],
weight0_blue[300],
weight0_blue[301],
weight0_blue[302],
weight0_blue[303],
weight0_blue[304],
weight0_blue[305],
weight0_blue[306],
weight0_blue[307],
weight0_blue[308],
weight0_blue[309],
weight0_blue[310],
weight0_blue[311],
weight0_blue[312],
weight0_blue[313],
weight0_blue[314],
weight0_blue[315],
weight0_blue[316],
weight0_blue[317],
weight0_blue[318],
weight0_blue[319],
weight0_blue[320],
weight0_blue[321],
weight0_blue[322],
weight0_blue[323],
weight0_blue[324],
weight0_blue[325],
weight0_blue[326],
weight0_blue[327],
weight0_blue[328],
weight0_blue[329],
weight0_blue[330],
weight0_blue[331],
weight0_blue[332],
weight0_blue[333],
weight0_blue[334],
weight0_blue[335],
weight0_blue[336],
weight0_blue[337],
weight0_blue[338],
weight0_blue[339],
weight0_blue[340],
weight0_blue[341],
weight0_blue[342],
weight0_blue[343],
weight0_blue[344],
weight0_blue[345],
weight0_blue[346],
weight0_blue[347],
weight0_blue[348],
weight0_blue[349],
weight0_blue[350],
weight0_blue[351],
weight0_blue[352],
weight0_blue[353],
weight0_blue[354],
weight0_blue[355],
weight0_blue[356],
weight0_blue[357],
weight0_blue[358],
weight0_blue[359],
weight0_blue[360],
weight0_blue[361],
weight0_blue[362],
weight0_blue[363],
weight0_blue[364],
weight0_blue[365],
weight0_blue[366],
weight0_blue[367],
weight0_blue[368],
weight0_blue[369],
weight0_blue[370],
weight0_blue[371],
weight0_blue[372],
weight0_blue[373],
weight0_blue[374],
weight0_blue[375],
weight0_blue[376],
weight0_blue[377],
weight0_blue[378],
weight0_blue[379],
weight0_blue[380],
weight0_blue[381],
weight0_blue[382],
weight0_blue[383],
weight0_blue[384],
weight0_blue[385],
weight0_blue[386],
weight0_blue[387],
weight0_blue[388],
weight0_blue[389],
weight0_blue[390],
weight0_blue[391],
weight0_blue[392],
weight0_blue[393],
weight0_blue[394],
weight0_blue[395],
weight0_blue[396],
weight0_blue[397],
weight0_blue[398],
weight0_blue[399],
weight0_blue[400],
weight0_blue[401],
weight0_blue[402],
weight0_blue[403],
weight0_blue[404],
weight0_blue[405],
weight0_blue[406],
weight0_blue[407],
weight0_blue[408],
weight0_blue[409],
weight0_blue[410],
weight0_blue[411],
weight0_blue[412],
weight0_blue[413],
weight0_blue[414],
weight0_blue[415],
weight0_blue[416],
weight0_blue[417],
weight0_blue[418],
weight0_blue[419],
weight0_blue[420],
weight0_blue[421],
weight0_blue[422],
weight0_blue[423],
weight0_blue[424],
weight0_blue[425],
weight0_blue[426],
weight0_blue[427],
weight0_blue[428],
weight0_blue[429],
weight0_blue[430],
weight0_blue[431],
weight0_blue[432],
weight0_blue[433],
weight0_blue[434],
weight0_blue[435],
weight0_blue[436],
weight0_blue[437],
weight0_blue[438],
weight0_blue[439],
weight0_blue[440],
weight0_blue[441],
weight0_blue[442],
weight0_blue[443],
weight0_blue[444],
weight0_blue[445],
weight0_blue[446],
weight0_blue[447],
weight0_blue[448],
weight0_blue[449],
weight0_blue[450],
weight0_blue[451],
weight0_blue[452],
weight0_blue[453],
weight0_blue[454],
weight0_blue[455],
weight0_blue[456],
weight0_blue[457],
weight0_blue[458],
weight0_blue[459],
weight0_blue[460],
weight0_blue[461],
weight0_blue[462],
weight0_blue[463],
weight0_blue[464],
weight0_blue[465],
weight0_blue[466],
weight0_blue[467],
weight0_blue[468],
weight0_blue[469],
weight0_blue[470],
weight0_blue[471],
weight0_blue[472],
weight0_blue[473],
weight0_blue[474],
weight0_blue[475],
weight0_blue[476],
weight0_blue[477],
weight0_blue[478],
weight0_blue[479],
weight0_blue[480],
weight0_blue[481],
weight0_blue[482],
weight0_blue[483],
weight0_blue[484],
weight0_blue[485],
weight0_blue[486],
weight0_blue[487],
weight0_blue[488],
weight0_blue[489],
weight0_blue[490],
weight0_blue[491],
weight0_blue[492],
weight0_blue[493],
weight0_blue[494],
weight0_blue[495],
weight0_blue[496],
weight0_blue[497],
weight0_blue[498],
weight0_blue[499],
weight0_blue[500],
weight0_blue[501],
weight0_blue[502],
weight0_blue[503],
weight0_blue[504],
weight0_blue[505],
weight0_blue[506],
weight0_blue[507],
weight0_blue[508],
weight0_blue[509],
weight0_blue[510],
weight0_blue[511],
weight0_blue[512],
weight0_blue[513],
weight0_blue[514],
weight0_blue[515],
weight0_blue[516],
weight0_blue[517],
weight0_blue[518],
weight0_blue[519],
weight0_blue[520],
weight0_blue[521],
weight0_blue[522],
weight0_blue[523],
weight0_blue[524],
weight0_blue[525],
weight0_blue[526],
weight0_blue[527],
weight0_blue[528],
weight0_blue[529],
weight0_blue[530],
weight0_blue[531],
weight0_blue[532],
weight0_blue[533],
weight0_blue[534],
weight0_blue[535],
weight0_blue[536],
weight0_blue[537],
weight0_blue[538],
weight0_blue[539],
weight0_blue[540],
weight0_blue[541],
weight0_blue[542],
weight0_blue[543],
weight0_blue[544],
weight0_blue[545],
weight0_blue[546],
weight0_blue[547],
weight0_blue[548],
weight0_blue[549],
weight0_blue[550],
weight0_blue[551],
weight0_blue[552],
weight0_blue[553],
weight0_blue[554],
weight0_blue[555],
weight0_blue[556],
weight0_blue[557],
weight0_blue[558],
weight0_blue[559],
weight0_blue[560],
weight0_blue[561],
weight0_blue[562],
weight0_blue[563],
weight0_blue[564],
weight0_blue[565],
weight0_blue[566],
weight0_blue[567],
weight0_blue[568],
weight0_blue[569],
weight0_blue[570],
weight0_blue[571],
weight0_blue[572],
weight0_blue[573],
weight0_blue[574],
weight0_blue[575]};

endmodule