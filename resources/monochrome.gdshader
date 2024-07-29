shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;

void fragment() {
	vec4 bg = texture(SCREEN_TEXTURE, SCREEN_UV);
	float avg = (bg.r + bg.g + bg.b) / 3.0;
	
	if (avg < 0.6) {
		COLOR = vec4(avg, avg/2.0, avg, 1.0);
	}
	else {
		COLOR = vec4(avg, avg, avg*0.95, 1.0);
	}
	}