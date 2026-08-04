# Long Goal Workflow


Load this reference only after the main skill classifies work as **Long Goal** or **Ultra-long Goal**. It defines the executable spec and lean durable-Goal contract. Ultra-long work additionally loads `ultra-long-goal-workflow.md`.

During Goal execution, use staged document loading: package generation/review may read all phase specs; start/resume reads the design doc, optional same-level `progress.md`, and active phase; future phases load at phase entry; completed phases reopen only for drift, contradiction, design amendment, or review findings.

If the user or the copyable Goal explicitly says `启动前完整读取` and supplies a resolved startup list, that list overrides deferred future-phase loading for startup only. Read and record every listed artifact before the first phase action (`startup_read_set=full`), then continue to use the active-phase entry gate and `staged_read_set` at each transition. Without that explicit directive, defer future phases.

## Source precedence and change control

Use this order when instructions or state disagree:

1. Current user instructions and repository rules: authority, safety, write scope, and explicit overrides.
2. Reviewed design spec: normative requirements, architecture, phase order, and acceptance criteria.
3. Reviewed phase spec: phase-local interfaces and steps, only where consistent with the design doc.
4. Optional same-level `progress.md`: actual runtime status and next exact action.
5. Decision, inventory, tool, traceability, evidence, and verification records when explicitly linked: supporting history and proof.

Lower levels never silently change higher levels. When implementation reveals a normative defect, stop the affected path, record the finding, amend the design doc and impacted phase specs with a version/timestamped decision, update traceability, review the delta, then resume. Runtime progress may advance without rewriting the normative spec.

Reviewed task or repository rules may add stricter review, evidence, UX, tool, or delivery gates for their scope; this strictness inheritance cannot weaken the skill's safety, authorization, evidence, recovery, or blocker rules. If a source path, version, content hash, `task_key`, or same-level `progress.md` identity changes, treat it as identity drift: stop the affected path, compare the changed artifacts, and review before continuing.

## Spec-generation research gate

Research belongs to the brainstorming/specification stage. Immediately after the initial read-only inspection and route classification, decide whether current external evidence is needed:

- For exploratory, open-ended, niche, emerging, time-sensitive, uncertain, or explicitly reference-seeking work, begin web research before settling the design questions.
- For medium or large work, search GitHub and authoritative sources for compatible frameworks or reference repositories before freezing architecture, phase specs, or the design spec.
- For simple, stable, local work, record `research_not_required` and do not browse for ceremony.

Record each search in the applicable research spec and feed its conclusions, limits, and adoption/rejection decision into phase/design traceability. Review changed decisions before approval. The later Goal phase consumes this reviewed record; it does not repeat research unless the approved spec explicitly contains a runtime research step.

## Artifact tiers

Derive one canonical, human-readable `task_key` as `YYYY-MM-DD-<topic>` and never reuse it for an unrelated task. The date is the creation date and does not change on later edits. If the key already exists, append a human-readable scope qualifier or a simple sequence such as `-02`, then use that key for both the design filename and task directory. `<topic>` must be a stable short name using only readable words, digits, Chinese characters, and hyphens; do not use path separators, reserved names, or random-only suffixes. Never append a CRC, content hash, UUID, or random token to an artifact name.

Default layout:

```text
docs/superpowers/specs/
└── <task_key>/
    ├── design.md
    ├── goal.md
    ├── phases/
    └── progress.md (optional runtime record)
```

Repository/user path rules may replace the root, but one task still uses one internally consistent layout. Do not also create default copies under separate `prompts/` trees or a separate top-level `progress/` directory (the deprecated old layout); runtime state uses the single same-level `progress.md` beside `goal.md`.

Identity rules:

- design path: `docs/superpowers/specs/<task_key>/design.md`;
- task root: `docs/superpowers/specs/<task_key>/`;
- phase specs: `docs/superpowers/specs/<task_key>/phases/phase-<number>-<name>.md`;
- copyable Goal: `docs/superpowers/specs/<task_key>/goal.md`;
- runtime progress: optional `docs/superpowers/specs/<task_key>/progress.md` beside `goal.md`;
- no additional runtime artifact directories.

The design doc records `task_key`, task-root path, Goal path, and spec version. `goal.md` and optional `progress.md` record design identity when present. When exact drift detection is required, store the checksum in document metadata rather than the filename. A path, key, version, or governed checksum mismatch is identity drift: stop, compare, repair the affected artifacts, review, and regenerate Goal when its startup source set changed.

