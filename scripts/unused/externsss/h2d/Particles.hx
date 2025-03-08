package h2d;

/**
 See `ParticleGroup.sortMode` - not used anywhere.
 */
/**
	
		See `ParticleGroup.sortMode` - not used anywhere.
	
**/
@:dox(hide) @:native("h2d.Particles") extern enum PartSortMode {
	/**
		
				Particles are not sorted.
			
	**/
	None;
	/**
		
				Particles are sorted back-to-front every frame based on their current position.
			
	**/
	Dynamic;
}

/**
 The particle emission pattern modes. See `ParticleGroup.emitMode`.
 */
/**
	
		The particle emission pattern modes. See `ParticleGroup.emitMode`.
	
**/
@:native("h2d.Particles") extern enum PartEmitMode {
	/**
		
				A single Point, that emits in all directions.
			
	**/
	Point;
	/**
		
				A cone, parametrized with `emitAngle` and `emitDistance`.
			
	**/
	Cone;
	/**
		
				A box, parametrized with `emitDist` and `emitDistY`.
			
	**/
	Box;
	/**
		
				A box, parametrized with `emitAngle` and `emitDistance`.
			
	**/
	Direction;
}

/**
 An emitter of a single particle group. Part of `Particles` simulation system.
 */
/**
	
		An emitter of a single particle group. Part of `Particles` simulation system.
	
**/
@:access(h2d.SpriteBatch) @:access(h2d.Object) @:native("h2d.Particles") extern class ParticleGroup {
	/**
		
				Create a new particle group instance.
				@param p The parent Particles instance. Group does not automatically adds itself to the Particles.
			
	**/
	function new(p:h2d.Particles):Void;
	/**
		
				The group name.
			
	**/
	var name : String;
	/**
		
				Disabling the group immediately removes it from rendering and resets it's state.
			
	**/
	var enable(default, set) : Bool;
	/**
		
				Does nothing.
			
	**/
	var sortMode(default, set) : h2d.Particles.PartSortMode;
	/**
		
				Configures blending mode for this group.
			
	**/
	var blendMode(default, set) : h2d.BlendMode;
	/**
		
				Maximum number of particles alive at a time.
			
	**/
	var nparts(default, set) : Int;
	/**
		
				Initial particle X offset.
			
	**/
	var dx(default, set) : Int;
	/**
		
				Initial particle Y offset.
			
	**/
	var dy(default, set) : Int;
	/**
		
				If enabled, group will emit new particles indefinitely maintaining number of particles at `ParticleGroup.nparts`.
			
	**/
	var emitLoop(default, set) : Bool;
	/**
		
				The pattern in which particles are emitted. See individual `PartEmitMode` values for more details.
			
	**/
	var emitMode(default, set) : h2d.Particles.PartEmitMode;
	/**
		
				Initial particle position distance from emission point.
			
	**/
	var emitStartDist(default, set) : Float;
	/**
		
				Additional random particle position distance from emission point.
			
	**/
	var emitDist(default, set) : Float;
	/**
		
				Secondary random position distance modifier (used by `Box` emitMode)
			
	**/
	var emitDistY(default, set) : Float;
	/**
		
				Normalized particle emission direction angle.
			
	**/
	var emitAngle(default, set) : Float;
	/**
		
				When enabled, particle rotation will match the particle movement direction angle.
			
	**/
	var emitDirectionAsAngle(default, set) : Bool;
	/**
		
				Randomized synchronization delay before particle appears after being emitted.
		
				Usage note for non-relative mode: Particle will use configuration that was happened at time of emission, not when delay timer runs out.
			
	**/
	var emitSync(default, set) : Float;
	/**
		
				Fixed delay before particle appears after being emitted.
		
				Usage note for non-relative mode: Particle will use configuration that was happened at time of emission, not when delay timer runs out.
			
	**/
	var emitDelay(default, set) : Float;
	/**
		
				Initial particle size.
			
	**/
	var size(default, set) : Float;
	/**
		
				If set, particle will change it's size with time.
			
	**/
	var sizeIncr(default, set) : Float;
	/**
		
				If enabled, particle will increase on X-axis with `sizeIncr`.
			
	**/
	var incrX(default, set) : Bool;
	/**
		
				If enabled, particle will increase on Y-axis with `sizeIncr`.
			
	**/
	var incrY(default, set) : Bool;
	/**
		
				Additional random size increase when particle is created.
			
	**/
	var sizeRand(default, set) : Float;
	/**
		
				Initial particle lifetime.
			
	**/
	var life(default, set) : Float;
	/**
		
				Additional random lifetime increase when particle is created.
			
	**/
	var lifeRand(default, set) : Float;
	/**
		
				Initial particle velocity.
			
	**/
	var speed(default, set) : Float;
	/**
		
				Additional random velocity increase when particle is created.
			
	**/
	var speedRand(default, set) : Float;
	/**
		
				If set, particle velocity will change over time.
			
	**/
	var speedIncr(default, set) : Float;
	/**
		
				Gravity applied to the particle.
			
	**/
	var gravity(default, set) : Float;
	/**
		
				The gravity angle in radians. `0` points down.
			
	**/
	var gravityAngle(default, set) : Float;
	@:noCompletion
	@:dox(hide)
	var cosGravityAngle : Float;
	@:noCompletion
	@:dox(hide)
	var sinGravityAngle : Float;
	/**
		
				Initial particle rotation.
			
	**/
	var rotInit(default, set) : Float;
	/**
		
				Initial rotation speed of the particle.
			
	**/
	var rotSpeed(default, set) : Float;
	/**
		
				Additional random rotation speed when particle is created.
			
	**/
	var rotSpeedRand(default, set) : Float;
	/**
		
				If enabled, particles will be automatically rotated in the direction of particle velocity.
			
	**/
	var rotAuto : Bool;
	/**
		
				The time in seconds during which particle alpha fades in after being emitted.
			
	**/
	var fadeIn : Float;
	/**
		
				The time in seconds at which particle will start to fade out before dying. Fade out time can be calculated with `lifetime - fadeOut`.
			
	**/
	var fadeOut : Float;
	/**
		
				The exponent of the alpha transition speed on fade in and fade out.
			
	**/
	var fadePower : Float;
	/**
		
				Total count of frames used by the group.
		
				When 0, amount of frames in a group calculated by `frameDivisionX * frameDivisionY`.
		
				Otherwise it's `min(frameDivisionX * frameDivisionY, frameCount)`.
			
	**/
	var frameCount(default, set) : Int;
	/**
		
				Horizontal frame divisor.
			
	**/
	var frameDivisionX(default, set) : Int;
	/**
		
				Vertical frame divisor.
			
	**/
	var frameDivisionY(default, set) : Int;
	/**
		
				The amount of times the animations will loop during lifetime.
				Settings it to 0 will stop the animation playback and each particle will have a random frame assigned at emission time.
			
	**/
	var animationRepeat(default, set) : Float;
	/**
		
				The texture used to render particles.
			
	**/
	var texture(default, set) : h3d.mat.Texture;
	/**
		
				Optional color gradient texture for tinting.
			
	**/
	var colorGradient(default, set) : h3d.mat.Texture;
	/**
		
				When enabled, causes particles to always render relative to the emitter position, moving along with it.
				Otherwise, once emitted, particles won't follow the emitter, and will render relative to the scene origin.
		
				Non-relative mode is useful for simulating something like a smoke coming from a moving object,
				while relative mode things like jet flame that have to stick to its emission source.
			
	**/
	var isRelative(default, set) : Bool;
	/**
		
				Should group rebuild on parameters change.
		
				Note that some parameters take immediate effect on the existing particles, and some would force rebuild regardless of this setting.
		
				Parameters that take immediate effect:
				`speedIncr`, `gravity`, `gravityAngle`, `fadeIn`, `fadeOut`, `fadePower`, `rotAuto`, `rotInit`, `incrX`, `incrY`, `emitLoop` and `blendMode`
		
				Parameters that will always force rebuild:
				`enable`, `sortMode`, `isRelative`, `texture`, `frameCount`, `frameDivisionX`, `frameDivisionY` and `nparts`
		
				Parameters that newer cause rebuild:
				`blendMode`, `colorGradient` and `animationRepeat`
			
	**/
	var rebuildOnChange : Bool;
	/**
		
				Reset current state of particle group and re-emit all particles.
			
	**/
	function rebuild():Void;
	/**
		
				Saves the particle group configuration into a `Dynamic` object.
			
	**/
	function save();
	/**
		
				Loads the particle group configuration from a given object.
		
				@param version The version of Particles that were used to save the configuration.
				@param o The previously saved configuration data to load.
			
	**/
	function load(version:Int, o:Dynamic):Void;
}

