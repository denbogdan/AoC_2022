library(tidyr)

pairs <- read.delim("~/portfolio/AoC_2022/day_4/input_day4.txt", header=FALSE, sep=",")

pairs <- pairs %>% separate(V1, into=c("E1", "E2"), sep="-") %>% separate(V2, into=c("F1", "F2"), sep="-")
pairs[,1:4] <- sapply(pairs[,1:4], as.numeric)

##Question 1 -----------------------------------------------------------------------
contained <- 0
row_counted <- c()
for(i in 1:nrow(pairs)) {
  #check if E is in F
  if(pairs[i,"E1"] <= pairs[i, "F1"]) {
    if(pairs[i,"E2"] >= pairs[i, "F2"]) {
      contained <- contained+1
      row_counted <- c(row_counted, i)
    }
  }
  
  #check if F is in E
  if(pairs[i,"F1"] <= pairs[i, "E1"]) {
    if(pairs[i,"F2"] >= pairs[i, "E2"]) {
      contained <- contained+1
      row_counted <- c(row_counted, i)
    }
  }
  
  #remove duplicates
  if((pairs[i,"F1"] == pairs[i, "E1"]) & (pairs[i,"F2"] == pairs[i, "E2"])) {
    contained <- contained-1
    print(pairs[i,])
  }
}

##Answer 1 -------------------------------------------------------------------------
contained


##Question 2 -----------------------------------------------------------------------

#Approach 1: count segments that overlap and keep track of the rows. Final result is
#the reunion of rows overlapping and those contained within each other.

overlap <- 0
for(i in 1:nrow(pairs)) {
  if((pairs[i,"F1"] <= pairs[i,"E1"]) & (pairs[i,"E1"] <= pairs[i,"F2"]) & (pairs[i,"F2"] <= pairs[i,"E2"])) {
    overlap <- overlap + 1
    row_counted <- c(row_counted, i)
  }
  
  if((pairs[i,"E1"] <= pairs[i,"F1"]) & (pairs[i,"F1"] <= pairs[i,"E2"]) & (pairs[i,"E2"] <= pairs[i,"F2"])) {
    overlap <- overlap + 1
    row_counted <- c(row_counted, i)
  }
}

##Answer 2 -------------------------------------------------------------------------
length(unique(row_counted))


#Approach 2: count only segments that do not overlap
no_overlap <- 0
for(i in 1:nrow(pairs)) {
  if((pairs[i,"E2"] < pairs[i,"F1"]) || (pairs[i,"F2"] < pairs[i,"E1"])) {
    no_overlap <- no_overlap+1
    print(pairs[i,])
  }
}

nrow(pairs) - no_overlap