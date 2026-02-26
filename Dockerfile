ARG BASE_TAG=v0.16.0-cu130
FROM vllm/vllm-openai:${BASE_TAG}

# Install patched transformers from source using uv
RUN uv pip install --system git+https://github.com/huggingface/transformers.git
