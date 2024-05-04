#let disclaimer(
  title: "",
  degree: "",
  author: "",
  submissionDate: none,
) = {

  set page(
    margin: (left: 25mm, right: 25mm, top: 25mm, bottom: 25mm),
    numbering: none,
    number-align: center,
  )

  let body-font = "New Computer Modern"
  let sans-font = "New Computer Modern Sans"

  set text(
    font: body-font, 
    size: 12pt, 
    lang: "en"
  )

  set par(leading: 1em)

  
  // --- Disclaimer ---
  pagebreak()
  
  v(73%)
  text("I confirm with my signature that I have conducted my present " + degree + "'s thesis independently. All sources of information (specialist literature, discussions with experts, etc.) and other aids that have significantly contributed to my work are fully listed in my work report in the appendix. All content that does not originate from me is marked with the exact reference to its source.")

  v(15mm)
  grid(
      columns: 2,
      gutter: 1fr,
      "Bern, " + submissionDate, author
  )

  pagebreak()
  pagebreak()
}
