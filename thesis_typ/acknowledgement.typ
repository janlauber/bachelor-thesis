#let acknowledgement() = {
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

  
  // --- Acknowledgements ---
  align(left, text(font: sans-font, 2em, weight: 700,"Acknowledgements"))
  v(15mm)

  text(
    "Acknowledgements

    I would like to express my sincere gratitude to my thesis advisor, Prof. Dr. Erik Graf, for his continuous support, insightful guidance, and invaluable feedback throughout this project. His expertise and encouragement were crucial in shaping this thesis.

    I extend my thanks to my expert, Reto Tinkler, for his thorough review and constructive feedback on the business aspects of the One-Click Deployment system. His insights were instrumental in refining the project's scope and objectives.

    I am also grateful to my team at Natron Tech AG for supporting with me on this project and providing the necessary resources and environment for development and testing.

    Also, I would like to thank Emanuel Imhof, the founder of Unbrkn GmbH, for his valuable feedback and suggestions, which helped me improve the project significantly and deliver the features that users need.

    A special thank you goes to my family, girlfriend and friends for their unwavering support and understanding during this journey. Lastly, I would like to thank the University of Applied Sciences at Bern for providing the resources and opportunities to pursue this research.

    Bern, 13.06.2024
    Jan Lauber
    "
  )
}