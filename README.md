# MI_Plasticity

RVE analysis for plasticity

> git repo: https://github.com/lyyc199586/MI_Plasticity

## Directory

```bash
.
├── MatFile                      # store temp *.mat file
├── Plastic_report.md            # analysis report
├── Plot                         # plot data and plots
├── README.md                    # read me
├── ReportFile                   # abaqus report file *.rpt
├── getmesh.m                    # node.txt, ele.txt -> mesh.mat
├── hardening_plot.nb            # plot hardening curve
├── homo_stress_strain.m         # plot single stress-strain curve
├── mesh                         # store mesh.mat
├── multi_stress_strain_plot.m   # plot multi stress-strain curves
├── rpt2mat.m                    # *.rpt -> *.mat
├── sq_crack0                    # all abaqus files
├── sq_crack0d4
└── sq_crack0d8
```

## Goals

1. **Trace-free test** on RVE with different hardening models

   | perfect plasticity | isotropic hardening (linear) | isotropic hardening (exponential) | kinematic hardening |
   | ------------------ | ---------------------------- | --------------------------------- | ------------------- |
   | ✔                 |  ✔                           |          ✔                     | ✔ |

2. RVE with **linear hardening** model on different loading paths

   | trace-free | uniaxial tension |  uniaxial compression    | shear test |
   | ---------- | ---------------- | ---- | ---------- |
   | ✔          | ✔ |      | e12/e13    |

## Work flow

1. create and set RVE in abaqus (`*.cae`)

2. output mesh from abaqus input file
  
   a. paste nodes and elements from `*.inp` to `node.txt`, `ele.txt`

   b. run `getmesh.m` to get `mesh.mat`

3. run abaqus analysis

4. output report (`*.rpt`) from abaqus

5. run `rpt2mat.m` to convert `*.rpt` to temporary mat file

6. run `homo_stress_strain.m` and `multi_stress_strain_plot` to postprocess

7. store plot data and plots in `./Plot`

8. update `Plastic_report.md`