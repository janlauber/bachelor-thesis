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
  align(center, text(font: body-font, 1em, weight: "semibold", "Abstract"))
  
  text[
    This thesis explores how the One-Click Deployment system enhances the deployment of open-source software by leveraging Kubernetes. By simplifying the complexities involved, the system aims to democratize access to these powerful features, making it easier for users of all technical levels to benefit from advanced container orchestration.

    The deployment of open-source software and frameworks often involves intricate and challenging processes, which can limit accessibility and adoption. Many users find it difficult to manage dependencies, scale applications, and ensure consistent environments across different stages of development. The One-Click Deployment system addresses these challenges by encapsulating Kubernetes' strengths within a user-friendly interface. This system simplifies deployment, scaling, and management processes, making these advanced capabilities available to a broader audience. Through iterative development and user feedback, the system has been refined to balance ease of use with robust functionality.

    The primary objective of this project is to enhance the accessibility and usability of Kubernetes, enabling users to deploy and manage open-source software more efficiently. By providing a unified deployment solution that streamlines the process, the system empowers users to focus on their applications' development and innovation, rather than the complexities of deployment.
    
    The One-Click Deployment system has successfully made the strengths of Kubernetes more accessible, significantly reducing the need for specialized knowledge. Users reported notable improvements in deployment efficiency and ease of management, highlighting the system's effectiveness in simplifying complex processes.

    Future enhancements will focus on further improving the user experience, integrating additional Kubernetes features, and ensuring robust security measures. Ongoing user feedback will drive the continuous improvement of the system, ensuring it meets the evolving needs of the open-source community.

    The system is open-source and available under the Apache 2.0 license on GitHub, with repositories for both the One-Click Operator and the One-Click system. This commitment to open-source principles fosters broad collaboration and continuous enhancement, further supporting its goal of making advanced deployment capabilities accessible to all.
  ]
  
  v(1fr)
}