| Artifact | Long Goal | Ultra-long Goal |
|---|---:|---:|
| Design doc and `phases/` specs | Required | Required |
| `goal.md` | Required | Required |
| `progress.md` | Optional | Optional |

Use `progress.md` when interruption-safe runtime state needs persistence; do not create additional runtime artifacts.

## Phase design

Split by requirement, dependency, and review boundaries, not by file count. Use only categories the task needs:

1. Discovery and baseline.
2. Contracts, interfaces, inventory, and data model.
3. Tooling and evidence readiness.
4. Core implementation.
5. Integration and workflows.
6. Validation and delivery.

Each phase spec states:

- purpose, scope, non-goals, inputs, outputs, dependencies, owner, and entry gate;
- allowed, test-only, read-only, generated, external, and forbidden targets as applicable;
- interfaces, identities, states, invariants, errors, compatibility, authority, and resource limits;
- ordered implementation or investigation steps, expected results, and evidence locations;
- validation mode for each step;
- reviewer inputs, rollback/blocker conditions, and precise exit gate;
- stable requirement/task IDs that the design doc can trace.

Write each phase to `docs/superpowers/specs/<task_key>/phases/phase-<number>-<name>.md`. The phase name must be human-readable and stable. Phase numbering expresses dependency order only after the architecture and contract sequence is known; never use file count as the decomposition rule.

At phase exit, write sibling `phases/phase-<number>-<name>-completion.md` before advancing. Include completed tasks and evidence, review findings/rulings, core decisions, next-phase relevance/dependencies, residual risks/blockers, changed targets, cleanup, terminal status, and exact next action.

## Architecture-first gate

Before implementing a large module, pass an architecture-first gate designed for long-term maintainability, stability, robustness, and large-scale stress testing. Define module boundaries, dependency direction, data/state flow, extension points, resource ceilings, fault isolation, observability, and rollback before decomposing the module into executable core nodes.

- Inspect the current repository and binding constraints first. Then, under the tool-readiness rules, research the architecture of comparable frameworks. When external evidence is useful, consult GitHub or other public source repositories and authoritative documentation. Record source, version, license/security constraints, and the reason for adopting or rejecting each relevant pattern; never copy an implementation blindly.
- Prohibit a single oversized file or oversized function. Split by responsibility, dependency, and change cadence; maintain high cohesion and low coupling. When the current structure cannot satisfy this, record the smallest boundary refactor and its compatibility impact before implementation.
- Record gate inputs, design artifacts, load/capacity assumptions, measurable indicators, risks, review findings, and a passed/blocked state. Do not begin the module's coding tasks until the gate passes.
- Use waterfall stage gates: architecture baseline and research → module contract freeze → core-node implementation and validation → node review and fixes → module integration and stress validation → phase delivery. Do not cross an exit gate early. When new evidence contradicts an earlier decision, return to the affected stage and record the change.

### Validation modes

Do not force fake RED/GREEN/REFACTOR steps onto work that is not behavior implementation.

| Work | Required validation |
|---|---|
| New or changed behavior | TDD: observe correct RED, minimal GREEN, REFACTOR while green |
| Existing behavior being preserved | Characterization test, then regression evidence |
| Diagnostic/MCP/tool capability | Capability probe or contract test before dependent work |
| Read-only discovery or baseline | Reproducible query/command, captured output, identity and interpretation check |
| Documentation or generated protocol | Schema/placeholder/consistency/traceability validation |
| External effect | Precondition, bounded execution, postcondition, recovery evidence |

Every step names one mode. `N/A` is acceptable only with a concrete alternate validation method; never invent a failing test.

## Design spec

Create `docs/superpowers/specs/<task_key>/design.md` after phase drafts have passed local consistency checks. Do not independently review every phase twice: the independent review happens after the bounded grill has revised the design draft and affected phase drafts.

The revised design doc is the normative implementation source and must:

- map every requirement and phase to dependencies, owner, task, test/validation, review, artifact, and status;
- describe end-to-end architecture, data/state flow, contracts, error/blocker semantics, compatibility, security/authority, non-goals, and precise exceptions;
- order phases and core nodes by dependency, with commands or discovery rules, expected outputs, checkpoint updates, and exit gates;
- turn “complete,” “correct,” “consistent,” or “lossless” into measurable criteria, tolerances, comparison rules, current evidence, and narrow exception lists;
- define baseline, checkpoint, cancellation, rollback, retry, recovery, delivery, and completion gates;
- identify bounded tasks that implementation subagents may own, with exact context, inputs, outputs, write boundaries, validation, and report file;
- define the review hierarchy below and the Goal's minimum progress artifacts;
- include an architecture-gate record before every large module: maintainability, stability, robustness, large-scale stress assumptions, comparable-framework sources (including GitHub when used), decomposition boundaries, cohesion/coupling rationale, and the waterfall stage gates;
- contain no separate implementation-plan handoff.

