"Desert Treasure" by Austin Ishii

Release along with Cover art.

When play begins:
	say "After hours of wandering through the desert, you find shelter from a sandstorm in a mysterious building. You have no idea where you are, but you are about to find out…[line break][line break]"
	
The Description of the player is "You have a knapsack filled with various survival gear. You have explorer clothes that are well worn along with a pair of boots on your feet. You're geared up for desert travel, but the sand-storm caught you off guard.[if torch is lit] You're carrying a lit torch in your hand that's providing a source of light. [otherwise if flashlight is lit] You're carrying a flashlight for a source of lighting."

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
[Rules]	
		
Use no scoring

Rule for deciding whether all includes something:
	stop.
	
Rule for printing a parser error when the latest parser error is the nothing to do error:
	say "You just can't seem to be able to do that." instead.

[Conversation coding (Taken from a Day for Spelling)]

Understand "talk to [something]" as talking. 
Talking is an action applying to one thing.

[Entryway Coding]

The Entrance is a dark room. It is north of the Desert and south of the Stone Door. Description is "The hallway is bare of deecorations. It is slightly stuffy here, no doubt due the amount of time that this place has been sealed away."

Brass Key is a thing in the Entrance. The Brass Key unlocks the Stone Door. Description is "An ordinary Brass key."

Instead of opening stone door for the first time:
	if stone door is locked:
		say "You try to open the door but it's locked. [if flashlight is switched off]Now that you think about it, don't you have a flashlight with you?";
	otherwise: 
		say "You finally manage to open the door. Now let's see where you ended up at…";
		now stone door is open.
		
[Entryway door]

The Stone Door is south of the Main hall and north of the Entrance. The Stone door is a lockable door. The stone door is locked. Description is "A mundane door. There's a brass keyhole in the center."

[The desert code]

The Desert is a room. It is south of the Entrance. "You wince as you open the doors outside. The sandstorm that forced you to come make it impossible leave the tomb. Looks like you're stuck here until the storm subsides."

Storm is scenery in the Desert. Description is "All you can see is a blinding sandstrom that rages before you." Understand "Desert" as storm.

[Player Inventory]

Survival Kit is a portable container. It contains Flashlight, Matches, and Dry Survival Food. The Survival Kit is carried by the player. Description is "A rough, waterproof survival kit. You packed it just in case something like this happens. Looks like your paranoia paid off this time."

Flashlight is a device. The description of a Flashlight is "Your trusty flashlight. You're not sure how much battery it has left, but you should probably find something else to your surroundings by just in case."

Dry Suvival Food is a thing. The description is "Standard rations to eat when you don't have anything left. They taste like garbage though."

[matches and torches]

Matches are a thing. Description is "A pack of survival matches. They can be lit underwater or in the middle of a downpour. Very useful stuff." Understand "match" as matches.

Lighting it with is an action applying to two things.
Understand "light [something] with [something]" as lighting it with. 

Striking is an action applying to one thing.
Understand "strike [something]" as striking.

Instead of striking matches:
	say "The match gives you a few seconds of light but it flickers and fades. You should probably light something with them."

A Torch is a thing in the Entrance. Description is "A[if torch is unlit] torch that smells like oil[otherwise if torch is lit] lit torch that burns brightly[end if]."

Check lighting it with:
	if noun is torch and second noun is matches:
		say "You manage to light the torches with the match. It burns brightly in your grip, illuminating everything around you.";
		now the torch is lit;
	if noun is an animal:
		say "Are you crazy?!";
	if noun is not torch:
		if noun is not matches,
			say "That's not flammable.".
			
After switching on the flashlight:
		say "You turn the flashlight on, providing a small source of light for now. You better be careful, it doesn't look like you have much battery left.";
		now the flashlight is lit.
	
After switching off the flashlight:
		say "You switch the flashlight off.";
		now the flashlight is unlit. 
		
[extinguishing code]

Understand "extinguish [something]" and "put out [something]" as extinguishing. 
Extinguishing is an action applying to one thing.

