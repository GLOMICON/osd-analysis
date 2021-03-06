# Note that this script will standardise the data with the
# total sum of all OTUs detected at a given site.
# this is not the same as the original number of reads, low
# quality reads that were discarded by SILVAngs are not
# featured here.

if (exists("raw16Scounts") == FALSE){
  source("https://raw.githubusercontent.com/MicroB3-IS/osd-analysis/master/16S18S/import_16S.R")
} else {print("using existing raw16Scounts matrix")}


if (is.element("vegan", installed.packages()[,1])) {
  print("using existing vegan installation...")
} else {install.packages("vegan")}

require(vegan)

tss16Scounts <- decostand(
  raw16Scounts, 
  MARGIN = 1, 
  method = "total"
  )

gc()