Phase consistency gate: before Goal generation, compare every phase file against the design doc phase registry. Reject orphan phase files, missing reciprocal links, mismatched task keys or versions, phase requirements absent from design traceability, and phase exit gates not represented in the design doc. During execution, record predecessor evidence before advancing `active_phase`; a numbered phase filename list alone is insufficient.

After the draft exists, run the design gap grill (see the brainstorming-goal SKILL.md Long/Ultra Goal extension → Design gap grill section). Apply each material answer to the design doc and affected phase spec before continuing. Preserve unanswered load-bearing decisions as blockers.

## Subagent execution and review hierarchy

The main context owns integration, source-of-truth changes, shared-file status, and final arbitration. Subagents receive task-local file paths and saved artifacts, never accumulated conversation history.

### Model routing

Classify each bounded task before dispatch:

| Complexity | Preferred agent | Typical work |
|---|---|---|
| Simple | `luna_worker` (gpt-5.6-luna, max) | exploration, code search, documentation, simple bounded implementation |
| Medium | `terra_worker` (gpt-5.6-terra, high) | single-module implementation, tests, ordinary analysis |
| High-difficulty | `sol_worker` (gpt-5.6-sol, max, workspace-write) | cross-module changes, interface/dependency shifts, risky migrations |
| Complex review/decision | `sol_advisor` (gpt-5.6-sol, high, read-only) | architecture, security, compatibility, high-impact decisions |

Independent tasks and workflows may run in parallel only when dependency-ready and write-disjoint. Every brief states model, scope, inputs, outputs, write boundary, validation, evidence path, fallback, and terminal state. Main context verifies returned artifacts; a report is a claim until checked. If model/channel unavailable, record `agent_unavailable` and use a suitable fallback or main context.

- Use fresh/context-minimal implementers for bounded, dependency-ready tasks.
- Never allow concurrent writes to the same file.
- Record the base state before dispatch and the resulting diff/artifacts after return.
- Treat an implementer's report as a claim until the main context or reviewer checks saved evidence.
- For a context-free reviewer, dispatch with no inherited conversation when the platform supports it; provide only the phase/task spec, actual diff, tests/evidence, and review contract.

Review gates:

1. **Task/node review:** required for an independently meaningful compatibility, migration, persistence, security, performance, resource, or other high-risk boundary.
2. **Phase review:** reviews cross-node integration, phase exit criteria, accumulated evidence, and unresolved findings. If a phase has one reviewed node and no additional integration delta, that node review satisfies the phase gate; record this instead of repeating the same review.
3. **Final review:** end-to-end acceptance, scope drift, evidence currentness, terminal states, and zero-untracked work. Do not re-review unchanged task internals without a specific integration concern.

For every actionable finding, the main context records one ruling: fix, rejected with evidence, accepted exception with authority, or blocker with owner/unblock condition. Fixes require scoped retest and re-review. Do not proceed with an unresolved load-bearing finding.

If the reviewed design doc, phase spec, or user instructions require review for every task/node, preserve that stricter gate; the default phase-review de-duplication rule cannot replace it.

If subagents are unavailable:

- For low/medium-risk work, use a saved-input independent second pass that has the same review contract and record `review_substitute`.
- For high-risk gates that explicitly require independent context, record `review_unavailable` and block that gate rather than fabricating independence.

Do not invoke plan-only execution skills. Dispatch bounded agents directly from task briefs extracted from the design doc or phase spec.

## Progress and resume protocol

Use phase files and `goal.md` as durable artifacts. If runtime state must persist across interruption, use same-level `docs/superpowers/specs/<task_key>/progress.md`.

When `progress.md` exists, it remains compact and contains:

- Goal/spec version, active phase/task ID, state, owner, and current acceptance gate;
- last verified evidence and relevant artifact IDs;
- blockers/retry identity and counts;
- active authorization/write-scope exceptions;
- exact next evidence-producing action or command;
- no extra runtime links;
- last focus-calibration time and reporting policy.

Use `progress.md` or the Goal itself as runtime record.

After compaction or interruption:

