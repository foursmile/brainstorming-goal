# Ultra-Long Goal Workflow

Ultra-long uses the same required artifacts as Long Goal: design spec, `goal.md`, and `phases/`. `progress.md` beside `goal.md` is the only runtime progress file.

## Additional ultra-long controls

- Keep a complete work-item inventory in the design doc or phase documents. Each item has stable ID, scope, dependency, implementation target, validation, evidence, risk, and terminal status.
- Keep authorization and write scope explicit in the design doc or active phase: allowed, test-only, read-only, generated, external, and forbidden targets.
- Probe every required tool and evidence path before dependent work. Record tool version, command, environment, failure mode, recovery, and evidence location in the owning phase or `progress.md`.
- Use deterministic comparison for expensive evidence: record the fixed input, revision/configuration, seed/time controls, process state, command, timestamp, output path, and invalidation condition when each is materially relevant to the result.
- Monitor long-lived processes with bounded waits, health checks, protected-process rules, and cleanup actions. Never use blind waits.
- Preserve interruption safety through `progress.md`; after compaction read repository rules, the design doc, `progress.md` when present, and active phase before continuing.
- Every phase exit receives an independent second pass when required by design risk. Record each finding and ruling in the Goal, phase completion record, or `progress.md`.

## Final acceptance

Complete only when every design requirement and phase exit has current evidence, every work item has terminal status, all protected processes are cleaned up, and no scope or authorization drift remains. Missing evidence is `unverified`; unavailable tooling is `tool_unavailable`; unresolved load-bearing issues are `blocked`.
