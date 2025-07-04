# Check for renv and install, if necessary
if(require(renv) != TRUE) {
  install.packages("renv")
}
# The renv package allows for using renv::status(), which will compare the list 
# of installed packages with those specified in the .lock file and installing,
# up- or downgrading those that cannot be found or are installed in another 
# version than specified.
