package com.jahepi.taekwondo.collection
{
	import com.jahepi.taekwondo.dto.Controller;
	import com.jahepi.taekwondo.dto.ControllerButton;

	public class ControllerCollection
	{
		
		private var controllers:Array;
		
		public function ControllerCollection()
		{
			this.controllers = new Array();
		}
		
		public function addController(controller:Controller):void
		{
			this.controllers.push(controller);
		}
		
		public function getNumberOfControllers():Number {
			return this.controllers.length;
		}
		
		public function getControllers():Array
		{
			return this.controllers;
		}
		
		public function getButtonByKey(key:String):ControllerButton
		{
			for (var i:int = 0; i < this.controllers.length; i++) {
				var controller:Controller = this.controllers[i];
				var button:ControllerButton = controller.getButtonByKey(key);
				if (button != null) {
					return button;
				}
			}
			
			return null;
		}
	}
}