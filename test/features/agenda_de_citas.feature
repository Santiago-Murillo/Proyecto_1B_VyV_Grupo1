# Created by Eliathx at 07/06/2025
  # language: es

Característica: Agenda de citas médicas
  Como paciente,
  Quiero agendar citas médicas
  Para dar seguimiento a mi tratamiento

  Escenario: Agendar cita en horario disponible
    Dado que el paciente tiene un médico asignado,
    Cuando solicita una nueva cita,
    Y elige una fecha y hora disponibles,
    Entonces la cita quedará agendada.

  Escenario: Cancelar cita
    Dado que el paciente tiene una cita agendada,
    Cuando cancela la cita
    Entonces la cita ya no estará agendada.

  Escenario: Agendar cita en horario no disponible
    Dado que el paciente tiene un médico asignado,
    Cuando intenta agendar una cita con un médico en un horario ya ocupado,
    Entonces el sistema debe indicarle que ese horario no está disponible,
    Y no se registra la cita.

 """
   Escenario:
    Dado que el paciente tiene al menos una cita futura agendada,
    Cuando consulta sus citas,
    Entonces puede ver la lista de próximas citas con sus detalles.
 """