package h2d;

/**
 An automatic layout system.
 */
/**
	
		An automatic layout system.
	
**/
@:native("h2d.Flow") extern class Flow extends h2d.Object {
	/**
		
				Create a new Flow instance.
				@param parent An optional parent `h2d.Object` instance to which Flow adds itself if set.
			
	**/
	function new(?parent:h2d.Object):Void;
	/**
		
				If some sub element gets resized, you need to set reflow to true in order to force
				the reflow of elements. You can also directly call `Flow.reflow` which will immediately
				update all elements positions.
		
				If a reflow is needed, `Flow.reflow` will be called before rendering the flow.
				Each change in one of the flow properties or addition/removal of elements will set needReflow to true.
			
	**/
	var needReflow(default, set) : Bool;
	/**
		
				Horizontal alignment of elements inside the flow.
				See `FlowAlign` for more details.
			
	**/
	var horizontalAlign(default, set) : h2d.Flow.FlowAlign;
	/**
		
				Vertical alignment of elements inside the flow.
				See `FlowAlign` for more details.
			
	**/
	var verticalAlign(default, set) : h2d.Flow.FlowAlign;
	/**
		
				Ensures that Flow is at least the specified outer width at all times when not null.
			
	**/
	var minWidth(default, set) : Int;
	/**
		
				Ensures that Flow is at least the specified outer height at all times when not null.
			
	**/
	var minHeight(default, set) : Int;
	/**
		
				Attempts to limit the Flow outer width to the specified width.
				Used as a baseline for overflow when `Flow.multiline` is enabled and `Flow.layout` is `Horizontal`.
			
	**/
	var maxWidth(default, set) : Int;
	/**
		
				Attempts to limit the Flow outer height to the specified height.
				Used as a baseline for overflow when `Flow.multiline` is enabled and `Flow.layout` is `Vertical`.
			
	**/
	var maxHeight(default, set) : Int;
	/**
		
				Sets the minimum row height when `Flow.layout` is `Horizontal`.
			
	**/
	var lineHeight(default, set) : Int;
	/**
		
				Sets the minimum colum width when `Flow.layout` is `Vertical`.
			
	**/
	var colWidth(default, set) : Int;
	/**
		
				Enabling overflow will treat maxWidth/maxHeight and lineHeight/colWidth constraints as absolute : bigger elements will overflow instead of expanding the limit.
				See respective `FlowOverflow` values for more details.
			
	**/
	var overflow(default, set) : h2d.Flow.FlowOverflow;
	/**
		
				Will set all padding values at the same time.
		
				Note that padding is applied inside the flow boundaries and included in the size constraint, shrinking available space for Flow children.
		
				@see `Flow.paddingLeft`
				@see `Flow.paddingRight`
				@see `Flow.paddingTop`
				@see `Flow.paddingBottom`
				@see `Flow.paddingHorizontal`
				@see `Flow.paddingVertical`
			
	**/
	var padding(never, set) : Int;
	/**
		
				Will set `Flow.paddingLeft` and `Flow.paddingRight` to the given value.
		
				Note that padding is applied inside the flow boundaries and included in the size constraint, shrinking available space for Flow children.
			
	**/
	var paddingHorizontal(never, set) : Int;
	/**
		
				Will set `Flow.paddingTop` and `Flow.paddingBottom` to the given value.
		
				Note that padding is applied inside the flow boundaries and included in the size constraint, shrinking available space for Flow children.
			
	**/
	var paddingVertical(never, set) : Int;
	/**
		
				Sets the extra padding along the left edge of the Flow.
		
				Note that padding is applied inside the flow boundaries and included in the size constraint, shrinking available space for Flow children.
			
	**/
	var paddingLeft(default, set) : Int;
	/**
		
				Sets the extra padding along the right edge of the Flow.
		
				Note that padding is applied inside the flow boundaries and included in the size constraint, shrinking available space for Flow children.
			
	**/
	var paddingRight(default, set) : Int;
	/**
		
				Sets the extra padding along the top edge of the Flow.
		
				Note that padding is applied inside the flow boundaries and included in the size constraint, shrinking available space for Flow children.
			
	**/
	var paddingTop(default, set) : Int;
	/**
		
				Sets the extra padding along the bottom edge of the Flow.
		
				Note that padding is applied inside the flow boundaries and included in the size constraint, shrinking available space for Flow children.
			
	**/
	var paddingBottom(default, set) : Int;
	/**
		
				The horizontal separation spacing between two flowed elements.
			
	**/
	var horizontalSpacing(default, set) : Int;
	/**
		
				The vertical separation spacing between two flowed elements.
			
	**/
	var verticalSpacing(default, set) : Int;
	/**
		
				Adds an `h2d.Interactive` to the Flow that is accessible through `Flow.interactive` field.
				This Interactive is automatically resized to cover the whole Flow area.
		
				Flow is added as a bottom-most (after the `Flow.backgroundTile`) child as to not impede flow elements with Interactives.
			
	**/
	var enableInteractive(default, set) : Bool;
	/**
		
				@see `Flow.enableInteractive`.
			
	**/
	var interactive(default, null) : h2d.Interactive;
	/**
		
				Setting a background tile will create an `h2d.ScaleGrid` background which uses the `Flow.borderWidth`/`Flow.borderHeigh` values for its borders.
		
				It will automatically resize when the reflow is done to cover the whole Flow area.
			
	**/
	var backgroundTile(default, set) : h2d.Tile;
	/**
		
				Set the border width of the `Flow.backgroundTile`'s left and right borders.
		
				Does not affect padding by default, which can be enabled with `-D flow_border` compilation flag.
				If border padding is enabled, `Flow.outerWidth` will be affected accordingly even if background tile is not set
				and will follow the same constraint limitation as padding.
		
				@see `Flow.paddingLeft`
				@see `Flow.paddingRight`
				@see `Flow.paddingHorizontal`
				@see `h2d.ScaleGrid.borderWidth`
			
	**/
	var borderWidth(never, set) : Int;
	/**
		
				Left border width of the `Flow.backgroundTile`.
		
				Does not affect padding by default, which can be enabled with `-D flow_border` compilation flag.
				If border padding is enabled, `Flow.outerHeight` will be affected accordingly even if background tile is not set
				and will follow the same constraint limitation as padding.
		
				@see `Flow.paddingLeft`
				@see `h2d.ScaleGrid.borderLeft`
			
	**/
	var borderLeft(default, set) : Int;
	/**
		
				Right border width of the `Flow.backgroundTile`.
		
				Does not affect padding by default, which can be enabled with `-D flow_border` compilation flag.
				If border padding is enabled, `Flow.outerHeight` will be affected accordingly even if background tile is not set
				and will follow the same constraint limitation as padding.
		
				@see `Flow.paddingRight`
				@see `h2d.ScaleGrid.borderRight`
			
	**/
	var borderRight(default, set) : Int;
	/**
		
				Set the border height of the `Flow.backgroundTile`'s top and bottom borders.
		
				Does not affect padding by default, which can be enabled with `-D flow_border` compilation flag.
				If border padding is enabled, `Flow.outerHeight` will be affected accordingly even if background tile is not set
				and will follow the same constraint limitation as padding.
		
				@see `Flow.paddingTop`
				@see `Flow.paddingBottom`
				@see `Flow.paddingVertical`
				@see `h2d.ScaleGrid.borderHeight`
			
	**/
	var borderHeight(never, set) : Int;
	/**
		
				Top border width of the `Flow.backgroundTile`.
		
				Does not affect padding by default, which can be enabled with `-D flow_border` compilation flag.
				If border padding is enabled, `Flow.outerHeight` will be affected accordingly even if background tile is not set
				and will follow the same constraint limitation as padding.
		
				@see `Flow.paddingTop`
				@see `h2d.ScaleGrid.borderTop`
			
	**/
	var borderTop(default, set) : Int;
	/**
		
				Bottom border width of the `Flow.backgroundTile`.
		
				Does not affect padding by default, which can be enabled with `-D flow_border` compilation flag.
				If border padding is enabled, `Flow.outerHeight` will be affected accordingly even if background tile is not set
				and will follow the same constraint limitation as padding.
		
				@see `Flow.paddingBottom`
				@see `h2d.ScaleGrid.borderBottom`
			
	**/
	var borderBottom(default, set) : Int;
	/**
		
				Calculate the client width, which is the inner size of the flow without the borders and padding.
		
				@see `Flow.padding`
			
	**/
	var innerWidth(get, never) : Int;
	/**
		
				Calculate the client height, which is the inner size of the flow without the borders and padding.
		
				@see `Flow.padding`
			
	**/
	var innerHeight(get, never) : Int;
	/**
		
				Flow total width. Compared to `Flow.innerWidth`, it also includes paddings and, if enabled, borders (see `Flow.borderWidth`).
		
				@see `Flow.padding`
			
	**/
	var outerWidth(get, never) : Int;
	/**
		
				Flow total height Compared to `Flow.innerHeight`, it also includes paddings and, if enabled, borders (see `Flow.borderHeight`).
		
				@see `Flow.padding`
			
	**/
	var outerHeight(get, never) : Int;
	/**
		
				The Flow item layout rules.
				See `FlowLayout` for specific details on each mode.
			
	**/
	var layout(default, set) : h2d.Flow.FlowLayout;
	@:deprecated("isVertical is replaced by layout=Vertical")
	@:dox(hide)
	var isVertical(get, set) : Bool;
	/**
		
				When isInline is set to false, the flow size will be reported based on its bounds instead of its calculated size.
				@see `Object.getSize`
			
	**/
	var isInline : Bool;
	/**
		
				When set to true, the Flow will display a debug overlay.
				* Red box around the flow
				* Green box for the client space.
				* Blue boxes for each element.
			
	**/
	var debug(default, set) : Bool;
	/**
		
				When set to true, uses specified lineHeight/colWidth instead of maxWidth/maxHeight for alignment.
			
	**/
	var multiline(default, set) : Bool;
	/**
		
				When set to true, children are aligned in reverse order.
		
				Note that it does not affect render ordering, and may cause overlap of elements due to them positioned in reverse order.
			
	**/
	var reverse(default, set) : Bool;
	/**
		
				When set to true, if a width constraint is present and `minWidth` is null - Flow will expand to fill all the available horizontal space
			
	**/
	var fillWidth(default, set) : Bool;
	/**
		
				When set to true, if a height constraint is present and `minHeight` is null - Flow will expand to fill all the available vertical space
			
	**/
	var fillHeight(default, set) : Bool;
	/**
		
			 	The scroll bar component created when `overflow` is set to `Scroll`
			
	**/
	var scrollBar(default, null) : h2d.Flow;
	/**
		
			 	The scroll bar cursor component created when `overflow` is set to `Scroll`
			
	**/
	var scrollBarCursor(default, null) : h2d.Flow;
	/**
		
			 	The amount of scrolling that is done when using mouse wheel (in pixels).
			
	**/
	var scrollWheelSpeed : Float;
	/**
		
			 	The current scrolling position for the flow content (in pixels). Only applies when overflow is Scroll or Hidden.
			
	**/
	var scrollPosY(default, set) : Float;
	/**
		
				Get the per-element properties. Returns null if the element is not currently part of the Flow.
		
				Requesting the properties will cause a reflow regardless if properties values were changed or not.
			
	**/
	function getProperties(e:h2d.Object):h2d.Flow.FlowProperties;
	private function set_layout(v:h2d.Flow.FlowLayout):h2d.Flow.FlowLayout;
	@:deprecated("isVertical is replaced by layout=Vertical")
	private function get_isVertical():Bool;
	@:deprecated("isVertical is replaced by layout=Vertical")
	private function set_isVertical(v:Bool):Bool;
	private function set_horizontalAlign(v:h2d.Flow.FlowAlign):h2d.Flow.FlowAlign;
	private function set_debug(v:Bool):Bool;
	private function set_verticalAlign(v:h2d.Flow.FlowAlign):h2d.Flow.FlowAlign;
	private function set_overflow(v:h2d.Flow.FlowOverflow):h2d.Flow.FlowOverflow;
	private function set_multiline(v:Bool):Bool;
	private function set_reverse(v:Bool):Bool;
	private function set_needReflow(v:Bool):Bool;
	private function set_lineHeight(v:Int):Int;
	private function set_colWidth(v:Int):Int;
	private function set_padding(v:Int):Int;
	private function set_scrollPosY(v:Float):Float;
	private function get_outerWidth():Int;
	private function get_outerHeight():Int;
	private function get_innerWidth():Int;
	private function get_innerHeight():Int;
	private function set_paddingLeft(v:Int):Int;
	private function set_paddingRight(v:Int):Int;
	private function set_paddingTop(v:Int):Int;
	private function set_paddingBottom(v:Int):Int;
	private function set_fillWidth(v:Bool):Bool;
	private function set_fillHeight(v:Bool):Bool;
	/**
		
				Adds some spacing by either increasing the padding of the latest
				non-absolute element or the padding of the flow if there are no elements in it.
		
				The padding affected depends on the `Flow.layout` mode.
				It's impossible to add spacing with a `Stack` Flow layout.
			
	**/
	function addSpacing(v:Int):Void;
	override function addChildAt(s:h2d.Object, pos:Int):Void;
	override function removeChild(s:h2d.Object):Void;
	override function removeChildren():Void;
	private function set_maxWidth(w:Int):Int;
	private function set_maxHeight(h:Int):Int;
	private function set_minWidth(w:Int):Int;
	private function set_minHeight(h:Int):Int;
	private function set_horizontalSpacing(s:Int):Int;
	private function set_verticalSpacing(s:Int):Int;
	private function set_enableInteractive(b:Bool):Bool;
	private function set_backgroundTile(t:h2d.Tile):h2d.Tile;
	private function set_borderWidth(v:Int):Int;
	private function set_borderLeft(v:Int):Int;
	private function set_borderRight(v:Int):Int;
	private function set_borderHeight(v:Int):Int;
	private function set_borderTop(v:Int):Int;
	private function set_borderBottom(v:Int):Int;
	/**
		
				Call to force all flowed elements position to be updated.
				See `Flow.needReflow` for more information.
			
	**/
	function reflow():Void;
	/**
		
				Sent at the start of the `Flow.reflow`.
			
	**/
	function onBeforeReflow():Void;
	/**
		
				Sent after the `Flow.reflow` was finished.
			
	**/
	function onAfterReflow():Void;
}

