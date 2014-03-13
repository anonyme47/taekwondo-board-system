package com.jahepi.taekwondo.event
{
	import flash.events.Event;
	
	public class ScoreManagerEvent extends Event
	{
		
		public static var ON_CHOOSE_POINT:String = "OnChoosePointEvent";
		public static var ON_RESET_SCORE:String = "onResetScore";
		
		private var scoreType:String;
		private var scoreValue:Number;
		
		public function ScoreManagerEvent(scoreType:String, scoreValue:Number, type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.scoreType = scoreType;
			this.scoreValue = scoreValue;
		}
		
		public function getScoreValue():Number 
		{
			return this.scoreValue;	
		}
		
		public function getScoreType():String
		{
			return this.scoreType;	
		}
	}
}