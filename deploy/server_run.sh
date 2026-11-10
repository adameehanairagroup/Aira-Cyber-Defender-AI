#!/usr/bin/env bash
# ==============================================================================
# Aira Cyber Defender - 24/7 DigitalOcean / Linux VPS Deployment Script
# Managed by Aira Group of Technology (Er. Adam Eehan)
# ==============================================================================

set -e

MODEL_NAME="aira-cyber-defender-Q4_K_M.gguf"
MODEL_URL="https://huggingface.co/airagroupoftechnology/aira-cyber-defender/resolve/main/${MODEL_NAME}"
PORT=${PORT:-8080}
API_KEY=${API_KEY:-"aira-live-secret-key"}

echo "🛡️ Starting Aira Cyber Defender AI Deployment..."

# 1. Download Model if not present
if [ ! -f "$MODEL_NAME" ]; then
    echo "⬇️ Downloading ${MODEL_NAME} from Hugging Face..."
    wget -c "$MODEL_URL" -O "$MODEL_NAME"
else
    echo "✅ Model file already exists: ${MODEL_NAME}"
fi

# 2. Check for llama-server binary
if ! command -v llama-server &> /dev/null; then
    echo "📦 llama-server not found in PATH. Checking local directory..."
    if [ ! -f "./llama-server" ]; then
        echo "🔧 Installing pre-built llama.cpp binaries..."
        OS_ARCH=$(uname -m)
        if [ "$OS_ARCH" = "x86_64" ]; then
            RELEASE_URL="https://github.com/ggerganov/llama.cpp/releases/latest/download/llama-b4130-bin-ubuntu-x64.zip"
        else
            RELEASE_URL="https://github.com/ggerganov/llama.cpp/releases/latest/download/llama-b4130-bin-arm64.zip"
        fi
        
        wget -q "$RELEASE_URL" -O llama_bin.zip || true
        if [ -f llama_bin.zip ]; then
            unzip -q llama_bin.zip -d ./llama_dist || true
            cp ./llama_dist/build/bin/llama-server ./ || cp ./llama_dist/llama-server ./ || true
            chmod +x ./llama-server || true
            rm -rf llama_bin.zip ./llama_dist
        fi
    fi
fi

LLAMA_BIN="llama-server"
if [ -f "./llama-server" ]; then
    LLAMA_BIN="./llama-server"
fi

echo "🚀 Launching Aira Cyber Defender API on port ${PORT}..."
exec $LLAMA_BIN \
  -m "$MODEL_NAME" \
  --host 0.0.0.0 \
  --port "$PORT" \
  --api-key "$API_KEY" \
  --threads "$(nproc)" \
  -c 4096 \
  -ngl 99 \
  --metrics
