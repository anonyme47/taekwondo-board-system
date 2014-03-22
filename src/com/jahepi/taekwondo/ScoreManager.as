package com.jahepi.taekwondo
{
	import com.jahepi.taekwondo.dto.ScorePoint;
	import com.jahepi.taekwondo.event.ScoreManagerEvent;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	
	public class ScoreManager extends EventDispatcher
	{
		
		public static var TIME_INTERVAL:Number = 100;
		public static var TIME_LIMIT:Number = 5000;
		
		private var type:String;
		private var time:Number;
		private var startListening:Boolean;
		private var thread:Timer;
		private var points:Array;
		private var total:Number;
		
		public function ScoreManager(type:String, target:IEventDispatcher = null)
		{
			super(target);
			this.time = 0;
			this.total = 0;
			this.type = type;
			this.startListening = false;
			this.thread = new Timer(TIME_INTERVAL);
			this.thread.addEventListener(TimerEvent.TIMER, onTimer);
			this.thread.start();
			this.points = new Array();
		}
		
		private function onTimer(e:TimerEvent):void 
		{
			if (this.startListening) {
				var point:Number = this.choosePoint();
				if (point > 0 || this.time > TIME_LIMIT) {
					this.startListening = false;
					this.points = new Array();
				}
				
				this.time += TIME_INTERVAL;
			}
		}
		
		private function choosePoint():Number 
		{
			var pointValue:Number = 0;
			var pointMaxCount:Number = 0;
			var pointsTemp:Dictionary = new Dictionary();
			
			// Clasify points by the number of times they were selected
			for (var i:int = 0; i < this.points.length; i++) {
				var point:ScorePoint = this.points[i];
				var value:Number = point.getValue();
				if (pointsTemp.hasOwnProperty(value)) {
					pointsTemp[value] += 1;
				} else {
					pointsTemp[value] = 1;
				}
			}
			// Which point was selected more times
			for (var key:Object in pointsTemp) {
				var pointCount:Number = pointsTemp[key];
				if (pointCount > pointMaxCount) {
					pointValue = Number(key);
					pointMaxCount = pointCount;
				}
			}
			// In case the point was not selected more than one time, set it to zero
			if (pointMaxCount <= 1) {
				pointValue = 0;
			}
			
			if (pointValue > 0) { 
				this.total += pointValue;
				this.dispatchEvent(new ScoreManagerEvent(this.type, pointValue, ScoreManagerEvent.ON_CHOOSE_POINT));
			}
			
			return pointValue;
		}
		
		public function addPoint(point:ScorePoint):void
		{
			
			if (this.hasPointName(point) == false) { 
				this.points.push(point);
			}
			
			if (this.points.length == 1) {
				this.time = 0;
				this.startListening = true;
			}
		}
		
		private function hasPointName(point:ScorePoint):Boolean 
		{
			for (var i:int = 0; i < this.points.length; i++) {
				var pointCol:ScorePoint = this.points[i];
				if (point.getName() == pointCol.getName()) {
					return true;
				}
			}
			
			return false;
		}
		
		public function resetTotal():void 
		{
			this.total = 0;
			this.dispatchEvent(new ScoreManagerEvent(this.type, 0, ScoreManagerEvent.ON_RESET_SCORE));
		}
		
		public function getTotal():Number
		{
			return this.total;
		}
		
		public function reduceTotal():void
		{
			if (this.total > 0) {
				this.total--;
				this.dispatchEvent(new ScoreManagerEvent(this.type, -1, ScoreManagerEvent.ON_CHOOSE_POINT));
			}
		}
		
		public function sumTotal():void
		{
			this.total++;
			this.dispatchEvent(new ScoreManagerEvent(this.type, 1, ScoreManagerEvent.ON_CHOOSE_POINT));
		}
	}
}