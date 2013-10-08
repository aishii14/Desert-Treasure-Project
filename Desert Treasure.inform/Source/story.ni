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

Survival Kit is a portable container. It contains Flashlight, Matches, and Dry Survival Food. The Survival Kit is carried by the player. Description is "A rough, waterproof survival kit. You packed it just in case something like this happens. Looks like your paranoia paid off this time."

Flashlight is a device. The description of a Flashlight is "Your trusty flashlight. You're not sure how much battery it has left, but you should probably find something else to your surroundings by just in case."

Dry Suvival Food is a thing. The description is "Standard rations to eat when you don't have anything left. They taste like garbage though."

[matches and torches]

Matches are a thing. Description is "A pack of survival matches. They can be lit underwater or in the middle of a downpour. Very useful stuff."

Lighting it with is an action applying to two things.
Understand "light [something] with [something]" as lighting it with. 

A Torch is a thing in the Entrance. Description is "A[if torch is unlit] torch that smells like oil [otherwise if torch is lit] lit torch that burns brightly [end if]."

Check lighting it with:
	if noun is torch and second noun is matches:
		say "You manage to light the torches with the match. It burns brightly in your grip, illuminating everything around you.";
		now the torch is lit;
	if noun is an animal:
		say "Are you crazy?!";
	if noun is not torch:
		say "That's not flammable."

After switching on the flashlight:
		say "You turn the flashlight on, providing a small source of light for now. You better be careful, it doesn't look like you have much battery left.";
		now the flashlight is lit.
	
After switching off the flashlight:
		say "You switch the flashlight off.";
		now the flashlight is unlit. 
[main hall coding]

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
	
Instead of taking water:
	say "You empty out your survival kit and fill it with the water.";
	move food to player;
	move matches to player;
	move water to Survival Kit.

Walls are scenery in the Main Hall. Description is "On the mural on the left is the Pharoah of Egypt, the crown of kingdom rests upon his head. He holds a flail and a crook in hand, symbols of his authority as the ruler of the kingdom. On the right wall is the Pharoah's bride, the Queen. She did not hold as much power as the Pharoah, but she is still a very influential person." Understand "Jewel" and "Main Hall" as walls. 

Fountain is scenery in the Main hall. The fountain is a container. Description is "A gold and silver fountain filled with sparkling water."

Water is a thing. It is in the fountain. Description is "Sparkling clean water. You're surprised that it looks so fresh."

Instead of drinking water:
	say "You are sorely tempted to but it's probably several hundred years old. It's not sanitary at all."

[Hall of the Sun Coding]

The Hall of the Sun is a room. It is west of the Main Hall and south of the Pharoah's Chamber. Description is "This chamber is dedicated to the triumphs that the Pharoah went through in life. He ruled the people kindly but he kept them in line with his laws, as a king should."

The King's Chamber is a room. It is north of the Hall of the Sun.

[hall of the moon coding]

The Hall of the Moon is a room. It is east of the Main Hall and south of the Silver Door. Description is "The Hall is filled with adornments, praising the Queen entombed here. There is a ornate stone door to the north and the Main hall is to the west. [if unvisited][line break] 'I warned you to leave.' the voice growls again. It is then that you realize that the voice is coming from the Jackal! [line break] 'Why are you still here?' he asks menacingly, slowly getting closer to you. Maybe you should try talk to him…[end if]"

A Silver Mirror is a thing in the Hall of the Moon. Description is "A large silver mirror that shines in the light of your torch."

Instead of taking Mirror:
	say "The mirror pops off of the door easily, as if it was meant to come off. You hear the sound of stones grinding as the door to the Queen's chamber slowly opens.";
	now the silver door is unlocked;
	move Mirror to player.

The Silver Door is north of the Hall of the Moon and south of the Queen's Chamber. It is a locked door. Description is "An ornate stone door with a mirror in the center. It looks like you could pry the mirror off if you tried to." 

[Queen's Chamber coding]

The Queen's Chamber is a room. It is north of the Silver Door. Description is "The Queen's resting place is covered in hundreds of various pictures, depicting the Queen in all of her splendor. Her sarcophagus lies in the center of the tomb, undisturbed. However, there is a shining amulet on the wall in the back."

Queen's Sarcophagus is scenery in the Queen's chamber. Description is "The Queen's gold and silver sarcophagus. Strange considering that usually the Queen never has one. The Pharoah must have gotten it for her." Understand "coffin" as sarcophagus.

Instead of opening sarcophagus:
	say "You shake your head. The dead deserve more respect than this. Besides, you're not nearly strong enough to open it anyway."

Queen's Amulet is a thing. It is in the Queen's Chamber. Description is "A silver and sapphire amulet fashioned into a delicate feather." 

The Treasury is north of the Main Hall. 

[Conversation coding (Taken from a Day for Spelling)]

Understand "talk to [something]" as talking. 
Talking is an action applying to one thing.

[Anubis Coding with WIP affection values (to gain good-good ending] 

Affection is a number variable. Affection is 0.

A Large Black Jackal is an animal. Understand "Anubis" as Jackal. Description is "He is large black jackal with a golden collar around its neck. His crimson eyes stare into your soul."

After talking Jackal for the first time:
	say "You explain to the jackal why you're here. You're stuck here because of a sandstorm and you can't get out. The jackal narrows his eyes and tilts his head. [line break] 'It seems you aren't lying.' he says. 'You may stay here…for now.' The jackal turns and leaves the room and goes into the main hall.";
	move Jackal to Main hall.
	
After asking Jackal about "his name" for the first time:
	say "The Jackal blinks in confusion. He clearly wasn't expecting you to say that. [line break] 'My name is Anubis, I am the guardian of this tomb.' he says.";
	 increase Affection by 2.
	
After asking Jackal about "the tomb": 
	say "'This is the tomb of the greatest of the Kings and Queens of Egypt. This is also the resting place to the Eye of Horus, a powerful artifact.' [line break] He glares at you. 'I do NOT take well to theives here.'"

After asking jackal about "thieves":
	say "'Unfortunately there have been many people attempting to make their way in. Most of the time the magic of the tomb keeps them out. But it let you in.' he replies. 'I still don't trust you though.'"
	
Instead of giving the Survival food to the Jackal for the first time:
	say "The jackal looks at you. 'I live off of the energies of the temple. I don't need to eat anything.' But something tells you that he appreciated the offer.";
	increase Affection by 1.
	
[If the player is in Main Hall
	if the player carries Queen's Amulet
		say "The jackal glares at you. 'You better not break that. If you do I will devour you alive.' You quickly reassure the jackal that you won't break it."]
