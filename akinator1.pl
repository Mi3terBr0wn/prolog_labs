woman(natsu, 0).
woman(lucy, 1).
woman(erza, 1).
woman(gray, 0).
woman(happy, 0).
woman(gajeel, 0).
woman(juvia, 1).
woman(wendy, 1).
woman(charly, 1).
woman(mirajane, 1).
woman(makarov, 0).
woman(laxus, 0).
woman(elfman, 0).
woman(lisanna, 1).
woman(levy, 1).
woman(gildarts, 0).
woman(evergreen, 1).
woman(fried, 0).
woman(bilkslow, 0).
woman(panther, 0).

long_hair(natsu, 0).
long_hair(lucy, 1).
long_hair(erza, 1).
long_hair(gray, 0).
long_hair(happy, 0).
long_hair(gajeel, 1).
long_hair(juvia, 1).
long_hair(wendy, 1).
long_hair(charly, 0).
long_hair(mirajane, 1).
long_hair(makarov, 0).
long_hair(laxus, 0).
long_hair(elfman, 0).
long_hair(lisanna, 0).
long_hair(levy, 0).
long_hair(gildarts, 0).
long_hair(evergreen, 1).
long_hair(fried, 1).
long_hair(bilkslow, 0).
long_hair(panther, 0).

was_enemy(natsu, 0).
was_enemy(lucy, 0).
was_enemy(erza, 0).
was_enemy(gray, 0).
was_enemy(happy, 0).
was_enemy(gajeel, 1).
was_enemy(juvia, 1).
was_enemy(wendy, 0).
was_enemy(charly, 0).
was_enemy(mirajane, 0).
was_enemy(makarov, 0).
was_enemy(laxus, 1).
was_enemy(elfman, 0).
was_enemy(lisanna, 0).
was_enemy(levy, 0).
was_enemy(gildarts, 0).
was_enemy(evergreen, 1).
was_enemy(fried, 1).
was_enemy(bilkslow, 1).
was_enemy(panther, 1).

white_hair(natsu, 0).
white_hair(lucy, 0).
white_hair(erza, 0).
white_hair(gray, 0).
white_hair(happy, 0).
white_hair(gajeel, 0).
white_hair(juvia, 0).
white_hair(wendy, 0).
white_hair(charly, 1).
white_hair(mirajane, 1).
white_hair(makarov, 1).
white_hair(laxus, 0).
white_hair(elfman, 1).
white_hair(lisanna, 1).
white_hair(levy, 0).
white_hair(gildarts, 0).
white_hair(evergreen, 0).
white_hair(fried, 0).
white_hair(bilkslow, 0).
white_hair(panther, 0).

blue_hair(natsu, 0).
blue_hair(lucy, 0).
blue_hair(erza, 0).
blue_hair(gray, 0).
blue_hair(happy, 1).
blue_hair(gajeel, 0).
blue_hair(juvia, 1).
blue_hair(wendy, 1).
blue_hair(charly, 0).
blue_hair(mirajane, 0).
blue_hair(makarov, 0).
blue_hair(laxus, 0).
blue_hair(elfman, 0).
blue_hair(lisanna, 0).
blue_hair(levy, 1).
blue_hair(gildarts, 0).
blue_hair(evergreen, 0).
blue_hair(fried, 0).
blue_hair(bilkslow, 0).
blue_hair(panther, 0).

dragon_slayer(natsu, 1).
dragon_slayer(lucy, 0).
dragon_slayer(erza, 0).
dragon_slayer(gray, 0).
dragon_slayer(happy, 0).
dragon_slayer(gajeel, 1).
dragon_slayer(juvia, 0).
dragon_slayer(wendy, 1).
dragon_slayer(charly, 0).
dragon_slayer(mirajane, 0).
dragon_slayer(makarov, 0).
dragon_slayer(laxus, 1).
dragon_slayer(elfman, 0).
dragon_slayer(lisanna, 0).
dragon_slayer(levy, 0).
dragon_slayer(gildarts, 0).
dragon_slayer(evergreen, 0).
dragon_slayer(fried, 0).
dragon_slayer(bilkslow, 0).
dragon_slayer(panther, 0).

cat(natsu, 0).
cat(lucy, 0).
cat(erza, 0).
cat(gray, 0).
cat(happy, 1).
cat(gajeel, 0).
cat(juvia, 0).
cat(wendy, 0).
cat(charly, 1).
cat(mirajane, 0).
cat(makarov, 0).
cat(laxus, 0).
cat(elfman, 0).
cat(lisanna, 0).
cat(levy, 0).
cat(gildarts, 0).
cat(evergreen, 0).
cat(fried, 0).
cat(bilkslow, 0).
cat(panther, 1).

use_weapon(natsu, 0).
use_weapon(lucy, 0).
use_weapon(erza, 1).
use_weapon(gray, 0).
use_weapon(happy, 0).
use_weapon(gajeel, 0).
use_weapon(juvia, 0).
use_weapon(wendy, 0).
use_weapon(charly, 0).
use_weapon(mirajane, 0).
use_weapon(makarov, 0).
use_weapon(laxus, 0).
use_weapon(elfman, 0).
use_weapon(lisanna, 0).
use_weapon(levy, 0).
use_weapon(gildarts, 0).
use_weapon(evergreen, 0).
use_weapon(fried, 0).
use_weapon(bilkslow, 0).
use_weapon(panther, 1).

has_children(natsu, 0).
has_children(lucy, 0).
has_children(erza, 0).
has_children(gray, 0).
has_children(happy, 0).
has_children(gajeel, 0).
has_children(juvia, 0).
has_children(wendy, 0).
has_children(charly, 0).
has_children(mirajane, 0).
has_children(makarov, 1).
has_children(laxus, 0).
has_children(elfman, 0).
has_children(lisanna, 0).
has_children(levy, 0).
has_children(gildarts, 1).
has_children(evergreen, 0).
has_children(fried, 0).
has_children(bilkslow, 0).
has_children(panther, 0).

question1(X1):-	write("Is your character a woman?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X1).

question2(X2):-	write("Does your character have long hair?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X2).

question3(X3):-	write("Did your character fight against the Fairy Tail?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X3).

question4(X4):-	write("Does your character have white hair?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X4).

question5(X5):-	write("Does your character have blue hair?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X5).

question6(X6):-	write("Is your character a dragon slayer?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X6).

question7(X7):-	write("Is your character a cat?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X7).

question8(X8):-	write("Does your character use cold steel?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X8).

question9(X9):-	write("Does your character have children?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X9).

pr:-	question1(X1),question2(X2),question3(X3),question4(X4),
		question5(X5),question6(X6),question7(X7), question8(X8), question9(X9),
		woman(X,X1),long_hair(X,X2),was_enemy(X,X3),white_hair(X,X4),
		blue_hair(X,X5),dragon_slayer(X,X6),cat(X,X7),use_weapon(X,X8),has_children(X,X9),
		write(X).