YearlyDataFetch = function(year = c(start_year, end_year)) {
  require(lubridate)
  datas = c()
  mes = 1
  ano_inicial = year[1]
  ano_final = year[2]
  while (ano_inicial != ano_final) {
    for (dia in 1:31) {
      datas = append(datas, paste(dia, mes, ano_inicial, sep = "/"))
    }
    mes = mes + 1
    if (mes == 13) {
      mes = 1
      ano_inicial = ano_inicial + 1
    }
  }
  datas = append(datas, paste(31, 12, ano_inicial, sep = "/"))
  datas = suppressWarnings(dmy(datas))
  datas = datas[!is.na(datas)]
  ultimo = length(datas)
  datas = datas[-ultimo]
  return(datas)
}
