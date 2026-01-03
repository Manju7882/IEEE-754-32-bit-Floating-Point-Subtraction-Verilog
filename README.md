# IEEE-754-32-bit-Floating-Point-Subtraction-Verilog
This project implements a single-precision IEEE-754 floating-point subtraction unit using Verilog HDL. It performs sign handling, exponent alignment, mantissa subtraction, and result normalization. The design is verified through simulation and is suitable for understanding basic FPU operation and digital arithmetic design.

This project presents the RTL design  of a 32-bit Floating Point Subtraction unit based on the IEEE 754 standard using Verilog. The design extracts the sign, exponent, and mantissa from the input operands, aligns the exponents, performs subtraction, normalizes the result, and rounds it according to IEEE 754 rules. Special cases like zero, infinity are handled appropriately. The implementation was verified using EDA Playground. 

## 📘 IEEE-754 Single Precision Format
A 32-bit floating-point number is divided as:

- **Sign:** 1 bit  
- **Exponent**: 8 bits (Bias = 127)  
- **Mantissa**: 23 bits (Implicit leading 1)

---

## ⚙️ Functional Steps
1. Extract sign, exponent, and mantissa from both operands  
2. Align exponents by right-shifting the smaller mantissa  
3. Perform mantissa subtraction  
4. Normalize the result  
5. Assemble the final IEEE-754 result  

---

## 🧩 Module Description

### 🔹 Top Module
- `fp32_subtractor.v`  
Controls the complete floating-point subtraction operation.

### 🔹 Sub Modules
- `fp_align.v` – Exponent comparison and mantissa alignment  
- `fp_mantissa_sub.v` – Mantissa subtraction and sign decision  
- `fp_normalize.v` – Normalizes the mantissa and adjusts exponent  

---

## 🧪 Testbench
- `fp32_subtractor_tb.v`
- Verifies functionality using multiple test cases such as:
  - 5.5 − 2.25 = 3.25  
  - 10.0 − 3.0 = 7.0  
  - 4.0 − 6.0 = −2.0  

---

## 🛠 Tools Used
- Verilog HDL  
- Icarus Verilog / ModelSim / Vivado (for simulation)  

