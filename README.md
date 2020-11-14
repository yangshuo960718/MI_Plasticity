# MI_Plasticity

RVE analysis for plasticity

> git repo: https://github.com/lyyc199586/MI_Plasticity

## Directory

```bash
.
├── MatFile 					# temp folder for .mat files
├── Plot
│   └── config
│       ├── bc.svg
│       ├── bc_trace_free.svg
│       └── config.svg
├── README.md
├── ReportFile					# report files .rpt from Abaqus
├── getmesh.m					# .inp->mesh.m
├── hardening_plot.nb			# hardening curve plots in mma
├── homo_stress_strain.m		# single stress-strain curve plot
├── mesh						# mesh files .mat
├── multi_stress_strain_plot.m	# final load circle plot
├── rpt2mat.m					# transfer rpt->mat into MatFile
├── sq_crack0					# all Abaqus files for r_a = 0
├── sq_crack0d2
├── sq_crack0d4
├── sq_crack0d6
└── sq_crack0d8
```



## Goals

1. **Trace-free test** on RVE with different hardening models

   | perfect plasticity | isotropic hardening (linear) | isotropic hardening (exponential) | kinematic hardening |
   | ------------------ | ---------------------------- | --------------------------------- | ------------------- |
   | ✔                  |                              |                                   |                     |

2. RVE with **linear hardening** model on different loading paths

   | trace-free | uniaxial tension/compression | shear test |
   | ---------- | ---------------------------- | ---------- |
   |            |                              |            |

