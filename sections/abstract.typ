// ============================================================================
// Resumen + Palabras clave (página preliminar, numeración romana)
//
// APA 7 (sección 2.9): un único párrafo sin sangría, de 150 a 250 palabras,
// en página propia. Las palabras clave van en una línea aparte, con sangría
// de primera línea y la etiqueta en cursiva.
// ============================================================================

#heading(level: 1, outlined: false)[Resumen]

#par(first-line-indent: 0em)[
  Los modelos de lenguaje avanzados (LLM, por las siglas de #emph[large language models]) aceleran el desarrollo de software, pero su naturaleza probabilística produce código que puede contener alucinaciones, vulnerabilidades y desviaciones sutiles respecto de la intención del usuario. En dominios de alta criticidad, como la clasificación de pacientes en servicios de urgencias, estos defectos son inaceptables, y la revisión humana exhaustiva del código generado anula buena parte de la ganancia de velocidad. Este trabajo propone un marco neuro-simbólico que combina tres elementos: generación de código mediante LLM, verificación formal con el asistente de pruebas Lean 4 y programación literaria. La verificación formal garantiza que el código cumple su especificación; la programación literaria expone esa especificación en una narrativa legible para que auditores clínicos y técnicos puedan validar que representa fielmente el protocolo. El marco se aplica al Sistema de Triage de Manchester, tomando como alcance el flujograma de dolor torácico. El trabajo comprende el diseño y la implementación de un prototipo que traduce los requisitos clínicos de ese flujograma a una especificación y un código verificados en Lean 4, acompañados de documentación literaria orientada a la auditoría; la evaluación empírica del marco queda planteada como trabajo futuro. Se busca demostrar la factibilidad técnica de incorporar LLM al desarrollo de software crítico sin renunciar a la corrección ni a la auditabilidad.
]

#par(first-line-indent: 0.5in)[
  #emph[Palabras clave:] modelos de lenguaje avanzado, programación literaria, verificación formal, triage de Manchester
]
