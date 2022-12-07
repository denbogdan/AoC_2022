data <- readLines("~/projects/AoC_2022/day_6/input_day6.txt")
data <- strsplit(data[1], split="") |> unlist()

##Question 1 -----------------------------------------------------------------------
found <- FALSE
i <- 1
while(!found) {
  marker <- data[i:(i+3)]
  if(length(unique(marker)) == 4)
    found=TRUE
  else
    i=i+1
}

##Answer 1 -------------------------------------------------------------------------
i+3

##Question 2 -----------------------------------------------------------------------
found <- FALSE
i <- 1
while(!found) {
  marker <- data[i:(i+13)]
  if(length(unique(marker)) == 14)
    found=TRUE
  else
    i=i+1
}

##Answer 1 -------------------------------------------------------------------------
i+13


