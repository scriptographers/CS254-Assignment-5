CS 254: Assignment 5

Team Members:
1. Devansh Jain  (190100044)
2. Harshit Varma (190100055)

File Descriptions:

Q1:
    EightbitKogStonAddSub.vhd : 8-bit Kogge-Stone unsigned adder-subtractor
    Overloading.vhd           : Flips bits of b if needed for subtractor
    PreProcess.vhd            : Computes g(i)=G[i:i] and p(i)=P[i:i] for all i using GenAndProp
    PrefixComputation.vhd     : Computes G[i:0] and P[i:0] for all i using GPCell
    PostProcess.vhd           : Computes carry and sum from prefixes using CarryCell
    GenAndProp.vhd            : Computes g and p for the pre-processing step
    GPCell.vhd                : GP Cell as described in the slides
    CarryCell.vhd             : Computes carry for the post-processing step
    NotGate.vhd               : NOT Gate using 2x1 MUX
    AndGate.vhd               : AND Gate using 2x1 MUX
    OrGate.vhd                : OR Gate using 2x1 MUX
    XorGate.vhd               : XOR Gate using 2x1 MUXes
    TwoByOneMux.vhd           : 2x1 MUX using structural modelling

Q1_bonus:
    EightbitKogStonAddSub.vhd : 8-bit Kogge-Stone signed adder-subtractor
    Overloading.vhd           : Flips bits of b if needed for subtractor
    PreProcess.vhd            : Computes g(i)=G[i:i] and p(i)=P[i:i] for all i using GenAndProp
    PrefixComputation.vhd     : Computes G[i:0] and P[i:0] for all i using GPCell
    PostProcess.vhd           : Computes carry and sum from prefixes using CarryCell
    GenAndProp.vhd            : Computes g and p for the pre-processing step
    GPCell.vhd                : GP Cell as described in the slides
    CarryCell.vhd             : Computes carry for the post-processing step
    NotGate.vhd               : NOT Gate using 2x1 MUX
    AndGate.vhd               : AND Gate using 2x1 MUX
    OrGate.vhd                : OR Gate using 2x1 MUX
    XorGate.vhd               : XOR Gate using 2x1 MUXes
    TwoByOneMux.vhd           : 2x1 MUX using structural modelling

