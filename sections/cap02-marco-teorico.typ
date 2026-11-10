// ============================================================================
// Capítulo 2 — Marco teórico
// ============================================================================

#import "../tesis-template.typ": capitulo

#capitulo[Marco teórico]

Este capítulo presenta los conceptos sobre los que se apoya el marco propuesto: los LLM como generadores de código, la verificación formal con asistentes de pruebas, la programación literaria, la auditoría humana y el Sistema de Triage de Manchester como dominio de aplicación.

= LLM y generación de código

Los LLM generan texto, y en particular código, a partir de instrucciones en lenguaje natural. Su adopción en el desarrollo de software se justifica por mejoras de productividad medidas en entornos reales @kumar2025intuition, pero su naturaleza probabilística tiene consecuencias directas sobre la calidad del código: pueden producir programas plausibles que no implementan la intención del usuario @yuan2026guiding y pueden introducir vulnerabilidades y malas prácticas aprendidas de los repositorios públicos con los que fueron entrenados @mohsin2024trust. Por ello, el código generado por un LLM debe tratarse como una propuesta que requiere validación, no como un artefacto confiable por sí mismo.

// TODO: ampliar con conceptos de prompting, aprendizaje en contexto y
// métricas de evaluación de código generado (p. ej., pass@k).

= Verificación formal y Lean 4

La verificación formal consiste en demostrar matemáticamente que un programa satisface una especificación. Los asistentes de pruebas permiten escribir especificaciones, programas y demostraciones en un mismo lenguaje, y comprobar mecánicamente que cada demostración es correcta. Lean 4 es a la vez un asistente de pruebas interactivo y un lenguaje de programación funcional eficiente, y es extensible por el propio usuario @moura2021lean. Esto permite que el código del prototipo y las demostraciones de sus propiedades convivan en el mismo artefacto.

Conviene distinguir dos nociones que suelen confundirse. La _verificación_ comprueba que el programa cumple su especificación; la _validación_ comprueba que la especificación expresa lo que realmente se necesitaba. Un asistente de pruebas resuelve la primera de forma mecánica, pero la segunda sigue dependiendo del juicio humano. En el marco propuesto, esta distinción ordena el reparto de tareas: Lean 4 se encarga de la verificación y los auditores, de la validación.

Una forma de incorporar un LLM a este esquema es establecer una frontera de confianza explícita: la salida del modelo, probabilística, se acepta solo cuando un componente determinista la certifica. #cite(<koomullil_proof-carrying_2026>, form: "prose") propone una arquitectura de este tipo, en la que la capa de aprendizaje automático queda separada de una capa determinista en Lean 4 que emite certificados verificables por el núcleo del asistente.

= Programación literaria

La programación literaria, concebida por #cite(<knuth1984literate>, form: "prose"), propone escribir los programas como obras dirigidas en primer lugar a lectores humanos: la narrativa explicativa y el código ejecutable se intercalan en un mismo documento fuente, organizado según la lógica de la explicación y no según las exigencias del compilador. Los cuadernos computacionales, como los de Jupyter, son una forma contemporánea de esta idea, y su calidad puede evaluarse con criterios explícitos de documentación y reproducibilidad @candela_approach_2023.

En la era de los LLM, la programación literaria adquiere un doble papel. Por un lado, como formato de instrucciones: estructurar los requisitos al estilo literario mejora la generación de código en proyectos grandes @zhang2024renaissance. Por otro, como interfaz de validación: una documentación en lenguaje natural no ambigua, situada entre la instrucción y el código, permite que incluso usuarios no programadores detecten discrepancias entre su intención y el programa @yuan2026guiding.

= Auditoría humana y trazabilidad

Auditar un sistema crítico implica poder reconstruir por qué se comporta como lo hace y verificar que cada comportamiento responde a un requisito. En los sistemas críticos, esta argumentación suele organizarse en casos de aseguramiento, que vinculan afirmaciones de seguridad con la evidencia que las respalda y que deben mantenerse actualizados cuando cambian los requisitos o los componentes @sorokin2024continuous. En el software científico, la auditabilidad se ha abordado declarando explícitamente las decisiones de preparación, los parámetros de análisis y la procedencia de cada resultado en registros legibles por máquina @balaskas_gp3sequences_2026.

En el marco propuesto, la trazabilidad se establece entre tres niveles: la regla del protocolo clínico, su formalización en Lean 4 y el código que la implementa. La documentación literaria hace visible ese vínculo para el auditor, y las demostraciones garantizan que no se rompe.

= Sistema de Triage de Manchester

El MTS es un método de clasificación de pacientes en servicios de urgencias. El profesional selecciona el flujograma que corresponde a la forma de presentación del paciente (por ejemplo, dolor torácico) y recorre sus discriminadores en orden de prioridad decreciente; el primer discriminador presente determina una de las cinco prioridades, cada una con un tiempo máximo hasta la primera atención médica @mackwayjones2014emergency. Algunos discriminadores son generales y aparecen en muchos flujogramas, como el compromiso de la vía aérea o el _shock_; otros son específicos de un flujograma y varios se definen mediante umbrales numéricos, como la saturación de oxígeno o la frecuencia del pulso.

Esta estructura —una lista ordenada de condiciones con definiciones explícitas y un resultado discreto— vuelve al MTS especialmente apto para la formalización. Al mismo tiempo, varias definiciones requieren juicio clínico (por ejemplo, el "dolor cardíaco" se describe por sus características típicas), lo que exige decidir y documentar cómo se representan en la especificación.
