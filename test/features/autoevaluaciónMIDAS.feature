# language: es

Característica: Autoevaluación MIDAS
  Como paciente
  Quiero autoevaluar mi migraña usando el estándar MIDAS
  Para entender mejor el impacto de migrañas en mi vida diaria

  Esquema del escenario: Nueva autoevaluación completada
    Dado que la evaluación MIDAS está disponible
    Y el paciente tiene <autoevaluaciones_previas> autoevaluación(es) en el historial
    Cuando el paciente responde todas las preguntas con un puntaje total de <puntaje>
    Entonces los resultados se registran con la fecha actual en el historial
    Y el historial de autoevaluaciones incluye la nueva autoevaluación con <puntaje>

    Ejemplos:
      | autoevaluaciones_previas | puntaje |
      | 0                        | 15      |
      | 2                        | 25      |
      | 5                        | 30      |

  Esquema del escenario: Historial de autoevaluaciones de paciente al médico
    Dado que un médico tiene asignado un paciente
    Y el paciente ha realizado <cantidad_inicial> autoevaluación(es)
    Cuando el paciente realiza una nueva autoevaluación con puntaje <puntaje>
    Entonces el historial de autoevaluaciones incluye la nueva autoevaluación con puntaje <puntaje>
    Y la cantidad total de autoevaluaciones es <cantidad_total>

    Ejemplos:
      | cantidad_inicial | puntaje | cantidad_total |
      | 0                | 18      | 1              |
      | 2                | 22      | 3              |
      | 5                | 30      | 6              |

  Esquema del escenario: Historial ordenado por puntaje total
    Dado que el paciente ha completado al menos una autoevaluación con puntajes: <puntajes> # entonces tiene un historial de autoevaluaciones
    Cuando el paciente aplica el filtro de puntaje total en <orden>
    Entonces los registros del historial se ordenan por puntaje total en dicho <orden>

    Ejemplos:
      | puntajes | orden       |
      | 10,25,5  | ascendente  |
      | 30,20,50 | descendente |

  Esquema del escenario: Mostrar historial ordenado por fecha
    Dado que el paciente ha completado al menos una autoevaluación con fechas: <fechas>
    Cuando el paciente aplica el filtro de fecha en orden <orden>
    Entonces los registros del historial se ordenan ordenados por fecha en dicho <orden>

    Ejemplos:
      | fechas                           | orden       |
      | 2024-05-01,2024-04-01,2024-06-01 | ascendente  |
      | 2024-01-15,2024-03-10,2024-02-20 | descendente |

  Esquema del escenario: Disponibilidad del test trimestral
    Dado que el paciente ha realizado <evaluaciones_previas> autoevaluación(es)
    Y la última autoevaluación fue realizada hace <meses> meses
    Cuando el paciente solicita iniciar una nueva autoevaluación
    Entonces el sistema indica que la prueba está <disponibilidad> para ser realizada

    Ejemplos:
      | evaluaciones_previas | meses | disponibilidad |
      | 0                    | 0     | disponible     |
      | 1                    | 3     | disponible     |
      | 2                    | 4     | disponible     |
      | 3                    | 2     | no disponible  |
      | 1                    | 0     | no disponible  |

 # ???
  Escenario: Disponibilidad del test trimestral para paciente nuevo
    Dado que el paciente no ha realizado ninguna autoevaluació
    Cuando el paciente solicita iniciar una nueva autoevaluación
    Entonces el sistema indica que la prueba está disponible para ser realizada

  Esquema del escenario: Estadísticas para autoevaluaciones
    Dado que el paciente ha completado autoevaluaciones con puntajes: <puntajes>
    Cuando el paciente realiza una nueva autoevaluación con puntaje <nuevo_puntaje>
    Entonces las estadísticas reflejan un promedio de <promedio_esperado>
    Y el grado de discapacidad es <grado>

    Ejemplos:
      | puntajes | nuevo_puntaje | promedio_esperado | grado    |
      | 10,20    | 30            | 20.0              | leve     |
      | 40,50,60 | 50            | 50.0              | moderada |
      | 0        | 10            | 5.0               | mínima   |

