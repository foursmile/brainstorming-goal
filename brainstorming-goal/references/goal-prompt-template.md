# Goal Prompt Generation and Review Contract


This file is a review contract, not a fixed Goal prompt template. The historical filename is retained for compatibility with existing references. Never copy this document into a user's Goal.

This contract is executed by the Goal author. Scripts may check syntax or presence only; they never generate, compress, or replace the actual Goal content.

Core objective: use this contract to generate a correct, complete, executable `goal.md`. A summary, link list, checklist-only result, or syntax-pass without corresponding Goal content is a generation failure.

Use it to generate and independently review the **actual target Goal** for the current task. The target Goal must be derived from the reviewed design spec, repository rules, applicable phase specs, optional `progress.md`, and current authorization. Generic wording in this reference cannot add requirements to the target task.

## Required inputs

Resolve these inputs before drafting a candidate Goal:

1. The target Goal name, canonical `task_key`, task-root path, objective, available `progress.md` state, and start-or-resume intent.
2. Repository/user rules and the current authorization/write-scope matrix.
3. Reviewed design spec path, version, and content identity.
4. Applicable phase specs and their entry/exit gates.
5. Optional `progress.md` path and version, when present.
6. The installed brainstorming-goal skill root and its raw `references/caveman/SKILL.md` and `references/pua/SKILL.md` files.
7. Known blockers, active external state, protected processes, reusable evidence, and the exact first evidence-producing action. If no `progress.md` exists, derive state from the design doc and active phase; do not invent a state file.

For the default layout, resolve the candidate path as `docs/superpowers/specs/<task_key>/goal.md`, the design doc as `docs/superpowers/specs/<task_key>/design.md`, and phase specs under `phases/`. Use same-level `progress.md` only when runtime state needs persistence. Do not generate a second prompt tree.

If a load-bearing input is missing, mark the draft `blocked` with an owner and unblock condition. Do not hide placeholders inside a runnable Goal prompt.

## Generate the candidate Goal

Build a task-specific candidate Goal from the resolved inputs:

- Set `document_language` from the user's current task language and write the actual objective and scope in that language: Chinese user requests use Simplified Chinese; English requests use English. Keep commands, paths, identifiers, code, and literal UI strings unchanged. If the user language is genuinely mixed or ambiguous, ask one language question before drafting.
- Link authoritative artifacts by resolved path and version instead of copying the design spec into the prompt.
- Include only execution rules that the target Goal needs. Do not import irrelevant records, tools, phases, review gates, or examples from this reference.
- Preserve exact commands, identifiers, paths, tolerances, terminal states, and protected-resource rules from the reviewed sources.
- State the source-precedence order and the exact start/resume procedure.
- If the user supplied an explicit startup list (for example, `启动前完整读取`), copy the resolved list into the Goal and require it before the first phase action; otherwise state the deferred future-phase loading rule.
- Give one exact first evidence-producing action or discovery rule.
- Keep authorization inherited from the governing sources; the prompt cannot expand write scope or external authority.
- Do not bind delivery to Git, SVN, or another specific version-control tool unless the repository or user explicitly does so.
- Do not create a separate implementation-plan handoff. Ordered execution comes from the design doc and phase specs.
- Generate `goal.md` as a complete copyable execution prompt. It must summarize the operational flow instead of only linking the design doc or listing phase filenames.
- Include, for every phase in the design registry: phase ID/path, prerequisite evidence, staged read set, concrete actions and commands, allowed write targets, expected outputs, validation, exit gate, rollback, and blocker terminal states.
- For every dispatchable phase task, include complexity, preferred agent (`luna_worker` / `terra_worker` / `sol_worker` / `luna_reviewer` / `sol_advisor`), independent-work condition, brief inputs/outputs, write boundary, validation, evidence path, fallback, and terminal state. Omit dispatch only when no independent bounded work exists.
- Require sibling `phases/phase-<number>-<name>-completion.md` at every phase exit with completed tasks/evidence, review findings/rulings, core decisions, next-phase relevance, residual risks, cleanup, terminal status, and next action.
- Include startup/resume, interruption/compaction recovery, progress-state updates, review gates, acceptance matrix, cleanup, delivery/version gates, and final reporting rules.
- Reject the candidate if a fresh runner would need to infer the phase order, first action, evidence location, or transition condition from memory.
- Include the saved Goal/design review status and evidence path. Never write that registry validation, independent review, or a phase exit has completed unless the corresponding saved evidence exists.

