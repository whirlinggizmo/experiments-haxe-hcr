package h3d.pass;

@:native("h3d.pass.DirShadowMap") extern class DirShadowMap extends h3d.pass.Shadows {
	function new(light:h3d.scene.Light):Void;
	/**
		
				Shrink the frustum of the light to the bounds containing all visible objects
			
	**/
	var autoShrink : Bool;
	/**
		
				For top down lights and cameras, use scene Z min/max to optimize shadowmap. Requires autoShrink
			
	**/
	var autoZPlanes : Bool;
	/**
		
				Clamp the zFar of the frustum of the camera for bounds calculation
			
	**/
	var maxDist : Float;
	/**
		
				Clamp the zNear of the frustum of the camera for bounds calculation
			
	**/
	var minDist : Float;
	override function dispose():Void;
	override function getShadowTex():hxsl.Types.TextureChannel;
	function calcShadowBounds(camera:h3d.Camera):Void;
	override function saveStaticData():haxe.io.Bytes;
	override function loadStaticData(bytes:haxe.io.Bytes):Bool;
	var debug : Bool;
	override function draw(passes:h3d.pass.PassList, ?sort:h3d.pass.PassList -> Void):Void;
	override function computeStatic(passes:h3d.pass.PassList):Void;
}