collectMonthlyRange = function(start_year, end_year) {
  source("https://raw.githubusercontent.com/udinh0/gtrends_daily/main/YearlyDataFetch.R")
  dia_inicial = 1
  dia_final = 0
  mes = 1
  dados = c()
  start_year = start_year
  end_year = end_year
  data_range_daily = YearlyDataFetch(start_year, end_year)
  while(dia_inicial <= length(data_range_daily)) {
    for (mes in 1:12) {
      if (mes == 2) {
        if (start_year %% 4 == 0) {
          dia_final = dia_final + 29
        }
        else {
          dia_final = dia_final + 28 
        }
      }
      if (mes %in% c(4, 6, 9, 11)) {
        dia_final = dia_final + 30
      }
      if (mes %in% c(1, 3, 5, 7, 8, 10, 12)) {
        dia_final = dia_final + 31
      }
      dados = append(dados, paste(data_range_daily[dia_inicial], data_range_daily[dia_final], sep = " "))
      dia_inicial = dia_final + 1
    }
    start_year = start_year + 1
  }
  return(dados)
}
