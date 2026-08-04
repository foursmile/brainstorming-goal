# 第三方来源与许可证声明

本文件记录 `brainstorming-goal` 参考、派生或包含的第三方材料。它不替代各上游项目的许可证，也不表示上游作者认可或维护本项目。

核对日期：2026-08-02。

## 1. Superpowers

- 上游仓库：https://github.com/obra/superpowers
- 上游许可证：https://github.com/obra/superpowers/blob/main/LICENSE
- 许可证：MIT License
- 上游版权：Copyright (c) 2025 Jesse Vincent
- 涉及内容：`brainstorming` 工作流基础，以及与 TDD、Review、Verification 相关的流程思想。
- 本项目修改：加入任务规模分流、可执行 spec、长期 Goal、阶段审查、恢复和证据治理；不再把 `writing-plans` 作为固定下游阶段。

## 2. Matt Pocock Skills

- 上游仓库：https://github.com/mattpocock/skills
- 相关说明：https://github.com/mattpocock/skills/blob/main/docs/engineering/grill-with-docs.md
- 上游许可证：https://github.com/mattpocock/skills/blob/main/LICENSE
- 许可证：MIT License
- 上游版权：Copyright (c) 2026 Matt Pocock
- 涉及内容：`grill-with-docs` 的逐问式需求审问和文档同步理念。
- 本项目修改：简化核心规则内联进 brainstorming-goal SKILL.md 的 Long/Ultra Goal extension（Design gap grill 节），不再作为独立 references 文件分发；保留 12 问上限、零问题路径、blocker 保留和逐回答回写规则。

## 3. Caveman

- 上游仓库：https://github.com/JuliusBrussee/caveman
- 上游许可证：https://github.com/JuliusBrussee/caveman/blob/main/LICENSE
- 许可证：MIT License
- 上游版权：Copyright (c) 2026 Julius Brussee
- 涉及内容：`brainstorming-goal/references/caveman/SKILL.md`。
- 本项目修改：只保留紧凑表达原则；安全、授权、失败、恢复、命令、证据和持久化文档使用完整表达，不允许压缩改变语义。不维护派生 profile。

## 4. PUA

- 上游仓库：https://github.com/tanweai/pua
- 相关上游文件：https://github.com/tanweai/pua/blob/main/codex/pua/SKILL.md
- 本地来源文件：`brainstorming-goal/references/pua/SKILL.md`
- 许可证状态：本地和上游技能 frontmatter 声明 `license: MIT`。截至核对日期，上游仓库根路径没有可直接取得的 `LICENSE` 文件。
- 涉及内容：重复失败诊断、主动读取原始材料、切换假设、证据闭环等理念。
- 本项目修改：去除激励/压力话术、无限循环、排名、遥测和竞争机制，提炼为受权限、证据、重试上限和安全边界约束的聚焦校准流程（不维护派生 profile 或独立 profile 文件）。
- 发布注意：公开发布前应再次核对上游最新许可证与版权声明；如果上游仍未提供完整许可文本，维护者应确认该文件的再分发条件，或只保留不构成文件复制的独立流程描述。

## MIT License 文本

以下许可文本适用于上文明确标记为 MIT License 的对应上游材料；各自版权声明以相应小节为准。

```text
MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## 维护规则

升级、替换或重新复制第三方材料时，应同时更新：

1. 上游仓库和具体文件链接；
2. 上游版本、tag 或 commit；
3. 本地涉及文件范围；
4. 许可证和版权声明；
5. 本项目相对于上游的修改摘要；
6. 如使用来源哈希，更新 SHA-256 和失效条件。
