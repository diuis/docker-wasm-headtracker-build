FROM diuis/docker-emsdk-opencv3-wasm:v1.1.0

USER root
RUN mkdir /opencv_wasm_lux && chown appuser /opencv_wasm_lux

USER appuser
ADD ./build_opencv_emscripten.py /opencv_wasm_lux/
SHELL ["/bin/bash", "-c"]
RUN source /emsdk/emsdk_env.sh && \
    python /opencv_wasm_lux/build_opencv_emscripten.py --opencv_dir /opencv/opencv-3.4.4 --install_dir /opencv_wasm_lux --emscripten_dir /emsdk/emscripten/1.38.21 /opencv_wasm_lux
