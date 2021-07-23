from datetime import datetime
import math
from tqdm import tqdm

now = datetime.now()
dateandtime = now.strftime("%d/%m/%Y %H:%M:%S")
engineername = "Nguyen Tien Bao - Nguyen Phan Hoang Duc"
imgsize = 224
modulename_BRAM = f"BRAM_{imgsize}_conv"
modulename_lineBuffer = f"lineBuffer_{imgsize}_conv"
data_width = 32
ram_depth = int(math.log2(imgsize)) + 1
counter_depth = int(math.log2(imgsize * 3 + 1)) + 1
projectname = "vgg11_hdl"
BRAM = open('/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/veriloggen/templates/BRAM.v', 'r')
data_BRAM = BRAM.read()
data_BRAM = data_BRAM.format(engineername=engineername,
                             dateandtime=dateandtime,
                             modulename_BRAM=modulename_BRAM,
                             projectname=projectname,
                             data_width=data_width,
                             imgsize=imgsize,
                             ram_depth=ram_depth)
BRAM_custom = open(
    f'/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/veriloggen/{modulename_BRAM}.v', 'w')
BRAM_custom.write(data_BRAM)
BRAM.close()
BRAM_custom.close()

lineBuffer = open(
    '/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/veriloggen/templates/lineBuffer_conv.v',
    'r')
data_lineBuffer = lineBuffer.read()
data_lineBuffer = data_lineBuffer.replace("32'h", f"{data_width}'h")
data_lineBuffer = data_lineBuffer.replace("8'd", f"{ram_depth}'d")
data_lineBuffer = data_lineBuffer.replace("10'd", f"{counter_depth}'d")
data_lineBuffer = data_lineBuffer.replace("d222", f"d{imgsize - 2}")
data_lineBuffer = data_lineBuffer.replace("d673", f"d{imgsize * 3 + 1}")
data_lineBuffer = data_lineBuffer.replace("d220", f"d{imgsize - 4}")
data_lineBuffer = data_lineBuffer.replace("d450", f"d{imgsize * 2 + 2}")
data_lineBuffer = data_lineBuffer.replace("d449", f"d{imgsize * 2 + 1}")
data_lineBuffer = data_lineBuffer.replace("d226", f"d{imgsize + 2}")
data_lineBuffer = data_lineBuffer.replace("d222", f"d{imgsize - 2}")
data_lineBuffer = data_lineBuffer.format(engineername=engineername,
                                         dateandtime=dateandtime,
                                         modulename_lineBuffer=modulename_lineBuffer,
                                         modulename_BRAM=modulename_BRAM,
                                         projectname=projectname,
                                         data_width=data_width,
                                         imgsize=imgsize,
                                         ram_depth=ram_depth,
                                         counter_depth=counter_depth)
lineBuffer_custom = open(
    f'/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/veriloggen/{modulename_lineBuffer}.v', 'w')
lineBuffer_custom.write(data_lineBuffer)
lineBuffer.close()
lineBuffer_custom.close()

