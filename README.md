# DeepLyapunovFunction

Efficient Computation of Lyapunov Functions Using Deep Neural Networks for the Assessment of Stability in Controller Design

Lyapunov Function Approximation and Analysis

This repository contains a collection of codes for approximating Lyapunov functions using deep neural networks and integrating these approximations into control system simulations in Simulink. The project demonstrates the use of machine learning techniques in control theory, particularly for systems where traditional analytical methods are infeasible.

Contents

lyapunov_approximation.py: TensorFlow code for approximating the Lyapunov function and computing its orbital derivative for a given dynamical system.

export_to_onnx.py: Script to export the trained TensorFlow model to the ONNX format for integration with Simulink.

Additional documentation and resources for integrating the model with Simulink.

Getting Started

Prerequisites

Python 3.x
TensorFlow 2.x
tf2onnx
NumPy
Matplotlib
Simulink (for integration with the ONNX model)

Installation

Clone the repository to your local machine:

bash
Copy code
git clone [https://github.com/your-username/lyapunov-function-approximation.git](https://github.com/DeepDynaSim/DeepLyapunovFunction.git)
cd lyapunov-function-approximation

Usage

Lyapunov Function Approximation:

Run .py files to approximate the Lyapunov function and compute its orbital derivative.
This script will also generate plots for visual analysis.

Exporting the Model:
Execute export_to_onnx.py to convert the trained model to the ONNX format.

Simulink Integration:
Follow the provided documentation to import the ONNX model into Simulink and set up the custom block for the orbital derivative.

Contributing
Contributions to this project are welcome. Please ensure to update tests as appropriate.

Contact
Caglar Uyulan - caglaruyulan1@gmail.com

Project Link: https://github.com/DeepDynaSim/DeepLyapunovFunction 