### Goal-level caveman and pua activation

Every Long Goal and Ultra-long Goal candidate must contain a short task-specific clause like the following. Resolve the skill root from the loaded `brainstorming-goal/SKILL.md`; never hard-code a machine-specific path:

```text
启动前，从当前 brainstorming-goal 技能目录读取 references/caveman/SKILL.md 和
references/pua/SKILL.md。读取 caveman/SKILL.md 后，立即采用其紧凑表达并保持到 Goal 结束——
不是仅"声明激活"，而是从现在起所有输出按 caveman 规则：去掉冠词/冗词/客套/对冲；
片段化可用；用短同义词（fix 不写 "implement a solution for"）；不装饰表格/emoji；
不自称"进入 caveman 模式"；技术术语、代码、命令、错误字符串原样保留；保留用户主语言
（中文提问→中文紧凑表达）。`normal mode` 或 `stop caveman` 停止。安全/不可逆/序列易误解处
保留完整表达并展开澄清。
PUA 自身按其原始技能的场景条件触发（失败 2+ 次、反复微调、准备放弃等）；
本技能另加周期聚焦校准：每隔 20 分钟触发一次检查，但只在 safe command/tool boundary 执行，
不打断命令、测试、Review 或授权确认，恢复后补检一次。不得复制成第二套 profile，
也不要写入绝对路径、版本、SHA-256 或其他来源登记字段。
若无法从当前技能副本解析上述文件，先标记 `skill_unavailable`/`blocked`，不得改用旧 profile
或猜测规则。
```

These skills remain the operational authority. The Goal must record that they were read and summarize
their required runtime controls; it must not paste or reimplement those files. These controls
affect communication and focus only, and cannot override user/repository rules, spec requirements,
authorization, evidence, retry caps, blockers, or terminal states.

### Generated Goal fidelity gate

The generated `goal.md` must carry the following runtime clauses in executable language; merely linking this template or saying “skills read” is insufficient:

- Caveman: after reading the active Caveman skill, immediately adopt its terse expression and keep it until the Goal ends — not just "declare activation". From now on all output follows caveman rules: drop articles/filler/pleasantries/hedging; fragments OK; short synonyms; no decorative tables/emoji; never announce the mode; preserve technical terms, code, commands, and exact error strings verbatim; preserve the user's dominant language. `normal mode`/`stop caveman` disables it; expand to full clarity where sequence, safety, or irreversible action could be misread.
- PUA: apply PUA's own scenario triggers per its skill (failure 2+, repeated tweaking, about to give up); separately, this skill adds a periodic focus check every 20 minutes, run only at a safe command/tool boundary — pause during commands/tests/reviews, and perform one catch-up check after resuming.
- Tool/MCP readiness: when network, MCP, browser, or another tool is needed, inspect existing/repository capability first; resolve missing capability before dependent work; record `tool_unavailable`/`blocked` instead of faking evidence or downgrading acceptance.
- Repeated operations: when the same operation has been performed three times with stable inputs/outputs, fix it into a project-level skill or batch/script workflow, then validate; do not create a skill from a one-off or unstable repetition. Do not reinvent the wheel: search the web/GitHub for maintained libraries or existing solutions before implementing a new capability.
- Waterfall gates: architecture/research → contract freeze → core implementation/validation → review/fix → integration/stress validation → delivery; do not cross an unmet gate.
- TDD: changed behavior follows observed RED → minimal GREEN → REFACTOR; preserved behavior uses characterization/regression evidence; non-code work names its alternate validation.

Review must mark any missing clause as `issues_found`; do not generate a runnable Goal that leaves these controls implicit.

