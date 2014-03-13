package com.jahepi.taekwondo.dto
{
	public class ScorePoint
	{
		private var name:String;
		private var value:Number;
		
		public function ScorePoint(name:String, value:Number) 
		{
			this.name = name;
			this.value = value;
		}
		
		public function getName():String 
		{
			return this.name;
		}
		
		public function getValue():Number 
		{
			return this.value;
		}
	}
}