/**
 `Flow` content alignment rules.
 */
/**
	
		`Flow` content alignment rules.
	
**/
@:native("h2d.Flow") extern enum FlowAlign {
	/**
		
				Aligns children to the top edge of the `Flow`.
		
				Only applicable to the `Flow.verticalAlign`.
			
	**/
	Top;
	/**
		
				Aligns children to the left edge of the `Flow`.
		
				Only applicable to the `Flow.horizontalAlign`.
			
	**/
	Left;
	/**
		
				Aligns children to the right edge of the `Flow`.
		
				Only applicable to the `Flow.horizontalAlign`.
			
	**/
	Right;
	/**
		
				Aligns children to the center of the `Flow`.
			
	**/
	Middle;
	/**
		
				Aligns children to the bottom edge of the `Flow`.
		
				Only applicable to the `Flow.verticalAlign`.
			
	**/
	Bottom;
}

/**
 The `Flow.layout` type.
 */
/**
	
		The `Flow.layout` type.
	
**/
@:native("h2d.Flow") extern enum FlowLayout {
	/**
		
				Children are aligned horizontally from left to right (or right to left when `Flow.reverse` is enabled).
		
				If `Flow.multiline` is enabled - children can overflow to the next row if there is not enough space available within the Flow size constraints.
		
				`Flow.lineHeight` can be used to set a fixed row height when `Flow.overflow` is set to `Limit` or `Hidden`.
				Objects with height that exceed the limitation will be aligned according to `Flow.verticalAlign` value vertically with `null` being treated as `Bottom`.
			
	**/
	Horizontal;
	/**
		
				Children are aligned vertically from top to bottom (or bottom to top when `Flow.reverse` is enabled).
		
				If `Flow.multiline` is enabled - children can overflow to the next column if there is not enough space available within the Flow size constraints.
		
				`Flow.colWidth` can be used to set a fixed column width when `Flow.overflow` is set to `Limit` or `Hidden`.
				Objects with height that exceed the limitation will be aligned according to `Flow.horizontalAlign` value horizontally with `null` being treated as `Left`.
			
	**/
	Vertical;
	/**
		
				Children are aligned independently (`Flow.reverse` has no effect).
			
	**/
	Stack;
}

