// ============================================================================
// Capítulo 3 — Estado del arte
// ============================================================================

#import "../tesis-template.typ": capitulo

#capitulo[Estado del arte]

Este capítulo revisa los trabajos recientes en las cuatro líneas que el marco propuesto busca integrar y en la aplicación de herramientas digitales y LLM al triage. Al final se sintetiza la vacancia que motiva la investigación.

= Generación de código asistida por LLM

Las evaluaciones en entornos reales muestran beneficios concretos. #cite(<kumar2025intuition>, form: "prose") analizaron durante un año la adopción de una plataforma interna de generación y revisión de código por parte de 300 ingenieros, e informaron una reducción del 31,8 % en el tiempo de revisión de los cambios y un aumento en el volumen de código llevado a producción. Se trata, sin embargo, de un estudio de caso en una sola organización, por lo que sus resultados no son directamente generalizables.

En cuanto a la calidad, #cite(<mohsin2024trust>, form: "prose") evaluaron cuatro LLM en tres lenguajes de programación y encontraron vulnerabilidades de seguridad y _code smells_ en el código generado; el aprendizaje en contexto con ejemplos redujo esas vulnerabilidades, pero no las eliminó. Los autores concluyen que los LLM tienen una comprensión limitada de los principios de seguridad y constituyen una posible fuente de vulnerabilidades en la cadena de suministro de software.

= LLM, asistentes de pruebas y certificación

El ecosistema de Lean ha incorporado herramientas para combinar asistentes de pruebas y aprendizaje automático. LeanDojo extrae datos de Lean, permite interactuar con el entorno de pruebas de forma programática y ofrece un demostrador basado en LLM con recuperación de premisas, junto con un banco de pruebas de casi 100 000 teoremas @yang_leandojo_2023. En una dirección más cercana a la ingeniería de software, #cite(<koomullil_proof-carrying_2026>, form: "prose") propone separar explícitamente la capa probabilística de un sistema basado en LLM de una capa determinista en Lean 4, que emite certificados cuya validez se define como la aceptación por el núcleo del asistente, sin demostraciones pendientes y sin axiomas ajenos a un conjunto de confianza declarado.

= Traducción de requisitos a especificaciones formales

Formalizar los requisitos es el paso que conecta el lenguaje natural con la verificación. #cite(<ma2025bridging>, form: "prose") proponen Req2LTL, que traduce requisitos en lenguaje natural a lógica temporal lineal (LTL) mediante una representación intermedia jerárquica: el LLM se usa para la descomposición semántica y una síntesis basada en reglas deterministas garantiza la validez sintáctica. Sobre requisitos aeroespaciales reales, el sistema alcanzó un 88,4 % de exactitud semántica y un 100 % de corrección sintáctica. Que aun en ese escenario una de cada nueve fórmulas no capture el significado del requisito refuerza la necesidad de que un humano valide la especificación.

= Aseguramiento continuo de sistemas críticos

En los sistemas críticos, la certificación suele apoyarse en casos de aseguramiento. #cite(<sorokin2024continuous>, form: "prose") emplearon el Evidential Tool Bus, un marco de integración de herramientas, para construir y mantener de forma continua un caso de aseguramiento a partir de un patrón predefinido, y lo aplicaron a un sistema industrial de estacionamiento automático. El trabajo muestra que la evidencia de seguridad puede regenerarse automáticamente cuando cambian los requisitos o los componentes, aunque no aborda el uso de LLM para generar el código que se asegura.

= Programación literaria y auditoría en la era de los LLM

#cite(<zhang2024renaissance>, form: "prose") proponen la programación literaria interoperable (ILP), que usa los principios de Knuth para estructurar las instrucciones que se dan a un LLM, y muestran que mejora la generación de código en proyectos de gran escala. #cite(<yuan2026guiding>, form: "prose") proponen la programación literaria verificable (VLP), el antecedente más cercano a este trabajo: una documentación en lenguaje natural de sintaxis no ambigua se interpone entre la instrucción y el código; el usuario la revisa con ayuda de un detector de discrepancias, y la documentación validada se usa para derivar propiedades formales que se verifican sobre el código mediante _model checking_. En su evaluación, la tasa de programas correctos al primer intento pasó de entre 28,7 % y 73,2 % a entre 65,4 % y 93,5 %, con un esfuerzo razonable por parte de los usuarios.

En una línea complementaria, centrada en la auditabilidad de artefactos computacionales, #cite(<candela_approach_2023>, form: "prose") propusieron un enfoque para evaluar la calidad de los proyectos Jupyter publicados por instituciones de patrimonio cultural, y #cite(<balaskas_gp3sequences_2026>, form: "prose") presentó un marco en R que vuelve auditables los análisis de secuencias mediante contratos de análisis explícitos, registros de decisiones y procedencia legible por máquina. Ninguno de los dos involucra LLM ni verificación formal, pero ambos aportan criterios concretos sobre qué hace que un artefacto sea revisable por terceros.

= Herramientas digitales y LLM en el triage

La lógica del MTS ya se ha llevado al software. #cite(<zlotnik_building_2016>, form: "prose") construyeron un sistema de apoyo a la decisión que combina la prioridad del MTS con variables administrativas para predecir el ingreso hospitalario, y #cite(<onler_agreement_2026>, form: "prose") evaluaron la concordancia entre una aplicación móvil de autotriage basada en el MTS y el triage realizado por profesionales en 2274 pacientes adultos: la concordancia exacta fue del 42,6 % y el 51,1 % de los pacientes recibió una prioridad más alta que la asignada por los profesionales. En paralelo, #cite(<masanneck_triage_2024>, form: "prose") compararon el desempeño de distintos LLM, de ChatGPT y de médicos no entrenados en tareas de triage. Estos trabajos evalúan la calidad de las decisiones de triage, pero no abordan cómo garantizar que una implementación respete el protocolo.

= Síntesis y vacancia

Los trabajos revisados abordan por separado las piezas del problema: la generación de código con LLM y sus riesgos, la certificación formal de salidas probabilísticas, la formalización de requisitos, el aseguramiento continuo y la validación humana mediante documentación. El trabajo de #cite(<yuan2026guiding>, form: "prose") es el que más se acerca a una integración, pero se orienta a programas de propósito general, usa _model checking_ en lugar de demostraciones en un asistente de pruebas y no considera auditores especialistas de un dominio crítico. No se identificaron trabajos que integren generación con LLM, demostración formal y programación literaria en el desarrollo de software clínico. Esa es la vacancia que aborda esta tesina.
