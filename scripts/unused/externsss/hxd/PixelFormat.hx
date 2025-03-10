package hxd;

@:native("hxd.PixelFormat") extern enum PixelFormat {
	ARGB;
	BGRA;
	RGBA;
	RGBA16F;
	RGBA32F;
	R8;
	R16F;
	R32F;
	RG8;
	RG16F;
	RG32F;
	RGB8;
	RGB16F;
	RGB32F;
	SRGB;
	SRGB_ALPHA;
	RGB10A2;
	RG11B10UF;
	R16U;
	RG16U;
	RGB16U;
	RGBA16U;
	S3TC(v:Int);
	Depth16;
	Depth24;
	Depth24Stencil8;
	Depth32;
}