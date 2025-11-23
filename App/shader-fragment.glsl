// This is what happens to every pixel in a given fragment or polygon being rendered

precision lowp float; // prevents us from writing lowp every time

uniform float iTime;
varying vec3 vPosition;

void main(void) {
    vec2 uv = vec2(vPosition.x, vPosition.y);
    vec3 ringColor = vec3(0.0, 0.5, 1.0);

    float d = length(uv); // distance from origin
    d = sin(d * 8.0 + iTime)/8.0;
    d = abs(d); //makes inside ring white

    d = 0.05/d; 
    ringColor *= d;

    gl_FragColor = vec4(ringColor, 1.0);
}