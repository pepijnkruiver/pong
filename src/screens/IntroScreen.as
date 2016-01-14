package screens 
{
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import utils.Controller;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author erwin henraat
	 */
	public class IntroScreen extends Screen 
	{
		private var title:TextField;
		private var info:TextField;
		private var info2:TextField;
		private var start:TextField;
		
		public static const START_GAME:String = "start game";		
				
		
		
		
		public function IntroScreen() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			
						
			title = new TextField();
			title.embedFonts = true;
			title.text = "Poképong";
			title.autoSize = TextFieldAutoSize.CENTER;			
			title.setTextFormat(textFormat);		
			
			title.x = stage.stageWidth / 2 - title.textWidth /2;
			title.y = stage.stageHeight / 2 - title.textHeight /2;
			
			title.mouseEnabled = false;
			
			addChild(title);
			
			info = new TextField();
			info.embedFonts = true;
			info.text = "Be the first to obtain 5 points to win!";
			info.autoSize = TextFieldAutoSize.CENTER;			
			info.setTextFormat(subFormat);		
			
			info.x = stage.stageWidth / 2 - info.textWidth /2;
		    info.y = stage.stageHeight / 2 + 50;
			
			info.mouseEnabled = false;
			
			addChild(info);
			
			info2 = new TextField();
			info2.embedFonts = true;
			info2.text = "Use the W and S keys to move your paddle";
			info2.autoSize = TextFieldAutoSize.CENTER;			
			info2.setTextFormat(subFormat);		
			
			info2.x = stage.stageWidth / 2 - info2.textWidth /2;
		    info2.y = stage.stageHeight / 2 + 65;
			
			info2.mouseEnabled = false;
			
			addChild(info2);
			
			
			start = new TextField();
			start.embedFonts = true;
			start.text = "press space to start";
			start.autoSize = TextFieldAutoSize.CENTER;
			start.setTextFormat(subFormat)
			
			start.x = stage.stageWidth / 2 - start.textWidth / 2;
			start.y = stage.stageHeight / 2 + 200;
			
			addChild(start);
			
			start.addEventListener(Event.ENTER_FRAME, loop);
			
			
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onKeyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == 32) {
				start.removeEventListener(Event.ENTER_FRAME, loop);		
				stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
				dispatchEvent(new Event(START_GAME));
				
			}
		}
		private var dir:Boolean = true;
		private function loop(e:Event):void 
		{
			if (dir)
			{
				start.alpha -= .1;	
				if (start.alpha <= 0) dir = false;
				
			}else
			{
				start.alpha += .1;	
				if (start.alpha >= 1) dir = true;
			}
			
			
		}
		
	}

}