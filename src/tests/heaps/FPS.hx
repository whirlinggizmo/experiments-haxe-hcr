package tests.heaps;

class FPS {
	static var fps:Float = 0;
	static var frames:Int = 0;
	static var nextFPSUpdate:Float = 0;
	static var fpsHistory:Array<Float> = [];
	static var historyLength:Int = 60;
	static var historyIndex:Int = 0;
	static var fpsSum:Float = 0; // Running sum for the FPS history
	static var filledHistoryLength:Int = 0; // Tracks valid entries in fpsHistory
	static var fpsText:h2d.Text;
	static var fpsBackground:h2d.Graphics;
	static var fpsBackgroundWidth:Float;
	static public var precision:Int = 0;
	static var initialized = false;

	// Initialize the FPS history array with zeros
	static public function init(parent:h2d.Object, font:h2d.Font = null, precision:Int = 0):Void {
		for (i in 0...historyLength) {
			fpsHistory.push(0);
		}
		fpsSum = 0;
		filledHistoryLength = 0;
		FPS.precision = precision;

		if (font == null) {
			font = hxd.res.DefaultFont.get();
		}
		var fpsBackground = new h2d.Graphics(parent);
		fpsText = new h2d.Text(font, fpsBackground);
		fpsText.text = 'FPS: 9999';
		fpsText.dropShadow = {
			dx: 2,
			dy: 2,
			color: 0,
			alpha: 0.6
		}
		fpsBackgroundWidth = fpsText.textWidth;
		fpsBackground.beginFill(0, 0.6);
		fpsBackground.drawRect(0, 0, fpsBackgroundWidth, fpsText.textHeight);
		fpsBackground.endFill();

		initialized = true;
	}

	public static function round(number:Float, ?precision = 2):Float {
		number *= Math.pow(10, precision);
		return Math.ffloor(number) / Math.pow(10, precision);
	}

	static public function update(dt:Float):Void {
		if (!initialized)
			return;
		frames++;
		nextFPSUpdate += dt;

		if (nextFPSUpdate > 1) {
			fps = frames / nextFPSUpdate;

			// Subtract the outgoing value and add the new one to keep a running sum
			fpsSum -= fpsHistory[historyIndex];
			fpsHistory[historyIndex] = fps;
			fpsSum += fps;

			// Update filled length if it's not yet full
			if (filledHistoryLength < historyLength)
				filledHistoryLength++;

			// Update the circular buffer index
			historyIndex = (historyIndex + 1) % historyLength;

			// Reset frame counter and timer for the next second
			frames = 0;
			nextFPSUpdate = 0;
		}

		fpsText.text = "FPS: " + getAverageFPS(0);
		fpsText.setPosition(fpsBackgroundWidth / 2 - fpsText.textWidth / 2, 0);
	}

	static public function getAverageFPS(precision:Int = 1):Float {
		if (!initialized)
			return 0;
		// Avoid division by zero by checking if filledHistoryLength is valid
		if (filledHistoryLength == 0)
			return 0;

		var avg:Float = fpsSum / filledHistoryLength;
		// trace("Average FPS: " + avg);
		return round(avg, precision);
	}
}
