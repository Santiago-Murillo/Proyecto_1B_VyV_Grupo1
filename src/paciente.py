class Paciente:
    def __init__(self, nombre):
        self.nombre = nombre
        self.autoevaluaciones = []
        self.autoevaluacion_disponible = True


    def realizar_autoevaluacion(self, autoevaluacion):
        self.autoevaluaciones.append(autoevaluacion)

    def obtener_ultima_autoevaluacion(self):
        return self.autoevaluaciones[-1]

    def establecer_autoevaluacion_disponible(self, disponibilidad):
        self.autoevaluacion_disponible = disponibilidad