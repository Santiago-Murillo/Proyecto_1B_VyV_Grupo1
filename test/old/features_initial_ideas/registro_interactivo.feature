# Created by Angel at 07/06/2025
# language: es
Característica: Registro interactivo
  Como paciente,
  quiero poder describir fácilmente lo que ocurre durante mis episodios,
  para que mi médico me entienda mejor

  Escenario: Registrar un episodio de migraña válido
    Dado que el paciente tiene un médico asignado
    Cuando intenta registrar un episodio de migraña
    Y ingresa los desencadenantes
    Y ingresa los síntomas
    Y ingresa la ubicación del dolor
    Entonces el episodio se registra correctamente en su historial con la fecha actual
    Y se mostrará un mensaje de registro exitoso

  Escenario: Registrar un episodio de migraña sin completar campos requeridos
    Dado que el paciente tiene un médico asignado
    Cuando intenta registrar un episodio de migraña
    Y ingresa los desencadenantes
    Y no ingresa los síntomas
    Y ingresa la ubicación del dolor
    Entonces se mostrará un mensaje de error indicando que los sintomas y ubicacion de dolor son obligatorios