# Mini tutorial de LaTeX (plantilla de tesis UMSNH)

Este es el mismo contenido del capítulo «Mini tutorial de LaTeX» de la
plantilla (`cap3/tutorial.tex`), en Markdown, para leerlo en GitHub sin
compilar. En el PDF compilado los ejemplos se ven ya resueltos.

## Estructura: capítulos, secciones y referencias cruzadas

Un documento se divide en `\chapter`, `\section` y `\subsection`. Para
referirse a otra parte se pone una etiqueta con `\label` y se cita con
`\ref`. Las notas al pie se hacen con `\footnote{...}`.

```latex
\chapter{Introducción}\label{Chap1}
\section{Motivación}
Véase el capítulo~\ref{Chap1}. Una aclaración.\footnote{Nota al pie.}
```

## Listas

```latex
\begin{itemize}
\item Primer elemento.
\item Segundo elemento.
\end{itemize}

\begin{enumerate}
\item Primer paso.
\item Segundo paso.
\end{enumerate}

\begin{description}
\item[Concepto] Descripción breve.
\item[Método] Descripción breve.
\end{description}
```

## Ecuaciones

Ecuación en línea: `$E = mc^2$`. Ecuación centrada y numerada:

```latex
\begin{equation}
E = mc^2
\label{eq:energia}
\end{equation}
```

Se cita con `\eqref{eq:energia}`. Varias ecuaciones alineadas por el
signo igual, con `align` (paquete `amsmath`, ya cargado por la clase):

```latex
\begin{align}
a^2 + b^2 &= c^2 \\
x &= \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
\end{align}
```

Cada ecuación va seguida de la definición de sus símbolos («donde $E$ es
la energía, $m$ es la masa...»).

## Letras griegas

En modo matemático, con su nombre en inglés precedido de barra invertida:

| Nombre | Minúscula | Mayúscula |
|--------|-----------|-----------|
| alfa   | `$\alpha$`  | — |
| beta   | `$\beta$`   | — |
| gamma  | `$\gamma$`  | `$\Gamma$` |
| delta  | `$\delta$`  | `$\Delta$` |
| pi     | `$\pi$`     | `$\Pi$` |
| omega  | `$\omega$`  | `$\Omega$` |
| lambda | `$\lambda$` | `$\Lambda$` |
| mu     | `$\mu$`     | — |
| sigma  | `$\sigma$`  | `$\Sigma$` |

Por ejemplo: $\pi \approx 3.1416$, un incremento es $\Delta x$. Las
mayúsculas que coinciden con el alfabeto latino no tienen comando propio.

## Citas bibliográficas

Las referencias se guardan en el archivo `.bib` y se citan con `\cite`:

```latex
\cite{libro-ejemplo}      % libro
\cite{articulo-ejemplo}   % artículo
\cite{sitio-ejemplo}      % sitio web
\citet{libro-ejemplo}     % autor en el texto (natbib)
```

Al final del documento, `\bibliography` genera la lista con el estilo de
`\bibliographystyle`.

## Figuras

```latex
\begin{figure}[htbp]
\centering
\includegraphics[width=0.25\textwidth]{ruta/a/la/imagen}
\caption{Pie de la figura.}
\label{fig:ejemplo}
\end{figure}
```

Toda figura debe introducirse y comentarse en el texto, y citarse con
`\ref{fig:ejemplo}`. También se pueden dibujar figuras con TikZ (véase
la parábola del capítulo 2 de la plantilla).

## Tablas

```latex
\begin{table}[htbp]
\centering
\caption{Pie de la tabla.}
\label{tab:ejemplo}
\begin{tabular}{lcc}
\toprule
Caso & Valor A & Valor B \\
\midrule
1 & 1.0 & 2.0 \\
\bottomrule
\end{tabular}
\end{table}
```

Con el paquete `booktabs` se usan `\toprule`, `\midrule` y
`\bottomrule` en lugar de `\hline`. Toda tabla debe introducirse y
comentarse en el texto, igual que las figuras.

Para armarla sin escribir el código a mano: [TableX](https://reoxlab.com/herramientas/tablex/) genera el `tabular` (estándar, booktabs, longtable o tabularx) desde una cuadrícula, y también importa tablas de LaTeX y de Excel.

## Cómo compilar

La forma recomendada es `latexmk`, que repite las pasadas necesarias
(incluida la bibliografía) automáticamente:

```bash
latexmk -pdf plantilla-tesis-umsnh.tex
```

Sin `latexmk`, a mano (tres pasadas de `pdflatex` con `bibtex` en medio):

```bash
pdflatex plantilla-tesis-umsnh.tex
bibtex plantilla-tesis-umsnh
pdflatex plantilla-tesis-umsnh.tex
pdflatex plantilla-tesis-umsnh.tex
```

El PDF resultante no se versiona: se genera al compilar. Para limpiar
los intermedios: `latexmk -c`.
