// ============================================================================
// tesis-template.typ — Helpers de estructura de la tesis
//
// Uso:
//   #import "tesis-template.typ": capitulo
//   #capitulo([Introducción])
//
// `capitulo` genera un salto de página y un encabezado de nivel 1 con la
// forma "Capítulo N — Título", donde N lo lleva el contador propio
// `contador-capitulo` (una entrada por capítulo, sin verse afectado por los
// subencabezados ==, ===). El encabezado se marca con supplement: [capitulo]
// para que las show-rules de main.typ e indice.typ puedan reconocerlo.
// Siguiendo APA 7, los encabezados internos (=, ==, ===) no se numeran;
// versatile-apa les aplica el formato de niveles 1, 2 y 3.
// ============================================================================

// Contador propio de capítulos (independiente del contador de headings,
// que también avanzan los subencabezados de nivel 2+).
#let contador-capitulo = counter("capitulo")

// Marcador para reconocer encabezados de capítulo en show-rules.
#let marca-capitulo = [capitulo]

#let capitulo(titulo) = {
  pagebreak()
  contador-capitulo.step()
  heading(level: 1, numbering: none, supplement: marca-capitulo, titulo)
}

// Encabezado de nivel 1 sin número de capítulo (para secciones finales como
// "Referencias bibliográficas"). No lleva la marca de capítulo.
#let seccion-sin-numero(titulo) = heading(level: 1, numbering: none, titulo)