Instead of extinguishing lanterns:
	say "You blow out both lanterns quickly. The moment the second one goes out the door slams shut.[if Intruders is inside Hall of the Sun][line break]You hear a cry of alarm as the thieves realize that they're trapped in the room![end if]";
	now lanterns is unlit;
	now the King's door is closed;
	now the King's door is locked.
	
Check extinguishing:
	if noun is not torch:
		if noun is not lanterns:
			say "You can't do that.";
	if noun is torch: 
		say "You extinguish your torch. You curse to yourself after you do so. Now you can't see anything!";
		now torch is unlit.

[main hall coding]

The Main Hall is a dark room. It is north of the Stone Door, south of the Ornate Door, east of the King's Door and west of the Queen's Door. Description is "The main hall is a wonderous location, the walls rich with dozens of hieroglyphs as well as various pictures of the King and Queen as they adorn the walls. It shows their triumphs as they ruled their kingdom with a strange artifact in hand. A large diamond set in a frame of gold and sapphire. A fountain of glittering water lies in the center of the room. The treasury is to the North, the Queen's door is to the East, the Stone door is to the south, and the King's door is to the West."

Pictures is a backdrop. Pictures is everywhere. 
Understand "murals" as pictures.
	
Instead of examining pictures:
	say "They're beautiful but you have more important things to think about."

An every turn rule:
	If flashlight is lit:
		if the player is in Main Hall:
			say "Your flashlight sputters and dies. You shake it before you realize that it is really dead before throwing it away in disgust. [if torch is lit]Thankfully you lit the torch before you came in so you have some lighting. [end if][line break]";
			now flashlight is unlit;
			remove flashlight from play.
			
Instead of taking water:
	say "You empty out your survival kit and fill it with the water.";
	move food to player;
	move matches to player;
	move water to Survival Kit.

Walls are scenery in the Main Hall. Description is "On the mural on the left is the Pharoah of Egypt, a strange crown rests upon his head. He holds a flail and a crook in hand, symbols of his authority as the Pharoah. On the right wall is the Pharoah's bride, the Queen." Understand "Jewel" and "Main Hall" as walls. 

Fountain is scenery in the Main hall. The fountain is a container. Description is "A gold and silver fountain filled with sparkling water."

Water is a thing. It is in the fountain. Description is "Sparkling clean water. You're surprised that it looks so fresh."

Instead of drinking water:
	say "You are sorely tempted to but it's probably several hundred years old. It's not sanitary at all."

