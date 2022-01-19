varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const float TWOPI = 6.28318530718;

const vec3 OUTLINE_COLOR = vec3(1.);
const float OUTLINE_WIDTH = 7.;

const float TOTAL_DIRECTIONS = 128.;

uniform vec2 texel;

void main()
{
    
    vec4 col = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    if (col.a == 0.0) {
        col.rgb = OUTLINE_COLOR;
        
        for (float i = 0.; i < TOTAL_DIRECTIONS; i++) {
            float dir = i * TWOPI / TOTAL_DIRECTIONS;
            vec2 check_pos = texel * vec2(cos(dir), sin(dir));
            col.a += texture2D(gm_BaseTexture, v_vTexcoord + check_pos).a;
        }
    }
    
    gl_FragColor = col;
}