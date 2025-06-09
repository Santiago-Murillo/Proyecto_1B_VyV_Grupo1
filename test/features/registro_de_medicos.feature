# Created by S_Mu_ at 6/9/2025
  # language: es

  # Goal: Impulsar la transformación digital de médicos independientes mediante una herramienta moderna.
    # Capability: Coordinación digital entre pacientes y médicos

Característica: Registro de médicos
  Como médico
  Quiero tener un perfil médico con mis datos profesionales
  Para que pueda tener un perfil público con el que mis pacientes puedan identificarme y contactarme

    Antecedentes:
      Dado que el médico no tiene un perfil médico registrado

    Escenario: Ingreso de datos válidos
      Y el médico tiene los siguientes datos profesionales válidos:
        | Categoria            | Valor               |
        | Correo               | juanperez@gmail.com |
        | Nombre               | "Juan"              |
        | Apellido             | "Pérez"             |
        | Fotografía           | juanCara.jpg        |
        | Especialidad         | Psicología          |
        | Experiencia en años  | 15                  |
        #todo: revisar campos útiles (especialidad)

      Cuando el médico intenta registrar su perfil médico con sus datos profesionales
      Entonces se creará un perfil médico único
      Y el médico recibirá una notificación de que su perfil médico ha sido creado

    Escenario: Ingreso de datos inválidos
      Y el médico tiene los siguientes datos profesionales inválidos:
        | Categoria            | Valor               |
        | Correo               | juanperezgmail.com  |
        | Nombre               | "Jua3"              |
        | Apellido             | "Pérez1"            |
        | Fotografía           | juanCara.pdf        |
        | Especialidad         | null                |
        | Experiencia en años  | 200                 |
        #todo: revisar campos útiles (especialidad)

      Cuando el médico intenta registrar su perfil médico con sus datos profesionales
      Entonces el médico recibirá una notificación de error
      Y se le indicará cuáles datos ingresados son inválidos