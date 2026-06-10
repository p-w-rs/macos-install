# ─── CUDA (Linux / NVIDIA box only) ──────────────────────────────────────────
# Supplements /etc/profile.d/cuda.sh (which usually handles PATH + CUDA_PATH).
if [[ -d /opt/cuda ]]; then
    export CUDA_HOME="/opt/cuda"
    export CUDNN_PATH="/opt/cuda"
    export LD_LIBRARY_PATH="/opt/cuda/lib64:${LD_LIBRARY_PATH:-}"

    # Reduce fragmentation for PyTorch on the GPU.
    export PYTORCH_ALLOC_CONF=expandable_segments:True
fi
