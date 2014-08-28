package;

import js.Browser;
import js.html.Element;
import haxe.remoting.Context;
import haxe.remoting.ExternalConnection;

/**
 * Compiled to JavaScript.
 *
 * @author Steve Richey
 */
class JsMain
{
	static private var cnx:ExternalConnection;
	static private var ctx:Context;
	static private var div:Element;
	
	static private function main():Void
	{
		/**
		 * Establish connection to Flash object.
		 */
		ctx = new Context();
		ctx.addObject("JsMain", JsMain);
		cnx = ExternalConnection.flashConnect("default", "myFlashObject", ctx );
	}
	
	/**
	 * Append div to document body.
	 */
	static public function appendDiv( Text:String ):Void
	{
		div = Browser.document.createElement( "div" );
		div.innerHTML = Text;
		div.className = "Status";
		Browser.document.body.appendChild( div );
	}
	
	/**
	 * Update the text of the created div.
	 * 
	 * @param	Text	The text to update the div to.
	 * @return	The text now in the div.
	 */
	static public function setText( Text:String ):String
	{
		return div.innerHTML = Text;
	}
}