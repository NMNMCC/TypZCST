# ZCST Typst 模板

| 类型         | 模板文件   |
| ------------ | ---------- |
| 课程设计报告 | report.typ |

## 自动化工作流

本项目包含两个 GitHub Actions 工作流：

### 1. 模板测试工作流 (`test.yaml`)

- **触发条件**: 每次推送代码时
- **功能**: 编译主要模板文件，确保模板可以正常工作
- **输出**: 生成 PDF 和 HTML 格式的测试文件

### 2. 测试文件编译工作流 (`test-compile.yaml`)

- **触发条件**: 推送到 main/master 分支或创建 Pull Request 时
- **功能**:
  - 自动查找并编译所有 `*test*.typ` 文件
  - 将编译结果推送到 `test` 分支
  - 上传编译产物作为 GitHub Artifacts
- **输出**:
  - PDF 和 HTML 格式的编译文件
  - 编译结果保存在 `test` 分支的 `test-results/` 目录中

## 使用说明

1. 创建测试文件时，请使用 `*.test.typ` 命名格式
2. 推送代码后，工作流会自动运行
3. 编译结果可以在 `test` 分支中查看
4. 也可以从 Actions 页面下载编译产物

## 本地测试

```bash
# 安装 Typst
curl -fsSL https://typst.community/typst-install/install.sh | sh

# 编译模板
typst compile templates/report.typ -o report.pdf
typst compile templates/report.test.typ -o report.test.pdf
```
