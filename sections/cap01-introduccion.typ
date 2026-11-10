// ============================================================================
// Capítulo 1 — Introducción
// ============================================================================

#import "../tesis-template.typ": capitulo

#capitulo[Introducción]

= Planteamiento del problema

El desarrollo de software crítico exige altos estándares de confiabilidad, seguridad y auditabilidad. Un ejemplo es el software que implementa el Sistema de Triage de Manchester (MTS, por sus siglas en inglés), un protocolo que asigna a cada paciente que llega a un servicio de urgencias una de cinco prioridades clínicas —inmediata (rojo), muy urgente (naranja), urgente (amarillo), estándar (verde) y no urgente (azul)— a partir de flujogramas de presentación y discriminadores @mackwayjones2014emergency. Un error en esa lógica puede demorar la atención de un paciente grave.

Los modelos de lenguaje avanzados (LLM, por las siglas de #emph[large language models]) se han convertido en herramientas habituales para generar código. Un estudio longitudinal realizado durante un año con 300 ingenieros de una misma empresa informó, por ejemplo, una reducción del 31,8 % en el tiempo de revisión de los cambios propuestos @kumar2025intuition. Sin embargo, su adopción en sistemas críticos se ve limitada por tres problemas.

== Falta de determinismo y verificabilidad

Los LLM son modelos probabilísticos: pueden producir código plausible pero incorrecto (alucinaciones) y no garantizan el mismo resultado ante la misma instrucción @yuan2026guiding @koomullil_proof-carrying_2026. Además, pueden reproducir vulnerabilidades y malas prácticas presentes en sus datos de entrenamiento @mohsin2024trust. Ninguna de estas propiedades es compatible con un sistema cuya salida determina el orden de atención de los pacientes.

== Auditoría humana insostenible

Revisar manualmente el código generado es costoso y propenso a errores. #cite(<yuan2026guiding>, form: "prose") observaron que muchas fallas del código generado por LLM provienen de requisitos subespecificados o de desviaciones semánticas sutiles, que no se detectan con verificaciones automáticas de grano grueso y que exigen una revisión humana detallada. En el caso del MTS, la dificultad se agrava porque quien conoce el dominio —el personal de salud— no suele leer código, y quien lee código no domina los criterios clínicos de cada discriminador.

== Falta de integración sistemática

La ingeniería de software dispone de metodologías y herramientas maduras para reducir errores en el desarrollo tradicional, como la verificación formal o los casos de aseguramiento que se mantienen de forma continua a medida que cambia el sistema @sorokin2024continuous. Existen también propuestas que acercan los LLM a la especificación formal @ma2025bridging o a la validación humana @yuan2026guiding. No obstante, en la revisión realizada para este trabajo no se identificó un enfoque que integre de manera sistemática generación con LLM, verificación formal y documentación auditable por especialistas del dominio en el desarrollo de software clínico. Esta vacancia se desarrolla en el Capítulo 3.

= Preguntas de investigación

== Pregunta principal

¿Cómo puede diseñarse e implementarse un sistema que integre generación de código por LLM, verificación formal y programación literaria para desarrollar una implementación del Triage de Manchester verificada y auditable?

== Preguntas secundarias

+ ¿Qué propiedades del flujograma de dolor torácico del MTS pueden expresarse y demostrarse formalmente en Lean 4?
+ ¿Cómo debe estructurarse la documentación literaria para que la especificación formal pueda ser leída y validada por auditores clínicos y técnicos?
+ ¿Cómo se organiza el ciclo de generación, verificación y corrección para que el LLM aproveche la retroalimentación del asistente de pruebas?

= Objetivos

== Objetivo general

Diseñar e implementar un prototipo de marco neuro-simbólico que integre generación de código por LLM, verificación formal y programación literaria para el desarrollo de software crítico, tomando como caso de estudio el Sistema de Triage de Manchester.

== Objetivos específicos

+ Analizar la viabilidad técnica de un sistema neuro-simbólico que permita a los LLM generar código verificado formalmente, acompañado de documentación literaria y de retroalimentación automatizada.
+ Diseñar un flujo de trabajo que parta de los requisitos clínicos del MTS, genere código con un LLM, lo verifique formalmente y produzca documentación legible para auditores clínicos y técnicos. Un requisito típico es la regla del flujograma de dolor torácico según la cual un paciente que presenta el discriminador _shock_ —definido como un aporte inadecuado de oxígeno a los tejidos, con signos como sudoración, palidez, taquicardia, hipotensión o disminución del nivel de conciencia— recibe prioridad inmediata (rojo) @mackwayjones2014emergency.
+ Implementar un prototipo que traduzca los requisitos clínicos del flujograma de dolor torácico a una especificación y un código verificados en Lean 4, y que genere la documentación literaria correspondiente.

= Justificación

La verificación formal permite demostrar que un programa cumple las propiedades que se le especifican @moura2021lean. Esa garantía, sin embargo, es relativa a la especificación: un programa puede satisfacer perfectamente una especificación que no refleja el protocolo clínico. La verificación responde a la pregunta "¿el código hace lo que dice la especificación?", pero no a "¿la especificación dice lo que establece el MTS?". La segunda pregunta solo puede responderla una persona que conozca el dominio, y para ello necesita leer la especificación en un lenguaje que comprenda.

Este trabajo sostiene que la programación literaria es el puente entre ambas preguntas. Al intercalar la especificación formal, las demostraciones y el código con una narrativa en lenguaje natural @knuth1984literate, la documentación literaria convierte la validación de la especificación en una tarea de lectura accesible para auditores clínicos, mientras que la verificación formal libera a esos auditores de revisar la implementación línea por línea. #cite(<yuan2026guiding>, form: "prose") mostraron que una documentación en lenguaje natural no ambigua, validada por el usuario y usada luego para derivar propiedades verificables, mejora sustancialmente la corrección del código generado por LLM. Este trabajo extiende esa idea a un dominio clínico y a un asistente de pruebas.

La contribución esperada es doble. En el plano de la ingeniería de software, el diseño de un marco que combina aprendizaje automático y razonamiento lógico para producir código no solo sintácticamente correcto, sino verificado y auditable. En el plano aplicado, un prototipo que demuestra la factibilidad técnica de ese marco sobre un protocolo clínico real.

= Alcance

El MTS comprende más de cincuenta flujogramas de presentación @mackwayjones2014emergency. Este trabajo se limita al flujograma de dolor torácico, que combina discriminadores generales (por ejemplo, _shock_ o compromiso de la vía aérea) con discriminadores específicos basados en umbrales numéricos (por ejemplo, saturación de oxígeno o frecuencia de pulso), lo que lo hace representativo de los desafíos de formalización del protocolo.

El trabajo comprende el diseño y la implementación del prototipo. La evaluación empírica del marco —por ejemplo, la comparación con un desarrollo sin verificación formal ni documentación literaria, o la medición del esfuerzo de auditoría con profesionales de la salud— queda fuera del alcance y se propone como trabajo futuro. El prototipo no se destina al uso clínico.

= Estructura del trabajo

El Capítulo 2 presenta el marco teórico: los LLM aplicados a la generación de código, la verificación formal con Lean 4, la programación literaria, la auditoría y el MTS. El Capítulo 3 revisa el estado del arte y delimita la vacancia que motiva este trabajo. El Capítulo 4 expone el diseño y la implementación del prototipo. Por último, se presentan las conclusiones y los trabajos finales.
