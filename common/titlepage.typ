#let titlepage(
  title: "",
  subtitle: "",
  degree: "",
  program: "",
  advisor: "",
  expert: "",
  author: "",
  projectPartner: "",
  submissionDate: none,
) = {
  set document(title: title, author: author)
  set page(
    margin: (left: 25mm, right: 25mm, top: 10mm, bottom: 10mm),
    numbering: none,
    number-align: center,
  )

  let body-font = "New Computer Modern"
  let sans-font = "New Computer Modern Sans"

  set text(
    font: body-font, 
    size: 10pt, 
    lang: "en"
  )

  set par(leading: 1em)

  
  // --- Title Page ---
  align(left, image("../figures/logo.svg", width: 35%))

  v(10mm)
  
  align(left, text(font: sans-font, 2.5em, weight: 700, title))

  align(left, text(font: sans-font, 2em, weight: 100, subtitle))
  
  v(5mm)

  align(left, text(font: sans-font, 1.4em, weight: 700, degree + "’s Thesis in " + program))

  v(12cm)
  
  pad(
    top: 3em,
    right: 15%,
    grid(
      columns: 2,
      gutter: 1em,
      strong("Author: "), author,
      strong("Advisor: "), advisor,
      strong("Expert: "), expert,
      strong("Project Partner: "), projectPartner,
      strong("Submission Date: "), submissionDate
    )
  )

  pagebreak()
}