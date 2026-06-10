# ─── CUDA (Linux / NVIDIA box only) ──────────────────────────────────────────
# Double-guarded: only on Linux AND only if /opt/cuda exists. This means the
# file ships to macOS harmlessly and simply does nothing there.
if is_linux && [[ -d /opt/cuda ]]; then
    export CUDA_HOME="/opt/cuda"
    export CUDNN_PATH="/opt/cuda"
    export LD_LIBRARY_PATH="/opt/cuda/lib64:${LD_LIBRARY_PATH:-}"
    export PYTORCH_ALLOC_CONF=expandable_segments:True
fi
