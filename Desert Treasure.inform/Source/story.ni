"Desert Treasure" by Austin Ishii

[taken from "Get that Cat"]
Use the serial comma.
When play begins: 
    now left hand status line is "Exits: [exit list]"; 
    now right hand status line is "[location]".
To say exit list: 
	let place be location; 
	repeat with way running through directions: 
		let place be the room way from the location; 
		if place is a room, say " [way]".
[Entryway Coding]

The Entrance is a dark room. It is north of the Desert and south of the Main hall.  Description is "The dark hallway is covered in dozens of various depictions of Ancient Egyptian art depicing the life of the Pharoah and his Queen. It is slightly stuffy here, no doubt due the amount of time that this tomb has been sealed away."

[The desert code]

The Desert is a room. It is south of the Entrance. "You wince as you open the doors outside. The sandstorm that forced you to come make it impossible leave the tomb. Looks like you're stuck here until the storm subsides."

[Main Hall Code]

Survival Kit is a portable container. It contains Flashlight, Matches, and Survival Food. The Survival Kit is carried by the player. Description is "A rough, waterproof survival kit. You packed it just in case something like this happens. Looks like your paranoia paid off this time."

Flashlight is a device. The description of a Flashlight is "Your trusty flashlight. You're not sure how much battery it has left, but you should probably find something else to your surroundings by just in case."

A device can be broken or working. A device is usually working. 

Matches are a thing. Description is "A pack of survival matches. They can be lit underwater or in the middle of a downpour."

Understand "light [something] with [something]" as lighting something with. 

Check lighting it with:
	if noun is torch and second noun is matches:
		say "You manage to light the torches with the match. It burns brightly in your grip, illuminating everything around you.";
		now the torch is lit;
	if noun is an animal:
		say "You don't want to piss Anubis off, so you decide not to.";
	if noun is not torches:
		say "That's not flammable."

After switching flashlight on:
	if flashlight is working:
		say "You turn the flashlight on, providing a small source of light for now. You better be careful, it doesn't look like you have much battery left.";
		now the flashlight is lit;
	if the flashlight is broken:
		say: "You try to switch the flashlight on, but you don't have enough battery power to make it stay on.".
	
After switching the flashlight off:
	if the flashlight is working:
		say "You switch the flashlight off.";
	if the flashlight is broken:
		say "It's broken so it really doesn't matter."

The Main Hall is a dark room. It is north of the Hallway, south of the Treasury, east of the Hall of the Pharoah,  and west of the Queen's hall. Description is "The main hall is a wonderous location, the walls rich with dozens of hieroglyphs as well as various pictures of the King and Queen as they adorn the walls. It shows their triumphs as they ruled their kingdom with a strange artifact in hand. It is a large jewel with gold decorations. It looks very important."

After entering Main hall for the first time:
	say "You marvel at the scenery that is displayed before you. You somehow managed to find an Ancient Egyptian Tomb in the middle of nowhere! Since you cannot leave, you might as well explore the area. Those walls look interesting..."

Instead of examining walls for the first time:
	say "Your fingers touch the painted walls of the crypt when you suddenly hear a mysterious voice. [line break]'You are not welcome here. Leave this place now!' [line break]You are startled by the sudden noise as you look around for where the voice came from. You manage to see a shadowy figure enter the door on the east."

Walls are scenery in the Main Hall. Description is "On the mural on the left is the Pharoah of Egypt, the crown of kingdom rests upon his head. He holds a flail and a crook in hand, symbols of his authority as the ruler of the kingdom. On the right wall is the Pharoah's bride, the Queen. She did not hold as much power as the Pharoah, but she is still a very influential person."

The Hall of the Pharoah is a room. It is west of the Main Hall and south of the Pharoah's Chamber. Description is "This chamber is dedicated to the triumphs that the Pharoah went through in life. He ruled the people kindly but he kept them in line with his laws, as a king should."

The King's Chamber is a room. It is north of the Hall of the Pharoah.

The Hall of the Queen is a room. It is east of the Main Hall and south of the Queen's Chamber.

The Queen's Chamber is a room. It is north of the Hall of the Queen. 

The Treasury is north of the Main Hall. 
