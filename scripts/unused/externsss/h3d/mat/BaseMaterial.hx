package h3d.mat;

@:native("h3d.mat.BaseMaterial") extern class BaseMaterial extends hxd.impl.AnyProps {
	var name : String;
	var mainPass(get, never) : h3d.mat.Pass;
	function addPass<T:(h3d.mat.Pass)>(p:T):T;
	function removePass(p:h3d.mat.Pass):Bool;
	function getPasses():Array<h3d.mat.Pass>;
	function getPass(name:String):h3d.mat.Pass;
	function allocPass(name:String, ?inheritMain:Bool):h3d.mat.Pass;
	function clone(?m:h3d.mat.BaseMaterial):h3d.mat.BaseMaterial;
}