= Título tentativo

Programación literaria verificada formalmente: El determinismo en codificación y eficientización de auditoría humana en desarrollo acelerado por modelos de lenguaje avanzados probado en el Triage de Manchester

#pagebreak()

= Identificación del problema

El desarrollo de software crítico, como el utilizado en el protocolo Triage de Manchester —un sistema de clasificación de pacientes basado en prioridades clínicas— exige altos estándares de confiabilidad, seguridad y auditabilidad @sorokin2024continuous. Los Modelos de Lenguaje Avanzados (como en español se los llama a los Large Language Models, LLMs por sus siglas en inglés) han demostrado ser herramientas efectivas para la generación automática de código, mejorando la productividad y reduciendo costos en el ciclo de desarrollo @kumar2026intuition. Sin embargo, su adopción en sistemas críticos se ve limitada por tres problemas fundamentales.

== Falta de determinismo y verificabilidad

Los LLMs generan código con alucinaciones (resultados plausibles pero incorrectos) y comportamientos no deterministas, lo que compromete la fiabilidad en entornos donde la precisión es crítica @mohsin2024trust. Estudios recientes indican que solo el 46% del código generado por LLMs cumple con conformidad real en sistemas críticos, y apenas el 41% satisface invariantes clave @ma2025bridging.

== Auditoría humana insostenible

La revisión manual de código generado por LLMs es costosa y propensa a errores, especialmente en sistemas con requisitos complejos como el Triage de Manchester, donde la ambigüedad en la interpretación de reglas clínicas puede llevar a fallos graves @zhang2024renaissance.

== Falta de integración sistemática

Aunque existen metodologías, técnicas y herramientas para reducir errores en el desarrollo tradicional de software, no hay una integración sistemática entre estas facilidades y los LLMs @sorokin2024continuous.

#pagebreak()

= Palabras clave

modelos de lenguaje avanzado, programación literaria, verificación formal, triage de Manchester

#pagebreak()

= Preguntas que guiarán la investigación

== Pregunta principal

¿Cómo puede mejorarse, en una implementación del Triage de Manchester, la eficacia de los LLMs en el ciclo de vida de desarrollo mediante la integración de verificación formal y programación literaria?

== Preguntas secundarias

- ¿Qué impacto tiene, durante el ciclo de desarrollo del protocolo Triage de Manchester, la integración de código generado por LLMs y la programación literaria en la legibilidad de la documentación interseccionada con el código y la eficiencia de la auditoría humana?
- ¿Cómo se diseñaría un sistema que, aplicado al protocolo Triage de Manchester, combine generación de código por LLMs, verificación formal, programación literaria y auditoría humana eficiente y eficaz?

#pagebreak()
#pagebreak()

= Programación literaria y auditoría externa

== Auditoría externa en software crítico

En dominios regulados —salud, automotor, ferroviario, aeronáutico— la aprobación de un sistema no depende solo de que funcione, sino de que un *auditor externo* (regulador, organismo de certificación o tercero independiente) pueda reconstruir y evaluar el argumento de por qué el sistema es confiable @sorokin2024continuous. El artefacto central de esta evaluación es el *assurance case*: un conjunto estructurado de afirmaciones (claims), argumentos y evidencia que justifica que las propiedades de seguridad y corrección del sistema se cumplen. Construir y mantener estos casos manualmente es costoso y lento, y se vuelve especialmente frágil cuando los requisitos cambian o una afirmación deja de ser válida —por ejemplo, cuando componentes basados en aprendizaje se degradan— @sorokin2024continuous. La notación estándar para presentar estos argumentos es la *Goal Structuring Notation* (GSN), desarrollada en la Universidad de York durante los años noventa para presentar safety cases y estandarizada en 2011, con uso documentado en cuidado clínico, aviación y energía nuclear @gsn2021standard.

