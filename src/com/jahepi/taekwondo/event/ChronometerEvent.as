package com.jahepi.taekwondo.event
{
	import flash.events.Event;
	
	public class ChronometerEvent extends Event
	{
		
		public static var ON_SECOND:String = "onSecond";
		public static var ON_COMPLETE_TIME:String = "onCompleteTime";
		
		public function ChronometerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}