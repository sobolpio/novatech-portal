# NovaTech Client Portal — Starter Repo

A simple static website for CI/CD pipeline training.

## Files
- `index.html` — main page
- `style.css` — styles
- `config.json` — app configuration
- `tests/validate.sh` — test script

## Your task

Build a GitHub Actions pipeline (`.github/workflows/ci-cd.yml`) that does:

### CI (runs on every push/PR to main):
1. **Lint** — install `htmlhint` (`npm install -g htmlhint`) and run it on `*.html`
2. **Test** — run `bash tests/validate.sh`
3. **Build** — zip all app files into an artifact, upload with `actions/upload-artifact`

### CD (runs only after CI passes, only on push to main):
4. **Deploy Staging** — download artifact, simulate deploy with `echo` commands. Use GitHub Environment `staging`.
5. **Deploy Production** — same simulation. Use GitHub Environment `production` with **Required Reviewers** enabled (manual approval).

### Validation:
6. Break `index.html` (e.g., remove `<title>`) → push → show pipeline fails at test stage.
7. Fix it → push → show full green pipeline including production deploy.

## Useful references
- Jobs & dependencies: look up `needs:` keyword
- Environments: Repository Settings → Environments
- Manual approval: Environment → Protection Rules → Required Reviewers
- Artifacts: `actions/upload-artifact@v4`, `actions/download-artifact@v4`
- Conditional execution: `if: github.ref == 'refs/heads/main'`
