# language: es
# language: es

Característica: Autoevaluación MIDAS
  Como paciente
  Quiero saber mi grado de discapacidad
  Para entender mejor el impacto de migrañas en mi vida diaria

  Escenario: La evaluación está disponible luego de 3 meses
    Dado que el paciente ha realizado al menos una evaluacion MIDAS
    Cuando la diferencia entre la "<fecha_actual>" y la "<fecha_ultima_evaluacion>" sea de 90 dias o más
      | fecha_ultima_evaluacion | 2023-01-01 |
      | fecha_actual            | 2023-04-01 |
    Entonces el paciente podrá realizar una nueva evaluación

  Esquema del escenario: La evaluación no está disponible antes de 3 meses
    Dado que el paciente ha realizado al menos una evaluacion MIDAS
    Cuando la diferencia entre la "<fecha_actual>" y la "<fecha_ultima_evaluacion>" sea de 90 dias o menos
    Entonces el paciente no podrá realizar una nueva evaluación
    Ejemplos:
      | fecha_ultima_evaluacion | fecha_actual |
      | 2023-02-01              | 2023-02-01   |
      | 2023-01-15              | 2023-01-25   |
      | 2023-04-1               | 2023-05-30   |


#  Esquema del escenario: La evaluación está disponible luego de 3 meses
#    Dado que el paciente ha realizado una última evaluación en la "<fecha>"
#    Cuando pasen 3 meses desde la última evaluación
#    Entonces el paciente podrá realizar una nueva evaluación
#
#    Ejemplos:
#      | fecha      | fecha_actual |
#      | 2023-01-01 | 2023-04-01   |
#      | 2023-12-15 | 2024-03-15   |
#      | 2023-03-10 | 2023-06-10   |
#
#
#  Esquema del escenario: La evaluación no está disponible
#    Dado que el paciente ha realizado una última evaluación en la "<fecha>"
#    Cuando no pasen 3 meses desde la última evaluación
#    Entonces el paciente no podrá realizar una nueva evaluación
#
#    Ejemplos:
#      | fecha      | fecha_actual |
#      | 2023-02-01 | 2023-02-02   |
#      | 2023-01-15 | 2023-01-25   |
#      | 2023-04-11 | 2023-04-11   |

#    ------------------------------

#Característica: Autoevaluación MIDAS
#  Como paciente
#  Quiero saber mi grado de discapacidad
#  Para entender mejor el impacto de migrañas en mi vida diaria
#
#  Esquema del escenario: La autoevaluación está disponible luego de 3 meses
#    Dado que el paciente ha realizado una última autoevaluación en la "<fecha>"
#    Cuando pasen 3 meses desde la última autoevaluación
#    Entonces el paciente podrá realizar una nueva autoevaluación
#
#    Ejemplos:
#      | fecha      | fecha_actual |
#      | 2023-01-01 | 2023-04-01   |
#      | 2023-12-15 | 2024-03-15   |
#      | 2023-03-10 | 2023-06-10   |
#
#  Esquema del escenario: La autoevaluación no está disponible
#    Dado que el paciente ha realizado una última autoevaluación en la "<fecha>"
#    Cuando no pasen 3 meses desde la última autoevaluación
#    Entonces el paciente no podrá realizar una nueva autoevaluación
#
#    Ejemplos:
#      | fecha      | fecha_actual |
#      | 2023-02-01 | 2023-02-02   |
#      | 2023-01-15 | 2023-01-25   |
#      | 2023-04-11 | 2023-04-11   |
