package h3d.parts;

interface Collider {
	function collidePart(p:h3d.parts.Particle, normal:h3d.Vector):Bool;
}