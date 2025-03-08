package h3d.impl;

typedef GPUBuffer = js.html.webgl.Buffer;

typedef Texture = {
	var bias : Float;
	var bind : Int;
	var bits : Int;
	var height : Int;
	var internalFmt : Int;
	var pixelFmt : Int;
	var startMip : Int;
	var t : js.html.webgl.Texture;
	var width : Int;
};

typedef Query = { };

@:native("h3d.impl.Driver") extern enum Feature {
	StandardDerivatives;
	FloatTextures;
	AllocDepthBuffer;
	HardwareAccelerated;
	MultipleRenderTargets;
	Queries;
	SRGBTextures;
	ShaderModel3;
	BottomLeftCoords;
	Wireframe;
	InstancedRendering;
}

@:native("h3d.impl.Driver") extern enum QueryKind {
	/**
		
				The result will give the GPU Timestamp (in nanoseconds, 1e-9 seconds) at the time the endQuery is performed
			
	**/
	TimeStamp;
	/**
		
				The result will give the number of samples that passes the depth buffer between beginQuery/endQuery range
			
	**/
	Samples;
}

@:native("h3d.impl.Driver") extern enum RenderFlag {
	/**
		
				0 = LeftHanded (default), 1 = RightHanded. Affects the meaning of triangle culling value.
			
	**/
	CameraHandness;
}

@:native("h3d.impl.Driver") extern class Driver {
	var logEnable : Bool;
	function hasFeature(f:h3d.impl.Driver.Feature):Bool;
	function setRenderFlag(r:h3d.impl.Driver.RenderFlag, value:Int):Void;
	function isSupportedFormat(fmt:h3d.mat.Data.TextureFormat):Bool;
	function isDisposed():Bool;
	function dispose():Void;
	function begin(frame:Int):Void;
	function generateMipMaps(texture:h3d.mat.Texture):Void;
	function getNativeShaderCode(shader:hxsl.RuntimeShader):String;
	function clear(?color:h3d.Vector4, ?depth:Float, ?stencil:Int):Void;
	function captureRenderBuffer(pixels:hxd.Pixels):Void;
	function capturePixels(tex:h3d.mat.Texture, layer:Int, mipLevel:Int, ?region:h2d.col.IBounds):hxd.Pixels;
	function getDriverName(details:Bool):String;
	function init(onCreate:Bool -> Void, ?forceSoftware:Bool):Void;
	function resize(width:Int, height:Int):Void;
	function selectShader(shader:hxsl.RuntimeShader):Bool;
	function selectMaterial(pass:h3d.mat.Pass):Void;
	function uploadShaderBuffers(buffers:Dynamic, which:Dynamic):Void;
	function selectBuffer(buffer:h3d.Buffer):Void;
	function selectMultiBuffers(format:hxd.BufferFormat.MultiFormat, buffers:Array<h3d.Buffer>):Void;
	function draw(ibuf:h3d.Buffer, startIndex:Int, ntriangles:Int):Void;
	function drawInstanced(ibuf:h3d.Buffer, commands:h3d.impl.InstanceBuffer):Void;
	function setRenderZone(x:Int, y:Int, width:Int, height:Int):Void;
	function setRenderTarget(tex:h3d.mat.Texture, ?layer:Int, ?mipLevel:Int, ?depthBinding:h3d.Engine.DepthBinding):Void;
	function setRenderTargets(textures:Array<h3d.mat.Texture>, ?depthBinding:h3d.Engine.DepthBinding):Void;
	function setDepth(tex:h3d.mat.Texture):Void;
	function allocDepthBuffer(b:h3d.mat.Texture):h3d.impl.Driver.Texture;
	function disposeDepthBuffer(b:h3d.mat.Texture):Void;
	function getDefaultDepthBuffer():h3d.mat.Texture;
	function present():Void;
	function end():Void;
	function setDebug(b:Bool):Void;
	function allocTexture(t:h3d.mat.Texture):h3d.impl.Driver.Texture;
	function allocBuffer(b:h3d.Buffer):h3d.impl.Driver.GPUBuffer;
	function allocInstanceBuffer(b:h3d.impl.InstanceBuffer, bytes:haxe.io.Bytes):Void;
	function disposeTexture(t:h3d.mat.Texture):Void;
	function disposeBuffer(b:h3d.Buffer):Void;
	function disposeInstanceBuffer(b:h3d.impl.InstanceBuffer):Void;
	function uploadIndexData(i:h3d.Buffer, startIndice:Int, indiceCount:Int, buf:hxd.IndexBuffer, bufPos:Int):Void;
	function uploadBufferData(b:h3d.Buffer, startVertex:Int, vertexCount:Int, buf:hxd.FloatBuffer, bufPos:Int):Void;
	function uploadBufferBytes(b:h3d.Buffer, startVertex:Int, vertexCount:Int, buf:haxe.io.Bytes, bufPos:Int):Void;
	function uploadTextureBitmap(t:h3d.mat.Texture, bmp:hxd.BitmapData, mipLevel:Int, side:Int):Void;
	function uploadTexturePixels(t:h3d.mat.Texture, pixels:hxd.Pixels, mipLevel:Int, side:Int):Void;
	function readBufferBytes(b:h3d.Buffer, startVertex:Int, vertexCount:Int, buf:haxe.io.Bytes, bufPos:Int):Void;
	function onTextureBiasChanged(t:h3d.mat.Texture):Void;
	/**
		
				Returns true if we could copy the texture, false otherwise (not supported by driver or mismatch in size/format)
			
	**/
	function copyTexture(from:h3d.mat.Texture, to:h3d.mat.Texture):Bool;
	function allocQuery(queryKind:h3d.impl.Driver.QueryKind):h3d.impl.Driver.Query;
	function deleteQuery(q:h3d.impl.Driver.Query):Void;
	function beginQuery(q:h3d.impl.Driver.Query):Void;
	function endQuery(q:h3d.impl.Driver.Query):Void;
	function queryResultAvailable(q:h3d.impl.Driver.Query):Bool;
	function queryResult(q:h3d.impl.Driver.Query):Float;
	function computeDispatch(?x:Int, ?y:Int, ?z:Int):Void;
	static function setShaderCache(cache:h3d.impl.ShaderCache):Void;
}