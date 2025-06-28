# descarga y limpieza del CSV
suppressPackageStartupMessages({
  library(readr); library(dplyr); library(lubridate); library(fs)
})

url  <- Sys.getenv("URL_CSV")
dir_create("data/raw")
today_csv <- file.path("data/raw", paste0(Sys.Date(), ".csv"))
download.file(url, today_csv, mode = "wb")

df <- read_csv(today_csv, show_col_types = FALSE) |>
  filter(status == "complete")

# Guardar CSV limpio

dir_create("data/processed")
write_csv(df, "data/processed/clean.csv")
