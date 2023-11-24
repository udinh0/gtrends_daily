YearlyDataFetch = function(start_year, end_year) {
  require(lubridate)
  datas = c()
  mes = 1
  while (start_year != end_year) {
    for (dia in 1:31) {
      datas = append(datas, paste(dia, mes, start_year, sep = "/"))
    }
    mes = mes + 1
    if (mes == 13) {
      mes = 1
      start_year = start_year + 1
    }
  }
  datas = append(datas, paste(31, 12, start_year, sep = "/"))
  datas = suppressWarnings(dmy(datas))
  datas = datas[!is.na(datas)]
  ultimo = length(datas)
  datas = datas[-ultimo]
  return(datas)
}