### Goal generation algorithm

Execute in this order; do not skip ahead:

1. Intake: read every user-named artifact in full; resolve actual paths, versions, identity, authorization, and available `progress.md`.
2. Authority gate: classify user/repository rules, design doc, phase sources, permissions, write scope, non-goals, protected resources, and start/resume authority. Contradiction or identity drift stops generation.
3. Research/tool gate: decide whether current web/GitHub evidence is required; inspect repository/bundled tools first, probe them, then inspect available MCP/tool capability. Resolve missing capability before dependent design; record unavailable capability without faking evidence.
4. Phase registry gate: read all phase specs during package generation; verify reciprocal identity, dependency order, entry/exit gates, completion-record paths, and requirement traceability. A filename-only list fails.
5. Architecture/waterfall gate: for applicable large modules, pass architecture/research → contract freeze before drafting implementation steps. Record decomposition, capacity assumptions, rollback, and review gates.
6. Generate `goal.md`: include resolved startup set, runtime-control clauses, source precedence, recovery, final reporting, and one explicit section per phase with read path, prerequisite evidence, actions/commands, write scope, outputs, validation, exit gate, completion record, rollback, and blocker state. At later phase entry, read and verify predecessor completion record first.
7. Coverage gate: build `template_coverage_map` inside `goal.md`, mapping every applicable template section to concrete Goal section and evidence. Mark only genuinely irrelevant sections `not_applicable` with a reason.
8. Review gate: run semantic review; reject placeholders, omitted clauses, unverifiable commands, missing completion requirements, weak evidence, or false `approved` claims. If independent review is unavailable, label low/medium risk `review_substitute`; high-risk `review_unavailable` remains `blocked`.
9. Handoff gate: save review status/evidence in `goal.md` or the user-facing execution record. Only after `approved`, resolve absolute path and output `/goal "<absolute-path-to-goal.md>"`; do not start execution during drafting or unresolved review.

The candidate is a draft until the review below passes. Drafting it does not start or resume the Goal.

## Startup source set in the copyable Goal

The final Goal must be one self-contained, copyable prompt. It must embed a resolved startup source set; the user must not have to assemble paths or replace placeholders manually.

```text
启动或恢复 Goal 前，完整读取以下文件，并记录读取结果和读取时间：
0. 当前安装的 brainstorming-goal 技能目录下的 references/caveman/SKILL.md
1. 当前安装的 brainstorming-goal 技能目录下的 references/pua/SKILL.md
2. <source artifact path 1>
3. <design spec path and version>
4. <progress.md path and version, when present>
5. <other linked phase/evidence paths required by the active task>

这些文件全部读取并通过身份/一致性检查前，不得实现、派发实现子 Agent、
修改代码或测试、创建替代 spec，或把状态写成已完成。文件缺失、读取失败、
规范冲突时，先记录 blocked/inconsistent 和解除条件。
```

During generation, replace every task-specific placeholder with the actual path and identity. A generated prompt that still contains unresolved task placeholders fails review. The source set is for Goal startup/resume; it does not replace the brainstorming input gate above.

When the user explicitly requires a full startup read, the resolved source set must include every named phase document even if the default staged policy would defer future phases. The Goal must preserve the distinction between the one-time full startup read and later phase-entry reads.

The resolved startup set must use the same `task_key` and reciprocal design/task-root identities. `progress.md`, when used, sits beside `goal.md`.

## Upstream research boundary

External research is a brainstorming/spec-generation gate, not a second Goal workflow. The final Goal links the reviewed research record and resulting phase/design decisions, but does not restate or initiate web/GitHub research unless the approved spec explicitly defines a runtime research action. This keeps the copyable Goal focused on executing an already reviewed source of truth.

## Semantic review contract

Review only requirements applicable to the actual target Goal. Mark a category `not_applicable` with evidence instead of injecting generic boilerplate.

### Identity and authority

