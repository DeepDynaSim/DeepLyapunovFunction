# Neural Lyapunov Functions for Nonlinear Systems

**DeepDynaSim collection | Learning and stability analysis | TensorFlow / MATLAB**

Explore deep neural-network approximations of Lyapunov functions and their orbital derivatives. This research and teaching repository contains two Python notebooks, MATLAB stability examples and a technical report.

## Repository map

| Resource | Purpose |
| --- | --- |
| [Lyapunov_Approximation_1.ipynb](Lyapunov_Approximation_1.ipynb) | Neural approximation example for a two-dimensional state |
| [Lyapunov_Approximation_2.ipynb](Lyapunov_Approximation_2.ipynb) | Neural approximation example for a four-dimensional state |
| [evaluateStability.m](evaluateStability.m) | MATLAB stability-condition evaluation helper |
| [example_stability.m](example_stability.m) | Illustrative MATLAB workflow with placeholder training data |
| [Technical report](Efficient%20Computation%20of%20Lyapunov%20Functions%20Using%20DNNs%20for%20the%20Assessment%20of%20Stability%20in%20Controller%20Design.pdf) | Method background and discussion |

## Getting started

The notebooks import TensorFlow, NumPy and Matplotlib. Open either notebook in a compatible Jupyter environment and review the system dynamics, sampling region, training objective and plotting cells before running them in order. Dependency versions are not pinned in this repository.

```sh
git clone https://github.com/DeepDynaSim/DeepLyapunovFunction.git
cd DeepLyapunovFunction
python -m venv .venv
# Activate the environment using the command for your operating system.
python -m pip install jupyter tensorflow numpy matplotlib
python -m notebook
```

For MATLAB, inspect `example_stability.m` and `evaluateStability.m` together. Neural-network functions in the example require the corresponding MATLAB toolbox. The random training targets and other placeholders must be adapted to the intended dynamical system.

## Interpreting the examples

A fitted scalar function or a sampled numerical check does not by itself establish a formal stability certificate over a continuous domain. Examine positivity, orbital-derivative conditions, the domain and the verification method for the specific system. The examples support method exploration and visual analysis.

### Known limitations of the historical examples

- The scalar and batched dynamics in `Lyapunov_Approximation_1.ipynb` differ: one cell uses `x1_dot=-x1^3`, while the batched cell uses `x1_dot=-x1-10*x2^2`. They must not be interpreted as evaluations of the same vector field without reconciling that choice.
- The four-state notebook includes `x1_dot=-x1^2`. For a negative initial state, `x1(t)=x1(0)/(1+x1(0)*t)` has finite escape; `x1(0)=-0.5` is singular at `t=2`. Thus this example does not establish two-sided asymptotic stability of the origin. A low value-regression loss does not repair that problem.
- `evaluateStability.m` differentiates `V` symbolically and therefore requires Symbolic Math Toolbox and a candidate that accepts symbolic inputs. An arbitrary trained network handle may not support this operation. Its Boolean result describes only the supplied finite sample set.
- The first example in `example_stability.m` is a rotation: its quadratic candidate has zero orbital derivative and is expected to fail the requested strict negative-decay test. That failure does not prove the rotation is Lyapunov unstable.

The MATLAB example now forms a full Cartesian grid rather than pairing identical coordinate lists. For an independent, strictly decreasing numerical example:

```matlab
axisValues = -1:0.5:1;
[X1, X2] = meshgrid(axisValues, axisValues);
domain = [X1(:)'; X2(:)'];
passedSamples = evaluateStability(@(x) -x, ...
    @(x) x(1)^2+x(2)^2, @(x) 2*sum(x.^2), domain);
```

Passing those samples is not a continuum certificate. The separate [structure-preserving neural Lyapunov repository](https://github.com/DeepDynaSim/structure-preserving-neural-lyapunov) contains explicit proof assumptions and a distinction between sampled evidence and validated verification.

The current checkout does not include `export_to_onnx.py` or a complete Simulink integration workflow. ONNX export and deployment require an additional implementation.

## Contributing and citation

For a useful issue or contribution, include the notebook/file, environment versions, system equations, sampling settings and a minimal reproducible example. Cite the repository and the commit/version used in academic work. The existing [GPL-2.0 license](LICENSE) governs reuse.

Author contact retained from the original repository: Caglar Uyulan, caglaruyulan1@gmail.com.

## Related work and collaboration

Explore related repositories: [AI Powered Software for Turbo Compressor Design](https://github.com/DeepDynaSim/AI-Powered-Software-for-Turbo-Compressor-Design) · [satellite thermal preview control](https://github.com/DeepDynaSim/satellite-thermal-preview-control).

[DeepDynaSim](https://github.com/DeepDynaSim) is an engineering R&D and consulting company in İzmir, Türkiye, focused on physics-guided AI, simulation and control. For engineering collaboration: [support@deepdynasim.com](mailto:support@deepdynasim.com). For repository questions, use [Issues](https://github.com/DeepDynaSim/DeepLyapunovFunction/issues).

Reuse follows the existing [LICENSE](LICENSE); academic authorship and third-party attribution remain with their respective creators.
