data <- readLines("~/projects/AoC_2022/day_6/input_day6.txt")
data <- strsplit(data[1], split="") |> unlist()

##Question 1 -----------------------------------------------------------------------
find_marker <- function(data, nchar) {
  found <- FALSE
  i <- 1
  while(!found) {
    marker <- data[i:(i+(nchar-1))]
    if(length(unique(marker)) == nchar){
      found=TRUE
      return(i+(nchar-1))
    }
    else
      i=i+1
  }
}


##Answer 1 -------------------------------------------------------------------------
find_marker(data, 4)

##Answer 2 -------------------------------------------------------------------------
find_marker(data, 14)


