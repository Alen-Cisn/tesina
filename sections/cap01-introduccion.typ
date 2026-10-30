// ============================================================================
// Capítulo 1 — Introducción
// ============================================================================

#import "../tesis-template.typ": capitulo

#capitulo[Introducción]

= Planteamiento del problema

El desarrollo de software crítico, como el utilizado en el protocolo Triage de Manchester —un sistema de clasificación de pacientes basado en prioridades clínicas— exige altos estándares de confiabilidad, seguridad y auditabilidad @noauthor_emergency_nodate @sorokin2024continuous. Los Modelos de Lenguaje Avanzados (como en español se los llama a los Large Language Models, LLMs por sus siglas en inglés) han demostrado ser herramientas efectivas para la generación automática de código, mejorando la productividad y acelerando el ciclo de desarrollo @kumar2025intuition. Sin embargo, su adopción en sistemas críticos se ve limitada por tres problemas fundamentales.

== Falta de determinismo y verificabilidad

Los LLMs generan código con alucinaciones (resultados plausibles pero incorrectos) y comportamientos no deterministas, lo que compromete la fiabilidad en entornos donde la precisión es crítica @mohsin2024trust @koomullil_proof-carrying_2026. Los enfoques de traducción de requisitos en lenguaje natural a especificaciones formales @ma2025bridging permiten atacar este problema desde la fase de especificación.

== Auditoría humana insostenible

La revisión manual de código generado por LLMs es costosa y propensa a errores, especialmente en sistemas con requisitos complejos como el Triage de Manchester @yuan2026guiding, donde la ambigüedad en la interpretación de reglas clínicas @noauthor_emergency_nodate puede llevar a fallos graves.

== Falta de integración sistemática

Aunque existen metodologías, técnicas y herramientas para reducir errores en el desarrollo tradicional de software, no hay una integración sistemática entre estas facilidades y los LLMs @sorokin2024continuous.

= Preguntas e hipótesis

== Pregunta principal

¿Cómo puede mejorarse, en una implementación del Triage de Manchester, la eficacia de los LLMs en el ciclo de vida de desarrollo mediante la integración de verificación formal y programación literaria?

== Preguntas secundarias

- ¿Qué impacto tiene, durante el ciclo de desarrollo del protocolo Triage de Manchester, la integración de código generado por LLMs y la programación literaria en la legibilidad de la documentación interseccionada con el código y la eficiencia de la auditoría humana?
- ¿Cómo se diseñaría un sistema que, aplicado al protocolo Triage de Manchester, combine generación de código por LLMs, verificación formal, programación literaria y auditoría humana eficiente y eficaz?

== Hipótesis

La integración de verificación formal y programación literaria en el ciclo de desarrollo asistido por LLMs incrementa la corrección del código generado y reduce el esfuerzo de auditoría humana, sin sacrificar la velocidad de desarrollo, incluso en dominios de alta criticidad como el triage hospitalario.

= Objetivos

== Objetivo general

Proponer e implementar un marco neuro-simbólico que integre generación de código por LLMs, verificación formal y programación literaria para el desarrollo de software crítico, tomando como caso de estudio el protocolo Triage de Manchester.

== Objetivos específicos

- Analizar la viabilidad de un sistema neuro-simbólico que permita a los LLMs generar código verificado formalmente, con documentación clara (programación literaria) y retroalimentación automatizada @yuan2026guiding.
- Diseñar un flujo de trabajo que integre generación de código por LLMs a partir de requisitos clínicos (ej.: "Si el paciente tiene dolor torácico y presión arterial < 90, asignar prioridad 1"), verificación formal del código generado y generación de documentación legible para auditores humanos (médicos o ingenieros) mediante programación literaria.
- Implementar un prototipo aplicado al Triage de Manchester, que traduzca requisitos clínicos a código verificable y genere documentación auditable.
- Evaluar el prototipo con técnicas cuantitativas (bugs, cumplimiento de invariantes) y cualitativas (usabilidad de la documentación para auditores).

