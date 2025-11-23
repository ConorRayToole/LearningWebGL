void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;

    // Determine color based on pixel position
    vec3 col = vec3(0.0); // Default to black

    // Example: draw a line down the middle
    if (uv.x < 0.3
    ) {
        col = vec3(1.0); // White
    }

    // Output to screen
    fragColor = vec4(col, 1.0);
}