/**
 A 2D particle system with wide range of customizability.
 
 The Particles instance can contain multiple `ParticleGroup` instances - each of which works independently from one another.
 
 To simplify designing of the particles [HIDE](https://github.com/HeapsIO/hide/) contains a dedicated 2D particle editor and
 stores the particle data in a JSON format, which then can be loaded with the `Particles.load` method:
 ```haxe
 var part = new h2d.Particles();
 part.load(haxe.Json.parse(hxd.Res.my_parts_file.entry.getText()), hxd.Res.my_parts_file.entry.path);
 ```
 */
/**
	
		A 2D particle system with wide range of customizability.
	
		The Particles instance can contain multiple `ParticleGroup` instances - each of which works independently from one another.
	
		To simplify designing of the particles [HIDE](https://github.com/HeapsIO/hide/) contains a dedicated 2D particle editor and
		stores the particle data in a JSON format, which then can be loaded with the `Particles.load` method:
		```haxe
		var part = new h2d.Particles();
		part.load(haxe.Json.parse(hxd.Res.my_parts_file.entry.getText()), hxd.Res.my_parts_file.entry.path);
		```
	
**/
@:access(h2d.ParticleGroup) @:native("h2d.Particles") extern class Particles extends h2d.Drawable {
	/**
		
				Create a new Particles instance.
				@param parent An optional parent `h2d.Object` instance to which Particles adds itself if set.
			
	**/
	function new(?parent:h2d.Object):Void;
	/**
		
				Sent when all particle groups stopped playback.
				Restarts all groups by default.
			
	**/
	function onEnd():Void;
	/**
		
				Saves Particles settings and returns an object that can be saved into a file and then loaded with a `Particles.load` method.
			
	**/
	function save():Dynamic;
	/**
		
				Loads previously saved Particles settings.
				@param o The saved Particles settings.
				@param resourcePath An optional path of the configuration file. May be safely omitted.
			
	**/
	function load(o:Dynamic, ?resourcePath:String):Void;
	/**
		
				Add new particle group to the Particles.
				@param g Particle group to add. If null, will create an empty ParticleGroup.
				Note that when passing existing group, it should be created with this Particles instanceas the constructor argument,
				otherwise it may lead to undefined behavior.
				@param index Optional insertion index at which the group should be inserted.
				@returns Added ParticleGroup instance.
			
	**/
	function addGroup(?g:h2d.Particles.ParticleGroup, ?index:Int):h2d.Particles.ParticleGroup;
	/**
		
				Removes the group from the Particles.
			
	**/
	function removeGroup(g:h2d.Particles.ParticleGroup):Void;
	/**
		
				Returns a group with a specified name or `null` if none found.
			
	**/
	function getGroup(name:String):h2d.Particles.ParticleGroup;
}