= Justificación

Esta investigación contribuye al campo de la ingeniería de software y la inteligencia artificial al proponer un marco que integre LLMs, verificación formal y programación literaria. La verificación formal permite asegurar que el código cumple con propiedades críticas @moura2021lean, mientras que la programación literaria mejora la claridad y estructura del código, facilitando la auditoría humana @zhang2024renaissance @yuan2026guiding. Este enfoque neuro-simbólico, combinación de aprendizaje automático y razonamiento lógico, busca generar código no solo sintácticamente correcto, sino semánticamente válido y verificable @ma2025bridging.

= Marco de referencia

== Programación literaria

La programación literaria, concebida por Knuth @knuth1984literate, intercala narrativa explicativa y código ejecutable en un mismo documento fuente, orientado primordialmente a lectores humanos. Trabajos recientes retoman esta idea en la era de los LLMs para mejorar la generación de código en proyectos de gran escala @zhang2024renaissance, y estudian su rol como interfaz de validación y trazabilidad para no programadores y auditores @candela_approach_2023 @yuan2026guiding.

== Verificación formal y asistentes de pruebas

Los asistentes de pruebas como Lean 4 permiten verificar formalmente que un programa cumple con propiedades especificadas @moura2021lean. El ecosistema actual incluye herramientas como LeanDojo, que provee datos y un entorno programable para trabajar con Lean en contextos de aprendizaje automático @yang_leandojo_2023.

== Sistemas de triage y software clínico

El Manchester Triage System se sustenta en flujogramas y discriminadores @noauthor_emergency_nodate que han sido estudiados en relación con la construcción de software clínico seguro @zlotnik_building_2016, con estudios de concordancia entre pacientes y sistemas de autotriage @onler_agreement_2026 y de rendimiento comparativo entre LLMs y profesionales en triage @masanneck_triage_2024.

= Estado del arte

- *Generación de código con LLMs:* evaluaciones recientes miden el impacto real de la IA en la productividad de desarrolladores @kumar2025intuition y proponen marcos para evaluar la confianza en el código generado @mohsin2024trust.
- *Traducción de requisitos a especificaciones formales:* enfoques automáticos que usan descomposición semántica jerárquica con LLMs para traducir requisitos en lenguaje natural a lógica temporal (LTL) @ma2025bridging.
- *Verificación continua y aseguramiento:* herramientas de creación continua de casos de aseguramiento (assurance cases) para sistemas críticos @sorokin2024continuous.
- *Programación literaria y auditoría:* renovación de la programación literaria con LLMs @zhang2024renaissance, secuencias GP3 para validar la adherencia de código a la narrativa @balaskas_gp3sequences_2026, experiencias con estándares de documentación para auditores @candela_approach_2023 y validación humana de código LLM mediante programación literaria verificable @yuan2026guiding.

= Aspectos metodológicos

== Paradigma

El paradigma elegido es el pragmatismo. Este paradigma permite combinar validación formal con Lean 4, documentación narrativa (literate programming) y feedback humano, evaluando cada componente por su contribución a la generación de software correcto. El conocimiento válido se define por su capacidad para resolver problemas concretos @peirce1878ideas, en este caso: reducir errores en el código generado por LLMs y mejorar la comprensión del código por parte de los desarrolladores.

== Método

Usaremos un método mixto, juntando cualitativo y cuantitativo.

=== Técnicas cuantitativas

- Experimentos controlados para medir el número de bugs y el cumplimiento de invariantes en el código generado @ma2025bridging.
- Benchmarking con herramientas de verificación formal que provee el ecosistema de Lean 4 para evaluar la corrección del código @moura2021lean.

=== Técnicas cualitativas

- Análisis de usabilidad de la documentación generada (mediante encuestas a auditores humanos).
- Entrevistas a desarrolladores para evaluar la eficiencia de la auditoría.
