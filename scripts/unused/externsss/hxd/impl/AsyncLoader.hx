package hxd.impl;

interface AsyncLoader {
	function load(img:hxd.res.Image):Void;
	function isSupported(t:hxd.res.Image):Bool;
}