package com.jahepi.taekwondo.event
{
	import flash.events.Event;
	
	public class ConfigLoaderEvent extends Event
	{
		public static var ON_CONFIG_LOAD_COMPLETE:String = "OnConfigLoadCompleteEvent";
		
		public function ConfigLoaderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}