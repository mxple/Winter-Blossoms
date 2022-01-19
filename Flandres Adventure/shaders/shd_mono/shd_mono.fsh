//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;


void main()
{
    vec4 Color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor = vec4(vec3((Color.r+Color.g+Color.b)/3.0), Color.a);
}
