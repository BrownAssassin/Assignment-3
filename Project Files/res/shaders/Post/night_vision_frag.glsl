#version 420

layout(location = 0) in vec2 inUV;

out vec4 frag_color;

layout (binding = 0) uniform sampler2D s_screenTex;

void main() 
{
    vec4 color;
    float vignetteAmount, luminence;
    float distanceFromCenter = length( inUV - vec2(0.5,0.5) );
    
    vignetteAmount = 1.0 - distanceFromCenter;
    vignetteAmount = smoothstep(0.1, 1.0, vignetteAmount);
    
    color = texture( s_screenTex, inUV);
    
    luminence = dot(color.rgb, vec3( 0.85, 0.30, 0.10) );
    
    color.rgb = vec3(0.0, luminence, 0.0);
    
    // vignette
    color *=  vignetteAmount * 1.0;
    
	frag_color  = color;
}