class EventEmitter {
	// A map where the keys are event names (Strings) and the values are arrays of listeners (functions).
	private var events:Map<String, Array<Dynamic->Void>> = new Map();

	// constructor
	public function new() {
		// A map where the keys are event names (Strings) and the values are arrays of listeners (functions).
		this.events = new Map();
	}

	/**
	 * Registers an event listener for the specified event.
	 * 
	 * @param event The event name.
	 * @param listener The function to be called when the event is emitted.
	 */
	public function on(event:String, listener:Dynamic->Void):Void {
		if (!events.exists(event)) {
			events.set(event, []);
		}
		events.get(event).push(listener);
	}

	/**
	 * Removes a specific listener for the specified event.
	 * 
	 * @param event The event name.
	 * @param listener The function to be removed.
	 */
	public function off(event:String, listener:Dynamic->Void):Void {
		if (events.exists(event)) {
			var listeners = events.get(event);
			listeners.remove(listener); // Removes the listener
			if (listeners.length == 0) {
				events.remove(event); // If no listeners left, remove the event
			}
		}
	}

	/**
	 * Emits an event, calling all registered listeners for that event.
	 * 
	 * @param event The event name.
	 * @param data The event data passed to each listener.
	 */
	public function emit(event:String, data:Dynamic):Void {
		if (events.exists(event)) {
			var listeners = events.get(event).copy(); // Copy to avoid modification during iteration
			for (listener in listeners) {
				listener(data);
			}
		}
	}

	public function getListeners(event:String):Array<Dynamic->Void> {
		return events.get(event);
	}

	public function getEvents():Iterator<String> {
		return events.keys();
	}

	/**
	 * Clears all listeners for the specified event.
	 * 
	 * @param event The event name.
	 */
	public function clear(event:String):Void {
		var eventListeners = events.get(event);
		if (eventListeners != null) {
			eventListeners = []; // Clears the listeners
		}
		events.remove(event);
	}

	/**
	 * Clears all listeners for all events.
	 */
	public function clearAll():Void {
		for (event in events.keys()) {
			clear(event);
		}
		events = new Map(); // Resets the event map
	}
}

// EventEmitterTracker
// Helper class for tracking registered event listeners
// Springboards to an EventEmitter instance
// This allows us to track the event listeners locally so we can remove
// specific listeners or all listeners when needed  (e.g. a script).
class EventEmitterTracker extends EventEmitter {
	// track the event listeners so we can remove them later
	private var registeredEvents:Map<String, Array<Dynamic->Void>> = new Map();

	@:isVar
	public var eventEmitter(get, set):EventEmitter;

	public function get_eventEmitter():EventEmitter {
		return eventEmitter;
	}

	public function set_eventEmitter(value:EventEmitter):EventEmitter {
		if (this.eventEmitter != null) {
			trace("EventEmitterTracker: Clearing all event listeners.");
			this.clearAll();
		}
		eventEmitter = value;
		return eventEmitter;
	}

	public function new(eventEmitter:EventEmitter = null) {
		super();
		this.eventEmitter = eventEmitter;
	}

	// EventEmitter interface for scripts
	override public function on(event:String, callback:Dynamic->Void):Void {
		if (this.eventEmitter == null) {
			trace("No external event emitter set.");
			return;
		}
		eventEmitter.on(event, callback);

		// track the event listeners so we can remove them later
		if (!registeredEvents.exists(event)) {
			registeredEvents.set(event, []);
		}
		registeredEvents.get(event).push(callback);
	}

	override public function off(event:String, callback:Dynamic->Void):Void {
		if (this.eventEmitter == null) {
			trace("No external event emitter set.");
			return;
		}

		eventEmitter.off(event, callback);

		// untrack the event listeners, removing them from the internal event emitter
		if (registeredEvents.exists(event)) {
			var listeners = registeredEvents.get(event);
			listeners.remove(callback);
			if (listeners.length == 0) {
				registeredEvents.remove(event);
			}
		}
	}

	override public function emit(event:String, data:Dynamic):Void {
		if (this.eventEmitter == null) {
			trace("No external event emitter set.");
			return;
		}
		eventEmitter.emit(event, data);
	}

	override public function clear(event:String):Void {
		// remove the event listeners from the external event emitter
		for (callback in registeredEvents.get(event)) {
			off(event, callback);
		}
	}

	override public function clearAll():Void {
		// remove all event listeners from the external event emitter
		for (event in registeredEvents.keys()) {
			clear(event);
		}
	}
}
