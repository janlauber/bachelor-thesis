#import "thesis_template.typ": *
#import "common/titlepage.typ": *
#import "thesis_typ/disclaimer.typ": *
#import "thesis_typ/acknowledgement.typ": *
#import "thesis_typ/abstract_en.typ": *
#import "common/metadata.typ": *


#titlepage(
  title: titleEnglish,
  subtitle: subTitleEnglish,
  degree: degree,
  program: program,
  advisor: advisor,
  expert: expert,
  author: author,
  projectPartner: projectPartner,
  submissionDate: submissionDate
)

#disclaimer(
  title: titleEnglish,
  degree: degree,
  author: author,
  submissionDate: submissionDate
)

#acknowledgement()

#abstract_en()

#show: project.with(
  title: titleEnglish,
  degree: degree,
  program: program,
  advisor: advisor,
  expert: expert,
  author: author,
  submissionDate: submissionDate
)

= Introduction


