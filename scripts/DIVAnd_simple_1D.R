# Simplest DIVAnd interpolation with a 1D vector
# The input are created as R variables, then converted to Julia variables
# with the command julia_assign("aa", aa), with aa taking the name of the different variables

library(JuliaCall)
julia_setup(JULIA_HOME = path.expand("~/.juliaup/bin/"))
# julia_setup(JULIA_HOME = "/home/ctroupin/miniconda3/bin/")
julia_command("using DIVAnd")
library(logger)
library(ggplot2)

# Create directories
figdir <- "../product/figures/"
resdir <- "../product/netcdf"
dir.create(figdir)
dir.create(resdir)

# Create 1D data
x <- c(0.0, 0.2, 0.4, 0.6, 0.8, 1.0, 1.1)
f <- sin(x*6)

# Set the interpolation grid: increase the value of npoints to have a finer resolution
npoints <- 30
xi <- seq(0, 1, length.out=npoints)

# True field (normally unknown)
fref <- sin(xi * 6)

# Mask: all points are valid points
mask <- !logical(length(xi))

# Metrics: pm is the inverse of the resolution along the 1st dimension
pm <- rep(1, length(xi)) / (xi[2]-xi[1])

# Analysis parameters
# Correlation length
len <- 0.1

# Obs. error variance normalized by the background error variance
epsilon2 <- 0.1

# From R variable to Julia variable
# (maybe possible to do it differently)
julia_assign("pm", pm)
julia_assign("xi", xi)
julia_assign("x", x)
julia_assign("f", f)
julia_assign("len", len)
julia_assign("mask", mask)
julia_assign("epsilon2", epsilon2)

# DIVAnd execution
julia_command("fi, s = DIVAndrun(mask, (pm,) ,(xi,), (x,), f, len, epsilon2; alphabc=0);") 

# From Julia variable to R variable
fi = julia_eval("fi")


# Create a simple plot
ggplot() +
  geom_point(aes(x = x, y = f, colour = "Observations"), size = 3) +
  geom_line(aes(x = xi, y = fref, colour = "Reference")) +
  geom_line(aes(x = xi, y = fi, colour = "Interpolation")) +
  scale_colour_manual("", 
                      breaks = c("Observations", "Reference", "Interpolation"),
                      values = c("blue", "green", "orange")) +
  theme(legend.position.inside = c(0.8, 0.9)) + 
  xlab("x") +
  ylab("f") +
  ggtitle("DIVAnd interpolation in 1 dimension")


ggsave(file.path(figdir, "divand_simple_1D.png"))

# Write the results in a netCDF file
library(ncdf4)

filename = file.path(resdir, "diva_1D.nc")
nx <- length(xi)
lon1 <- ncdim_def("longitude", "degrees_east", xi)
mv <- -999 #missing value to use
var_field <- ncvar_def("field", "celsius", list(lon1), longname="Temperature", mv)

ncnew <- nc_create(filename, list(var_field))
ncvar_put(ncnew, var_field, fi, start=c(1), count=c(nx))

# Don't forget to close the file
nc_close(ncnew)