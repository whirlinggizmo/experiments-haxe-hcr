package h3d.anim;

/**
 Blends multiple animations points placed on a virtual 2d plane
 */
/**
	
		Blends multiple animations points placed on a virtual 2d plane
	
**/
@:access(h3d.scene.Skin) @:native("h3d.anim.BlendSpace2D") extern class BlendSpace2D extends h3d.anim.Animation {
	function new(name:String, points:Array<h3d.anim.BlendSpace2D.BlendSpace2DPoint>):Void;
	/**
		
				X Position of the blend point in the Blendspace
			
	**/
	var x(default, set) : Float;
	/**
		
				Smooth factor for the X value position over time
			
	**/
	var xSmooth : Float;
	/**
		
				Y Position of the blend point in the BlendSpace
			
	**/
	var y(default, set) : Float;
	/**
		
				Smooth factor for the Y value position over time
			
	**/
	var ySmooth : Float;
	/**
		
				If true, the speed of the blended animation will be scaled when
				the x/y points lies outside all of the blend space triangles,
				based on the distance of the point from the center of the graph (0,0)
				and the distance of the closest point inside of the graph to the center
			
	**/
	var scaleSpeedOutsideOfBounds : Bool;
	private function set_x(v:Float):Float;
	private function set_y(v:Float):Float;
	function resetSmooth():Void;
	override function sync(?decompose:Bool):Void;
	override function bind(object:h3d.scene.Object):Void;
	override function unbind(objectName:String):Void;
	override function update(dt:Float):Float;
}

@:allow(h3d.anim.BlendSpace2D) @:native("h3d.anim.BlendSpace2D") extern class BlendSpace2DPoint {
	function new(x:Float, y:Float, animation:h3d.anim.Animation, ?keepSync:Bool):Void;
	var x : Float;
	var y : Float;
	var animation : h3d.anim.Animation;
	var keepSync : Bool;
}

@:allow(h3d.anim.BlendSpace2D) @:native("h3d.anim.BlendSpace2D") extern class BlendSpaceObject extends h3d.anim.Animation.AnimatedObject {
	function new(name:String):Void;
	var matrices : Array<h3d.Matrix>;
	var outMatrix : h3d.Matrix;
	var defaultMatrix : h3d.Matrix;
	var touchedThisFrame : Bool;
	override function clone():h3d.anim.BlendSpace2D.BlendSpaceObject;
}