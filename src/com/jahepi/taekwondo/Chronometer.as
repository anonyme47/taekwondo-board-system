package com.jahepi.taekwondo
{
	import com.jahepi.taekwondo.event.ChronometerEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.osmf.events.TimeEvent;

	public class Chronometer extends EventDispatcher
	{
		
		public static var BACKWARD_TYPE:String = "backward";
		public static var NORMAL_TYPE:String = "normal";
		private static var INTERVAL:Number = 1000;
		
		private var seconds:int;
		private var secondsCount:int;
		private var type:String;
		private var timer:Timer;
		private var isActive:Boolean;
		
		public function Chronometer(seconds:int, type:String)
		{
			this.type = type;
			this.isActive = false;
			this.seconds = seconds;
			this.timer = new Timer(INTERVAL);
			this.timer.addEventListener(TimerEvent.TIMER, this.onUpdate);
			this.reset();
		}
		
		private function onUpdate(e:Event):void
		{	
			if (this.type == BACKWARD_TYPE) {
				this.secondsCount--;
				if (this.secondsCount == 0) {
						this.pause();
						this.dispatchEvent(new ChronometerEvent(ChronometerEvent.ON_COMPLETE_TIME, false, false));
				}
				if (this.secondsCount < 0) {
					this.secondsCount = 0;
				}
			}
			
			if (this.type == NORMAL_TYPE) {
				this.secondsCount++;
				if (this.secondsCount == this.seconds) {
					this.pause();
					this.dispatchEvent(new ChronometerEvent(ChronometerEvent.ON_COMPLETE_TIME, false, false));
				}
				if (this.secondsCount > this.seconds) {
					this.secondsCount = this.seconds;
				}
			}
			
			this.dispatchEvent(new ChronometerEvent(ChronometerEvent.ON_SECOND));
		}
		
		public function start():void 
		{
			if (this.isActive == false) {
				this.timer.start();
				this.isActive = true;
			}
			
		}
		
		public function pause():void 
		{
			if (this.isActive) {
				this.timer.stop();
				this.isActive = false;
			}
		}
		
		public function reset():void 
		{
			this.pause();
			
			if (this.type == BACKWARD_TYPE) {
				this.secondsCount = this.seconds;
			}
			
			if (this.type == NORMAL_TYPE) {
				this.secondsCount = 0;
			}
			
			this.dispatchEvent(new ChronometerEvent(ChronometerEvent.ON_SECOND));
		}
		
		public function setTypeAndSeconds(type:String, seconds:int):void 
		{
			this.type = type;
			this.seconds = seconds;
			this.reset();
		}
		
		public function getSeconds():int 
		{
			return this.secondsCount;	
		}
		
		public function setType(type:String):void 
		{
			this.type = type;	
		}
		
		public function getType():String 
		{
			return this.type;	
		}
		
		public function isActived():Boolean
		{
			return this.isActive;
		}
		
		public function getTime():String 
		{
			var minutes:int = this.secondsCount / 60;
			var seconds:int = this.secondsCount % 60;
			var minutesStr:String = minutes.toString();
			var secondsStr:String = seconds.toString();
			
			if (minutes < 10) {
				minutesStr = "0" + minutesStr;
			}
			
			if (seconds < 10) {
				secondsStr = "0" + secondsStr;
			}
			
			return minutesStr + ":" + secondsStr;
		}
	}
}