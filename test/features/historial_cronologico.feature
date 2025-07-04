# Created by Angel at 07/06/2025
# language: es

Característica: Historial cronológico
  Como paciente
  Quiero saber cómo ha cambiado mi condición de salud a lo largo del tiempo
  Para saber si he mejorado o empeorado

  Antecedentes:
    Dado que el paciente tiene registrado al menos un episodio de migraña

  Escenario: Visualización del historial completo
    Cuando el historial no disponga de un rango de fechas específico
    Entonces se muestran todos los episodios registrados con su información detallada

  Escenario: Filtrar historial según un rango de fechas
    Cuando el historial disponga de un rango de fechas con episodios registrados
    Entonces se muestran solo los episodios registrados dentro de ese rango

  Escenario: Visualizar mensaje cuando no hay datos registrados en el período seleccionado
    Cuando el historial disponga de un rango de fechas sin episodios registrados
    Entonces se muestra un mensaje indicando que no hay registros disponibles
    Y se sugiere registrar un nuevo episodio si es necesario