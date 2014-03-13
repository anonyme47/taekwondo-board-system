package com.jahepi.taekwondo.loaders
{
	import com.jahepi.taekwondo.collection.ControllerCollection;
	import com.jahepi.taekwondo.dto.Controller;
	import com.jahepi.taekwondo.dto.ControllerButton;

	public class Config
	{
		
		private var controllers:ControllerCollection;
		private var variables:Object;
		
		public function Config()
		{
			this.controllers = new ControllerCollection();
			this.variables = new Object();
		}
		
		public function addController(controller:Controller):void
		{
			this.controllers.addController(controller);
		}
		
		public function getNumberOfControllers():Number {
			return this.controllers.getNumberOfControllers();
		}
		
		public function getControllers():Array {
			return this.controllers.getControllers();
		}
		
		public function getButtonByKey(key:String):ControllerButton
		{
			return this.controllers.getButtonByKey(key);
		}
		
		public function setVariable(key:String, value:*):void 
		{
			this.variables[key] = value;
		}
		
		public function getVariable(key:String):*
		{
			if (this.variables.hasOwnProperty(key)) {
				return this.variables[key];
			}
			
			return null;
		}
	}
}