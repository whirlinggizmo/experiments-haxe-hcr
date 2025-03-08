package h3d.mat.noise;

@:native("h3d.mat.noise.WorleyNoise") extern class WorleyNoise {
	static function generate(?texRes:Int, ?gridSize:Int):h3d.mat.Texture3D;
}