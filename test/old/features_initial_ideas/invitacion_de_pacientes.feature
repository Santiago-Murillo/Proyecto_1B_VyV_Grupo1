# Created by S_Mu_ at 6/9/2025
  # language: es

  # Goal: Impulsar la transformación digital de médicos independientes mediante una herramienta moderna.
    # Capability: Coordinación digital entre pacientes y médicos

Característica: Invitación de pacientes
  Como médico
  Quiero invitar a mis pacientes a unirse a la aplicación
  Para que puedan crear su cuenta y queden automáticamente asignados a mi

  Antecedentes:
    Dado que el médico ha creado una invitación para un paciente

  Escenario: Invitar a un paciente sin perfil existente
    Dado que el paciente no tiene un perfil existente
    Cuando el paciente reclama la invitación enviada por el médico
    Entonces se creará el perfil del paciente y se vinculará al médico
    Y el médico recibirá una confirmación de que la invitación fue reclamada

  Escenario: Invitar a un paciente con perfil existente
    Dado que el paciente tiene un perfil existente vinculado a otro médico
    Cuando  el paciente reclama la invitación enviada por el médico
    Entonces se vinculará al nuevo médico y no se creará un nuevo perfil
     Y el médico recibirá una confirmación de que la invitación fue reclamada