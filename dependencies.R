# Windows or Mac
# if (.Platform$OS.type == 'windows') {
#   Sys.setlocale(category = 'LC_ALL','English_United States.1252')
# } else {
#   Sys.setlocale(category = 'LC_ALL','en_US.UTF-8')
# }

# setting path to miniCRAN
# pth <- normalizePath("../../miniCRAN", winslash = "/")
# http://mostly-harmless.github.io/radiant_miniCRAN/

# install to user directory
local_dir <- Sys.getenv("R_LIBS_USER")
if(!file.exists(local_dir)) dir.create(local_dir, recursive = TRUE)

# loading the list of pkgs needed to run radiant
# source(paste0(pth,"/pkgs.R"))
pkgs <- c("car", "gridExtra", "GPArotation", "psych", "vegan",
          "RColorBrewer", "wordcloud", "AlgDesign", "brew",
          "reshape2", "plyr", "markdown", "knitr", "rmarkdown",
          "testthat", "lubridate", "ggplot2", "shiny", "magrittr",
          "tidyr", "dplyr", "ggvis", "broom", "shinyAce")

# setting the url for the miniCRAN
# look to rady server first and then in the Rstudio CRAN
mcran <- paste0("file:///",pth)
options(repos = c(CRAN = mcran))

# udpate old-packages
update.packages(lib.loc = local_dir, ask = FALSE)

# install packages that are available but were not installed before
to_inp <- new.packages(lib.loc = local_dir)

#   if(length(to_inp) != 0) install.packages(to_inp, lib.loc = local_dir)
if(length(to_inp) != 0)
	install.packages(to_inp, local_dir, dependencies = TRUE)

# load/attach packages
# suppressWarnings(
#   sapply(pkgs, require, lib.loc = local_dir, character.only=TRUE)
# )
