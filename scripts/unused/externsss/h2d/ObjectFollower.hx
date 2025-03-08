package h2d;

/**
 Follows the 3D object position in current 3D camera, synchronizing the follower position to projected 2D position of the followed object.
 */
/**
	
		Follows the 3D object position in current 3D camera, synchronizing the follower position to projected 2D position of the followed object.
	
**/
@:uiNoComponent @:native("h2d.ObjectFollower") extern class ObjectFollower extends h2d.Object {
	/**
		
				Create a new ObjectFollower instance.
				@param obj The 3D object to follow.
				@param parent An optional parent `h2d.Object` instance to which ObjectFollower adds itself if set.
			
	**/
	function new(obj:h3d.scene.Object, ?parent:h2d.Object):Void;
	/**
		
				Reference to target 3D object to follow.
			
	**/
	var follow : h3d.scene.Object;
	/**
		
				Rounds the resulting 2d position of follower aligning it to s2d pixel grid.
			
	**/
	var pixelSnap : Bool;
	/**
		
				If enabled, follower will mirror visibility of target object.
			
	**/
	var followVisibility : Bool;
	/**
		
				Extra camera projection offset along X-axis to which follower will attach to.
			
	**/
	var offsetX : Float;
	/**
		
				Extra camera projection offset along Y-axis to which follower will attach to.
			
	**/
	var offsetY : Float;
	/**
		
				Extra camera projection offset along Z-axis to which follower will attach to.
			
	**/
	var offsetZ : Float;
	/**
		
				Horizontal object alignment relative to anchoring point.
			
	**/
	var horizontalAlign : h2d.Flow.FlowAlign;
	/**
		
				Vertical object alignment relative to anchoring point.
			
	**/
	var verticalAlign : h2d.Flow.FlowAlign;
	/**
		
				Mask with current depth buffer
			
	**/
	var depthMask : Bool;
	/**
		
				Calculate the depth for masking with the given bias in 3D position units, relative to current camera.
			
	**/
	var depthBias : Float;
	/**
		
				Express the offset in terms of the current camera direction.
			
	**/
	var cameraRelative : Bool;
	/**
		
				If enabled, the ObjectFollower will remove itself if the object followed is null or removed.
			
	**/
	var autoRemove : Bool;
}