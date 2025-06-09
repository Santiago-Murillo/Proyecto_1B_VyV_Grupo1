# Created by Eliath at 07/06/2025
  #language: es
Característica: Registro interactivo
  Como paciente,
  quiero poder describir fácilmente lo que ocurre durante mis episodios,
  para que mi médico me entienda mejor

  Escenario: Registro de episodios
    Dado que el paciente tiene un médico asignado,
    Cuando registra un episodio de migraña,
    Entonces podrá elegir dónde ocurre el dolor
    Y podrá elegir desencadenantes
    Y podrá elegir síntomas asociados

    Y el sistema guarda mi registro para que mi médico pueda revisarlo después.