- Goal name, human-readable `task_key`, objective, artifact paths, versions, and governed metadata identify one task and cannot collide with another Goal. CRC values, hashes, UUIDs, and random tokens never appear in artifact names; required checksums remain metadata only.
- The design stem and task-directory name resolve to the same canonical `task_key`; `goal.md` records the design path/version/hash, and the design doc records the task-root and Goal paths.
- User instructions and repository rules govern authority and safety; the design doc governs normative requirements; optional `progress.md` governs the runtime next action.
- Apply strictness inheritance: a reviewed task spec may add stricter review, evidence, UX, tool, or delivery gates, but the generated Goal may not weaken the skill's safety, authorization, evidence, recovery, or blocker rules.
- Detect identity drift whenever a source path, version, governed checksum, `task_key`, or same-level `progress.md` identity changes; stop and review the affected artifacts before continuing.
- Allowed, test-only, read-only, generated, external, and forbidden targets agree with the source artifacts.
- Start/resume authority exists for the unchanged scope. New destructive, irreversible, remote, or expanded actions retain their required gate.

### Architecture-first discipline

For every applicable large module, verify that the candidate Goal points to a passed **架构先行门** rather than hard-coding a generic architecture:

- the gate evaluates **可维护性、稳定性、健壮性** and **大规模压力测试** assumptions;
- it starts from the current repository and may research **同类框架** through **GitHub** or authoritative sources when evidence is useful;
- it records source, version, license/security constraints, and adoption or rejection rationale;
- it rejects a single **大文件** or **大函数** and requires **高内聚、低耦合** boundaries; 
- it does **not** over-engineer ahead of time — design for long-term maintainability, stability, and robustness, not speculative complexity; only add structure the current requirement justifies;
- it uses applicable **瀑布式阶段** gates: architecture baseline and research → contract freeze → core-node implementation and validation → review/fix → integration/stress validation → delivery.

The Goal must return to an affected earlier gate when new evidence invalidates a frozen decision.

### Execution, validation, and review

- Each iteration selects one dependency-ready core node with bounded inputs, outputs, paths, acceptance criteria, and evidence locations.
- Changed behavior uses observed RED → minimal GREEN → REFACTOR. Other work uses the explicit alternate validation mode from the phase spec.
- Bounded subagents receive task briefs, not accumulated conversation history, and never write the same shared file concurrently. Route by task shape: simple exploration/search/question → `luna_worker`; medium implementation/test/analysis → `terra_worker`; high-difficulty implementation/cross-module changes → `sol_worker`; lightweight first-pass review of simple nodes (common-sense bugs, boundary cases, static/leak findings, duplicate interfaces, test correctness, oversized units, perf/UI/UX issues, cleanup) → `luna_reviewer` (read-only); complex architecture/security/compatibility review and high-impact decisions → `sol_advisor` (read-only). `luna_reviewer` is the first filter; escalate deep findings to `sol_advisor`. Each packet must include objective, write boundary, acceptance criteria, exact validation, and escalation conditions. `luna_worker`/`terra_worker`/`sol_worker` must stop and return evidence on ambiguity, unexpected interface/dependency change, security or data-integrity impact, unavailable validation, material scope expansion, or two failed attempts; `luna_reviewer` and `sol_advisor` are read-only, return findings/recommendation and evidence, never claim implementation; `luna_reviewer` escalates to `sol_advisor` when a finding needs deep judgment. The main context owns integration and final acceptance — inspect actual diffs and validation results, not summaries. Unavailable agent → record `agent_unavailable`, fallback or main context; never fabricate results.
- High-risk nodes and phase exits receive the independent review required by the design/phase contract.
- The main context arbitrates every actionable finding as fixed, rejected with evidence, accepted exception with authority, or blocked with an unblock condition.
- Fixes receive scoped retest and re-review before the next dependent node begins.
- Phase delivery follows repository discipline without assuming a particular version-control system.
- Goal completeness: the prompt itself must be executable after staged source loading. Links to source artifacts are normative references, not substitutes for phase instructions, commands, evidence, gates, or terminal states.

### Tool and evidence readiness

