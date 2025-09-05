#!/usr/bin/env python3
"""
AI Text Summarizer by Jatin Jangid
Combined FastAPI backend and deployment helper
"""

import subprocess
import sys
import os
import signal
import time
from multiprocessing import Process

def run_backend():
    """Run the FastAPI backend."""
    os.system("uvicorn app:app --host 0.0.0.0 --port ${PORT:-8000}")

def run_frontend():
    """Run the Streamlit frontend."""
    os.system("streamlit run frontend.py --server.port=${PORT:-8501} --server.address=0.0.0.0")

def main():
    """Main deployment function."""
    mode = os.environ.get("APP_MODE", "backend")
    
    if mode == "frontend":
        print("🚀 Starting Streamlit Frontend by Jatin Jangid...")
        run_frontend()
    else:
        print("🚀 Starting FastAPI Backend by Jatin Jangid...")
        run_backend()

if __name__ == "__main__":
    main()