1. Read repository rules and design version.
2. Read optional `progress.md` and only explicitly linked evidence.
3. Verify workspace/revision, changed files, locks, relevant process health, authorization, and artifact identity.
4. If records disagree, apply source precedence and repair state before implementation.
5. Run the recorded next evidence-producing action. Never reconstruct completed work from memory or rerun an identity-matching artifact without invalidation.

Before entering a later phase, read predecessor completion record and verify exit status plus next-phase entry evidence. Missing completion record blocks transition.

## Goal package

Generate `docs/superpowers/specs/<task_key>/goal.md`. Generate optional same-level `progress.md` only when runtime state needs persistence.

Before start authorization is consumed, review the design doc, phase registry, and Goal prompt. Record review status in the Goal or user-facing execution record; do not create a separate review document merely for completeness. If an independent reviewer is unavailable, record `review_substitute` for low/medium-risk work or `review_unavailable` and block the affected high-risk gate. A Goal may not claim registry validation or independent review is complete without evidence.

Repository/user path rules override these defaults.

The Goal links source specs, precedence, phase order, validation, review, recovery, authorization, delivery, and completion gates. Optional `progress.md` records runtime state.

Resolve the installed brainstorming-goal skill root from the loaded `SKILL.md`, then read `references/caveman/SKILL.md` and `references/pua/SKILL.md` from that same root. After reading, Caveman is enabled by default for the active Long/Ultra Goal; `normal mode` or `stop caveman` disables it. PUA's own trigger is scenario-based per its skill; in addition, this skill applies a periodic focus check every 20 minutes, run only at a safe command/tool boundary — pause during active commands/tests/reviews and run one catch-up check after resuming. These skills cannot override user/repository rules, spec requirements, authorization, evidence, retry caps, blockers, or terminal states. No derived profiles, absolute paths, versions, or SHA-256 fields are required.

Generate the user prompt from `goal-prompt-template.md` and save the candidate/final artifact as `goal.md`. Replace placeholders only with values established by the specs. Do not copy the design doc into `goal.md`; link its resolved identity. A prompt draft does not create a Goal. Existing explicit authorization to execute the unchanged scope counts as start authorization; otherwise ask once to start or resume.

Review the Goal and phase specs against the design doc. Exercise interruption/resume, failed/cancelled work, blocked dependency, missing evidence/tool/reviewer, conflicting edits, authorization change, spec amendment, and final integration. Every state must reach a recorded completed, cancelled, blocked, unavailable, or superseded terminal state.

Final handoff is minimal: when Goal review is `approved`, output exactly one copyable `/goal "<absolute-path-to-goal.md>"` command. Resolve and verify the absolute path before reporting it. Do not emit this command for `issues_found`, `blocked`, or missing Goal artifacts.

## Tool readiness, retries, and delivery

- Inspect existing and repository-local capability before seeking another tool.
- When a required capability remains missing, consult authoritative documentation and maintained public source repositories for a compatible MCP or equivalent; evaluate license, security, versioning, maintenance, and evidence export.
- Implement the smallest repository-scoped capability only when a named acceptance need requires it or repeated evidence shows existing tools are insufficient. Add a probe/test, contract, failure modes, and saved evidence first.
- Do not perform an acceptance mode downgrade. A requirement for a real UI, external effect, screenshot/capture, or current evidence cannot be replaced by a mock, static page, headless smoke test, synthetic result, stale artifact, or prose claim. If the required mode is unavailable, preserve the affected item as `tool_unavailable`, `evidence_unavailable`, `blocked`, or `unverified`.
- Use retry identity, limit, materially changed hypothesis predicate, stop condition, and unblock condition. Stop unchanged retries at the declared cap.
- Repeated failure does not automatically justify a new skill. Crystallize a procedure only after the same multi-step workflow has occurred at least three times, has stable inputs/outputs, is likely reusable, and has validation evidence. Otherwise record a diagnostic/recovery entry.
- Use bounded waits with observation window, health check, protected-process rule, and recovery action. No blind long waits.
- Deliver one scoped task/phase only after review, fixes, rerun evidence, and progress update. The repository/user determines the actual submission mechanism; never assume one or mix unrelated changes.

## Completion

Complete only when all applicable requirements and phase gates have current evidence, load-bearing findings are resolved, declared blockers have terminal records, scope drift is reconciled, and no tracked work item remains in an incomplete implementation/evidence state. Report actual completion, current blockers, unblock conditions, and the next action—never inferred success.
