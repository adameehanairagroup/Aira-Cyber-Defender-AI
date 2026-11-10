#!/usr/bin/env python3
"""
Aira Cyber Defender - API Audit Client Example
Demonstrates how to send untrusted code to the Aira Cyber Defender endpoint for automated vulnerability triage.
"""

import os
import requests

API_URL = os.environ.get("AIRA_API_URL", "http://localhost:8080/v1/chat/completions")
API_KEY = os.environ.get("AIRA_API_KEY", "aira-live-secret-key")

VULNERABLE_CODE_SAMPLE = """
void process_packet(char *user_input) {
    char local_buffer[64];
    strcpy(local_buffer, user_input);
    printf("Processed packet: %s\\n", local_buffer);
}
"""

def audit_code(code_snippet: str):
    prompt = f"Perform a rigorous security audit of the following code snippet. Identify any memory corruption vulnerabilities, explain the exploit vector, and provide a secure, hardened patch:\n\n```c\n{code_snippet}\n```"
    
    headers = {
        "Authorization": f"Bearer {API_KEY}",
        "Content-Type": "application/json"
    }
    
    payload = {
        "model": "aira-cyber-defender",
        "messages": [
            {
                "role": "system",
                "content": "You are Aira Cyber Defender, an elite cybersecurity intelligence and defensive audit engine."
            },
            {
                "role": "user",
                "content": prompt
            }
        ],
        "temperature": 0.2,
        "max_tokens": 1024
    }
    
    print("🛡️ Sending code to Aira Cyber Defender...")
    try:
        response = requests.post(API_URL, headers=headers, json=payload, timeout=60)
        response.raise_for_status()
        data = response.json()
        result = data["choices"][0]["message"]["content"]
        print("\n=== AIRA CYBER DEFENDER AUDIT REPORT ===\n")
        print(result)
    except Exception as e:
        print(f"❌ Error connecting to Aira Cyber Defender API: {e}")

if __name__ == "__main__":
    audit_code(VULNERABLE_CODE_SAMPLE)
