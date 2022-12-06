cal <- readLines("~/portfolio/AoC_2022/day_1/1_input.txt") |> as.numeric()

s <- 0
elves <- c()
for(c in cal) {
  if(!is.na(c)) {
    s <- s+c
  } else {
    elves <- c(elves, s)
    s <- 0
  }
}

##Answer 1 -------------------------------------------------------------------------
max(elves)

##Answer 2 -------------------------------------------------------------------------
sort(elves, decreasing = TRUE)[1:3] |> sum()
