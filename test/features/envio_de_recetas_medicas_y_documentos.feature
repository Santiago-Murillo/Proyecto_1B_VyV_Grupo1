# Created by S_Mu_ at 6/9/2025
  # language: es

  # Goal: Impulsar la transformación digital de médicos independientes mediante una herramienta moderna.
    # Capability: Comunicación segura y directa

Característica: Envío de recetas médicas y documentos (registros médicos)
  Como médico (independiente)
  Quiero que mis pacientes reciban inmediatamente los documentos para paciente que guarde en su perfil de la aplicación
  Para que mis pacientes estén al tanto de su tratamiento
  #Y que accedan a la información médica relevante en cualquier momento

  Antecedentes:
    Dado que el médico tiene un perfil médico registrado
    Y tiene al menos un paciente registrado

  Escenario: Guardar documentos para paciente
    Y tiene documentos para paciente:
      | tipo de documento | nombre del documento |
      | Receta            | receta.pdf           |
      | Informe médico    | informe.pdf          |
    Cuando guarda los documentos para paciente en el perfil de un paciente
    Entonces los documentos serán visibles para el paciente en su perfil
    Y los documentos serán visibles para el médico en su perfil
    Y el paciente recibirá una notificación de que hay nuevos documentos disponibles

  Escenario: Guardar documentos para médico
    Y tiene documentos para médico:
      | tipo de documento     | nombre del documento         |
      | Radiografía           | radiografía.pdf              |
      | Resultado exámenes    | resultadosSangre09062025.pdf |
    Cuando guarda los documentos para médico en el perfil de un paciente
    Entonces los documentos serán visibles para el médico en su perfil