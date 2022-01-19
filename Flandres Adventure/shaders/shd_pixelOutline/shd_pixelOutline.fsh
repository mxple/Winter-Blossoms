varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const vec3 OUTLINE_COLOR = vec3(1.);

uniform vec2 texel;

void main()
{
    
    vec4 col = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    if (col.a == 0.0) {
        col.rgb = OUTLINE_COLOR;
        col.a += texture2D(gm_BaseTexture, v_vTexcoord.x + texel.x).a;
        col.a += texture2D(gm_BaseTexture, v_vTexcoord.x - texel.x).a;
        col.a += texture2D(gm_BaseTexture, v_vTexcoord.y + texel.y).a;
        col.a += texture2D(gm_BaseTexture, v_vTexcoord.y - texel.y).a;
    }
    gl_FragColor = col;
}