[Queen's Door coding]

Queen's door is east of the Main hall and west of the Hall of the moon. The Queen's Door is a lockable door. The Queen's Door is locked. Description is "A door with a picture of the Queen."

Instead of examining or opening Queen's Door for the first time:
	say "You touch the beautiful pictures that adorn the door before you hear a voice. [line break][line break] 'You are not welcome here. Leave this place now!' [line break][line break]You are startled by the sudden noise as you look around for where the voice came from. When you turn back to the door, you realize that there is something inside.";
	move Jackal to Hall of the Moon;
	now the Queen's Door is unlocked.

[hall of the moon coding]

The Hall of the Moon is a room. It is east of the Queen's Door and south of the Silver Door. Description is "The Hall dedicated to the Queen as well, depicting her in her splendor. There is a Ornate door to the north and the Main hall is to the west.[if unvisited][line break][line break] 'I warned you to leave.' the voice growls again. It is then that you realize that the voice is coming from the Jackal! [line break][line break] 'Why are you still here?' he asks menacingly, slowly getting closer to you. Maybe you should try talk to him…[end if]"

A Silver Mirror is scenery in the Hall of the Moon. Mirror is portable. Description is "A large silver mirror that shines in the light of your torch."

Instead of taking Mirror for the first time:
	say "The mirror pops off of the door easily, as if it was meant to come off. You hear the sound of stones grinding as the door to the Queen's chamber slowly opens.";
	now the silver door is unlocked;
	move Mirror to player.

The Silver Door is north of the Hall of the Moon and south of the Queen's Chamber. The Silver door is a locked door. Description is "An silver door with a mirror in the center. It looks like you could take the mirror off if you tried to." 

Understand "pry [something] off door" as taking. 

[Queen's Chamber coding]

The Queen's Chamber is a room. It is north of the Silver Door. Description is "The Queen's resting place is covered in hundreds of various pictures, depicting the Queen in all of her splendor. Her sarcophagus lies in the center of the tomb, undisturbed. [if player is not carrying amulet]There is a shining amulet on the wall in the back."

Queen's Sarcophagus is scenery in the Queen's chamber. Description is "The Queen's gold and silver sarcophagus. Strange considering that usually the Queen never has one. The Pharoah must have gotten it for her." Understand "coffin" as sarcophagus.

Instead of opening sarcophagus:
	say "You shake your head. The dead deserve more respect than this. Besides, you're not nearly strong enough to open it anyway."

Queen's Amulet is a thing. It is in the Queen's Chamber. Description is "A silver and sapphire amulet fashioned into a delicate feather." 

Instead of taking Amulet:
	say "'It seems you were trustworthy after all.' the jackal states as he walks into the chamber. [line break][line break]'If you weren't the amulet would have burned you to ash. But you still are alive and well. You will need to claim the Pharoah's crown to open the Treasury.' The Jackal moves back out the door where he came in.";
	move amulet to Player. 

[King's Door Coding]

The King's Door is west of the Main Hall and east of the Hall of the Sun. The King's door is a lockable door. The King's door is locked. Description is "A heavy door with two [if lanterns are unlit]oil lanterns on the sides.[otherwise if lanterns are lit]lit lanterns that are burning brightly on the sides."

Lanterns are scenery in the Main hall. Description is "A pair of [if lanterns are lit]burning[otherwise if lanterns are unlit]unlit[end if] lanterns."

Instead of lighting lanterns with torch:
	if lanterns is unlit:
		say "You light the lanterns with your torch. The moment the second one is lit, the door clicks audiably as it slowly opens.";
		now King's door is unlocked;
		now the King's door is open;
		now lanterns is lit;
	otherwise if lanterns is lit: 
		say "The door is already unlocked."
	
Instead of lighting lanterns with matches:
	if lanterns are unlit:
		say "You light the lanterns with your matches. The moment the second one is lit, the door slowly opens.";
		now king's door is unlocked;
		now the King's door is open;
		now lanterns is lit;
	otherwise if lanterns is lit:
		say "It's already unlocked."
			
Instead of lighting lanterns with torch:
	say "You light the lanterns with your torch. The moment the second one is lit, the door slowly creaks open.";
	now lanterns are lit;
	now King's door is unlocked.		

[Hall of the Sun Coding]

The Hall of the Sun is a room. It is west of the King's Door and south of the Golden Door. Description is "This chamber is dedicated to the triumphs that the Pharoah went through in life. Sunlight shines from a opening in the ceiling onto a pedestal in the center of the room. There is a golden door to the north. "

Ceiling is scenery in the Hall of the Sun. Description is "There's a hole in the ceiling that letting sunlight stream down."
Understand "sun", "hole", and "sunlight" as ceiling. 

Pedestal is scenery in the Hall of the Sun. The pedestal is an open container. Description is "A large pedestal with a circular frame.[if player is carrying mirror] It looks like the mirror could be inserted into there…[otherwise if the mirror is in the pedestal]The mirror that you found is fixed in place.[end if]"

Instead of taking pedestal:
	say "You shake your head. There's no way you could lift that!"

Golden door is north of the Hall of the Sun and south of the King's chamber. The Golden door is a lockable door. The golden door is locked. The Golden Key unlocks the Golden Door. "A Golden door with a large picture of an eye in the center. There's a large glass jewel there where the iris would be, but it looks like you can't take it off like the mirror."

Instead of examining Golden door:
	say "A Golden door with a large picture of an eye in the center. There's a large glass jewel there where the iris would be, but it looks like you can't take it off."

Instead of inserting the mirror into pedestal:
	say "You put the mirror into the pedestal and you are nearly blinded as the shining mirror redirects the sunlight into you eyes. The moment you move out of the way, the beam of sunlight shines upon the jewel in the door's center. It shines red as the door slowly rumbles open.";
	move mirror to pedestal;
	now the golden door is open;
	now the golden door is unlocked.

[Original pedestal rotating coding that would open the door, scrapped because it wouldn't work. 

Rotation is a number variable. Rotation is 0.

Adjusting is an action applying to one thing.
Understand "rotate", "turn", and "adjust" as adjusting.

Instead of adjusting pedestal:
	if rotation is 2:
		say "You turn the pedestal 90 degrees clockwise to the east";
		increase rotation by 1;
	otherwise if rotation is 1:
		if mirror is in the pedestal:
			say "You turn the pedestal counterclockwise to face the golden door. The mirror's light shine into the jeweled eyes, causing it to glow red. The door slowly creaks open.";
			now the golden door is unlocked;
			now the golden door is open;
		otherwise:
			say "You turn the pedestal 90 degrees to the door.";
		increase rotation by 1;
	otherwise if rotation is 3:
		say "You rotate the pedestal to its starting position.";
		decrease rotation by 3;
	otherwise if rotation is 0:
		say "You turn the pedestal 90 degrees to the west.";
		increase rotation by 1.]

[King's chamber coding]

The King's Chamber is a room. It is north of the Golden Door. Description is "The King's chamber displays his grandeur and wealth, as well as his glory as the ruler of Egypt. The King's sarcophagus lies in the enter of the room, glittering in the light. [if player does not have the crown]The crown rests on a pedestal before you, shining like a glowing star.[end if]"

King's Sarcophagus is scenery in the King's chamber. Description is "The King's gold and silver sarcophagus. It is much more elaborate than the Queen's. It must be worth a fortune!" Understand "coffin" as sarcophagus.

Instead of opening sarcophagus:
	say "You shake your head. The dead deserve more respect than this. Besides, you're not nearly strong enough to open it anyway."

King's Crown is a thing. It is in the King's Chamber. Description is "A Ruby and Alabaster crownthat represented the King's status in Egypt." 

Instead of taking Crown for the first time:
	say "You take the crown from the pedestal and you feel its weight in your hands. It feels strange to hold such a precious treasure. But it looks like you have all the things you need to open the treasury.[line break][line break]But the quickly jackal rushes into the room as it slams shute behind him, 'There are intruders in the tomb! Seal the King's chamber or else they will defile it!' he shouts, he's clearly panicked. He tosses you a golden key that you quickly catchpu. [line break][line break] 'I have already locked the Queen's chamber. Hurry!'";
	now the Golden Door is closed;
	move Jackal to King's Chamber;
	move Crown to Player;
	move Intruders to Hall of the Sun;
	move Golden key to player. 
	
Instead of wearing crown:
	say "You're tempted too, but you don't think it will fit. It's too big for you."
	
[King's Chamber ESCAPE coding]

Instead of locking door with golden key:
	say "You quickly lock the door with the key that was given to you. The jackal quickly nods and takes the key back from you, moving off to the side of the room. [line break][line break] 'Pull this,' he says as he indicates to hidden protrusion on the wall. It looks like an ancient lever. 'It will take you back to the Main Hall. Then we can deal with the intruders permanently.'";
	now the Golden door is locked;
	remove Golden key from play. 

Stone lever is scenery in the King's Chamber. Stone lever is fixed in place. Description is "A cleverly hid lever. Who knew the Egyptians were so advanced?"

Instead of pulling lever:
		say "The wall slides open, revealing a hidden passageway. The Jackal quickly descends into the dark tunnel as you follow after him. When you finally reach the end, you find yourself back into the Main Hall as the passageway closes behind you. [line break][line break] The Jackal nods towards the entrance to the King's door. 'All that is left is to lock them in the room. There is not that many things of value in there, thankfully. I managed to take the mirror with me before I left. Lock the door so I can get rid of the intruders.[line break][line break]";
		move player to Main Hall;
		move Jackal to Main Hall.
		
[Treasury Door coding]

Ornate Door is north of the Main Hall and south of the Treasury. It is a locked door. Description is "A very ornate door decorated with gold and silver hieroglyphs. The Queen and the King are on opposite sides of the door. There's two slots in the door."

Slots are an open container. Slots are a part of the Ornate Door. Description is "A pair of slots in the door. You probably need to fill both of them to open the door." Understand "slot" as slots.

Instead of inserting the Amulet into slots:
	say "The Amulet slides in with a gentle click before it begins to glow.";
	move Amulet to Slots. 
	
Instead of unlocking Ornate door with Amulet:
	say "You should probably insert them into the slots."

Instead of unlocking Ornate door with Crown:
	say "You should probably insert them into the slots."

Instead of inserting the Crown into slots:
	say "The Crown slides in with a gentle click before it glows with power.";
	move Crown to slots.

An every turn rule:
	If the Amulet is in the Slots and the Crown is in the slots for the first time:
		say "The ornate door glows with power before the locks fall away. [line break][line break]'Good' the Jackal says he he takes both artifacts. 'Now the treasury is open.' The Jackal moves into the Treasury.";
		now Ornate Door is unlocked;
		move crown to Jackal;
		move amulet to Jackal.
	
Instead of opening ornate door:
	if Ornate door is locked:
		say "It's locked.";
	if Intruders are in the Hall of the Sun:
		say "The Jackal shakes his head, 'You should probably get rid of the intruders first.'";
	if ornate door is unlocked:
		say "You slowly open the door with apprehension on your face.";
		now the ornate door is open;
		move Jackal to Treasury.
		
Instead of inserting crown into ornate door:
	say "The Crown slides in with a gentle click before it begins to glows.";
	move crown to Slots. 

Instead of inserting amulet into ornate door:
	say "The Amulet slides in with a gentle click before it begins to glows.";
	move Amulet to Slots. 
		
[Treasury/Ending Coding]

Treasury is a room. It is north of the Ornate Door. Description is "The Treasury is filled with various treasures of different sizes. All of Egypt's wealth is here. In the center of the room is a bejeweled stand with a diamond set in gold, silver, and lapis-lazuli. It glows with a mysterious power.[if unvisited][line break][line break] 'Behold.' the Jackal states, 'The Eye of Horus, the greatest treasure in all of Egypt.'[end if]"

Jeweled Stand is scenery in the Treasury. Jeweled Stand is a supporter. Description is "A jeweled stand decorated in various precious metals and gems. The Eye of Horus hovers over it."

Eye of Horus is a thing on the Jeweled Stand. Description is "A powerful artifact that pulses with power. It warms your skin like the sun."

Instead of taking Eye of Horus:
	if affection is 5:
		say "You take hold of the Eye as you feel power rush through your body. It feels like your mind and soul are about to burst. Anubis cries out in alarm, concerned about your well-being. But the sensation fades and when you open your eyes, the Eye is gone! [line break][line break]You look around desperately before you realize something is on your wrist, A gold, silver, and sapphire bracelet with an large diamond in the center. [line break][line break]'The Eye has chosen a new wielder.' Anubis says with reverence, 'I had suspected that there was something special about you, my lord.' he bows, 'My body and soul are yours to command.' Vitality wells through your body like a river, and you grin. [line break][line break]'Let's leave this place, Anubis,' you say as both you and your companion vanish with but a thought with your newfound powers. A new world awaits you and your new guardian.";
		end the story;
	otherwise if affection is 3:
		say "The Eye glows in your hands as you feel power surge through your body. Taking command of it you banish the sandstorm outside the howl of the sandstorm that has filled your ears for so long finally vanish. [line break][line break]'Well done,' the Jackal comments, 'Your task is done and the storm has vanished. You may finally leave this place.' he nods at you before he walks into the shadows. 'Farewell, and may we meet again.' In a flash of light you find yourself out of the tomb and back in the desert. You flinch at the bright sunlight and when your eyes have adjusted you find yourself on the outskirts of Cairo. Glancing back at desert you frown. You feel something heavy in your pocket. You reach down and find a hefty amount of Gold and Silver along with a note: [line break][line break]May your life be filled with blessings, Anubis.";
		end the story;
	if affection is 6:
		say "You take hold of the Eye as you feel power rush through your body. It feels like your mind and soul are about to burst. Anubis cries out in alarm, concerned about your well-being. But the sensation fades and when you open your eyes, the Eye is gone! [line break][line break]You look around desperately before you realize something is on your wrist, A gold, silver, and sapphire bracelet with an large diamond in the center. [line break][line break]'The Eye has chosen a new wielder.' Anubis says with reverence, 'I had suspected that there was something special about you, my lord.' he bows, 'My body and soul are yours to command.' Vitality wells through your body like a river, and you grin. [line break][line break]'Let's leave this place, Anubis,' you say as both you and your companion vanish with but a thought with your newfound powers. A new world awaits you and your newfound companion.";
		end the story.
		
[theives coding]

Intruders is a person. Understand "Thieves" as Intruders.

Instead of opening Golden Door while Intruders are inside Hall of the Sun,
	say "You shake your head. There's no way you're going to win a fight against multiple people. You better stay out of it…"

An every turn rule:
If intruders are in the Hall of the Sun and King's Door is locked
begin;
	say "The Jackal nods, 'Good.' he says 'Stand back from the door,' he instructs. [line break][line break]After you do so, his eyes glows red. There's a bright flash of light that forces you to close your eyes. You hear the screams of the thieves before the voices are cut off. When you open your eyes nothing seems to have been changed. [line break][line break] 'The thives are gone now.' the Jackal smirked, 'Thank you for your assistance.' he says, smiling.";
	remove intruders from play;
	increase Affection by 3;
end if.

Instead of going through King's door from the Main hall:
	if intruders are inside hall of the sun:
		say "There's no way you're going in there while there's intruders still there! It's suicidal!";
		rule succeeds;
	if King's door is locked:
		say "The King's door is locked.";
		rule succeeds;
	otherwise if king's door is open:
		move player to Hall of the Sun.
			
[Anubis Coding with affection values (to gain good-good ending when it's high enough)] 

Affection is a number variable. Affection is 0.

A Large Black Jackal is an animal. Understand "Anubis" as Jackal. Description is "He is large black jackal with a golden collar around its neck. His crimson eyes stare into your soul.[if affection is greater than 1] It looks like he's grown fond of you."

Instead of talking jackal:
	say "Try asking about something instead."

Instead of talking Jackal for the first time:
	say "You explain to the jackal why you're here, that you're stuck here because of a sandstorm and you can't get out. The jackal narrows his eyes and tilts his head. [line break][line break]'It seems you aren't lying.' he says. 'This tomb is protected by that sandstorm, if you want to leave you will need to open the Treasury and claim the Eye of Horus. I will be watching you…' [line break][line break]The jackal turns and leaves the room and goes into the main hall. You still have some questions though! Although a random thought passes through your head, does he have a name? It would be tedious calling him the Jackal all the time…";
	move Jackal to Main hall.
	
After asking Jackal about "his name" for the first time:
	say "The Jackal blinks in confusion. He clearly wasn't expecting you to say that. [line break][line break]'My name is Anubis, I am the guardian of this tomb. It is a pleasure to meet you.' he says.";
	 increase Affection by 2.
	
Instead of asking Jackal about "name":
	say "You should probably be more specific than that."
	
After asking Jackal about "tomb": 
	say "'This is the tomb of the greatest of the Kings and Queens of Egypt. This is also the resting place to the Eye of Horus, a powerful artifact,' the Jackal says.[line break][line break]He glares at you. 'I do NOT take well to thieves here.'"

After asking jackal about "thieves":
	say "'Unfortunately there have been many people attempting to make their way in. Most of the time the magic of the tomb keeps them out. But it let you in.' he replies. 'I still don't trust you though.'"
	
Instead of giving the Survival food to the Jackal for the first time:
	say "The jackal looks at you. 'I live off of the energies of the temple. I don't need to eat anything.' But something tells you that he appreciated the offer.";
	increase Affection by 1.
