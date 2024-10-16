#define ICON_NOT_SET "Not Set"

//This is stored as a nested list instead of datums or whatever because it json encodes nicely for usage in tgui
var/global/list/master_filter_info = list(
	"alpha" = list(
		"defaults" = list(
			"x" = 0,
			"y" = 0,
			"icon" = ICON_NOT_SET,
			"render_source" = "",
			"flags" = 0
		),
		"flags" = list(
			"MASK_INVERSE" = MASK_INVERSE,
			"MASK_SWAP" = MASK_SWAP
		)
	),
	"angular_blur" = list(
		"defaults" = list(
			"x" = 0,
			"y" = 0,
			"size" = 1
		)
	),
	/* Not supported because making a proper matrix editor on the frontend would be a huge dick pain.
		Uncomment if you ever implement it
	"color" = list(
		"defaults" = list(
			"color" = matrix(),
			"space" = FILTER_COLOR_RGB
		)
	),
	*/
	"displace" = list(
		"defaults" = list(
			"x" = 0,
			"y" = 0,
			"size" = null,
			"icon" = ICON_NOT_SET,
			"render_source" = ""
		)
	),
	"drop_shadow" = list(
		"defaults" = list(
			"x" = 1,
			"y" = -1,
			"size" = 1,
			"offset" = 0,
			"color" = COLOR_HALF_TRANSPARENT_BLACK
		)
	),
	"blur" = list(
		"defaults" = list(
			"size" = 1
		)
	),
	"layer" = list(
		"defaults" = list(
			"x" = 0,
			"y" = 0,
			"icon" = ICON_NOT_SET,
			"render_source" = "",
			"flags" = FILTER_OVERLAY,
			"color" = "",
			"transform" = null,
			"blend_mode" = BLEND_DEFAULT
		),
		"flags" = list(
			"FILTER_OVERLAY" = FILTER_OVERLAY,
			"FILTER_UNDERLAY" = FILTER_UNDERLAY
		),
	),
	"motion_blur" = list(
		"defaults" = list(
			"x" = 0,
			"y" = 0
		)
	),
	"outline" = list(
		"defaults" = list(
			"size" = 0,
			"color" = COLOR_BLACK,
			"flags" = NONE
		),
		"flags" = list(
			"OUTLINE_SHARP" = OUTLINE_SHARP,
			"OUTLINE_SQUARE" = OUTLINE_SQUARE
		)
	),
	"radial_blur" = list(
		"defaults" = list(
			"x" = 0,
			"y" = 0,
			"size" = 0.01
		)
	),
	"rays" = list(
		"defaults" = list(
			"x" = 0,
			"y" = 0,
			"size" = 16,
			"color" = COLOR_WHITE,
			"offset" = 0,
			"density" = 10,
			"threshold" = 0.5,
			"factor" = 0,
			"flags" = FILTER_OVERLAY | FILTER_UNDERLAY
		),
		"flags" = list(
			"FILTER_OVERLAY" = FILTER_OVERLAY,
			"FILTER_UNDERLAY" = FILTER_UNDERLAY
		)
	),
	"ripple" = list(
		"defaults" = list(
			"x" = 0,
			"y" = 0,
			"size" = 1,
			"repeat" = 2,
			"radius" = 0,
			"falloff" = 1,
			"flags" = NONE
		),
		"flags" = list(
			"WAVE_BOUNDED" = WAVE_BOUNDED
		)
	),
	"wave" = list(
		"defaults" = list(
			"x" = 0,
			"y" = 0,
			"size" = 1,
			"offset" = 0,
			"flags" = NONE
		),
		"flags" = list(
			"WAVE_SIDEWAYS" = WAVE_SIDEWAYS,
			"WAVE_BOUNDED" = WAVE_BOUNDED
		)
	)
)

#undef ICON_NOT_SET

//Helpers to generate lists for filter helpers
//This is the only practical way of writing these that actually produces sane lists
/proc/alpha_mask_filter(x, y, icon/icon, render_source, flags)
	. = list("type" = "alpha")
	if(!isnull(x))
		.["x"] = x
	if(!isnull(y))
		.["y"] = y
	if(!isnull(icon))
		.["icon"] = icon
	if(!isnull(render_source))
		.["render_source"] = render_source
	if(!isnull(flags))
		.["flags"] = flags

