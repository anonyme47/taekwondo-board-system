package com.jahepi.taekwondo.loaders
{
	import com.jahepi.taekwondo.dto.Controller;
	import com.jahepi.taekwondo.dto.ControllerButton;
	import com.jahepi.taekwondo.event.ConfigLoaderEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class ConfigLoader extends EventDispatcher
	{
		
		private static var PATH:String = "config.xml";
		
		private var loader:URLLoader;
		private var config:Config;
		
		public function ConfigLoader(config:Config, target:IEventDispatcher = null)
		{
			super(target);
			this.config = config;
			this.loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, this.onLoadComplete);	
		}
		
		public function load():void 
		{
			this.loader.load(new URLRequest(PATH));
		}
		
		private function onLoadComplete(e:Event):void 
		{
			
			var xml:XML = XML(e.target.data);
			
			for each (var variable:XML in xml..variable) {
				this.config.setVariable(variable.@name, variable.toString());
			}
			
			for each (var controller:XML in xml..controller) {
				var name:String = controller.@name;
				var controllerDto:Controller = new Controller(name);
				for each (var group:XML in controller..group) {
					var groupPlayer:String = group.@player;
					for each (var button:XML in group..button) {
						var key:String = button.@key;
						var value:String = button.@value;
						var buttonDto:ControllerButton = new ControllerButton(groupPlayer, key, value, controllerDto);
						controllerDto.addButton(buttonDto);
					}
				}
				
				this.config.addController(controllerDto);
			}
			
			var event:ConfigLoaderEvent = new ConfigLoaderEvent(ConfigLoaderEvent.ON_CONFIG_LOAD_COMPLETE);
			this.dispatchEvent(event);
		}
	}
}