La auditoría externa introduce una exigencia que la verificación formal por sí sola no satisface: el auditor necesita no solo la evidencia (por ejemplo, una prueba mecanizada que pasa), sino *comprender* qué se afirma, por qué la evidencia sostiene la afirmación y dónde están los límites de ese argumento. Como advierten Habli y Kelly, un diagrama GSN es solo una representación del safety case, no el safety case en sí; y la crítica posterior al accidente del Nimrod mostró que un argumento de seguridad mal construido puede convertirse en una "profecía autocumplida" que produce una falsa sensación de confianza @gsn2021standard. El problema de la auditoría es, entonces, fundamentalmente un problema de *comunicación y trazabilidad*: conectar requisitos, argumento y evidencia de manera que un tercero sin acceso al proceso de desarrollo pueda evaluarlo.

== El problema de auditorar código generado por LLMs

Este problema se agrava cuando el código no fue escrito por humanos. Los LLMs generan código con vulnerabilidades y comportamientos inseguros heredados de sus datos de entrenamiento; los evaluadores no deberían asumir comprensión de los principios de seguridad por parte del modelo, y el código generado constituye además una fuente potencial de vulnerabilidades en la cadena de suministro de software @mohsin2024trust. En sistemas con requisitos complejos y ambiguos —como las reglas clínicas del Triage de Manchester— la revisión manual es costosa, propensa a errores y difícil de escalar @zhang2024renaissance. El auditor externo queda así en la peor posición posible: debe evaluar un artefacto que ni siquiera fue redactado con la intención de ser leído por humanos, a partir de requisitos cuya interpretación no presenció.

== Programación literaria como infraestructura de auditoría

La tesis que esta sección sostiene es que la programación literaria no es, en el contexto de LLMs, una preferencia de estilo sino la *infraestructura de comunicación* que hace viable la auditoría externa de código generado automáticamente. Esta relación opera en tres niveles.

*Primero, la documentación como objeto de auditoría.* En el enfoque Interoperable Literate Programming (ILP) de Zhang et al., los documentos LP no son un subproducto del código sino el artefacto primario a partir del cual se guía la generación de código por LLMs, con plantillas de prompt engineering diseñadas para que el modelo produzca código a partir de documentos bien estructurados @zhang2024renaissance. Sus experimentos sobre RepoBench con generación de Scheme y Python muestran que las instrucciones estilo ILP mejoran la generación a escala de proyecto completo, precisamente porque el documento LP explicita las interdependencias y la intención que el auditor de otro modo tendría que reconstruir reversamente desde el código. En términos de assurance case, el documento LP desempeña el rol de argumento legible que conecta las afirmaciones de alto nivel con la evidencia de bajo nivel: es el puente entre el claim ("el discriminador de dolor torácico asigna prioridad 1 correctamente") y la evidencia (el código y su prueba formal).

*Segundo, la trazabilidad requisitos-evidencia.* La auditoría externa exige trazabilidad bidireccional: desde cada requisito hasta la evidencia que lo satisface, y desde cada pieza de código hasta el requisito que motiva su existencia. Cuando los requisitos se expresan en un Lenguaje Natural Controlado (CNL) y se traducen automáticamente a especificaciones formales verificables @ma2025bridging, el documento literario puede contener, para cada fragmento de código, el requisito CNL del que proviene y el estado de su verificación. Esto convierte la auditoría de una reconstrucción forense en una verificación de correspondencias: el auditor no tiene que inferir qué hace el código ni a qué requisito responde; lo tiene declarado, y puede concentrar su esfuerzo en evaluar si la correspondencia es genuina.

*Tercero, la delimitación del alcance del argumento.* El valor más sutil —el que la crítica al GSN tras el Nimrod puso en evidencia— es que un documento literario bien escrito obliga a declarar los supuestos y límites del sistema: qué interpretación de las reglas clínicas se adoptó, qué casos no cubre, qué propiedades verificó el sistema formal y cuáles quedan fuera. Un safety case que oculta sus incertidumbres produce sobreconfianza; un documento LP que articula el "tren de pensamiento" del desarrollo @knuth1984literate hace visibles esas incertidumbres al auditor externo, que es exactamente lo que una auditoría debe poder detectar.

== Consecuencia metodológica para esta investigación

