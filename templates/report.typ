/// ZCST 课程设计报告模板
///
/// - department (string): 院系
/// - major (string): 专业
/// - course (string): 课程
/// - students (array): 学生（名字，学号）
/// - teacher (string): 教师
/// - finish_time (datetime): 完成时间
/// - body (content): 正文
/// -> content
#let report(
  department,
  major,
  course,
  students,
  teacher,
  finish_time,
  body,
) = {
  import "@preview/cuti:0.3.0": show-cn-fakebold, show-fakebold
  show: show-fakebold

  set page(paper: "a4")
  let s = "\u{3000}"

  text(size: 12pt, font: "KaiTi")[
    #align(center + horizon)[
      #text(size: 32pt)[珠海科技学院]
      #v(2cm)
      #text(size: 48pt, weight: "bold")[课程设计报告]
      #v(2cm)
      #pad(x: 2cm)[
        #table(
          columns: (1fr, 3fr),
          stroke: 0.1pt,
          inset: (x: 12pt, y: 12pt),
          [院　　系：], [#department],
          [专　　业：], [#major],
          [科　　目：], [#course],
          [学　　生：],
          [#grid(
              columns: (1fr, 1fr),
              inset: (x: 2pt, y: 4pt),

              ..students
                .map(((name, id)) => (
                  align(right)[
                    #if (name.clusters().len() == 2) { name.clusters().at(0) + "　" + name.clusters().at(1) } else {
                      name
                    }
                  ],
                  align(left)[#id],
                ))
                .flatten(),
            )],

          [指导教师：], [#teacher],
          [完成时间：], [#finish_time.display("[year]年[month]月[day]日")],
        )]
    ]]

  pagebreak()

  set text(size: 12pt, font: "SimSun")
  set par(leading: 2em)

  outline(title: block(width: 100%)[#align(center)[#text(size: 24pt, weight: "bold")[目录]]])

  pagebreak()

  set heading(numbering: "1.1.1")
  show heading: set block(below: 1.5em)

  set par(spacing: 1em)
  show strong: it => {
    let content = it.body
    let text_value = if content != none { content.text } else { "" }

    if (
      text_value
        .matches(
          regex("[\u{4E00}-\u{9FFF}\u{3400}-\u{4DBF}\u{F900}-\u{FAFF}\u{2E80}-\u{2EFF}\u{3000}-\u{303F}\u{FF00}-\u{FFEF}]"),
        )
        .len()
        > 0
    ) {
      text(
        font: "SimHei",
        weight: "regular",
        content,
      )
    } else {
      text(weight: "bold", content)
    }
  }

  body
}
