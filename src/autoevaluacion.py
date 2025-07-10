import numpy as np

class Autoevaluacion:
    def __init__(self, fecha):
        self.fecha = fecha

    def han_pasado_tres_meses(self, fecha_actual):
        fecha_autoevaluacion = np.datetime64(self.fecha, 'M')
        fecha_actual_np = np.datetime64(fecha_actual, 'M')

        fecha_luego_de_tres_meses = fecha_autoevaluacion + np.timedelta64(3, 'M')

        return fecha_actual_np == fecha_luego_de_tres_meses
