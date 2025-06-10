# Created by Eliathx at 07/06/2025
  # language: es

  """
  Un médico puede habilitar o deshabilitar la mensajería con pacientes asignados.
  Si la mensajería está deshabilitada, el sistema debe impedir el envío de mensajes y notificar al paciente.
  """

Característica: Sistema de mensajería entre pacientes y médicos
  Como paciente,
  Quiero poder comunicarme directamente con mi médico,
  Para resolver dudas rápidas sin tener que esperar una nueva cita.

  Escenario: Enviar mensaje a médico que permite mensajes
    Dado que el paciente tiene un médico asignado
    Y el médico asignado permite recibir mensajes
    Cuando el paciente envía un mensaje
    Entonces el mensaje queda registrado y disponible para que el médico lo lea


  Escenario: Enviar mensaje a médico que no permite mensajes
    Dado que el paciente tiene un médico asignado
    Y el médico asignado no permite recibir mensajes
    Cuando el paciente intenta enviar un mensaje
    Entonces se le informa que ese médico no acepta mensajes directos
