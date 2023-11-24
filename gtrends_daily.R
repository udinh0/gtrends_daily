gtrends_daily = function(keyword = NA, geo = "BR", time = c(start_year, end_year), retry = 10, wait = 5) {
  require(trendecon)
  require(tidyverse)
  source("https://raw.githubusercontent.com/udinh0/gtrends_daily/main/collectMonthlyRange.R")
  df_total = data.frame()
  df = data.frame()
  t = collectMonthlyRange(time[1], time[2])
  for (i in t) {
    trends = ts_gtrends(keyword = keyword, geo = geo, time = i, retry = retry, wait = wait)
    df_total = expand(df_total, trends)
    df = rbind(df, df_total)
  }
  df = df %>% mutate(keyword = keyword)
  return(df)
}