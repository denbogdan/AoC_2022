library(dplyr)

plays <- read.delim("/Users/dbogdan/projects/AoC_2022/day2_input.txt", header=FALSE)

#outcomes
out <- data.frame(play=unique(plays$V1), my_hand=substr(unique(plays$V1), 3,3),
                  outcome=c("lose", "win", "lose", "win", "draw", "draw", "draw", "lose", "win"))
out <- out %>% mutate(hand_score = case_when(my_hand == "X" ~ 1, my_hand == "Y" ~ 2, my_hand == "Z" ~ 3)) %>% 
  mutate(play_score = case_when(outcome == "win" ~ 6, outcome == "lose" ~ 0, outcome == "draw" ~ 3)) %>%
  mutate(total_score = hand_score+play_score)

sum <- 0 
for (p in plays$V1) {
  sum <- sum + out$total_score[which(out$play == p)]
}

#part 2
out_2 <- out %>% select(play, my_hand) %>% mutate(outcome=my_hand) %>%
  mutate(outcome = case_when(outcome == "X" ~ "lose", outcome == "Y" ~ "draw", outcome == "Z" ~ "win")) %>%
  mutate(play_score = case_when(outcome == "win" ~ 6, outcome == "lose" ~ 0, outcome == "draw" ~ 3)) %>%
  mutate(my_hand = c("B", "A", "A", "B", "C", "B", "A", "C", "C")) %>%
  mutate(hand_score = case_when(my_hand == "A" ~ 1, my_hand == "B" ~ 2, my_hand == "C" ~ 3)) %>%
  mutate(total_score = hand_score + play_score)

sum <- 0 
for (p in plays$V1) {
  sum <- sum + out_2$total_score[which(out$play == p)]
}

