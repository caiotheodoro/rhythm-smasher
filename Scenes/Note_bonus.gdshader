shader_type canvas_item;
//A shader by 刚学shader的小策划@SL

uniform float effect_filling: hint_range(0.0, 1.0, 0.01) = 1.0;
uniform float angle: hint_range(-180.0, 180.0, 0.1) = 0.0;
uniform float keep_saturation: hint_range(0.0, 1.0, 0.01) = 1.0;
uniform float keep_luminance: hint_range(0.0, 1.0, 0.01) = 1.0;
uniform vec4 color_start: source_color = vec4(1.0);
uniform float start_pos: hint_range(0.0, 1.0, 0.01) = 0.0;
uniform vec4 color_mid: source_color = vec4(1.0);
uniform float mid_pos: hint_range(0.0, 1.0, 0.01) = 0.5;
uniform vec4 color_end: source_color = vec4(1.0);
uniform float end_pos: hint_range(0.0, 1.0, 0.01) = 1.0;
uniform bool midpos_enabled = false;

uniform float range_start: hint_range(0.0, 1.0, 0.01) = 0.0;
uniform float range_end: hint_range(0.0, 1.0, 0.01) = 1.0;
uniform float range_softedge: hint_range(0.0, 1.0, 0.01) = 0.1;

//Functions from @nonunknown
vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void fragment() {
	vec4 tex = texture(TEXTURE, UV);
	vec3 hsv = rgb2hsv(tex.rgb);
	
	vec2 angle_vec = vec2(cos(angle/180.0*PI),sin(angle/180.0*PI));
	float _uv_pos = dot(vec2(UV.x-0.5, UV.y-0.5),angle_vec) + 0.5;
	
	// the .r here represents HUE, .g is SATURATION, .b is LUMINANCE
	vec4 color = vec4(1.0);
	
	if (_uv_pos < start_pos) {color = color_start;}
	if (_uv_pos > end_pos) {color = color_end;}
	
	if (_uv_pos > start_pos && _uv_pos < end_pos){
		if (midpos_enabled && mid_pos > start_pos && mid_pos < end_pos){
			if (_uv_pos > mid_pos){
				color = mix(color_mid, color_end, (_uv_pos-mid_pos)/(end_pos-mid_pos));
			}
			else{
				color = mix(color_start, color_mid,(_uv_pos-start_pos)/(mid_pos-start_pos));
			}
		}
		else {
			color = mix(color_start, color_end, (_uv_pos-start_pos)/(end_pos-start_pos));
		}
	}
	
	vec3 _c = rgb2hsv(color.rgb);
	vec3 new_color = vec3(_c.r,mix(_c.g,hsv.g,keep_saturation),mix(_c.b,hsv.b,keep_luminance));
	
	tex = vec4(hsv2rgb(new_color),tex.a);
	
	//Range参数在这里生效：超出Range范围时调整其实际filling值
	float _filling = effect_filling;
	
	if (range_start > 0.0){
		if (_uv_pos < (range_start - range_softedge)){_filling = 0.0;}
		if (_uv_pos > (range_start - range_softedge) && _uv_pos < (range_start + range_softedge)){
			_filling *= (_uv_pos - (range_start - range_softedge))/ (range_softedge*2.0) ;}
		}
		
	if (range_end < 1.0 && range_end > range_start){
		if (_uv_pos > (range_end + range_softedge)){_filling = 0.0;}
		if (_uv_pos > (range_end - range_softedge) && _uv_pos < (range_end + range_softedge)){
			_filling *= 1.0 - (_uv_pos - (range_end - range_softedge))/ (range_softedge*2.0) ;}
		}
	
	COLOR = mix( texture(TEXTURE, UV), tex, _filling);
	COLOR.a = texture(TEXTURE, UV).a;
}