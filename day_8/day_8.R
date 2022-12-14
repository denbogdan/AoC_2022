trees <- readLines("~/portfolio/AoC_2022/day_8/input_day8.txt")

#make into data matrix
map <- matrix(strsplit(trees[1], split="") |> unlist() |> as.numeric()) |> t()
for(row in trees) {
  row <- strsplit(row, split="") |> unlist() |> as.numeric()
  map <- rbind(map, row)
}

for(i in 2:(nrow(map)-1) {
  for(j in 2:(nol(map)-1) {
    #get the neighbours in each direction
    up <- map[]
  }
}