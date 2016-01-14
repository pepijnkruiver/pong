package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import screens.GameOverScreen;
	import screens.GameScreen;
	import screens.IntroScreen;
	import screens.GameWinScreen;
	import sounds.SoundPlayer;
	    
	
	/**
	 * ...
	 * @author Erwin Henraat
	 */
	public class Main extends MovieClip 
	{
		private var gameScreen:GameScreen;
		private var introScreen:IntroScreen;
		private var gameOverScreen:GameOverScreen;
		private var soundPlayer:SoundPlayer;
		private var winScreen:GameWinScreen;
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point			
			soundPlayer = new SoundPlayer(this);
			buildIntroSreen();	
		}
		private function buildIntroSreen():void
		{			
			introScreen = new IntroScreen();
			addChild(introScreen);
			introScreen.addEventListener(IntroScreen.START_GAME, startGame);
		}
		private function startGame(e:Event):void 
		{
			removeChild(introScreen);
			gameScreen = new GameScreen();
			addChild(gameScreen);
			gameScreen.addEventListener(GameScreen.GAME_OVER, onGameOver);
			gameScreen.addEventListener(GameScreen.YOU_WON, onYouWon);
	}		
		private function onYouWon(e:Event):void 
		{
			
			
			removeChild(gameScreen);
			winScreen = new GameWinScreen();
			trace(gameScreen);
			gameScreen.removeEventListener(GameScreen.YOU_WON, onYouWon);
						
			
			addChild(winScreen);
			winScreen.addEventListener(GameWinScreen.RESET, onReset);
			
			
			
		}		
	
		private function onGameOver(e:Event):void 
		{
			removeChild(gameScreen);
			gameScreen.removeEventListener(GameScreen.GAME_OVER, onGameOver);
						
			gameOverScreen = new GameOverScreen();
			addChild(gameOverScreen);
			gameOverScreen.addEventListener(GameOverScreen.RESET, onReset);
			
			
			
		}		
		private function onReset(e:Event):void 
  {
   e.target.removeEventListener(GameOverScreen.RESET, onReset);
   if(winScreen != null)if(this.contains(winScreen))removeChild(winScreen);
   if(gameOverScreen != null)if(this.contains(gameOverScreen))removeChild(gameOverScreen);
   
   buildIntroSreen();
  }
		
	}
	
}