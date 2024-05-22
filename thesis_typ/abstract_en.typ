#let abstract_en() = {
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

  set par(
    leading: 1em,
    justify: true
  )

  
  // --- Abstract (EN) ---
  v(1fr)
  align(center, text(font: body-font, 1em, weight: "semibold", "Management Summary"))
  
  text[
    This thesis presents the development of the "One-Click Deployment" system, aimed at simplifying the deployment of open-source software (OSS). With a growing reliance on OSS in various industries, there is a clear need for deployment solutions that are both accessible and efficient. This system leverages Kubernetes and modern development practices to offer a streamlined approach that reduces the complexity typically associated with OSS deployment.

    The project identified key challenges in current deployment methodologies, including the high level of technical expertise required. The One-Click Deployment system addresses these challenges by featuring a user-centered interface and automating key deployment processes, thereby making OSS more accessible to users with varying levels of technical skills.

    The development process incorporated a comprehensive review of existing literature and a competitive market analysis, followed by iterative testing and user feedback to refine the system's design. Evaluations indicate that the system simplifies the deployment process while maintaining essential functionalities, striking a balance between ease of use and performance.

    User case studies demonstrated the system’s utility across various applications, from data science to IoT projects, suggesting its applicability in diverse operational settings. Feedback from these studies was incorporated into further system refinements, emphasizing practical usability and technical reliability.

    Looking forward, the One-Click Deployment system is poised to support a broader adoption of OSS by simplifying its deployment. Ongoing enhancements will focus on improving system security, expanding its features, and integrating emerging technologies to ensure the system remains relevant and effective.

    This thesis contributes a practical solution to the field of OSS deployment, offering a system that simplifies the process and broadens the accessibility of open-source tools, thus facilitating their adoption in a wider range of professional environments.
  ]
  
  v(1fr)
}