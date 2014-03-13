package com.jahepi.taekwondo.dto
{
	public class ControllerButton
	{
		
		private var group:String;
		private var key:String;
		private var value:String;
		private var controller:Controller;
		
		public function ControllerButton(group:String, key:String, value:String, controller:Controller)
		{
			this.group = group;
			this.key = key;
			this.value = value;
			this.controller = controller;
		}
		
		public function getGroup():String
		{
			return this.group;
		}
		
		public function getKey():String
		{
			return this.key;
		}
		
		public function getValue():String
		{
			return this.value;
		}
		
		public function getControllerName():String
		{
			return this.controller.getName();
		}
	}
}