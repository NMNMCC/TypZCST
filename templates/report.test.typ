#import "report.typ": report

#report(
  "计算机科学与技术学院",
  "计算机科学与技术",
  "高级程序设计",
  (("李依馨", "04240418"), ("王五", "04240416")),
  "张三",
  datetime(year: 2025, month: 5, day: 28),
)[
  = Hello, World!

  Latin Bold *OK*

  CJK Bold *你好*

  == Goodbye, World! 你好

  以下是一段 `OCaml` 代码
  ```ml
  let more x = (+) 1 x
  ```
  = Welcome, World!
  == Bye, World!
  === Go, World!
  === Jump, World!
  == Just, World!
]
