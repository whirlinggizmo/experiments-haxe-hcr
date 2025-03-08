package h2d.impl;

/**
 Automates buffer segmentation when rendering 2D geometry with multiple unique textures.
 
 Primary use-case is to allow usage of multiple textures without the need to manually manage them.
 Causes extra draw call each time a texture is swapped.
 Due to that, for production it is recommended to combine assets in atlases for optimal performance.
 
 Depending on geometry type, vertex count should be in groups of 4 vertices per quad or 3 indices per triangle.
 */
/**
	
		Automates buffer segmentation when rendering 2D geometry with multiple unique textures.
	
		Primary use-case is to allow usage of multiple textures without the need to manually manage them.
		Causes extra draw call each time a texture is swapped.
		Due to that, for production it is recommended to combine assets in atlases for optimal performance.
	
		Depending on geometry type, vertex count should be in groups of 4 vertices per quad or 3 indices per triangle.
	
**/
@:native("h2d.impl.BatchDrawState") extern class BatchDrawState {
	/**
		
				Create a new BatchDrawState instance.
			
	**/
	function new():Void;
	/**
		
				Current active texture of the BatchDrawState.
				Represents the most recent texture that was set with `setTile` or `setTexture`.
				Always null after state initialization or after `clear` call.
			
	**/
	var currentTexture(get, never) : h3d.mat.Texture;
	/**
		
				A total amount of vertices added to the BatchDrawState.
			
	**/
	var totalCount(default, null) : Int;
	/**
		
				Switches currently active texture to the given `texture` if it differs and splits the render state.
				@param texture The texture that should be used for the next set of vertices. Does nothing if `null`.
			
	**/
	function setTexture(texture:h3d.mat.Texture):Void;
	/**
		
				Resets the BatchDrawState by removing all texture references and zeroing vertex counter.
			
	**/
	function clear():Void;
	/**
		
				Renders given buffer as a set of quads. Buffer data should be in groups of 4 vertices per quad.
				@param ctx The render context which performs the rendering. Rendering object should call `h2d.RenderContext.beginDrawBatchState` before calling `drawQuads`.
				@param buffer The quad buffer used to render the state.
				@param offset An optional starting offset of the buffer to render in triangles (2 per quad).
				@param length An optional maximum limit of triangles to render.
		
				When `offset` and `length` are not provided or are default values, slightly faster rendering routine is used.
			
	**/
	function drawQuads(ctx:h2d.RenderContext, buffer:h3d.Buffer, ?offset:Int, ?length:Int):Void;
	/**
		
				Renders given indices as a set of triangles. Index data should be in groups of 3 vertices per quad.
				@param ctx The render context which performs the rendering. Rendering object should call `h2d.RenderContext.beginDrawBatchState` before calling `drawQuads`.
				@param buffer The vertex buffer used to render the state.
				@param indices Vertex indices used to render the state.
				@param offset An optional starting offset of the buffer to render in triangles.
				@param length An optional maximum limit of triangles to render.
		
				When `offset` and `length` are not provided or are default values, slightly faster rendering routine is used.
			
	**/
	function drawIndexed(ctx:h2d.RenderContext, buffer:h3d.Buffer, indices:h3d.Indexes, ?offset:Int, ?length:Int):Void;
}