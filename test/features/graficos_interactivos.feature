# Created by Angel at 07/06/2025
# language: es
Característica: Gráficos interactivos
  Como paciente,
  Quiero darme cuenta de cuándo, dónde y por qué me dan migrañas,
  Para entender mejor qué factores comunes influyen en mi condición.

  Escenario: Visualizar gráfico de frecuencia semanal de migrañas
    Dado que el paciente ha registrado varios episodios en su historial
    Cuando accede al dashboard
    Entonces se muestra un gráfico de barras con la cantidad de migrañas por semana

    Escenario: Visualizar gráfico de zonas comunes de dolor
      Dado que el paciente ha registrado varios episodios con zonas de dolor
      Cuando accede al dashboard
      Entonces se muestran las zonas más frecuentes resaltadas en un diagrama interactivo del cuerpo