filters = 2 #maps by mistake
layer = 2
for maps in tqdm(range(filters)):
    weightfilename = f"{layer}_{maps}"
    modulename_conv = f"conv_{imgsize}_weight{layer}_{maps}"
    weights = open(
        f'/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/weight/weights_ieee754/weight{weightfilename}_ieee754.txt',
        'r')
    data_weights = weights.readlines()
    parameter_weight = ""
    line = 0
    for lines in data_weights:
        string = f"parameter in_weight{line} = 32'b{lines.strip()},\n\t"
        parameter_weight = parameter_weight + string
        line = line + 1
    parameter_weight = parameter_weight.rstrip('\t\n,')
    final_core_inst = ""
    result = ""
    num_weight = 0
    for core in range(int(len(data_weights) / 9)):
        string = f"result{core},\n\t"
        result = result + string
        data_core_inst = "conv_core #({weight" + str(core) + "})\n\t\t\tcore" + str(core) + \
                         f"(.result(result{core}), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));\n\n"
        final_core_inst = final_core_inst + data_core_inst
    result = result.rstrip("\t\n,")
    for i in range(int(len(data_weights) / 9)):
        replace_str = ""
        for j in range(9):
            string = f"in_weight{num_weight}, "
            replace_str = replace_str + string
            num_weight = num_weight + 1
        replace_str = replace_str.rstrip(", ")
        final_core_inst = final_core_inst.replace(("{weight" + str(i) + "}"), replace_str)
    final_core_inst = final_core_inst.strip()
    conv = open(
        '/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/veriloggen/templates/conv.v',
        'r')
    data_conv = conv.read()
    data_conv = data_conv.format(engineername=engineername,
                                 dateandtime=dateandtime,
                                 modulename_lineBuffer=modulename_lineBuffer,
                                 projectname=projectname,
                                 data_width=data_width,
                                 imgsize=imgsize,
                                 ram_depth=ram_depth,
                                 counter_depth=counter_depth,
                                 parameter_weight=parameter_weight,
                                 final_core_inst=final_core_inst,
                                 modulename_conv=modulename_conv,
                                 result=result)
    conv_custom = open(
        f'/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/veriloggen/{modulename_conv}.v', 'w')
    conv_custom.write(data_conv)
    conv_custom.close()
    weights.close()

biases = open(
    f'/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/bias/bias_ieee754/bias2_ieee754.txt',
    'r')
data_biases = biases.readlines()
parameter_bias = ""
line = 0
for lines in data_biases:
    string = f"parameter in_bias{line} = 32'b{lines.strip()},\n\t"
    parameter_bias = parameter_bias + string
    line = line + 1
parameter_bias = parameter_bias.rstrip('\t\n')
bias_adder_inst = ""
wire_result_final = ""
final_result = ""
final_conv_inst = ""
dataIn = ""
for conv_inst in range(filters):
    string = f"dataIn{conv_inst},\n\t"
    dataIn = dataIn + string
    conv_inst_str = f"conv_112_weight2_{conv_inst} conv{conv_inst}(.counter(), .rowcounter(), .clk(clk), .rst(rst), .dataIn(dataIn{conv_inst}), .result0(result0_{conv_inst}), .result1(result1_{conv_inst}), .result2(result2_{conv_inst}), result3(result3_{conv_inst}));\n\n"
    final_conv_inst = final_conv_inst + conv_inst_str
final_conv_inst = final_conv_inst.strip()
dataIn = dataIn.strip()
dataIn = dataIn.rstrip(",")
for bias in range(int(len(data_weights) / 9)):
    string = f"final_result{bias},\n\t"
    final_result = final_result + string
    bias_adder = f"bias_adder_112_4 #(in_bias{bias})" \
                 f"\n\tba{bias}(.result(result{bias}), .in_map0(result{bias}_0), .in_map1(result{bias}_1));\n\n"
    bias_adder_inst = bias_adder_inst + bias_adder
final_result = final_result.strip()
final_result = final_result.rstrip(",")
relu = "relu relu_inst [0:3](\n" \
       "\t.out_conv({" + result + "}),\n\t.out_relu({" + final_result + "}));"
for re in range(2):
    for wire in range(4):
        wire_result = f"result{wire}_{re},\n"
        wire_result_final = wire_result_final + "\t" + wire_result
wire_result_final = wire_result_final.rstrip('\n,')
wire_result_final = wire_result_final.lstrip('\t')
final_conv = open(
    '/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/veriloggen/templates/conv_224_64.v',
    'r')
data_final_conv = final_conv.read()
data_final_conv = data_final_conv.format(engineername=engineername,
                                         dateandtime=dateandtime,
                                         result=result,
                                         projectname=projectname,
                                         data_width=data_width,
                                         parameter_bias=parameter_bias,
                                         dataIn=dataIn,
                                         final_conv_inst=final_conv_inst,
                                         bias_adder_inst=bias_adder_inst,
                                         wire_result_final=wire_result_final,
                                         final_result=final_result,
                                         relu=relu)
final_conv_custom = open(
    '/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/veriloggen/conv_112_4.v',
    'w')
final_conv_custom.write(data_final_conv)
biases.close()
final_conv.close()
final_conv_custom.close()