- A dependent phase does not begin until its diagnostic, capture, comparison, profiling, automation, or reporting output contract is available and probed.
- Missing capability triggers inspection of existing/repository tools, then maintained MCP or equivalent options when necessary. Repository-local capability is implemented only for a real acceptance need or repeated proven gap.
- Reject acceptance mode downgrade: a requirement for real UI, external effect, screenshot, capture, or current evidence cannot be replaced by a mock, static page, headless smoke test, synthetic result, old artifact, or prose claim.
- Tool limits, version, security/license implications, recovery, and failure modes are recorded.
- Evidence records its meaning-changing inputs: source/data snapshot, revision, configuration, environment, process state, seed/time controls, tool/version, command, timestamp, path, hash, and invalidation keys.
- Identity-matching expensive evidence is reused; it is regenerated only after invalidation or integrity failure.
- “Complete,” “correct,” “consistent,” and “lossless” are replaced by measurable criteria, tolerances, evidence, and narrow exceptions.

### Progress, resume, and focus

- Optional `progress.md` records the active acceptance gate, last evidence, blocker/retry identity, authorization exceptions, and one exact next action.
- After interruption or context compaction, the Goal reads governing rules, design version, optional `progress.md`, and active phase before executing.
- Previously answered questions and handled interruption messages are not repeated during automatic continuation.
- Focus calibration follows the resolved bounded profile at safe boundaries, remains silent when direction is unchanged, and pauses in legitimate blocked/waiting states.
- Reporting follows the user-approved cadence and preserves exact technical evidence.

### Completion

- Maintain a requirement-to-proof coverage map. Every applicable normative requirement must have a Goal rule, implementation/inspection target, validation, review, evidence, and terminal status; a missing mapping is `coverage_gap`, not an implicit success.
- Every applicable normative requirement maps to implementation, current validation, review, evidence, and a terminal status.
- Inventory items, changed files, generated artifacts, external effects, exceptions, and resource observations contain no untracked work.
- Implementation status and evidence status remain separate; stale or missing evidence stays `unverified`.
- Final reporting states only actual completions, current blockers, unblock conditions, residual risks, and the next exact command when work remains.

## Independent review procedure

1. Generate the candidate Goal and save it as the reviewable `docs/superpowers/specs/<task_key>/goal.md` artifact.
2. Dispatch a **context-minimal reviewer** with only:
   - this review contract;
   - the candidate Goal;
   - repository/user rules relevant to authority;
   - reviewed design and phase specs;
   - optional `progress.md`;
   - evidence needed to verify start or resume.
3. Require findings to identify the exact candidate location, violated source, execution impact, and concrete correction.
4. The main context arbitrates and fixes every actionable finding. It may not weaken a higher-precedence requirement merely to make the review pass.
5. Re-review the corrected candidate until it is `approved` or preserves an explicit `blocked` state.
6. Do not add a user document-review gate. There is no user review step after the spec or Goal package is written; do not insert one. Design decisions still require user input during brainstorming when no existing source has authority to resolve them, but written spec/Goal review is not a user gate.

## Review output

```text
Goal review status: approved | issues_found | blocked
Target Goal identity: <name / canonical task_key>
Candidate artifact: <resolved path / version / hash>
Source artifacts: <resolved paths / versions / hashes>
Findings:
- <severity / candidate location / governing source / execution impact / correction>
Main-context rulings:
- <fixed | rejected_with_evidence | accepted_exception_with_authority | blocked>
Unresolved blockers:
- <owner / unblock condition / affected gate>
Approved target Goal: <resolved path / version / hash, only when approved>
First action: <exact evidence-producing action or command>
```

The approved artifact is the task-specific Goal prompt the user can run. This reference never substitutes for that artifact and never starts a Goal by itself.

## Final copy command

After review status is `approved`, the handoff must include this single copyable command, with the resolved absolute path and no placeholders:

```text
/goal "<absolute-path-to-goal.md>"
```

Do not output `/goal` when the Goal is missing, unresolved, `issues_found`, or `blocked`.
