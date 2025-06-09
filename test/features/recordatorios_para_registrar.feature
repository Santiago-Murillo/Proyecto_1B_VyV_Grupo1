# Created by Angel at 07/06/2025
# language: es
Característica: Recordatorios para registrar nuevos episodios
  Como paciente
  Quiero recibir recordatorios
  Para no olvidar registrar mis síntomas y dar seguimiento a mi condición

  Escenario: Recordatorio tras período de inactividad
    Dado han pasado más de dos días desde mi último registro,
    Cuando el sistema detecta esta inactividad,
    Entonces se me envía un recordatorio para que registre un nuevo episodio.

  Escenario: Recordatorio configurado
    Dado que se ha configurado un recordatorio para una hora específica,
    Cuando llega la hora establecida,
    Entonces se me envía un recordatorio para que registre un nuevo episodio.
