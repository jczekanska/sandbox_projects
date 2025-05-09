# Rolling Stone Data Analysis

This R script performs an exploration of Rolling Stone’s “500 Greatest Albums” dataset. It combines three ranked lists (2003, 2012, 2020) with additional artist and Spotify metadata to uncover trends in:

- **Artist demographics** (gender, member count, birth years, debut age)
- **Album characteristics** (title length, word usage, special characters, emotional words)
- **Genre dynamics** (popularity, Billboard longevity, Spotify presence, proportions over decades)
- **Rank evolution** (changes between 2003, 2012, 2020; animations of rank trajectories)

## 📊 What it uses

- **Dataset**: `rolling_stone.csv`  
  - Album rankings in 2003, 2012, 2020  
  - Artist info: name, gender, member count, birth years, debut year  
  - Album info: title, release year, genre, Spotify URL & popularity  
  - Billboard performance: weeks on chart  

- **R packages** (installed & loaded at start):  
  tidyverse, ggplot2, dplyr, tidyr, stringr, lubridate, ggthemes,  
  tm, SnowballC, wordcloud, RColorBrewer, tidytext, viridis, pals,  
  patchwork, cowplot, gridExtra, gganimate, ggraph, tidygraph  
