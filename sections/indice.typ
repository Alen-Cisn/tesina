// ============================================================================
// Índice general (página preliminar, numeración romana)
// ============================================================================
#import "../tesis-template.typ": contador-capitulo

// Los capítulos usan `capitulo`, que numera "Capítulo N — Título" en el
// cuerpo, pero el outline resuelve los contadores en su propia ubicación.
// Esta show-rule recalcula el número de capítulo en la ubicación del
// encabezado de cada entrada marcada con supplement [capitulo] y reemplaza
// la entrada completa (evitando la duplicación del prefijo).
#show outline.entry: it => {
  if it.element.func() == heading and it.element.supplement == [capitulo] {
    // Entrada de capítulo: alineada al margen, en negrita, sin sangría
    // ni estilo de enlace (sin subrayado ni color).
    context {
      let n = contador-capitulo.at(it.element.location()).first()
      show link: it => text(fill: black, weight: "bold", it.body)
      strong(link(it.element.location())[Capítulo #n — #it.element.body])
    }
  } else if it.element.func() == heading {
    // Subniveles: sangría manual de 1em por nivel (nivel 1 = margen).
    pad(left: 1em * (it.level - 1), it)
  } else {
    it
  }
}
// versatile-apa aplica `first-line-indent (all: true)` a todos los párrafos;
// en el índice eso desplaza cada entrada ~0.5in. Se anula aquí y la sangría
// jerárquica se controla manualmente en la show-rule de arriba.
#set par(first-line-indent: (amount: 0em, all: true))
#set outline(indent: 0em)
#outline(title: [Índice], depth: 3, indent: 0em)


