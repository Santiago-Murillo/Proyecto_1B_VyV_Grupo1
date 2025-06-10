# Created by Angel at 07/06/2025
# language: es
Característica: Estadísticas de migrañas
  Como paciente,
  Quiero darme cuenta de cuándo, dónde y porqué me dan migrañas,
  Para entender mejor qué factores comunes influyen en mi condición.

  Antecedentes:
    Dado que el paciente ha registrado al menos un episodio en su historial de migrañas

  Escenario: Consultar frecuencia diaria de migrañas en una semana
    Cuando consulta la frecuencia de migrañas de la semana
    Entonces se mostrará la cantidad de migrañas registradas por cada día

  Escenario: Consultar las 3 zonas más frecuentes de dolor
    Cuando consulta las 3 zonas más frecuentes de dolor
    Entonces se mostrará las 3 zonas más frecuentes de dolor

  Escenario: Consultar el desencadenante más común
    Cuando consulta el desencadenante más común
    Entonces se mostrará el desencadenante más común
