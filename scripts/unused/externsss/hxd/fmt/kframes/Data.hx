package hxd.fmt.kframes;

typedef KFSize<T:(Float)> = Array<T>;

@:enum typedef KFAnimProp = String;

typedef KFAnimValue = {
	var data : Array<Float>;
	var start_frame : Int;
};

typedef KFAnimation = {
	var key_values : Array<hxd.fmt.kframes.Data.KFAnimValue>;
	var property : hxd.fmt.kframes.Data.KFAnimProp;
	var timing_curves : Array<Array<hxd.fmt.kframes.Data.KFSize<Float>>>;
};

typedef KFFeature = {
	@:optional
	var backed_image : String;
	var feature_animations : Array<hxd.fmt.kframes.Data.KFAnimation>;
	var feature_id : Int;
	@:optional
	var from_frame : Int;
	var name : String;
	var size : hxd.fmt.kframes.Data.KFSize<Int>;
	@:optional
	var to_frame : Int;
};

typedef KeyframesFile = {
	var animation_frame_count : Int;
	var animation_groups : Array<{ }>;
	var canvas_size : hxd.fmt.kframes.Data.KFSize<Int>;
	var features : Array<hxd.fmt.kframes.Data.KFFeature>;
	var formatVersion : String;
	var frame_rate : Float;
	var key : Int;
	var name : String;
};