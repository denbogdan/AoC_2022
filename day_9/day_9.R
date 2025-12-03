#read in data
setwd("~/portfolio/AoC_2022/day_9/")
data <- read.delim("input_day9.txt", header=FALSE, sep=" ")

#expand these coordinates
steps <- apply(data, 1, function(x) {rep(x[1], x[2])}) |> unlist() |> as.character()

##Question 1 -----------------------------------------------------------------------
#use a+bi cartesian coordinates to describe visited places
directions <- c("R" = 1, "L" = -1, "U" = 1i, "D" = -1i)
#start at 0
numbers_visited <- c()
H_pos <- 0
T_pos <- 0
for(s in steps) {
  H_pos <- H_pos + directions[s]
  distance <- Mod(H_pos-T_pos)
  if(distance > 1.5) {
    #if they are not overlapping, move tail
    if(H_pos != T_pos) {
      #if they are on the same line, add by the same increment
      if((Re(H_pos) == Re(T_pos)) | (Im(H_pos) == Im(T_pos))) {
        T_pos <- T_pos + directions[s]
      } else {
        #difference in real and im parts 
        T_pos <- H_pos - directions[s]
        # re_dif <- Re(H_pos) - Re(T_pos)
        # im_dif <- Im(H_pos) - Im(T_pos)
        # T_pos <- case_when(re_dif == 1  ~ (H_pos - 1i),
        #                    re_dif == -1 ~ (H_pos + 1i),
        #                    im_dif == 1 ~ (H_pos - 1),
        #                    im_dif == -1 ~ (H_pos + 1))
      }
    }
  }
  numbers_visited <- c(numbers_visited, T_pos)
}

##Answer 1 -------------------------------------------------------------------------
length(unique(numbers_visited))

##Question 2 -----------------------------------------------------------------------
