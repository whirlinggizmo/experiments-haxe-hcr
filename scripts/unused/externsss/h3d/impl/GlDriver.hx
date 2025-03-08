package h3d.impl;

@:access(h3d.impl.Shader) @:native("h3d.impl.GlDriver") extern class GlDriver extends h3d.impl.Driver {
	function new(?antiAlias:Int):Void;
	var gl : GL;
	override function setRenderFlag(r:h3d.impl.Driver.RenderFlag, value:Int):Void;
	override function setDebug(d:Bool):Void;
	override function begin(frame:Int):Void;
	override function getNativeShaderCode(shader:hxsl.RuntimeShader):String;
	override function getDriverName(details:Bool):String;
	override function selectShader(shader:hxsl.RuntimeShader):Bool;
	override function uploadShaderBuffers(buf:h3d.shader.Buffers, which:h3d.shader.Buffers.BufferKind):Void;
	override function selectMaterial(pass:h3d.mat.Pass):Void;
	override function clear(?color:h3d.Vector4, ?depth:Float, ?stencil:Int):Void;
	override function resize(width:Int, height:Int):Void;
	override function isSupportedFormat(fmt:h3d.mat.Data.TextureFormat):Bool;
	override function allocTexture(t:h3d.mat.Texture):h3d.impl.Driver.Texture;
	override function allocDepthBuffer(t:h3d.mat.Texture):h3d.impl.Driver.Texture;
	override function disposeDepthBuffer(b:h3d.mat.Texture):Void;
	override function getDefaultDepthBuffer():h3d.mat.Texture;
	override function allocBuffer(b:h3d.Buffer):h3d.impl.Driver.GPUBuffer;
	override function disposeTexture(t:h3d.mat.Texture):Void;
	override function disposeBuffer(b:h3d.Buffer):Void;
	override function generateMipMaps(t:h3d.mat.Texture):Void;
	override function uploadTextureBitmap(t:h3d.mat.Texture, bmp:hxd.BitmapData, mipLevel:Int, side:Int):Void;
	override function uploadTexturePixels(t:h3d.mat.Texture, pixels:hxd.Pixels, mipLevel:Int, side:Int):Void;
	override function uploadBufferData(b:h3d.Buffer, startVertex:Int, vertexCount:Int, buf:hxd.FloatBuffer, bufPos:Int):Void;
	override function uploadBufferBytes(b:h3d.Buffer, startVertex:Int, vertexCount:Int, buf:haxe.io.Bytes, bufPos:Int):Void;
	override function uploadIndexData(i:h3d.Buffer, startIndice:Int, indiceCount:Int, buf:hxd.IndexBuffer, bufPos:Int):Void;
	override function selectBuffer(b:h3d.Buffer):Void;
	override function selectMultiBuffers(format:hxd.BufferFormat.MultiFormat, buffers:Array<h3d.Buffer>):Void;
	override function draw(ibuf:h3d.Buffer, startIndex:Int, ntriangles:Int):Void;
	override function allocInstanceBuffer(b:h3d.impl.InstanceBuffer, bytes:haxe.io.Bytes):Void;
	override function disposeInstanceBuffer(b:h3d.impl.InstanceBuffer):Void;
	override function drawInstanced(ibuf:h3d.Buffer, commands:h3d.impl.InstanceBuffer):Void;
	override function end():Void;
	override function present():Void;
	override function isDisposed():Bool;
	override function setRenderZone(x:Int, y:Int, width:Int, height:Int):Void;
	override function capturePixels(tex:h3d.mat.Texture, layer:Int, mipLevel:Int, ?region:h2d.col.IBounds):hxd.Pixels;
	override function setRenderTarget(tex:h3d.mat.Texture, ?layer:Int, ?mipLevel:Int, ?depthBinding:h3d.Engine.DepthBinding):Void;
	override function setRenderTargets(textures:Array<h3d.mat.Texture>, ?depthBinding:h3d.Engine.DepthBinding):Void;
	override function setDepth(depthBuffer:h3d.mat.Texture):Void;
	override function onTextureBiasChanged(t:h3d.mat.Texture):Void;
	override function init(onCreate:Bool -> Void, ?forceSoftware:Bool):Void;
	override function hasFeature(f:h3d.impl.Driver.Feature):Bool;
	override function captureRenderBuffer(pixels:hxd.Pixels):Void;
	static var ALLOW_WEBGL2 : Bool;
	static var hasMultiIndirectCount : Bool;
	/**
		
				Perform OUT_OF_MEMORY checks when allocating textures/buffers.
				Default true, except in WebGL (false)
			
	**/
	static var outOfMemoryCheck : Bool;
}