De esta relación se sigue una decisión de diseño metodológico: la métrica de "legibilidad de la documentación interseccionada con el código" no debe medirse como una propiedad estética del documento, sino como *eficiencia de auditoría externa*: tiempo y tasa de éxito de auditores humanos al (a) reconstruir la correspondencia requisito-código, (b) detectar defectos plantados deliberadamente en el código generado, y (c) identificar los supuestos y límites declarados del sistema. Esta operacionalización alinea la variable cualitativa de la investigación con el marco establecido de assurance cases @sorokin2024continuous, y permite que la evaluación del prototipo sea comparable con las prácticas de certificación que los sectores de salud y automotor aplican actualmente a sistemas basados en aprendizaje.

#pagebreak()

= Justificación

Esta investigación contribuye al campo de la ingeniería de software y la inteligencia artificial al proponer un marco que integre LLMs, verificación formal y programación literaria. La verificación formal permite asegurar que el código cumple con propiedades críticas @sorokin2024continuous, mientras que la programación literaria mejora la claridad y estructura del código, facilitando la auditoría humana @zhang2024renaissance. Este enfoque neuro-simbólico, combinación de aprendizaje automático y razonamiento lógico, busca generar código no solo sintácticamente correcto, sino semánticamente válido y verificable @ma2025bridging.

#pagebreak()

= Objetivos

- Analizar la viabilidad de un sistema neuro-simbólico que permita a los LLMs generar código verificado formalmente, con documentación clara (programación literaria) y retroalimentación automatizada @zhang2024renaissance.
- Diseñar un flujo de trabajo que integre generación de código por LLMs a partir de requisitos clínicos (ej.: "Si el paciente tiene dolor torácico y presión arterial < 90, asignar prioridad 1"), verificación formal del código generado, generación de documentación legible para auditores humanos (médicos o ingenieros) mediante programación literaria.
- Implementar un prototipo aplicado al Triage de Manchester, que traduzca requisitos clínicos a código verificable y genere documentación auditable.

#pagebreak()

= Estrategia metodológica

== Paradigma

El paradigma elegido es el pragmatismo. Este paradigma permite combinar validación formal con Lean 4, documentación narrativa (literate programming) y feedback humano, evaluando cada componente por su contribución a la generación de software correcto. El conocimiento válido se define por su capacidad para resolver problemas concretos @peirce1878ideas, en este caso: reducir errores en el código generado por LLMs y mejorar la comprensión del código por parte de los desarrolladores.

== Método

Usaremos un método mixto, juntando cualitativo y cuantitativo.

=== Técnicas cuantitativas

- Experimentos controlados para medir el número de bugs y el cumplimiento de invariantes en el código generado @ma2025bridging.
- Benchmarking con herramientas de verificación formal que provee el ecosistema de Lean 4 para evaluar la corrección del código @sorokin2024continuous.

=== Técnicas cualitativas

- Análisis de usabilidad de la documentación generada (mediante encuestas a auditores humanos).
- Entrevistas a desarrolladores para evaluar la eficiencia de la auditoría.

#pagebreak()

= Observaciones

- *Qué LLM usar:* Leanstral es una buena opción (modelo de pesos abiertos de Mistral optimizado para ser usado con Lean 4), aunque requiere más investigación. Hasta lo que sé, es poco avanzado en comparación a otros modelos SOTA (state of the art, estado del arte) como Claude Opus 4.8 o GPT 5.5 que son significativamente mejores; pero la eficiencia de Leanstral permite una reiteración económica y que dentro de este marco de desarrollo cobra sentido al tener una salida potencialmente determinista.
- Se podría limitar el alcance a modelos de pesos abiertos.
- Definir métricas cuantitativas, cómo medir eficientemente la futilidad de auditoría humana.
- El sistema MCP (model context protocol) disponible actualmente es el `lean-lsp-mcp`. Debería analizar si en su estado actual es la mejor opción para trabajar. Un LSP (language server protocol) es una parte elemental de un compilador aplicado de manera parcial. Requiere un análisis de la pragmática del lenguaje para optimizar la consumición de la información de verificación.