# DIVAnd in R

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
![GitHub top language](https://img.shields.io/github/languages/top/emodnet/EMODnet-Biology-DIVAnd-R)

## Introduction

[`DIVAnd`](https://github.com/gher-uliege/DIVAnd.jl) is a software tool, written in [Julia](https://julialang.org/), designed to interpolate in situ measurements onto a regular grid.
The tool has been applied in several European projects to create climatologies for variable such as temperature, salinity or eutrophication variables.

`R` is a language widely used in the scientific community, hence the interface to call `DIVAnd` in a `R` session is the objective of the present project.

## Directory structure

```
EMODnet-Biology-DIVAnd-R/
├── analysis
├── data/
│   ├── derived_data/
│   └── raw_data/
├── docs/
├── product/
└── scripts/
```

* **analysis** - Markdown or Jupyter notebooks
* **data** - Raw and derived data
* **docs** - Rendered reports
* **product** - Output product files
* **scripts** - Reusable code

## Data series

This project does not involve any time series.

## Data product

This project does not involve any data product, as the main product is the documentation on how to use `DIVAnd` in `R`, which in turn can enable users to create new products. 

## More information:

### References

### Code and methodology

Barth, A., Beckers, J.-M., Troupin, C., Alvera-Azcárate, A., and Vandenbulcke, L.: DIVAnd-1.0: n-dimensional variational data analysis for ocean observations, Geosci. Model Dev., 7, 225-241, doi:[10.5194/gmd-7-225-2014](https://doi.org/10.5194/gmd-7-225-2014), 2014.

Bezanson, J.; Edelman, A.; Karpinski, S. & Shah, V. B. Julia: A fresh approach to numerical computing SIAM Review, SIAM, 59, 65-98, doi: [10.1137/141000671](https://doi.org/10.1137/141000671), 2017

Li. JuliaCall: an R package for seamless integration between R and Julia. Journal of Open Source Software, 4(35), 1284, [10.21105/joss.01284](https://doi.org/10.21105/joss.01284), 2019

### Citation and download link

This product should be cited as:

{{product_citation}}

Available to download in:

{{link_download}}

### Authors

Charles Troupin (ULiège)