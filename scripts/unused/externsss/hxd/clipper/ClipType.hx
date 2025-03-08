package hxd.clipper;

@:native("hxd.clipper.ClipType") extern enum ClipType {
	Intersection;
	Union;
	Difference;
	Xor;
}