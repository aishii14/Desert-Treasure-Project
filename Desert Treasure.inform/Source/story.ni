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

The Entrance is a dark room. It is north of the Desert and south of the Main hall.  Description is "The hallway is covered in dozens of various depictions of Ancient Egyptian art depicing the life of the Pharoah and his Queen. It is slightly stuffy here, no doubt due the amount of time that this tomb has been sealed away."

[The desert code]

The Desert is a room. It is south of the Entrance. "You wince as you open the doors outside. The sandstorm that forced you to come make it impossible leave the tomb. Looks like you're stuck here until the storm subsides."

[Player Inventory]

Survival Kit is a portable container. It contains Flashlight, Matches, and Survival Food. The Survival Kit is carried by the player. Description is "A rough, waterproof survival kit. You packed it just in case something like this happens. Looks like your paranoia paid off this time."

Flashlight is a device. The description of a Flashlight is "Your trusty flashlight. You're not sure how much battery it has left, but you should probably find something else to your surroundings by just in case."

[matches and torches]

Matches are a thing. Description is "A pack of survival matches. They can be lit underwater or in the middle of a downpour."

Lighting it with is an action applying to two things.
Understand "light [something] with [something]" as lighting it with. 

Torch is a thing in the Entrance. Description is "A[if torch is unlit] torch that smells like oil [otherwise if torch is lit] a lit torch that burns brightly [end if]."

Check lighting it with:
	if noun is torch and second noun is matches:
		say "You manage to light the torches with the match. It burns brightly in your grip, illuminating everything around you.";
		now the torch is lit;
	if noun is an animal:
		say "You don't want to piss Anubis off, so you decide not to.";
	if noun is not torch:
		say "That's not flammable."

After switching on the flashlight:
		say "You turn the flashlight on, providing a small source of light for now. You better be careful, it doesn't look like you have much battery left.";
		now the flashlight is lit.
	
After switching off the flashlight:
		say "You switch the flashlight off.";
		now the flashlight is unlit. 

The Main Hall is a dark room. It is north of the Hallway, south of the Treasury, east of the Hall of the Sun,  and west of the Hall of the Moon. Description is "The main hall is a wonderous location, the walls rich with dozens of hieroglyphs as well as various pictures of the King and Queen as they adorn the walls. It shows their triumphs as they ruled their kingdom with a strange artifact in hand. It is a large jewel with gold decorations. It looks very important."

An every turn rule:
	If flashlight is lit:
		if the player is in Main Hall:
			say "Your flashlight sputters and dies. You shake it before you realize that it is really dead before throwing it away in disgust. [if torch is lit]Thankfully you lit the torch before you came in so you have some lighting. [end if] ";
			now flashlight is unlit;
			remove flashlight from play.
		
Instead of examining walls for the first time:
	say "Your fingers touch the painted walls of the crypt when you suddenly hear a mysterious voice. [line break]'You are not welcome here. Leave this place now!' [line break]You are startled by the sudden noise as you look around for where the voice came from. You manage to see a shadowy figure enter the door on the east.";
	move Large Jackal to Hall of the Moon.

Walls are scenery in the Main Hall. Description is "On the mural on the left is the Pharoah of Egypt, the crown of kingdom rests upon his head. He holds a flail and a crook in hand, symbols of his authority as the ruler of the kingdom. On the right wall is the Pharoah's bride, the Queen. She did not hold as much power as the Pharoah, but she is still a very influential person."

The Hall of the Sun is a room. It is west of the Main Hall and south of the Pharoah's Chamber. Description is "This chamber is dedicated to the triumphs that the Pharoah went through in life. He ruled the people kindly but he kept them in line with his laws, as a king should."

The King's Chamber is a room. It is north of the Hall of the Pharoah.

The Hall of the Moon is a room. It is east of the Main Hall and south of the Queen's Chamber.

The Queen's Chamber is a room. It is north of the Hall of the Queen. 

The Treasury is north of the Main Hall. 

[Conversation coding (Taken from a Day for Spelling)]

Understand "talk to [something]" as talking. 
Talking is an action applying to one thing.

After talking Jackal for the first time:
	say "You explain to the jackal why you're here. You're stuck here because of a sandstorm and you can't get out. The jackal narrows his eyes and tilts his head. [line break] 'It seems you aren't lying.' he says. You may stay here for now, but do not take anything. The jackal turns and leaves the room and goes into the main hall.";
	move Jackal to Main hall.
	
After asking Jackal about "his name":
	say "The Jackal blinks in confusion. He clearly wasn't expecting you to say that. [line break] 'My name is Anubis, I am the guardian of this tomb.' he says."
	
After asking Jackal about "the tomb": 
	say "'This is the tomb of the greatest of the Kings and Queens of Egypt. This is also the resting place to the Eye of Horus, a powerful artifact. He glares at you. 'I do NOT take well to theives here.'"

[Guardian Coding with affection values (to gain good-good ending] 

Large Black Jackal is an animal. Understand "Anubis" as Jackal. Description is "He is large black jackal with a golden collar around its neck. His crimson eyes stare into your soul."

After entering Hall of the Moon for the first time:
	say "The Hall is filled with adornments, praising the Queen entombed here. But your attention is drawn towards the Black Jackal in the center of the hall. [line break] [line break] 'I told you to leave this place. Why are you still here?' the voice from before echoes. It is then that you realize that its coming from the Jackal. Maybe you could try to explain to him about why you're here?".
		

