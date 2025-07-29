import re
from pathlib import Path
from datetime import datetime

class BehaveSequenceDiagramGenerator:
    def __init__(self, feature_file, steps_file):
        self.feature_file = Path(feature_file)
        self.steps_file = Path(steps_file)
        self.scenarios = []
        self.feature_title = ""

    def parse_feature_file(self):
        """Analiza el archivo .feature y extrae escenarios"""
        try:
            with open(self.feature_file, 'r', encoding='utf-8') as f:
                content = f.read()

            # Extraer título de la feature
            feature_match = re.search(r'Feature:\s*(.+)', content)
            if feature_match:
                self.feature_title = feature_match.group(1).strip()

            # Extraer escenarios
            scenario_pattern = r'Scenario[^:]*:\s*([^\n]+)\n(.*?)(?=Scenario|$)'
            scenarios = re.findall(scenario_pattern, content, re.DOTALL)

            for title, scenario_content in scenarios:
                steps = re.findall(r'(Given|When|Then|And)\s+(.+)', scenario_content)
                self.scenarios.append({
                    'title': title.strip(),
                    'steps': steps
                })

        except FileNotFoundError:
            print(f"No se encontró el archivo: {self.feature_file}")
        except Exception as e:
            print(f"Error al procesar el archivo .feature: {e}")

    def generate_plantuml_diagram(self):
        """Genera el diagrama PlantUML basado en los escenarios"""
        plantuml = "@startuml\n"
        plantuml += "!theme plain\n"
        plantuml += f"title {self.feature_title or 'Diagrama de Secuencia'}\n\n"

        # Participantes
        plantuml += "actor Usuario\n"
        plantuml += "participant Paciente\n"
        plantuml += "participant Autoevaluacion\n\n"

        # Procesar cada escenario
        for i, scenario in enumerate(self.scenarios):
            plantuml += f"== {scenario['title']} ==\n"

            for step_type, step_text in scenario['steps']:
                interaction = self.map_step_to_interaction(step_type, step_text)
                if interaction:
                    plantuml += interaction

            if i < len(self.scenarios) - 1:
                plantuml += "\n"

        plantuml += "@enduml"
        return plantuml

    def map_step_to_interaction(self, step_type, step_text):
        """Mapea los pasos de Behave a interacciones del diagrama"""
        step_lower = step_text.lower().strip()

        # Mapeo de pasos comunes
        if "ha realizado una última autoevaluación" in step_lower:
            return ("Usuario -> Paciente: crear_paciente()\n"
                   "Usuario -> Autoevaluacion: crear_autoevaluacion(fecha)\n"
                   "Usuario -> Paciente: realizar_autoevaluacion(autoevaluacion)\n"
                   "Paciente -> Paciente: obtener_ultima_autoevaluacion()\n")

        elif "pasen 3 meses" in step_lower and "no" not in step_lower:
            return ("note over Usuario: Transcurren 3 meses\n"
                   "Usuario -> Autoevaluacion: han_pasado_tres_meses(fecha_actual)\n"
                   "Autoevaluacion --> Usuario: true\n")

        elif "no pasen 3 meses" in step_lower or "no han pasado 3 meses" in step_lower:
            return ("note over Usuario: No han transcurrido 3 meses\n"
                   "Usuario -> Autoevaluacion: han_pasado_tres_meses(fecha_actual)\n"
                   "Autoevaluacion --> Usuario: false\n")

        elif "podrá realizar una nueva autoevaluación" in step_lower:
            return ("Usuario -> Paciente: establecer_autoevaluacion_disponible(true)\n"
                   "Paciente --> Usuario: autoevaluacion_disponible = true\n")

        elif "no podrá realizar una nueva autoevaluación" in step_lower:
            return ("Usuario -> Paciente: establecer_autoevaluacion_disponible(false)\n"
                   "Paciente --> Usuario: autoevaluacion_disponible = false\n")

        elif "verifico" in step_lower or "debe" in step_lower:
            if "disponible" in step_lower:
                return "Usuario -> Paciente: is_autoevaluacion_disponible()\n"
            elif "true" in step_lower:
                return "Paciente --> Usuario: true\n"
            elif "false" in step_lower:
                return "Paciente --> Usuario: false\n"

        return ""

    def generate_diagram_file(self, output_file='sequence_diagram.puml'):
        """Genera el archivo del diagrama"""
        self.parse_feature_file()

        if not self.scenarios:
            print("No se encontraron escenarios en el archivo .feature")
            return

        diagram_content = self.generate_plantuml_diagram()

        try:
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write(diagram_content)

            print(f"✅ Diagrama generado exitosamente: {output_file}")
            print(f"📊 Escenarios procesados: {len(self.scenarios)}")
            print("🌐 Visualiza el diagrama en: http://www.plantuml.com/plantuml/uml")

        except Exception as e:
            print(f"❌ Error al generar el archivo: {e}")

def generate_simple_diagram():
    """Genera un diagrama simple basado en el patrón común de autoevaluación"""
    plantuml = """@startuml
!theme plain
title Autoevaluación MIDAS - Flujo Principal

actor Usuario
participant Paciente
participant Autoevaluacion

== Configuración Inicial ==
Usuario -> Paciente: new Paciente("")
Usuario -> Autoevaluacion: new Autoevaluacion(fecha)
Usuario -> Paciente: realizar_autoevaluacion(autoevaluacion)

== Verificación de Disponibilidad ==
Usuario -> Paciente: obtener_ultima_autoevaluacion()
Paciente --> Usuario: autoevaluacion

Usuario -> Autoevaluacion: han_pasado_tres_meses(fecha_actual)
alt Han pasado 3 meses
    Autoevaluacion --> Usuario: true
    Usuario -> Paciente: establecer_autoevaluacion_disponible(true)
    Paciente --> Usuario: "Puede realizar nueva autoevaluación"
else No han pasado 3 meses
    Autoevaluacion --> Usuario: false
    Usuario -> Paciente: establecer_autoevaluacion_disponible(false)
    Paciente --> Usuario: "Debe esperar para nueva autoevaluación"
end

@enduml"""

    with open('autoevaluacion_simple.puml', 'w', encoding='utf-8') as f:
        f.write(plantuml)

    print("✅ Diagrama simple generado: autoevaluacion_simple.puml")

def main():
    """Función principal"""
    print("🔄 Generador de Diagramas de Secuencia desde Behave")
    print("=" * 50)

    # Rutas de archivos (ajusta según tu estructura)
    feature_path = 'features/autoevaluacion.feature'
    steps_path = 'test/features/steps/autoevaluaciónMIDAS.py'

    # Verificar si existen los archivos
    if Path(feature_path).exists() and Path(steps_path).exists():
        print(f"📁 Procesando: {feature_path}")
        generator = BehaveSequenceDiagramGenerator(feature_path, steps_path)
        generator.generate_diagram_file('autoevaluacion_behave.puml')
    else:
        print("⚠️  No se encontraron los archivos .feature o steps")
        print("📋 Generando diagrama simple...")
        generate_simple_diagram()

if __name__ == "__main__":
    main()