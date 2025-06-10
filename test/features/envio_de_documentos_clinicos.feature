# Created by S_Mu_ at 6/9/2025
  # language: es

  # Goal: Impulsar la transformación digital de médicos independientes mediante una herramienta moderna.
    # Capability: Comunicación segura y directa

Característica: Disponibilidad de documentos clínicos
  Como médico
  Quiero que mis pacientes dispongan inmediatamente de sus documentos clínicos
  #Para que mis pacientes tomen decisiones informadas sobre su salud
  Para que puedan acceder a información clave sin depender de consultas presenciales

  Escenario: Compartir documentos clínicos
    Dado que el médico tiene al menos un paciente registrado
    Cuando el médico carga un documento clínico para ese paciente
    Entonces el documento estará registrado en el perfil del paciente
    Y el paciente recibirá una notificación de que hay nuevos documentos disponibles



#  Escenario: Guardar documentos para paciente
#    Dado que el médico tiene un perfil registrado
#    Y tiene al menos un paciente registrado
#    Y que el medico ha generado almenos uno de los siguientes documentos para paciente:
#      | tipo de documento | nombre del documento |
#      | Receta            | receta.pdf           |
#      | Informe médico    | informe.pdf          |
#    Cuando envia los documentos del paciente a su perfil
#    Entonces los documentos estarán disponibles para el paciente en su perfil
#    Y los documentos serán visibles para el médico en su perfil
#    Y el paciente recibirá una notificación de que hay nuevos documentos disponibles