/**
 The `Flow.overflow` rules.
 */
/**
	
		The `Flow.overflow` rules.
	
**/
@:native("h2d.Flow") extern enum FlowOverflow {
	/**
		
				Children larger than `Flow.maxWidth` / `Flow.maxHeight` will expand the flow size.
			
	**/
	Expand;
	/**
		
				Limits the bounds reported by the flow using `Flow.maxWidth` or `Flow.maxHeight`, if set.
		
				Children larger than max size will draw outside of the Flow bounds or overflow if `Flow.multiline` is enabled.
			
	**/
	Limit;
	/**
		
				Limits the bounds reported by the flow using `Flow.maxWidth` or `Flow.maxHeight`, if set.
		
				Compared to `Limit` - Flow will mask out the content that is outside of Flow bounds.
			
	**/
	Hidden;
	/**
		
				Similar to `Hidden` but allows to scroll using `Flow.scroll*` properties for control.
			
	**/
	Scroll;
}

/**
 An individual `Flow` element properties.
 
 Can be obtained after adding the element to the Flow and calling `Flow.getProperties`.
 Contains configuration unique of each Flow element.
 */
/**
	
		An individual `Flow` element properties.
	
		Can be obtained after adding the element to the Flow and calling `Flow.getProperties`.
		Contains configuration unique of each Flow element.
	
**/
@:allow(h2d.Flow) @:native("h2d.Flow") extern class FlowProperties {
	@:dox(hide)
	function new(elt:h2d.Object):Void;
	/**
		
				An extra padding to the left of the flow element.
			
	**/
	var paddingLeft : Int;
	/**
		
				An extra padding to the top of the flow element.
			
	**/
	var paddingTop : Int;
	/**
		
				An extra padding to the right of the flow element.
			
	**/
	var paddingRight : Int;
	/**
		
				An extra padding to the bottom of the flow element.
			
	**/
	var paddingBottom : Int;
	/**
		
				When enabled, element won't be automatically positioned during `Flow.reflow` and
				instead treated as an absolute element relative to the Flow.
			
	**/
	var isAbsolute(default, set) : Bool;
	/**
		
				The `Flow.horizontalAlign` override.
		
				If `FlowProperties.isAbsolute` is enabled - aligns the element within the Flow boundaries.
				Otherwise affects the element alignment within the Flow. Does not affect the alignment if `Flow.layout` is `Horizontal`.
			
	**/
	var horizontalAlign : h2d.Flow.FlowAlign;
	/**
		
				The `Flow.verticalAlign` override.
		
				If `FlowProperties.isAbsolute` is enabled - aligns the element within the Flow boundaries.
				Otherwise affects the element alignment within the Flow. Does not affect the alignment if `Flow.layout` is `Vertical`.
			
	**/
	var verticalAlign : h2d.Flow.FlowAlign;
	/**
		
				A visual offset of the element along the X axis.
		
				Offset does not affect the occupied space by the element, and can lead to overlapping with other elements.
			
	**/
	var offsetX : Int;
	/**
		
				A visual offset of the element along the Y axis.
		
				Offset does not affect the occupied space by the element, and can lead to overlapping with other elements.
			
	**/
	var offsetY : Int;
	/**
		
				The minimum occupied width of the element within the flow.
			
	**/
	var minWidth : Int;
	/**
		
				The minimum occupied height of the element within the flow.
			
	**/
	var minHeight : Int;
	/**
		
				The calculated element width since last element reflow.
			
	**/
	var calculatedWidth(default, null) : Int;
	/**
		
				The calculated element height since last element reflow.
			
	**/
	var calculatedHeight(default, null) : Int;
	/**
		
				Whether this element is the last on its current row/column, and the next flow element being on the next row/column after overflow.
			
	**/
	var isBreak(default, null) : Bool;
	/**
		
				Forces this element to break the line and flow onto the next row/column.
				`Flow.multiline` is not required to be enabled.
			
	**/
	var lineBreak : Bool;
	/**
		
				Will constraint the element size through `Object.constraintSize` if the Flow have a set maximum size.
		
				@see `Flow.maxWidth`
				@see `Flow.maxHeight`
			
	**/
	var constraint : Bool;
	/**
		
				When set, element will use the maximum size of non-autoSize elements as size constraint instead of current constraint on the parent flow.
			
	**/
	var autoSize(never, set) : Float;
	var autoSizeWidth : Float;
	var autoSizeHeight : Float;
	private function set_isAbsolute(a:Bool):Bool;
	private function set_autoSize(s:Float):Float;
}