# Tesis: Programación Literaria Verificada Formalmente

## Resumen

En los últimos años, las empresas e instituciones han delegado cada vez más responsabilidades dentro del ciclo de vida del desarrollo de software a los modelos de inteligencia artificial. En particular, su eficacia en la generación de código resulta útil en la construcción del software, aumentando significativamente la velocidad del ciclo de desarrollo. Sin embargo, aparecen limitaciones que provienen de la naturaleza estocástica de estos modelos probabilísticos (alucinaciones), la auditoría humana insostenible de código y la limitación de contexto que restringe la capacidad de manejar requisitos complejos, lo que ralentiza su uso en sistemas de alta criticidad de manera ágil y fiable.

A lo largo de los años, se han ido desarrollando diferentes metodologías, técnicas y herramientas para disminuir los errores en el ciclo de vida tradicional, pero no hay una integración sistemática entre estas facilidades y los LLMs. Para abordar este tema, nos enfocaremos en responder:

- ¿Cómo puede mejorarse la eficacia de los LLMs en el ciclo de vida de desarrollo para sistemas críticos?
- ¿Es posible diseñar un sistema que combine generación de código por LLM, verificación formal, programación literaria y auditoría humana eficiente?
- ¿Qué impacto tiene la integración de código generado por LLMs y la programación literaria en la legibilidad de la documentación interseccionada con el código y la eficiencia de la auditoría humana?

**Palabras clave:** Ingeniería de Software, Verificación Formal, Inteligencia Artificial

## Introducción

El uso de LLMs en el desarrollo de software está en auge, pero su adopción en dominios críticos (ej. salud) se ve limitada por su falta de determinismo y verificabilidad. Mejorar estos aspectos tendría un impacto directo en la calidad del software, con reducción de bugs y errores lógicos en sistemas donde el fallo puede tener consecuencias graves (ej. diagnóstico médico, dosificación de fármacos), velocidad de desarrollo, con la automatización de la verificación y documentación, permitiendo ciclos de desarrollo más ágiles sin sacrificar la seguridad, y la escalabilidad de la auditoría, con herramientas que faciliten la revisión humana de código generado por LLMs, haciendo viable su uso en entornos regulados.

Esta investigación plantea cerrar la brecha entre la productividad de los LLMs y los estándares de confiabilidad requeridos en software crítico, adoptando una postura dentro del paradigma pragmático, permitiéndonos usar, de manera criteriosa, tanto métodos cualitativos como cuantitativos.

Tenemos por objetivo analizar la viabilidad de un sistema neuro-simbólico que permita a los LLMs generar código verificado formalmente, con documentación clara (programación literaria) y retroalimentación automatizada, para mejorar la eficacia en el desarrollo de software crítico, usando como caso de estudio el Triage de Manchester (protocolos predefinidos de clasificación de pacientes).

Buscaremos diseñar un flujo de trabajo que integre generación de código por LLMs a partir de requisitos en Lenguaje Natural Controlado (CNL) (Ma et al., 2025), verificación formal del código generado usando Lean 4 (o herramientas similares) y documentación automática mediante programación literaria (Zhang et al., 2024). A partir de este flujo, se buscará implementar un prototipo aplicado al Triage de Manchester, que traduzca requisitos clínicos (ej. "Si el paciente tiene dolor torácico y presión arterial < 90, asignar prioridad 1") a código verificable, genere documentación legible para auditores humanos (médicos o ingenieros).

Para analizar los resultados de nuestras pruebas, nos referiremos al contexto sobre el que se basen: tanto los requisitos, el modelo de lenguaje como el entorno sobre el que funcionará el software final generado por el sistema tendrían sus propias cualidades contextuales de las que son indivisibles: interpretaciones de requisitos, gravedad de errores. Debido a esto, el análisis de esta investigación estará directamente condicionado por nosotros.

En el análisis del sistema se tomarán dos principales propiedades:

1. El número de bugs o errores lógicos producidos por el sistema.
2. La calidad y legibilidad de la documentación interseccionada con el código fuente.

El diseño metodológico de este estudio opera como un sistema rigurosamente coherente y alineado. El paradigma pragmático establece una epistemología orientada a la resolución del problema en escenarios de aplicación real, lo que fundamenta de manera natural la adopción de un método mixto. Este enfoque mixto determina la elección precisa de las técnicas de recolección de datos: la experimentación cuantitativa con motores de demostración matemática permite asegurar el componente determinista exigido por el problema, mientras que el análisis cualitativo aborda directamente la métrica de desgaste en la auditoría humana.

## Referencias

- Kumar, A., Khare, V., Sharma, D., Kumar, S., Saini, V., Yadav, A., Jain, S., Rana, A., Verma, P., Meena, V., & Edubilli, A. (2026). *Intuition to Evidence: Measuring AI's True Impact on Developer Productivity*. ArXiv. https://doi.org/10.48550/arXiv.2509.19708
- Ma, Z., Wen, C., Su, Z., Liang, X., Tian, C., Qin, S., & Yang, M. (2025). *Bridging Natural Language and Formal Specification–Automated Translation of Software Requirements to LTL via Hierarchical Semantics Decomposition Using LLMs*. ArXiv. https://doi.org/10.48550/arXiv.2512.17334
- Mohsin, A., Janicke, H., Wood, A., Sarker, I. H., Maglaras, L., & Janjua, N. (2024). *Can We Trust Large Language Models Generated Code? A Framework for In-Context Learning, Security Patterns, and Code Evaluations Across Diverse LLMs*. ArXiv. https://doi.org/10.48550/arXiv.2406.12513
- Peirce, C. S. (1878). How to make our ideas clear. *Popular Science Monthly, 12*, 286–302.
- Sorokin, L., Bouchekir, R., Beyene, T. A., Liao, B., & Molin, A. (2024). *Towards Continuous Assurance Case Creation for ADS with the Evidential Tool Bus*. ArXiv. https://doi.org/10.48550/arXiv.2403.01918
- Zhang, W., Li, Y., Dong, Z., Wu, Y., Zhou, Y., Wang, D., Xing, S., Zhou, C., & Shen, D. (2024). *Renaissance of Literate Programming in the Era of LLMs: Enhancing LLM-Based Code Generation in Large-Scale Projects*. ArXiv. https://doi.org/10.48550/arXiv.2502.17441
