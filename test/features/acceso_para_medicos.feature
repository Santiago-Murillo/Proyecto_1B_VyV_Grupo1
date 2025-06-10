# Created by S_Mu_ at 6/9/2025
  # language: es

  # Goal: Impulsar la transformación digital de médicos independientes mediante una herramienta moderna.
    # Capability: Coordinación digital entre pacientes y médicos

Característica: Acceso para médicos
  Como médico
  Quiero tener un perfil médico con mis datos profesionales
  Para poder gestionar mis pacientes

    Escenario: Registro del perfil médico nuevo
      Dado que el médico no tiene un perfil médico registrado
      Cuando intenta crear un perfil médico con un correo electrónico único
      Entonces se creará el perfil médico

    Escenario: Registro de perfil médico existente
      Dado que el médico tiene un perfil médico registrado
      Cuando intenta crear un perfil médico con el mismo correo electrónico ya registrado
      Entonces se le informará que ya existe un perfil médico con ese correo electrónico
      Y no se creará el nuevo perfil médico

    Escenario: Inicio de sesión a perfil médico con credenciales válidas
      Dado que el médico tiene un perfil médico registrado
      Cuando intenta iniciar sesión con un perfil médico existente
      Y las credenciales son válidas
      Entonces se le permitirá acceder a su perfil médico

    Escenario: Inicio de sesión a perfil médico con credenciales inválidas
      Dado que el medico tiene un perfil médico registrado
      Cuando intenta iniciar sesión con un perfil médico existente
      Y las credenciales son inválidas
      Entonces no se le permitirá acceder al perfil médico









#    Escenario: Ingreso de datos válidos
#      Y el médico tiene los siguientes datos profesionales válidos:
#        | Categoria            | Valor               |
#        | Correo               | juanperez@gmail.com |
#        | Nombre               | "Juan"              |
#        | Apellido             | "Pérez"             |
#        | Fotografía           | juanCara.jpg        |
#        | Experiencia en años  | 15                  |
#
#      Cuando el médico intenta registrar su perfil médico con sus datos profesionales
#      Entonces se creará un perfil médico único
#      Y el médico recibirá una notificación de que su perfil médico ha sido creado
#
#    Escenario: Ingreso de datos inválidos
#      Y el médico tiene los siguientes datos profesionales inválidos:
#        | Categoria            | Valor               |
#        | Correo               | juanperezgmail.com  |
#        | Nombre               | "Jua3"              |
#        | Apellido             | "Pérez1"            |
#        | Fotografía           | juanCara.pdf        |
#        | Experiencia en años  | 200                 |
#
#      Cuando el médico intenta registrar su perfil médico con sus datos profesionales
#      Entonces el médico recibirá una notificación de error
#      Y se le indicará cuáles datos ingresados son inválidos