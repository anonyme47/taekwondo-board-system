package com.jahepi.taekwondo.event
{
	import flash.events.Event;
	
	public class FaultTaekwondoEvent extends Event
	{
		public static var ON_ADD_POINT:String = "onAddPoint";
		public static var ON_LOSE_BY_FAULT:String = "onLoseByFault";
		
		public function FaultTaekwondoEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}