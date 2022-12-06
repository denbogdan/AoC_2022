library(rstack)

lines <- readLines("~/portfolio/AoC_2022/day_5/input_day5.txt")
stacks <- lines[1:9]
instructions <- lines[11:length(lines)]

#parse the stacks
#make list of 9 stacks
stack_list <- list(stack$new(), stack$new(), stack$new(),
                   stack$new(), stack$new(), stack$new(),
                   stack$new(), stack$new(), stack$new())

#letters are found at the following indexes in the parsed input
letter_positions <- seq(2,35,4)

#add letters to stack
for(i in 8:1) {
  split_line <- strsplit(stacks[i], split="") |> unlist()
  split_line <- split_line[letter_positions]
  
  for(j in 1:9) {
    if(split_line[j] %in% LETTERS)
      stack_list[[j]] <- stack_list[[j]]$push(split_line[j])
  }
}


##Question 1 -----------------------------------------------------------------------

#move boxes around
for(i in 1:length(instructions)) {
  #parse instructions
  instr <- gsub("move ", "",instructions[i])
  instr <- gsub("from ", "",instr)
  instr <- gsub("to ", "",instr)
  moves <- strsplit(instr, split=" ") |> unlist() |> as.numeric()
  n <- moves[1]
  from <- moves[2]
  to <- moves[3]
  
  #move each box
  for(box in 1:n) {
    box_to_move <- stack_list[[from]]$pop()
    stack_list[[to]] <- stack_list[[to]]$push(box_to_move)
  }
}


##Answer 1 -------------------------------------------------------------------------
sapply(stack_list, function(x) {x$peek()})


##Question 2 -----------------------------------------------------------------------

#move boxes around - re-initialise the stack before running
for(i in 1:length(instructions)) {
  #parse instructions
  instr <- gsub("move ", "",instructions[i])
  instr <- gsub("from ", "",instr)
  instr <- gsub("to ", "",instr)
  moves <- strsplit(instr, split=" ") |> unlist() |> as.numeric()
  n <- moves[1]
  from <- moves[2]
  to <- moves[3]
  
  #get all the boxes to move out
  boxes_to_move <- c()
  for(box in 1:n) {
    boxes_to_move <- c(boxes_to_move, stack_list[[from]]$pop())
  }
  
  #push them back in from the last to the first
  for(box in n:1) {
    stack_list[[to]] <- stack_list[[to]]$push(boxes_to_move[box])
  }
}

##Answer 2 -------------------------------------------------------------------------
sapply(stack_list, function(x) {x$peek()})
