"""Thin LLM client: one function, OpenAI-compatible chat endpoint, env-configured.

Defaults to a local ollama server so the tool runs with no API key. Swapping the
three env vars points it at any OpenAI-compatible provider (incl. an embeddings
endpoint as a later upgrade for the retriever).
"""
import json
import os
import urllib.error
import urllib.request

BASE_URL = os.environ.get("LLM_BASE_URL", "http://127.0.0.1:11434/v1")
MODEL = os.environ.get("LLM_MODEL", "qwen3:30b-a3b-instruct-2507-q4_K_M")
API_KEY = os.environ.get("LLM_API_KEY", "ollama")


class LLMError(RuntimeError):
    """Raised when the model is unreachable or returns an unexpected payload."""


def chat(messages, temperature=0.2, timeout=60):
    """Send chat messages, return the assistant text. Raises LLMError on failure."""
    url = BASE_URL.rstrip("/") + "/chat/completions"
    body = json.dumps(
        {"model": MODEL, "messages": messages, "temperature": temperature}
    ).encode("utf-8")
    req = urllib.request.Request(
        url,
        data=body,
        headers={
            "Content-Type": "application/json",
            "Authorization": f"Bearer {API_KEY}",
        },
    )
    try:
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            data = json.loads(resp.read().decode("utf-8"))
        return data["choices"][0]["message"]["content"]
    except (urllib.error.URLError, OSError, KeyError, ValueError, IndexError) as e:
        raise LLMError(
            f"LLM call failed (base_url={BASE_URL}, model={MODEL}): {e}"
        ) from e
