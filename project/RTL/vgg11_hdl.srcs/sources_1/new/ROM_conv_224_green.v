`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2021 10:28:38 AM
// Design Name: 
// Module Name: ROM_conv_224_green
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


module ROM_conv_224_green(
    out
    );
    
    output wire [18431:0] out;
    
    reg [31:0] weight0_green [0:575];
    
    initial begin
        $readmemb("/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/weight/weight_details/weight0_1_ieee754.txt", weight0_green);
    end

assign out = {weight0_green[0],
weight0_green[1],
weight0_green[2],
weight0_green[3],
weight0_green[4],
weight0_green[5],
weight0_green[6],
weight0_green[7],
weight0_green[8],
weight0_green[9],
weight0_green[10],
weight0_green[11],
weight0_green[12],
weight0_green[13],
weight0_green[14],
weight0_green[15],
weight0_green[16],
weight0_green[17],
weight0_green[18],
weight0_green[19],
weight0_green[20],
weight0_green[21],
weight0_green[22],
weight0_green[23],
weight0_green[24],
weight0_green[25],
weight0_green[26],
weight0_green[27],
weight0_green[28],
weight0_green[29],
weight0_green[30],
weight0_green[31],
weight0_green[32],
weight0_green[33],
weight0_green[34],
weight0_green[35],
weight0_green[36],
weight0_green[37],
weight0_green[38],
weight0_green[39],
weight0_green[40],
weight0_green[41],
weight0_green[42],
weight0_green[43],
weight0_green[44],
weight0_green[45],
weight0_green[46],
weight0_green[47],
weight0_green[48],
weight0_green[49],
weight0_green[50],
weight0_green[51],
weight0_green[52],
weight0_green[53],
weight0_green[54],
weight0_green[55],
weight0_green[56],
weight0_green[57],
weight0_green[58],
weight0_green[59],
weight0_green[60],
weight0_green[61],
weight0_green[62],
weight0_green[63],
weight0_green[64],
weight0_green[65],
weight0_green[66],
weight0_green[67],
weight0_green[68],
weight0_green[69],
weight0_green[70],
weight0_green[71],
weight0_green[72],
weight0_green[73],
weight0_green[74],
weight0_green[75],
weight0_green[76],
weight0_green[77],
weight0_green[78],
weight0_green[79],
weight0_green[80],
weight0_green[81],
weight0_green[82],
weight0_green[83],
weight0_green[84],
weight0_green[85],
weight0_green[86],
weight0_green[87],
weight0_green[88],
weight0_green[89],
weight0_green[90],
weight0_green[91],
weight0_green[92],
weight0_green[93],
weight0_green[94],
weight0_green[95],
weight0_green[96],
weight0_green[97],
weight0_green[98],
weight0_green[99],
weight0_green[100],
weight0_green[101],
weight0_green[102],
weight0_green[103],
weight0_green[104],
weight0_green[105],
weight0_green[106],
weight0_green[107],
weight0_green[108],
weight0_green[109],
weight0_green[110],
weight0_green[111],
weight0_green[112],
weight0_green[113],
weight0_green[114],
weight0_green[115],
weight0_green[116],
weight0_green[117],
weight0_green[118],
weight0_green[119],
weight0_green[120],
weight0_green[121],
weight0_green[122],
weight0_green[123],
weight0_green[124],
weight0_green[125],
weight0_green[126],
weight0_green[127],
weight0_green[128],
weight0_green[129],
weight0_green[130],
weight0_green[131],
weight0_green[132],
weight0_green[133],
weight0_green[134],
weight0_green[135],
weight0_green[136],
weight0_green[137],
weight0_green[138],
weight0_green[139],
weight0_green[140],
weight0_green[141],
weight0_green[142],
weight0_green[143],
weight0_green[144],
weight0_green[145],
weight0_green[146],
weight0_green[147],
weight0_green[148],
weight0_green[149],
weight0_green[150],
weight0_green[151],
weight0_green[152],
weight0_green[153],
weight0_green[154],
weight0_green[155],
weight0_green[156],
weight0_green[157],
weight0_green[158],
weight0_green[159],
weight0_green[160],
weight0_green[161],
weight0_green[162],
weight0_green[163],
weight0_green[164],
weight0_green[165],
weight0_green[166],
weight0_green[167],
weight0_green[168],
weight0_green[169],
weight0_green[170],
weight0_green[171],
weight0_green[172],
weight0_green[173],
weight0_green[174],
weight0_green[175],
weight0_green[176],
weight0_green[177],
weight0_green[178],
weight0_green[179],
weight0_green[180],
weight0_green[181],
weight0_green[182],
weight0_green[183],
weight0_green[184],
weight0_green[185],
weight0_green[186],
weight0_green[187],
weight0_green[188],
weight0_green[189],
weight0_green[190],
weight0_green[191],
weight0_green[192],
weight0_green[193],
weight0_green[194],
weight0_green[195],
weight0_green[196],
weight0_green[197],
weight0_green[198],
weight0_green[199],
weight0_green[200],
weight0_green[201],
weight0_green[202],
weight0_green[203],
weight0_green[204],
weight0_green[205],
weight0_green[206],
weight0_green[207],
weight0_green[208],
weight0_green[209],
weight0_green[210],
weight0_green[211],
weight0_green[212],
weight0_green[213],
weight0_green[214],
weight0_green[215],
weight0_green[216],
weight0_green[217],
weight0_green[218],
weight0_green[219],
weight0_green[220],
weight0_green[221],
weight0_green[222],
weight0_green[223],
weight0_green[224],
weight0_green[225],
weight0_green[226],
weight0_green[227],
weight0_green[228],
weight0_green[229],
weight0_green[230],
weight0_green[231],
weight0_green[232],
weight0_green[233],
weight0_green[234],
weight0_green[235],
weight0_green[236],
weight0_green[237],
weight0_green[238],
weight0_green[239],
weight0_green[240],
weight0_green[241],
weight0_green[242],
weight0_green[243],
weight0_green[244],
weight0_green[245],
weight0_green[246],
weight0_green[247],
weight0_green[248],
weight0_green[249],
weight0_green[250],
weight0_green[251],
weight0_green[252],
weight0_green[253],
weight0_green[254],
weight0_green[255],
weight0_green[256],
weight0_green[257],
weight0_green[258],
weight0_green[259],
weight0_green[260],
weight0_green[261],
weight0_green[262],
weight0_green[263],
weight0_green[264],
weight0_green[265],
weight0_green[266],
weight0_green[267],
weight0_green[268],
weight0_green[269],
weight0_green[270],
weight0_green[271],
weight0_green[272],
weight0_green[273],
weight0_green[274],
weight0_green[275],
weight0_green[276],
weight0_green[277],
weight0_green[278],
weight0_green[279],
weight0_green[280],
weight0_green[281],
weight0_green[282],
weight0_green[283],
weight0_green[284],
weight0_green[285],
weight0_green[286],
weight0_green[287],
weight0_green[288],
weight0_green[289],
weight0_green[290],
weight0_green[291],
weight0_green[292],
weight0_green[293],
weight0_green[294],
weight0_green[295],
weight0_green[296],
weight0_green[297],
weight0_green[298],
weight0_green[299],
weight0_green[300],
weight0_green[301],
weight0_green[302],
weight0_green[303],
weight0_green[304],
weight0_green[305],
weight0_green[306],
weight0_green[307],
weight0_green[308],
weight0_green[309],
weight0_green[310],
weight0_green[311],
weight0_green[312],
weight0_green[313],
weight0_green[314],
weight0_green[315],
weight0_green[316],
weight0_green[317],
weight0_green[318],
weight0_green[319],
weight0_green[320],
weight0_green[321],
weight0_green[322],
weight0_green[323],
weight0_green[324],
weight0_green[325],
weight0_green[326],
weight0_green[327],
weight0_green[328],
weight0_green[329],
weight0_green[330],
weight0_green[331],
weight0_green[332],
weight0_green[333],
weight0_green[334],
weight0_green[335],
weight0_green[336],
weight0_green[337],
weight0_green[338],
weight0_green[339],
weight0_green[340],
weight0_green[341],
weight0_green[342],
weight0_green[343],
weight0_green[344],
weight0_green[345],
weight0_green[346],
weight0_green[347],
weight0_green[348],
weight0_green[349],
weight0_green[350],
weight0_green[351],
weight0_green[352],
weight0_green[353],
weight0_green[354],
weight0_green[355],
weight0_green[356],
weight0_green[357],
weight0_green[358],
weight0_green[359],
weight0_green[360],
weight0_green[361],
weight0_green[362],
weight0_green[363],
weight0_green[364],
weight0_green[365],
weight0_green[366],
weight0_green[367],
weight0_green[368],
weight0_green[369],
weight0_green[370],
weight0_green[371],
weight0_green[372],
weight0_green[373],
weight0_green[374],
weight0_green[375],
weight0_green[376],
weight0_green[377],
weight0_green[378],
weight0_green[379],
weight0_green[380],
weight0_green[381],
weight0_green[382],
weight0_green[383],
weight0_green[384],
weight0_green[385],
weight0_green[386],
weight0_green[387],
weight0_green[388],
weight0_green[389],
weight0_green[390],
weight0_green[391],
weight0_green[392],
weight0_green[393],
weight0_green[394],
weight0_green[395],
weight0_green[396],
weight0_green[397],
weight0_green[398],
weight0_green[399],
weight0_green[400],
weight0_green[401],
weight0_green[402],
weight0_green[403],
weight0_green[404],
weight0_green[405],
weight0_green[406],
weight0_green[407],
weight0_green[408],
weight0_green[409],
weight0_green[410],
weight0_green[411],
weight0_green[412],
weight0_green[413],
weight0_green[414],
weight0_green[415],
weight0_green[416],
weight0_green[417],
weight0_green[418],
weight0_green[419],
weight0_green[420],
weight0_green[421],
weight0_green[422],
weight0_green[423],
weight0_green[424],
weight0_green[425],
weight0_green[426],
weight0_green[427],
weight0_green[428],
weight0_green[429],
weight0_green[430],
weight0_green[431],
weight0_green[432],
weight0_green[433],
weight0_green[434],
weight0_green[435],
weight0_green[436],
weight0_green[437],
weight0_green[438],
weight0_green[439],
weight0_green[440],
weight0_green[441],
weight0_green[442],
weight0_green[443],
weight0_green[444],
weight0_green[445],
weight0_green[446],
weight0_green[447],
weight0_green[448],
weight0_green[449],
weight0_green[450],
weight0_green[451],
weight0_green[452],
weight0_green[453],
weight0_green[454],
weight0_green[455],
weight0_green[456],
weight0_green[457],
weight0_green[458],
weight0_green[459],
weight0_green[460],
weight0_green[461],
weight0_green[462],
weight0_green[463],
weight0_green[464],
weight0_green[465],
weight0_green[466],
weight0_green[467],
weight0_green[468],
weight0_green[469],
weight0_green[470],
weight0_green[471],
weight0_green[472],
weight0_green[473],
weight0_green[474],
weight0_green[475],
weight0_green[476],
weight0_green[477],
weight0_green[478],
weight0_green[479],
weight0_green[480],
weight0_green[481],
weight0_green[482],
weight0_green[483],
weight0_green[484],
weight0_green[485],
weight0_green[486],
weight0_green[487],
weight0_green[488],
weight0_green[489],
weight0_green[490],
weight0_green[491],
weight0_green[492],
weight0_green[493],
weight0_green[494],
weight0_green[495],
weight0_green[496],
weight0_green[497],
weight0_green[498],
weight0_green[499],
weight0_green[500],
weight0_green[501],
weight0_green[502],
weight0_green[503],
weight0_green[504],
weight0_green[505],
weight0_green[506],
weight0_green[507],
weight0_green[508],
weight0_green[509],
weight0_green[510],
weight0_green[511],
weight0_green[512],
weight0_green[513],
weight0_green[514],
weight0_green[515],
weight0_green[516],
weight0_green[517],
weight0_green[518],
weight0_green[519],
weight0_green[520],
weight0_green[521],
weight0_green[522],
weight0_green[523],
weight0_green[524],
weight0_green[525],
weight0_green[526],
weight0_green[527],
weight0_green[528],
weight0_green[529],
weight0_green[530],
weight0_green[531],
weight0_green[532],
weight0_green[533],
weight0_green[534],
weight0_green[535],
weight0_green[536],
weight0_green[537],
weight0_green[538],
weight0_green[539],
weight0_green[540],
weight0_green[541],
weight0_green[542],
weight0_green[543],
weight0_green[544],
weight0_green[545],
weight0_green[546],
weight0_green[547],
weight0_green[548],
weight0_green[549],
weight0_green[550],
weight0_green[551],
weight0_green[552],
weight0_green[553],
weight0_green[554],
weight0_green[555],
weight0_green[556],
weight0_green[557],
weight0_green[558],
weight0_green[559],
weight0_green[560],
weight0_green[561],
weight0_green[562],
weight0_green[563],
weight0_green[564],
weight0_green[565],
weight0_green[566],
weight0_green[567],
weight0_green[568],
weight0_green[569],
weight0_green[570],
weight0_green[571],
weight0_green[572],
weight0_green[573],
weight0_green[574],
weight0_green[575]};

endmodule