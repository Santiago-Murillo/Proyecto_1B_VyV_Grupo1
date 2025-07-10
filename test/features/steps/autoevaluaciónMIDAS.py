from behave import *

from src.autoevaluacion import Autoevaluacion
from src.paciente import Paciente

use_step_matcher("re")

@step('que el paciente ha realizado una última autoevaluación en la "(?P<fecha>.+)"')
def step_impl(context, fecha):
    paciente = Paciente("")
    autoevaluacion = Autoevaluacion(fecha)
    paciente.realizar_autoevaluacion(autoevaluacion)
    ultima_autoevaluacion = paciente.obtener_ultima_autoevaluacion()

    context.paciente = paciente
    context.ultima_autoevaluacion = ultima_autoevaluacion

    assert ultima_autoevaluacion == autoevaluacion

@step("pasen 3 meses desde la última autoevaluación")
def step_impl(context):
    fecha_actual = context.scenario._row["fecha_actual"]
    ultima_autoevaluacion = context.ultima_autoevaluacion

    assert ultima_autoevaluacion.han_pasado_tres_meses(fecha_actual)



@step("el paciente podrá realizar una nueva autoevaluación")
def step_impl(context):
    paciente = context.paciente
    ultima_autoevaluacion = context.ultima_autoevaluacion
    fecha_actual = context.scenario._row["fecha_actual"]

    paciente.establecer_autoevaluacion_disponible(ultima_autoevaluacion.han_pasado_tres_meses(fecha_actual))

    assert paciente.autoevaluacion_disponible

@step("no pasen 3 meses desde la última autoevaluación")
def step_impl(context):
    fecha_actual = context.scenario._row["fecha_actual"]
    ultima_autoevaluacion = context.ultima_autoevaluacion

    assert not ultima_autoevaluacion.han_pasado_tres_meses(fecha_actual)


@step("el paciente no podrá realizar una nueva autoevaluación")
def step_impl(context):
    paciente = context.paciente
    ultima_autoevaluacion = context.ultima_autoevaluacion
    fecha_actual = context.scenario._row["fecha_actual"]

    paciente.establecer_autoevaluacion_disponible(ultima_autoevaluacion.han_pasado_tres_meses(fecha_actual))

    assert not paciente.autoevaluacion_disponible

