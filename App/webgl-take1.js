import { initBuffers } from "../Utils/init-buffers.js";
import { drawScene } from "../Utils/draw-scene.js";
import { initShaderProgram } from "./shader-program.js";
import { fetchShaderTexts } from "../Utils/fetch-shaders.js";

main();

function main() {
  const canvas = document.querySelector("#gl-canvas");
  const gl = canvas.getContext("webgl");

  if (gl === null) {
    alert(
      "Unable to initialize WebGL. Your browser or machine may not support it"
    );
    return;
  }

  // Set clear color to black, fully opaque
  gl.clearColor(0.0, 2.0, 6.0, 1.0);
  // Clear the color buffer with specified clear color
  gl.clear(gl.COLOR_BUFFER_BIT);

  fetchShaderTexts("./shader-vertex.glsl", "./shader-fragment.glsl").then(
    (shader) => {
      const shaderProgram = initShaderProgram(
        gl,
        shader.vertexShaderText,
        shader.fragmentShaderText
      );

      const programInfo = {
        program: shaderProgram,
        attribLocations: {
          vertexPosition: gl.getAttribLocation(
            shaderProgram,
            "aVertexPosition"
          ),
          vertexColor: gl.getAttribLocation(shaderProgram, "aVertexColor"),
        },
        uniformLocations: {
          projectionMatrix: gl.getUniformLocation(
            shaderProgram,
            "uProjectionMatrix"
          ),
          modelViewMatrix: gl.getUniformLocation(
            shaderProgram,
            "uModelViewMatrix"
          ),
          iTime: gl.getUniformLocation(shaderProgram, "iTime"),
        },
      };

      const buffers = initBuffers(gl);
      // Start the render loop
      function render(time) {
        drawScene(gl, programInfo, buffers, time);
        requestAnimationFrame(render); // Keep looping!
      }

      requestAnimationFrame(render);
    }
  );
}
