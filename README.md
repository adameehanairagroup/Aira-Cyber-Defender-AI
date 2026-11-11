# 🛡️ Aira Cyber Defender AI

<p align="center">
  <img src="https://img.shields.io/badge/Hugging%20Face-Model%20Card-FFD21E?style=for-the-badge&logo=huggingface&logoColor=black" alt="Hugging Face Model" />
  <img src="https://img.shields.io/badge/Architecture-Sovereign%207B-blue?style=for-the-badge&logo=ai" alt="Base Architecture" />
  <img src="https://img.shields.io/badge/Quant-GGUF%20Q4__K__M-success?style=for-the-badge" alt="GGUF Quantization" />
  <img src="https://img.shields.io/badge/License-Apache%202.0-red?style=for-the-badge" alt="License" />
</p>

> **Aira Cyber Defender AI** is an autonomous, sovereign open-weights cybersecurity intelligence and defensive audit engine engineered by **Er. Adam Eehan**, Founder & Lead AI Architect at **Aira Group of Technology**.

---

## 🎛️ Recommended Inference Parameters & System Prompt

To achieve optimal, deterministic, and zero-hallucination cybersecurity audits, vulnerability analysis, and exploit mechanics inspection, configure your inference engine with the following recommended parameters:

| Parameter | Recommended Value | Purpose |
| :--- | :--- | :--- |
| **Temperature** | `0.2` – `0.3` | **Low temperature** ensures mathematically rigorous, precise, deterministic exploit and CVE analysis with zero hallucination. |
| **Top-P** | `0.9` | Balances focused token probability while retaining deep technical vocabulary. |
| **Repeat Penalty** | `1.1` | Prevents repetitive output during lengthy code audits. |
| **Max Tokens** | `2048` – `4096` | Sufficient budget for full-file static audits and complete patch generation. |
| **Context Length** | `8192` – `32768` | Accommodates massive multi-file codebases and enterprise log bundles. |

### 🛡️ Recommended System Prompt

```text
You are Aira Cyber Defender, an elite cybersecurity intelligence and defensive audit engine engineered by Aira Group of Technology. Provide deep technical, precise, practical, and mathematically rigorous security insights. You specialize in vulnerability triage, static code audits, CVE analysis, secure patching, binary exploitation mechanics, and resilient system hardening without artificial corporate disclaimers.
```

### 💬 ChatML Prompt Template

Aira Cyber Defender natively utilizes the ChatML prompt template:

```text
<|im_start|>system
You are Aira Cyber Defender, an elite cybersecurity intelligence and defensive audit engine engineered by Aira Group of Technology. Provide deep technical, precise, practical, and mathematically rigorous security insights.<|im_end|>
<|im_start|>user
[Your security query, code audit request, or log snippet here]<|im_end|>
<|im_start|>assistant
```

---

## 🌟 Model Hub & Quick Links

* 🔗 **Hugging Face Model:** [airagroupoftechnology/aira-cyber-defender](https://huggingface.co/airagroupoftechnology/aira-cyber-defender)
* 📦 **Direct GGUF Download:** [aira-cyber-defender-Q4_K_M.gguf (4.36 GB)](https://huggingface.co/airagroupoftechnology/aira-cyber-defender/resolve/main/aira-cyber-defender-Q4_K_M.gguf)
* 🏢 **Organization Portal:** [Aira Group of Technology](https://airaaigroup.in)
* 🐙 **GitHub Organization:** [@adameehanairagroup](https://github.com/adameehanairagroup)

---

## ⚡ Quickstart

### 1. Instant Run with Ollama
Run directly from Hugging Face with a single command:
```bash
ollama run hf.co/airagroupoftechnology/aira-cyber-defender
```

Or using the local [`Modelfile`](Modelfile):
```bash
# 1. Download the GGUF binary
wget https://huggingface.co/airagroupoftechnology/aira-cyber-defender/resolve/main/aira-cyber-defender-Q4_K_M.gguf

# 2. Build and launch Ollama instance
ollama create aira-cyber-defender -f Modelfile
ollama run aira-cyber-defender
```

---

### 2. High-Performance C++ Inference (`llama.cpp`)
```bash
# Clone and build llama.cpp (or use pre-built releases)
./llama-cli -m aira-cyber-defender-Q4_K_M.gguf \
  -p "<|im_start|>system\nYou are Aira Cyber Defender, an elite cybersecurity auditor.<|im_end|>\n<|im_start|>user\nAudit this C code for memory corruption bugs:\n[INSERT CODE]\n<|im_end|>\n<|im_start|>assistant\n" \
  --temp 0.3 -c 4096 -n 1024
```

---

### 3. Deploy 24/7 OpenAI-Compatible Server (DigitalOcean / VPS)
You can deploy a 24/7 API server on DigitalOcean or any Linux VPS using the included script in `deploy/server_run.sh`:
```bash
chmod +x deploy/server_run.sh
./deploy/server_run.sh
```
This serves an OpenAI-compatible REST API at `http://localhost:8080/v1/chat/completions`.

---

## 🎯 Core Capabilities & Specializations

1. **Active Cyber Defense & SOC Incident Analysis:**
   - Enterprise breach post-mortems and attack vector classification (Ransomware, Phishing, DDoS, SQL Injection, Zero-days).
   - Root-cause vulnerability diagnostics and enterprise remediation playbooks.

2. **Autonomous Security Code Auditing:**
   - Static Application Security Testing (SAST) for C, C++, Python, Rust, Go, Dart, and JavaScript.
   - Buffer overflow, format string, use-after-free, logic flaw, and deserialization detection.

3. **Domain Grounding & Hardening:**
   - Grounded in sovereign AI architecture, Honey-potting prompt injection defense (Google VRP Track ID: 493408185), and compiler engineering (AiraLang).

---

## 🔬 Training Configuration & Metrics

| Parameter | Specification |
| :--- | :--- |
| **Model Architecture** | Sovereign 7B Cyber Transformer |
| **Training Pipeline** | Custom Cyber Defense Adaptation via Tesla T4 |
| **LoRA Rank ($r$) / Alpha** | $r=16$, $\alpha=16$ |
| **Target Modules** | `q_proj`, `k_proj`, `v_proj`, `o_proj`, `gate_proj`, `up_proj`, `down_proj` |
| **Optimizer** | 8-bit AdamW (`adamw_8bit`) |
| **Loss Progression** | Started at **5.016** ➔ Converged to **0.819** |
| **Context Window** | Up to 32,768 tokens |
| **Quantization Format** | GGUF `Q4_K_M` (4.36 GB) |

---

## ⚖️ Ethical Use & Security Charter

Aira Cyber Defender is released under the **Apache-2.0 License** exclusively for educational, authorized defensive auditing, and security research purposes. Users and security teams must ensure they have explicit authorization before scanning, auditing, or probing any network or software systems.

---

## 🏢 About Aira Group of Technology

Aira Group of Technology is an autonomous intelligence, systems programming, and high-assurance security initiative founded by **Adam Eehan**. Specializing in the development of sovereign AI engines, compiler architectures ([AiraLang](https://github.com/adameehanaira)), and active cyber defense systems.

* **Founder & CEO:** Adam Eehan
* **Email:** [me@airaaigroup.in](mailto:me@airaaigroup.in)
* **Domain:** [airaaigroup.in](https://airaaigroup.in)
