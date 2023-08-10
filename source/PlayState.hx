package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText.FlxTextBorderStyle;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import openfl.filters.ShaderFilter;
import shaders.GrayscaleShader;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		var topCam = new FlxCamera();
		FlxG.cameras.add(topCam);

		var bottomCam = new FlxCamera();
		FlxG.cameras.add(bottomCam, false);

		bottomCam.bgColor.alpha = 0;

		var topText = new FlxText();
		topText.text = "Hello";
		topText.color = FlxColor.RED;
		topText.size = 32;
		topText.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLUE, 4);
		topText.screenCenter(X);
		topText.camera = topCam;
		add(topText);

		var bottomText = new FlxText();
		bottomText.text = "World";
		bottomText.color = FlxColor.BLUE;
		bottomText.size = 32;
		bottomText.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.RED, 4);
		bottomText.screenCenter(X);
		bottomText.y = FlxG.height - bottomText.height;
		bottomText.camera = bottomCam;
		add(bottomText);

		topCam.setFilters([new ShaderFilter(new GrayscaleShader())]);

		var filtersButton:FlxButton = new FlxButton(0, 0, "Copy Filters", function()
		{
			// you could do
			bottomCam.setFilters(topCam.getFilters());
			// instead of
			/*`@:privateAccess
				bottomCam.setFilters(topCam._filters);` */
		});
		filtersButton.screenCenter();
		add(filtersButton);
	}
}
