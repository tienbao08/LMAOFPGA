
# weight_file = str(input("input weight file: "))
weight_file = "weight0_1_ieee754.txt"
weight_file_absname = weight_file.replace("_ieee754.txt", "")
weight_file_path = "/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/weight/weight_details/" + weight_file
num_weights = sum(1 for line in open(weight_file_path))
assign_data = ""
for weights in range(num_weights):
    data = weight_file_absname + "[" + str(weights) + "],\n"
    assign_data = assign_data + data
assign_data = assign_data.strip()
assign_data = assign_data[:len(assign_data)-1]
ROM_name = "ROM_conv_224_green"
ROM = open('/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/veriloggen/' + ROM_name + '.v', 'w')
ROM.write("`timescale 1ns / 1ps\nmodule " + ROM_name + "(\n\tout,\n\t);\n\n"
          "\toutput wire [" + str((32*num_weights)-1) + ":0];\n"
          "\treg [31:0] " + weight_file_absname + " [0:" + str(num_weights-1) + "];\n\n"
          "\tinitial begin\n"
          "\t\t$readmemb(\"" + weight_file_path + "\", " + weight_file_absname + ");\n"
          "\tend\n\n"
          "assign out = {" + assign_data + "};\n\nendmodule")
ROM.close()

final_results = ""
final_kernals = ""
final_wire = ""
final_kernal_inst = ""
kernal_size = 3
for kernals in range(int(kernal_size*3)):
    for results in range(int(num_weights/9)):
        weight_wire = "\tin_weight" + str(results) + "_" + str(kernals) + ",\n"
        final_wire = final_wire + weight_wire
final_wire = final_wire.strip()
final_wire = "\t" + final_wire[:len(final_wire)-1]
for kernals in range(int(kernal_size*3)):
    print(final_wire.find("in_weight0" + "_" + str(kernals)))
    kernal = "\tin" + str(kernals) + ",\n"
    kernal_inst = "\t.in" + str(kernals) + "(in" + str(kernals) + "),\n"
    final_kernals = final_kernals + kernal
    final_kernal_inst = final_kernal_inst + kernal_inst
final_kernals = final_kernals.strip()
final_kernals = "\t" + final_kernals[:(len(final_kernals)-1)]
final_kernal_inst = "\t" + final_kernal_inst.strip()
print(final_wire[1015:2029])
for results in range(int(num_weights/9)):
    result = "\tresult" + str(results) + ",\n"
    final_results = final_results + result
final_results = "\t" + final_results.strip()
filter_module = "filter_64_224_green"
filters = open('/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/veriloggen/'+ filter_module + '.v', 'w')
filters.write("`timescale 1ns / 1ps\nmodule " + filter_module + "(\n" + final_results + "\n" + final_kernals + "\n\t);\n"
              "\tinput wire [31:0] " + final_kernals[1:] + ";\n"
              "\toutput wire [31:0] " + final_results[1:len(final_results)-1] + ";\n"
              "\twire [31:0] " + final_wire[1:] + ";\n"
              "conv_core core[0:" + str(int(num_weights/9)-1) + "](\n"
              "\t.result({" + final_results[1:len(final_results)-1] + "}),\n" + final_kernal_inst + "\n"
              "")

filters.close()
for i in range(64):
    print(("in_bias" + str(i) + ","))

