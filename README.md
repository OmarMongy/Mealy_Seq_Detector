# Mealy Sequence Detector  

This GitHub repository contains a Verilog module named "Mealy_seq_101" that implements a Mealy sequence detector that detect an input sequence of  101. The module detects the specific sequence of inputs and produces an output based on the detected sequence.

## Module Description

The "Mealy_seq_101" module is designed to detect a specific input sequence and generate an output signal based on the detected sequence. The module takes the following inputs and outputs:

### Inputs:

1. `clk`: Clock signal (positive edge-triggered).
2. `reset_n`: Asynchronous reset signal (active-low).
3. `x`: Input signal representing the input sequence to be detected.

### Outputs:

1. `y`: Output signal indicating the detection of a specific sequence.


## State Descriptions

1. `s0`: Initial state. This state remains in place until the input `x` becomes '1', and then transitions to `s1`. If the input `x` remains '0', it stays in `s0`.
2. `s1`: After transitioning from `s0` to `s1`, this state will remain in place until the input `x` becomes '1', at which point it transitions to `s1`. If the input `x` becomes '0', it transitions to `s2`.
3. `s2`: After transitioning from `s1` to `s2`, this state will remain in place until the input `x` becomes '1', at which point it transitions back to `s1`. If the input `x` becomes '0', it transitions back to `s0`.

## Simulation

There exists a single testbench code for evaluating this module, along with another module[Moore Sequence Detector](https://github.com/OmarMongy/Moore_Seq_Detector)

## Implementation Details

The Mealy sequence detector is implemented using two always blocks:

1. The first always block (`always @(posedge clk, negedge reset_n)`) handles the synchronous update of the state. It registers the current state (`state_reg`) to be used in the next clock cycle. In case of a reset (when `reset_n` is low), the state is set to `s0` to start from the initial state.
2. The second always block (`always @(*)`) is a combinational block that determines the next state (`state_next`) based on the current state (`state_reg`) and the input `x`.

The output `y` is set to '1' when the current state is `s2` and the input `x` is '1'.
