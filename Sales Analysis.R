# Cargar librerías necesarias
library(readxl)
library(dplyr)
library(ggplot2)
library(lubridate)

# Leer dataset
ventas <- read_excel('C:/Users/User/Desktop/Certificado Data Science/Excel data sets/ventas_2023_2024.xlsx')
View(ventas)

# Limpieza básica
ventas <- ventas %>% distinct()
sum(is.na(ventas))
ventas$Fecha <- as.Date(ventas$Fecha)

# Resumen y análisis
resumen <- ventas %>% group_by(Ciudad) %>% summarise(Promedio_Tiempo = mean(Tiempo_Servicio_Min))
print(resumen)

# Resumen combinado por ciudad
resumen3 <- ventas %>%
  group_by(Ciudad) %>%
  summarise(
    Promedio_Tiempo_Servicio = mean(Tiempo_Servicio_Min, na.rm = TRUE),
    Promedio_Unidades_Vendidas = mean(Unidades_Vendidas, na.rm = TRUE)
  )


# Mostrar el resultado

print(resumen3)

# Gráfico de ventas mensuales por ciudad
ggplot(ventas, aes(x = Fecha, y = Unidades_Vendidas, color = Ciudad)) +
  geom_line() + theme_minimal() + labs(title = 'Ventas mensuales por ciudad')

