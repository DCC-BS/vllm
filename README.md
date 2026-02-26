# vLLM Patched Image

This repository provides a custom build of [vLLM](https://github.com/vllm-project/vllm) that includes a patched version of the `transformers` library installed directly from source.

## Intent

The primary purpose is to maintain a Docker image compatible with `vllm/vllm-openai` but with the latest `transformers` features or fixes from the `huggingface/transformers` main branch. This is useful when the served model requires a specific transformer version that hasn't been officially released or integrated into the upstream vLLM images yet. An example of such a model is [GLM-OCR](https://huggingface.co/zai-org/glm-ocr).

## How it works

The [Dockerfile](./Dockerfile) uses an `ARG BASE_TAG` to pull a specific version of `vllm/vllm-openai` and then updates the `transformers` package using `uv`.

## CI/CD Workflow

The GitHub Actions workflow [Build and Publish Patched vLLM](.github/workflows/publish.yml) can be triggered manually via `workflow_dispatch`.

### Inputs

- `vllm_tag`: The upstream vLLM image tag to use as a base (e.g., `v0.7.2-cu124`). Defaults to `latest`.

### Outputs

The workflow builds and pushes the image to GitHub Container Registry (GHCR):
- `ghcr.io/DCC-BS/vllm:<vllm_tag>`
- `ghcr.io/DCC-BS/vllm:latest`

## Usage

You can pull the latest patched image:

```bash
docker pull ghcr.io/DCC-BS/vllm:latest
```

Or a specific version:

```bash
docker pull ghcr.io/DCC-BS/vllm:v0.16.0-cu130
```
