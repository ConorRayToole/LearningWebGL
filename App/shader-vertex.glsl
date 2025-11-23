// vertex data is in buffer then this code processes it
attribute vec4 aVertexPosition; // holds the (x,y,z,w) position of each vertex

uniform mat4 uModelViewMatrix; //camera? 
uniform mat4 uProjectionMatrix; //depth in this case

varying lowp vec3 vPosition;

void main(void) { //runs for every vertex
    vPosition = aVertexPosition.xyz; // passes it to fragment file
    gl_Position = uProjectionMatrix * uModelViewMatrix * aVertexPosition;
}