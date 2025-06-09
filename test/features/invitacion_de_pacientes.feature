# Created by S_Mu_ at 6/9/2025
  # language: es

  # Goal: Impulsar la transformación digital de médicos independientes mediante una herramienta moderna.
    # Capability: Coordinación digital entre pacientes y médicos

Característica: Invitación de pacientes
  Como médico
  Quiero que invitar a mis pacientes para que se unan a mi burbuja médica
  Para que puedan acceder a sus registros médicos y comunicarse conmigo de manera segura

  Antecedentes:
    Dado que el médico tiene un perfil médico registrado
    Y tiene al menos una burbuja médica creada

  Escenario: Invitar a un paciente con un perfil existente
    Cuando el médico envía una invitación a un paciente con un perfil existente
    Entonces el paciente recibirá una notificación de la invitación que podrá aceptar o rechazar
    Y el médico recibirá una confirmación de que la invitación fue enviada

  Escenario: Invitar a un paciente sin perfil existente
    Cuando el médico envía una invitación a un paciente sin un perfil existente
    Entonces se creará un nuevo perfil de paciente con la invitación
    Y el paciente recibirá una notificación de la invitación
    Y el médico recibirá una confirmación de que la invitación fue enviada