/proc/angular_blur_filter(x, y, size)
	. = list("type" = "angular_blur")
	if(!isnull(x))
		.["x"] = x
	if(!isnull(y))
		.["y"] = y
	if(!isnull(size))
		.["size"] = size

/proc/color_matrix_filter(matrix/in_matrix, space)
	. = list("type" = "color")
	.["color"] = in_matrix
	if(!isnull(space))
		.["space"] = space

/proc/displacement_map_filter(icon, render_source, x, y, size = 32)
	. = list("type" = "displace")
	if(!isnull(icon))
		.["icon"] = icon
	if(!isnull(render_source))
		.["render_source"] = render_source
	if(!isnull(x))
		.["x"] = x
	if(!isnull(y))
		.["y"] = y
	if(!isnull(size))
		.["size"] = size

/proc/drop_shadow_filter(x, y, size, offset, color)
	. = list("type" = "drop_shadow")
	if(!isnull(x))
		.["x"] = x
	if(!isnull(y))
		.["y"] = y
	if(!isnull(size))
		.["size"] = size
	if(!isnull(offset))
		.["offset"] = offset
	if(!isnull(color))
		.["color"] = color

/proc/gauss_blur_filter(size)
	. = list("type" = "blur")
	if(!isnull(size))
		.["size"] = size

/proc/layering_filter(icon, render_source, x, y, flags, color, transform, blend_mode)
	. = list("type" = "layer")
	if(!isnull(icon))
		.["icon"] = icon
	if(!isnull(render_source))
		.["render_source"] = render_source
	if(!isnull(x))
		.["x"] = x
	if(!isnull(y))
		.["y"] = y
	if(!isnull(color))
		.["color"] = color
	if(!isnull(flags))
		.["flags"] = flags
	if(!isnull(transform))
		.["transform"] = transform
	if(!isnull(blend_mode))
		.["blend_mode"] = blend_mode

/proc/motion_blur_filter(x, y)
	. = list("type" = "motion_blur")
	if(!isnull(x))
		.["x"] = x
	if(!isnull(y))
		.["y"] = y

/proc/outline_filter(size, color, flags)
	. = list("type" = "outline")
	if(!isnull(size))
		.["size"] = size
	if(!isnull(color))
		.["color"] = color
	if(!isnull(flags))
		.["flags"] = flags

/proc/radial_blur_filter(size, x, y)
	. = list("type" = "radial_blur")
	if(!isnull(size))
		.["size"] = size
	if(!isnull(x))
		.["x"] = x
	if(!isnull(y))
		.["y"] = y

/proc/rays_filter(size, color, offset, density, threshold, factor, x, y, flags)
	. = list("type" = "rays")
	if(!isnull(size))
		.["size"] = size
	if(!isnull(color))
		.["color"] = color
	if(!isnull(offset))
		.["offset"] = offset
	if(!isnull(density))
		.["density"] = density
	if(!isnull(threshold))
		.["threshold"] = threshold
	if(!isnull(factor))
		.["factor"] = factor
	if(!isnull(x))
		.["x"] = x
	if(!isnull(y))
		.["y"] = y
	if(!isnull(flags))
		.["flags"] = flags

/proc/ripple_filter(radius, size, falloff, repeat, x, y, flags)
	. = list("type" = "ripple")
	if(!isnull(radius))
		.["radius"] = radius
	if(!isnull(size))
		.["size"] = size
	if(!isnull(falloff))
		.["falloff"] = falloff
	if(!isnull(repeat))
		.["repeat"] = repeat
	if(!isnull(flags))
		.["flags"] = flags
	if(!isnull(x))
		.["x"] = x
	if(!isnull(y))
		.["y"] = y

/proc/wave_filter(x, y, size, offset, flags)
	. = list("type" = "wave")
	if(!isnull(size))
		.["size"] = size
	if(!isnull(x))
		.["x"] = x
	if(!isnull(y))
		.["y"] = y
	if(!isnull(offset))
		.["offset"] = offset
	if(!isnull(flags))
		.["flags"] = flags
