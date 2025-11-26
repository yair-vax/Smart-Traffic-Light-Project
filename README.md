🚦 Smart Traffic Light Controller (SystemVerilog)
📌 Project Overview

This project is a hardware implementation of a smart traffic-light controller, written entirely in SystemVerilog.
The system uses finite-state machines (FSMs), real-time sensor inputs, and adaptive timing logic to simulate a realistic traffic junction that responds to changing conditions.

The design focuses on RTL development, timing behavior, hardware state management, and clean modular architecture.

🛠️ Features
🧠 Intelligent Control Logic

Fully hardware-implemented FSM controlling:

Green/Yellow/Red cycles

Pedestrian mode

Sensor-triggered priority

Idle / low-traffic modes

Adaptive timing based on input conditions (e.g., cars waiting, pedestrian waiting).

🚗 Real-Time Sensor Inputs

Input modules simulate:

Car presence sensors

📟 FPGA Implementation

Implemented 100% in SystemVerilog (RTL).

Structured design with dedicated modules:

FSM controller

Sensor interface

Timer module

Top-level integration

🔎 Simulation and Verification

Testbenches written to verify:

State transitions

Timing accuracy

Sensor-triggered behaviors

Simulated using ModelSim.

🚀 Technical Highlights

Designed a clean, parameterized finite-state machine for scalable behavior.

Implemented adaptive timing using hardware counters & timers.

Verified design correctness via simulation before deployment.


