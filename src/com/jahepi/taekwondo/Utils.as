package com.jahepi.taekwondo
{
	public class Utils
	{
		public static function isCharCommand(char:String):Boolean 
		{
			if (char != null) {
				if (char.length == 0) {
					return false;
				}
			}
			
			var chars:Array = [8, 13, 27, 32];
			for (var i:int = 0; i < chars.length; i++) {
				if (char.charCodeAt(0) == chars[i]) {
					return true;
				}
			}
			
			return false;
		}
	}
}