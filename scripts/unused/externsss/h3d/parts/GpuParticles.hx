package h3d.parts;

typedef GpuSave = {
	var bounds : Array<Float>;
	var groups : Array<Dynamic>;
	@:optional
	var hide : Dynamic;
	var type : String;
	var version : Int;
};

@:native("h3d.parts.GpuParticles") extern enum GpuSortMode {
	/**
		
				Particles are not sorted.
			
	**/
	None;
	/**
		
				Particles are sorted back-to-front every frame based on their current position.
			
	**/
	Dynamic;
}

@:native("h3d.parts.GpuParticles") extern enum GpuEmitMode {
	/**
		
				A single Point, emit in all directions
			
	**/
	Point;
	/**
		
				A cone, parametrized with emitAngle and emitDistance
			
	**/
	Cone;
	/**
		
				The GpuParticles specified volumeBounds
			
	**/
	VolumeBounds;
	/**
		
				The GpuParticles parent.getBounds()
			
	**/
	ParentBounds;
	/**
		
				Same as VolumeBounds, but in Camera space, not world space.
			
	**/
	CameraBounds;
	/**
		
				A disc, emit in one direction
			
	**/
	Disc;
}

@:native("h3d.parts.GpuParticles") extern class GpuPart {
	function new():Void;
	var index : Int;
	var x : Float;
	var y : Float;
	var z : Float;
	var w : Float;
	var sx : Float;
	var sy : Float;
	var sz : Float;
	var vx : Float;
	var vy : Float;
	var vz : Float;
	var time : Float;
	var life : Float;
	var initX : Float;
	var initY : Float;
	var deltaX : Float;
	var deltaY : Float;
	var next : h3d.parts.GpuParticles.GpuPart;
	function updatePos(time:Float, gravity:Float):Void;
}

@:allow(h3d.parts.GpuParticles) @:native("h3d.parts.GpuParticles") extern class GpuPartGroup {
	function new(parent:h3d.parts.GpuParticles):Void;
	var amount : Float;
	var name : String;
	var enable : Bool;
	var material : { };
	var sortMode(default, set) : h3d.parts.GpuParticles.GpuSortMode;
	var nparts(default, set) : Int;
	var emitLoop(default, set) : Bool;
	var emitMode(default, set) : h3d.parts.GpuParticles.GpuEmitMode;
	var emitStartDist(default, set) : Float;
	var emitDist(default, set) : Float;
	var emitAngle(default, set) : Float;
	var emitSync(default, set) : Float;
	var emitDelay(default, set) : Float;
	var emitOnBorder(default, set) : Bool;
	var clipBounds : Bool;
	var transform3D : Bool;
	var size(default, set) : Float;
	var sizeIncr(default, set) : Float;
	var sizeRand(default, set) : Float;
	var life(default, set) : Float;
	var lifeRand(default, set) : Float;
	var speed(default, set) : Float;
	var speedRand(default, set) : Float;
	var speedIncr(default, set) : Float;
	var gravity(default, set) : Float;
	var rotInit(default, set) : Float;
	var rotSpeed(default, set) : Float;
	var rotSpeedRand(default, set) : Float;
	var fadeIn : Float;
	var fadeOut : Float;
	var fadePower : Float;
	var frameCount : Int;
	var frameDivisionX : Int;
	var frameDivisionY : Int;
	var animationRepeat : Float;
	var texture : h3d.mat.Texture;
	var colorGradient : h3d.mat.Texture;
	var isRelative(default, set) : Bool;
	var attachToCam(default, set) : Bool;
	var distanceToCam(default, set) : Float;
	function syncParams():Void;
	function getMaterialProps():Any;
	function save():Dynamic;
	function load(version:Int, o:Dynamic):Void;
	function updateBounds(bounds:h3d.col.Bounds):Void;
	function emitPart(rnd:hxd.Rand, pt:h3d.parts.GpuParticles.GpuPart, absPos:h3d.Matrix):Void;
}

@:native("h3d.parts.GpuParticles") extern class GpuParticles extends h3d.scene.MultiMaterial {
	function new(?parent:h3d.scene.Object):Void;
	var seed(default, set) : Int;
	var volumeBounds(default, set) : h3d.col.Bounds;
	var currentTime : Float;
	var duration(default, null) : Float;
	var bounds(default, null) : h3d.col.Bounds;
	/**
		
				Tells how much percent of the particles to display. This can be used to progressively display a particle effect.
				This can also be done per group in GpuPartGroup.progress
			
	**/
	var amount : Float;
	/**
		
				Tells how many particles were uploaded to GPU last frame (for performance tuning).
			
	**/
	var uploadedCount(default, null) : Int;
	/**
		
				Tells how many particles are live actually
			
	**/
	var count(get, never) : Int;
	function onEnd():Void;
	function save():Dynamic;
	function load(_o:Dynamic, ?resourcePath:String):Void;
	function addGroup(?g:h3d.parts.GpuParticles.GpuPartGroup, ?material:h3d.mat.Material, ?index:Int):h3d.parts.GpuParticles.GpuPartGroup;
	private function set_seed(s:Int):Int;
	private function set_volumeBounds(v:h3d.col.Bounds):h3d.col.Bounds;
	function rebuild():Void;
	function removeGroup(g:h3d.parts.GpuParticles.GpuPartGroup):Void;
	function getGroup(name:String):h3d.parts.GpuParticles.GpuPartGroup;
	private function get_count():Int;
}