# CS220_Assignments

**Note**: The main repository used can be found in this [repository](https://github.com/cs220-adi-sid/CS220_Assignments) of the organization. (The code files are the same).

The set of assignments completed (in a team of 2) for the university course of Computer Organization, covering verilog and assembly language programming. The broad highlights of each assignment are:

## 1. Introduction
Designing Verilog modules for basic components of a digital circuit
* Full Adder using AND, OR, XOR gates (and extending it to a 32-bit Full Adder)
* Full Subtractor using AND, OR, XOR gates (and extending it to a 32-bit Full Subtractor)
* 3-to-8 decoder
* 4:1 MUX (where each input is 32-bits)

## 2. "Mjolnir" Adder Circuit
Implementing a k-bit adder using two k/2-bit ripple carry adders.

## 3. FSM and Ripple Counter
Implementing a design of 4-bit ripple counter using negatively-edge triggered flip-flop and a sequence detector for the sequence '1010'.

## 4. Memory Block
Designing a Verilog module for a custom 32x32 memory block memory with read and write capabilities.

## 5. Floating Point Adder
Designing a floating-point adder that reads inputs from the memory block previously designed and computes their sum and stores it into the memory. Floating point numbers are represented using the IEEE standards for 32 bits.

## 6. Bucket Sort
Implementing bucket sort in C and MIPS assembly language.

## 7. Single Cycle Processor
Designing a single-cycle MIPS processor with a given ISA which uses the memory block previously designed. This assignment was completed in 7 stages spread across 7 weeks. The processor was tested by running a sequennce of instructions to sort an array using bubble sort.
