package;

import flash.Lib;
import flash.text.TextField;
import flash.text.TextFieldType;
import flash.events.Event;
import haxe.remoting.Context;
import haxe.remoting.ExternalConnection;

/**
 * Compiled to Flash.
 *
 * @author Steve Richey
 */
class FlashMain
{
	static private var status:TextField;
	static private var cnx:ExternalConnection;
	static private var ctx:Context;
	
	static function main()
	{
		/**
		 * Connect to JavaScript.
		 */
		ctx = new Context();
		ctx.addObject("FlashMain", FlashMain);
		cnx = ExternalConnection.jsConnect("default", ctx);
		
		/**
		 * Create the input TextField.
		 */
		status = new TextField();
		status.width = 900;
		status.type = TextFieldType.INPUT;
		status.text = "Hello";
		status.addEventListener( Event.CHANGE, setText );
		Lib.current.addChild( status );
		
		/**
		 * Create the HTML div via JavaScript.
		 */
		cnx.JsMain.appendDiv.call( [ status.text ] );
	}
	
	/**
	 * Update the text of the div via JavaScript.
	 */
	static public function setText( ?e:Event ):Void
	{
		// Wrapped in a try-catch statement to provide notification if security settings are not correct.
		
		try {
			cnx.JsMain.setText.call( [ status.text ] );
		} catch ( e:Dynamic ) {
			trace( Std.string( e ) );
		}
	}
}