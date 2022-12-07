data <- readLines("~/projects/AoC_2022/day_3/input_day3.txt")
priority <- data.frame(item=c(letters, LETTERS), p=1:52)

##Question 1 -----------------------------------------------------------------------
sum <- 0
for(r in data) {
  r <- strsplit(r, split="") |> unlist()
  h1 <- r[1:(length(r)/2)]
  h2 <- r[(length(r)/2+1):length(r)]
  common_item <- intersect(h1, h2)
  
  sum <- sum + priority$p[which(priority$item == common_item)]
}

##Answer 1 -------------------------------------------------------------------------
sum

##Question 2 -----------------------------------------------------------------------
sum <- 0
for(i in seq(1, (length(data)-2), by=3)) {
  e1 <- strsplit(data[i], split="") |> unlist()
  e2 <- strsplit(data[i+1], split="") |> unlist()
  e3 <- strsplit(data[i+2], split="") |> unlist()
  
  common_item <- Reduce(intersect, list(e1,e2,e3))
  sum <- sum + priority$p[which(priority$item == common_item)]
}

##Answer 2 -------------------------------------------------------------------------
sum

