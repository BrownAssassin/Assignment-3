#version 420

layout(location = 0) in vec2 inUV;

out vec4 frag_color;

layout (binding = 0) uniform sampler2D s_screenTex;

uniform float u_Intensity;

float random(vec2 n) { 
    return fract(sin(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
}

float noise(vec2 p){
    vec2 ip = floor(p);
    vec2 u = fract(p);
    u = u * u * (3.0 - 2.0 * u);

    float res = mix(
        mix(random(ip), random(ip + vec2(1.0, 0.0)), u.x),
        mix(random(ip + vec2(0.0, 1.0)), random(ip + vec2(1.0, 1.0)), u.x), u.y);

    return res * res; 
}

void main() 
{
    float n = noise(inUV * u_Intensity);
	vec4 source = texture(s_screenTex, inUV);

    if(u_Intensity > 0.0) {
        source.rgb *= n + 0.5;
    }

    frag_color = source;
}