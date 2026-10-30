// ============================================================================
// main.typ — Documento principal de la tesis
//
// Estructura:
//   1. Carátula (sin numerar)
//   2. Páginas preliminares (numeración romana i, ii, ...):
//      - Resumen con palabras clave
//      - Índice
//   3. Cuerpo (numeración arábiga desde 1):
//      - Capítulos 1..N (introducción, marco teórico, estado del arte,
//        marco metodológico, prototipo, ...)
//      - Conclusiones (capítulo N+1)
//      - Trabajos finales (capítulo N+2)
//   4. Referencias bibliográficas (sin número de capítulo)
// ============================================================================

#import "tesis-template.typ": capitulo, seccion-sin-numero, contador-capitulo
#import "@preview/versatile-apa:7.2.0": versatile-apa as apa-style
#import "@preview/orchid:0.1.0": generate-link as orcid-logo

#set text(lang: "es")

#set document(
  title: [Programación literaria verificada formalmente],
  keywords: ("modelos de lenguaje avanzado", "programación literaria", "verificación formal", "triage de Manchester"),
  description: [Propuesta de investigación sobre la integración de LLMs, verificación formal y programación literaria para el desarrollo de software crítico, aplicada al Triage de Manchester.],
)

// ----------------------------------------------------------------------------
// Numeración de páginas:
//   - Preliminares (resumen, índice): números romanos (i, ii, ...)
//   - Cuerpo (capítulos, referencias): números arábigos desde 1
// La numeración arábiga se reinicia en el primer capítulo.
// ----------------------------------------------------------------------------

#let preliminares = [
  // i — Resumen (la numeración romana ya fue establecida antes del salto
  // de página que precede a este bloque: los `set page` solo afectan a las
  // páginas SIGUIENTES al punto donde aparecen, no a la actual)
  #include "sections/abstract.typ"
  #include "sections/indice.typ"
]

#let cuerpo = [
  // La numeración arábiga y el reinicio del contador se establecieron antes
  // del salto de página que precede a este bloque.
  // APA 7: los encabezados NO se numeran; versatile-apa aplica el formato
  // APA (nivel 1 centrado en negrita, nivel 2 alineado a la izquierda en
  // negrita, etc.). Los capítulos conservan la etiqueta "Capítulo N — Título"
  // por requisito institucional.

  // Capítulos 1..N (tentativos)
  #include "sections/cap01-introduccion.typ"
  #include "sections/cap02-marco-teorico.typ"
  #include "sections/cap03-estado-del-arte.typ"
  #include "sections/cap04-marco-metodologico.typ"
  #include "sections/cap05-prototipo.typ"

  // Capítulo N+1 — Conclusiones
  #include "sections/conclusiones.typ"

  // Capítulo N+2 — Trabajos finales
  #include "sections/trabajos-finales.typ"

  // Referencias bibliográficas (sección sin número de capítulo)
  #pagebreak()
  #seccion-sin-numero[Referencias bibliográficas]
  #bibliography("bibliography/ref.bib", full: true, title: none)
]

// ----------------------------------------------------------------------------
// Plantilla general (APA)
// ----------------------------------------------------------------------------
#show: apa-style.with(font-size: 12pt, running-head: [Programación literaria verificada formalmente])

// ----------------------------------------------------------------------------
// Show-rule de cuerpo para encabezados de capítulo (marca [capitulo]):
// renderiza "Capítulo N — Título".
// ----------------------------------------------------------------------------
#show heading.where(supplement: [capitulo]): it => context {
  let n = contador-capitulo.get().first()
  text(weight: "bold")[Capítulo #n — #it.body]
}

// ----------------------------------------------------------------------------
// El header de versatile-apa imprime here().page(), que siempre es arábigo.
// Lo reemplazamos por un header equivalente que usa counter(page).display(),
// que sí respeta el estilo de numeración activo (romano/arábigo por sección).
// Debe ir después del show del template para ganar prioridad.
// ----------------------------------------------------------------------------
#set page(header: context {
  grid(
    columns: (1fr, auto),
    upper([Programación literaria verificada formalmente]),
    counter(page).display(),
  )
})

// ----------------------------------------------------------------------------
// Carátula (sin numeración de página)
// ----------------------------------------------------------------------------
#let caratula-font = ("Arial", "Liberation Sans")

#page(paper: "a4", margin: (top: 3cm, x: 2.5cm, bottom: 2.5cm), numbering: none, header: none, footer: none)[
  #align(center)[
    #v(2fr)
    #image("./assets/images/Universidad-Nacional-del-Oeste.png", width: 25%)
    #v(1.5em)
    #text(font: caratula-font, size: 23pt, weight: "bold")[Universidad Nacional Del Oeste]

    #v(0.8em)
    #text(font: caratula-font, size: 20pt, weight: "bold")[Escuela de Ciencias Tecnológicas]

    #v(2.5em)
    #text(font: caratula-font, size: 23pt, weight: "bold")[Programación literaria verificada formalmente]

    #v(3em)
    #align(left)[
      #text(font: caratula-font, size: 16pt)[#text(weight: "bold")[Autor: ] Ian Alén Cisneros, DNI: 46193882]
      #v(0.6em)
      #text(font: caratula-font, size: 16pt)[#text(weight: "bold")[Tutor: ] Lic. Laura Mercedes Solla]
    ]

    #v(3em)
    #text(font: caratula-font, size: 16pt)[Trabajo Final presentado para obtener el título de]

    #v(0.6em)
    #text(font: caratula-font, size: 16pt, weight: "bold")[Licenciado de Informática]

    #v(2em)
    #text(font: caratula-font, size: 16pt)[#datetime.today().display("[month repr:long] - [year]")]

    #v(2fr)
  ]
]

// Roman numbering + counter reset must be set BEFORE the pagebreak that starts
// the preliminares section (set page rules apply to following pages only).
#set page(numbering: "i")
#counter(page).update(1)
#pagebreak()
#preliminares
// Arabic numbering + counter reset must happen BEFORE the pagebreak that
// starts the body.
#set page(numbering: "1")
#counter(page).update(1)
#pagebreak(weak: true)
#cuerpo
