// This is what happens to every pixel in a given fragment or polygon being rendered

precision lowp float; // prevents us from writing lowp every time

uniform float iTime;
varying vec3 vPosition;

vec3 pallete(float t) { //returns gradient of pallete or 4 colors 
    vec3 a = vec3(0.558, 0.57, .57);
    vec3 b = vec3(-0.878, 0.395, .395);
    vec3 c = vec3(1.359, 0.8, 0.8);
    vec3 d = vec3(-0.682, 0.333, 0.667);
    return a + b*cos(6.28318*(c*t+d));
}

void main(void) {
    vec2 uv = vec2(vPosition.x, vPosition.y);
    float d = length(uv); // distance from origin
    vec3 ringColor = pallete(d);

    d = sin(d * 8.0 + iTime)/8.0;
    d = abs(d); //makes inside ring white

    d = 0.03/d; 
    ringColor *= d;

    gl_FragColor = vec4(ringColor, 1.0);
}