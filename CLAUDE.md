# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Purpose

This is a base Docker image for Machine Learning projects. It exists solely to be extended by other Docker images (`FROM jgbustos/ml-model-base:latest`). There is no application code — only a `Dockerfile` and `requirements.txt`.

## Key Commands

Build the image locally:
```bash
docker build -t ml-model-base .
```

Run a quick validation (verify Python and packages load):
```bash
docker run --rm ml-model-base -c "import numpy, pandas, sklearn, lightgbm, xgboost, nltk; print('OK')"
```

## CI/CD

GitHub Actions (`.github/workflows/main.yml`) automatically builds and pushes to DockerHub as `jgbustos/ml-model-base:latest` on every push or PR to `master`. Secrets `DOCKERHUB_USERNAME` and `DOCKERHUB_TOKEN` must be set in the repository settings. The workflow uses multi-platform builds via QEMU and Docker Buildx.

## Architecture

- `Dockerfile`: `python:3.13-slim` base, installs `libgomp1` (required by LightGBM/XGBoost), copies repo contents to `/app`, installs `requirements.txt`, sets `ENTRYPOINT ["python3"]`.
- `.dockerignore`: Excludes `.git`, `.github`, `.claude`, `CLAUDE.md`, `venv`, `README.md`, `LICENSE`, and Python bytecode from the image build context.
- `requirements.txt`: Pinned versions of the core ML/data science stack (NumPy 2.x, Pandas 3.x, SciPy, scikit-learn, LightGBM, XGBoost 3.x, NLTK).

When updating package versions, NumPy 2.x introduced breaking changes; verify compatibility with the other numerical libraries. XGBoost 3.x and Pandas 3.x are also major version bumps with potential API changes.
