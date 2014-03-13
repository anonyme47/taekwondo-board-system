package com.jahepi.taekwondo.dto
{
	public class Controller
	{
		
		private var name:String;
		private var buttons:Array;
		
		public function Controller(name:String)
		{
			this.name = name;
			this.buttons = new Array();
		}
		
		public function addButton(button:ControllerButton):void
		{
			this.buttons.push(button);
		}
		
		public function getButtonByKey(key:String):ControllerButton
		{
			for (var i:int = 0; i < this.buttons.length; i++) {
				var button:ControllerButton = this.buttons[i];
				if (button.getKey() == key) {
					return button;
				}
			}
			
			return null;
		}
		
		public function getName():String
		{
			return this.name;
		}
	}
}