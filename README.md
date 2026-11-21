# Plantilla de tesis — UMSNH (LaTeX)

Plantilla genérica para tesis de la **Universidad Michoacana de San
Nicolás de Hidalgo**, basada en el formato FISMAT-UMSNH (clase
`PhDthesisPSnPDF`, GNU GPL v3). Es un machote mínimo, listo para
compilar: portada automática, preliminares, dos capítulos de ejemplo, un
apéndice de ejemplo y bibliografía de ejemplo.

**Crédito:** plantilla elaborada a partir del formato FISMAT-UMSNH y
compartida por **Reox Lab — reoxlab.com**.

**No contiene datos personales de nadie**: título, autor, director,
matrícula, correo y fecha son valores de ejemplo para sustituir, y las
referencias son inventadas. Si encuentra un dato real en algún archivo,
repórtelo: es un error.

## Estructura

- `plantilla-tesis-umsnh.tex` — documento principal (datos, portada,
  capítulos, apéndices, bibliografía).
- `cap1/introduccion.tex` — capítulo 1 de ejemplo (motivación, objetivos,
  organización).
- `cap2/desarrollo.tex` — capítulo 2 de ejemplo (ecuación con su
  «donde…», figura con TikZ, tabla y citas).
- `apen/apeA.tex` — apéndice de ejemplo.
- `cap3/tutorial.tex` — capítulo «Mini tutorial de LaTeX» (listas, ecuaciones, letras griegas, citas, figuras, tablas y compilación) y `TUTORIAL.md` — el mismo tutorial en Markdown, para leerlo en GitHub sin compilar.
- `Declaracion/`, `Agradecimientos/`, `Resumen/` — preliminares.
- `biblio/referencias-ejemplo.bib` — tres referencias inventadas.
- `Latex/Classes/PhDthesisPSnPDF.cls` — clase del formato (GPL v3) con
  sus estilos `.bst`; `Latex/Classes/Escudos/` — escudos UMSNH y FISMAT
  que usa la portada; `Latex/Macros/MacroFile1.tex` — macros de ayuda.

## Requisitos

TeX Live con `pdflatex`, `bibtex` y `latexmk` (en Debian/Ubuntu:
`texlive-full` o al menos `texlive-latex-base`,
`texlive-latex-recommended`, `texlive-latex-extra`, `texlive-fonts-*`,
`texlive-bibtex-extra` y `latexmk`). La figura de ejemplo usa TikZ
(paquete `pgf`, incluido en TeX Live).

## Compilar (local)

```bash
latexmk -pdf plantilla-tesis-umsnh.tex
```

El PDF resultante (`plantilla-tesis-umsnh.pdf`) **no** se versiona: se
genera al compilar. Para limpiar los intermedios:

```bash
latexmk -c
```

Sin `latexmk`, a mano (tres pasadas de `pdflatex` con `bibtex` en medio):

```bash
pdflatex plantilla-tesis-umsnh.tex
bibtex plantilla-tesis-umsnh
pdflatex plantilla-tesis-umsnh.tex
pdflatex plantilla-tesis-umsnh.tex
```

### Con VS Code + LaTeX Workshop

1. Abra la carpeta de la plantilla en VS Code.
2. Instale la extensión **LaTeX Workshop** (James Yu).
3. Abra `plantilla-tesis-umsnh.tex` y compile con `Ctrl+Alt+B`
   (o el botón «Build LaTeX project»); el PDF se muestra al lado.

## Importar a Overleaf

1. Comprima la carpeta de la plantilla en un `.zip` **sin** el PDF ni
   los archivos intermedios (`.aux`, `.log`, `.toc`, etc.).
2. En Overleaf: **New Project → Upload Project** y suba el `.zip`.
3. Overleaf compila con `pdflatex` automáticamente; el documento
   principal es `plantilla-tesis-umsnh.tex` (si Overleaf no lo detecta,
   fíjelo en **Menu → Settings → Main document**).

También puede importarse desde GitHub: **New Project → Import from
GitHub** con la URL del repositorio.

## Qué cambiar primero (personalización)

1. En `plantilla-tesis-umsnh.tex`: título, autor, facultad, grado,
   director, codirector (o bórrelo si no aplica), matrícula, correo,
   fecha y lugar; palabras clave.
2. `Resumen/Resumen.tex` y `Resumen/abstract.tex`: resumen y abstract
   reales.
3. `Declaracion/decla.tex`: título y nombres reales.
4. `Agradecimientos/`: dedicatoria y agradecimientos reales.
5. `cap1/` y `cap2/`: sustituya el texto de ejemplo por sus capítulos
   (copie la estructura: un archivo por capítulo, con su `\include`).
6. `biblio/referencias-ejemplo.bib`: sustituya las tres entradas
   inventadas por sus referencias reales.
7. Si su posgrado no es «Ciencias en Ingeniería Física», edite la línea
   «División de estudios de posgrado» en
   `Latex/Classes/PhDthesisPSnPDF.cls` (la portada la trae fija).

## Portada

`\portadafalse` selecciona la variante en blanco y negro (reglas negras,
logo FISMAT). La variante a color (reglas azul/oro) requiere el escudo
de la facultad en color (`fi_azul`), que **no** se incluye en esta
plantilla: colóquelo en `Latex/Classes/Escudos/` y cambie a
`\portadatrue`.

## Licencia

La clase `PhDthesisPSnPDF.cls` y sus estilos `.bst` son obra derivada
del formato CUED/PhDThesisPSnPDF y se distribuyen bajo **GNU General
Public License v3** (véase el encabezado de la clase). El texto de
ejemplo de esta plantilla es solo eso: ejemplo, sin derechos reservados
reclamados sobre él.

## Notas

- El PDF de ejemplo que acompaña a la plantilla es solo para revisión;
  no forma parte de las fuentes.
- La plantilla compila en unas 18 páginas, de las cuales varias son
  páginas en blanco impuestas por el formato (impresión a doble cara:
  cada preliminar y cada capítulo empieza en página nueva). El contenido
  de ejemplo ocupa unas 14 páginas; si quita `openany` del
  `\documentclass`, el PDF crece con más páginas en blanco (es el
  comportamiento normal del formato, no un error).
- Si su tesis es de licenciatura o maestría, cambie el grado en
  `\degree` y el texto «QUE PARA OBTENER EL GRADO DE» de la portada
  sigue funcionando igual (la clase lo imprime tal cual).
