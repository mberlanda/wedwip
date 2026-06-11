# Security Policy

This repository contains a fully static website: no server-side code, no database, no
authentication, no user input handling. The only dependencies are the npm build
toolchain (Dependabot-monitored) and the vendored 2016 theme assets served verbatim on
`/archive/*` (risk assessed and accepted in
[docs/security/remediation-plan.md](docs/security/remediation-plan.md)).

## Reporting a vulnerability

Please open a [GitHub security advisory](https://github.com/mberlanda/wedwip/security/advisories/new)
or contact the repository owner. There is no bug bounty — this is a personal website —
but reports are appreciated and will be addressed on a best-effort basis.

## Assessment

The full security posture assessment and remediation history are documented in
[docs/security/](docs/security/).
