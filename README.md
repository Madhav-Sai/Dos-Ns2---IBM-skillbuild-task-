# DoS Attack Simulation and Mitigation using NS2

This repository contains the code and documentation for a project that focuses on simulating and mitigating Denial of Service (DoS) attacks using NS2, a network simulation tool. The project aims to understand the impact of DoS attacks on network performance and develop effective defense mechanisms to mitigate their effects.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction
DoS Attack Simulation and Mitigation using NS2 is a research project that investigates the behavior of various DoS attack scenarios in a simulated network environment. The project utilizes NS2 to create realistic network topologies and analyze the impact of DoS attacks on network performance metrics such as throughput, latency, and packet loss.

## Features
- Simulation of different DoS attack techniques, including TCP SYN flooding, UDP flooding, and ICMP flooding.
- Customized defense mechanisms implemented to mitigate the effects of DoS attacks.
- Analysis of network performance metrics under attack conditions.
- Visualization of network topologies and traffic patterns using NAM (Network Animator).
- Modular and extensible codebase for easy customization and experimentation.

## Installation
1. Clone the repository:
git clone https://github.com/Madhav-Sai/Dos-Ns2.git


2. Install NS2: Follow the instructions provided by the NS2 documentation to install NS2 on your system.
3. sudo apt install ns2
4. sudo apt install nam 

5. Install any required dependencies or libraries specified in the project's documentation.

## Usage
1. Configure the network parameters and attack scenarios in the NS2 configuration files.

2. Run the simulation using the appropriate NS2 command:
 
 ns dos.tcl


3. Analyze the simulation results, including network performance metrics and attack effects.

4. Customize the code as needed to experiment with different defense mechanisms or attack scenarios.

## Contributing
Contributions to this project are welcome! If you have any ideas, bug fixes, or improvements, feel free to submit a pull request. Please follow the established coding conventions and provide clear documentation for any changes made.


