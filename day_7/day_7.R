t <- readLines("~/portfolio/AoC_2022/day_7/input_day7.txt")
tally <- 0
sum <- 0

#recursive solution
sum_dir <- function(dir) {
  #select lines 
  block_start <- which(t == dir)
  #find end
  found <- FALSE
  i <- 1
  while(!found) {
    if(grepl("cd", t[block_start+i])) {
      block_end <- block_start + i
      found <- TRUE
    } else {
      i<-i+1
    }
  }
  
  #find all the files and sum
  files <- block[!grepl("dir ", block)]
  if(length(files) > 2) {
    files_sizes <- gsub("[^0-9]", "", files[2:length(files)]) |> as.numeric()
  } 
  sum <- sum + file_sizes
  
  if(sum <= 100000)
    tally <<- tally+1
  
  #find all directories in this directory 
  block <- t[blcok_start:block_end]
  dirs <- block[grepl("dir ", block)]
  
  #move on to the next
  for(d in dirs) {
    if(d == "cd ..") {
      
    }
  }
}

######GRAVEYARD
#iterative solution
t_p <- t

lappend <- function (lst, ...){
  lst <- c(lst, list(...))
  return(lst)
}

#make list of blocks of dirs
blocks_list <- list()
while(length(t_p) > 1) {
  block_start <- 1
  block_end <- grep("cd ", t_p)[2]
  if(is.na(block_end)) {
    blocks_list <- lappend(blocks_list, t_p[block_start:length(t_p)])
    t_p <- t_p[block_end:length(t_p)]
  } else {
    blocks_list <- lappend(blocks_list, t_p[block_start:(block_end-1)])
    t_p <- t_p[block_end:length(t_p)]
  }
}

sums <- list()
current_sum <- 0

for(b in blocks_list) {
  #save parent
  if(b[1] != "cd ..") {
    parent <- b[1]
    #every time parent changes, interrupt sum and save
    sums <- append(sums, current_sum)
    current_sum <- 0
  }
  
  #find files and sum
  files <- b[!grepl("dir ", b)]
  files_sizes <- gsub("[^0-9]", "", files[2:length(files)]) |> as.numeric()
  
  current_sum <- current_sum + sum(files_sizes)
}
