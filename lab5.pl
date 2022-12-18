unique([]):-!.
unique([Head|Tail]):-
   member(Head, Tail), !, fail;
   unique(Tail).

right_to(_,_,[_]):-fail.
right_to(A,B,[A|[B|_]]).
right_to(A,B,[_|List]):-right_to(A,B,List).

left_to(_,_,[_]):-fail.
left_to(A,B,[B|[A|_]]).
left_to(A,B,[_|List]):-left_to(A,B,List).

neighbour(A,B,List):-right_to(A,B,List).
neighbour(A,B,List):-left_to(A,B,List).


% /*Задача о пяти домах */

house_color("red").
house_color("white").
house_color("green").
house_color("yellow").
house_color("blue").
nation("Englishman").
nation("Spaniard").
nation("Ukrainian").
nation("Japanese").
nation("Norwegian").
liquid("tea").
liquid("coffee").
liquid("orange juice").
liquid("milk").
liquid("water").
animal("dog").
animal("snails").
animal("fox").
animal("horse").
animal("zebra").
smoke("Kool").
smoke("Parlament").
smoke("Chesterfield").
smoke("Old Gold").
smoke("Lucky Strike").

resident(A,B,C,D,E) :- house_color(A),
                       nation(B),
                       liquid(C),
                       animal(D),
                       smoke(E).

task_1():- Houses=[resident(_,_,_,_,_),
                         resident(_,_,_,_,_),
                         resident(_,_,_,_,_),
                         resident(_,_,_,_,_),
                         resident(_,_,_,_,_)],

		member(resident("red","Englishman",_,_,_),Houses),
		member(resident(_,"Spaniard",_,"dog",_),Houses),
		member(resident("green",_,"coffee",_,_),Houses),
		member(resident(_,"Ukrainian","tea",_,_),Houses),
		neighbour(resident("green",_,_,_,_),resident("White",_,_,_,_),Houses),
		member(resident(_,_,_,"snails","Old Gold"),Houses),
		member(resident("yellow",_,_,_,"Kool"),Houses),
		Houses=[resident(_,"Norwegian",_,_,_),_,resident(_,_,"milk",_,_),_,_],
		neighbour(resident(_,_,_,_,"Chesterfield"),resident(_,_,_,"fox",_),Houses),
		neighbour(resident(_,_,_,_,"Kool"),resident(_,_,_,"horse",_),Houses),
		member(resident(_,_,"orange juice",_,"Lucky Strike"),Houses),
		member(resident(_,"Japanese",_,_,"Parlament"),Houses),
		neighbour(resident(_,"Norwegian",_,_,_),resident("blue",_,_,_,_),Houses),
		member(resident(_,WHO1,"water",_,_),Houses),
		member(resident(_,WHO2,_,"zebra",_),Houses),
		write(Houses),
		write(WHO1),nl,write(WHO2),!.

% Предикаты, взятые из примера

sub_posl([],_):-!.
sub_posl(_,[]):-fail,!.
sub_posl([H|Sub_list],[H|List]):-sub_posl(Sub_list,List),!.
sub_posl(Sub_list,[_|List]):-sub_posl(Sub_list,List).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[H|Set]):-sub_set(Sub_set,Set).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).


sprava_next(A,B,[C]):-fail.
sprava_next(A,B,[A|[B|Tail]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

sleva_next(A,B,[C]):-fail.
sleva_next(A,B,[B|[A|Tail]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).

next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).


% 2. Беседует трое друзей: Белокуров, Рыжов, Чернов. Брюнет
% сказал Белокурову: “Любопытно, что один из нас блондин, другой брюнет,
% третий - рыжий, но ни у кого цвет волос не соответствует фамилии”. Какой
% цвет волос у каждого из друзей?

rule1([belokurov,blonde]). % ни у кого цвет волос не соответствует фамилии
rule1([rizhov,redhead]). % ни у кого цвет волос не соответствует фамилии
rule1([chernov,black]). % ни у кого цвет волос не соответствует фамилии
rule1([belokurov,black]). %  Брюнет сказал Белокурову
pravilo1([]).
pravilo1([Head|Tail]):-
  not(rule1(Head)), % Проверяется от противного: Белокуров не блондин
                    % Рыжов не рыжий и т.д...
  pravilo1(Tail).

task_2:-
  Friends = [_,_,_],
  in_list(Friends, [belokurov,_]),
  in_list(Friends, [rizhov,_]),
  in_list(Friends, [chernov,_]),
  in_list(Friends, [_,blonde]),
  in_list(Friends, [_,redhead]),
  in_list(Friends, [_,black]),
  pravilo1(Friends),
  write(Friends).

  % 3 Три подруги вышли в белом, зеленом и синем платьях и
  % туфлях. Известно, что только у Ани цвета платья и туфлей совпадали. Ни
  % туфли, ни платье Вали не были белыми. Наташа была в зеленых туфлях.
  % Определить цвета платья и туфель на каждой из подруг.

is_equal(X,Y):-
  X = Y.

rule2([anya,X,X]). % только у Ани цвета платья и туфлей совпадали
rule2([valya,X,Y]):- 
  not(is_equal(X,Y)), % только у Ани цвета платья и туфлей совпадали
  not(is_equal(X,white)), % Ни туфли, ни платье Вали не были белыми.
  not(is_equal(Y,white)). % Ни туфли, ни платье Вали не были белыми.
rule2([natasha,X,Y]):-
  not(is_equal(X,Y)). % только у Ани цвета платья и туфлей совпадали
pravilo2([]).
pravilo2([Head|Tail]):-
  rule2(Head),
  pravilo2(Tail).

task_3:-
  Girls = [_,_,_], % [[имя,цвет платья,цвет туфель],[_,_,_],[_,_,_]]
  in_list(Girls, [anya,_,_]),
  in_list(Girls, [valya,_,_]),
  in_list(Girls, [natasha,_,green]),
  in_list(Girls, [_,green,_]),
  in_list(Girls, [_,white,_]),
  in_list(Girls, [_,blue,_]),
  in_list(Girls, [_,_,blue]),
  in_list(Girls, [_,_,green]),
  in_list(Girls, [_,_,white]),
  pravilo2(Girls),
  write(Girls).


  % 4 На заводе работали три друга: слесарь, токарь и сварщик. Их
  % фамилии Борисов, Иванов и Семенов. У слесаря нет ни братьев, ни сестер. Он
  % самый младший из друзей. Семенов, женатый на сестре Борисова, старше
  % токаря. Назвать фамилии слесаря, токаря и сварщика.

rule3([semenov,tokar]). % Семенов старше токаря
rule3([borisov,slesar]). % на сестре Борисова, У слесаря нет ни братьев, ни сестер.
rule3([semenov,slesar]). % слесаря самый младший из друзей. Семенов старше токаря.
pravilo3([]).
pravilo3([Head|Tail]):-
  not(rule3(Head)),
  pravilo3(Tail).

task_4:-
  Workers = [_,_,_],
  in_list(Workers, [borisov,_]),
  in_list(Workers, [ivanov,_]),
  in_list(Workers, [semenov,_]),
  in_list(Workers, [_,slesar]),
  in_list(Workers, [_,tokar]),
  in_list(Workers, [_,svarshik]),
  pravilo3(Workers),
  write(Workers).



  % 5 В бутылке, стакане, кувшине и банке находятся молоко,
  % лимонад, квас и вода. Известно, что вода и молоко не в бутылке, сосуд с
  % лимонадом находится между кувшином и сосудом с квасом, в банке - не
  % лимонад и не вода. Стакан находится около банки и сосуда с молоком. Как
  % распределены эти жидкости по сосудам.

  rule4([bottle,milk]). % Известно, что вода и молоко не в бутылке
  rule4([bottle,water]). % Известно, что вода и молоко не в бутылке
  rule4([jar,lemonade]). % сосуд с лимонадом находится между кувшином и сосудом с квасом
  rule4([jar,water]). % Стакан находится около банки и сосуда с молоком.
  rule4([pot,kvas]). % сосуд с лимонадом находится между кувшином и сосудом с квасом
  %rule4([jar,milk]).
  pravilo4([]).
  pravilo4([Head|Tail]):-
    not(rule4(Head)),
    pravilo4(Tail).

task_5:-
  Vessels = [_,_,_,_],
  in_list(Vessels, [bottle,_]),
  in_list(Vessels, [glass,_]),
  in_list(Vessels, [pot,_]),
  in_list(Vessels, [jar,_]),
  in_list(Vessels, [_,milk]),
  in_list(Vessels, [_,water]),
  in_list(Vessels, [_,lemonade]),
  in_list(Vessels, [_,kvas]),
  next_to([_,lemonade],[_,kvas],Vessels),
  next_to([_,lemonade],[pot,_],Vessels),
  %next_to([glass,_],[jar,_],Vessels),
  %next_to([glass,_],[_,milk],Vessels),
  pravilo4(Vessels),
  write(Vessels).


  % 6 Воронов, Павлов, Левицкий и Сахаров – четыре талантливых
  % молодых человека. Один из них танцор, другой художник, третий-певец, а
  % четвертый-писатель. О них известно следующее: Воронов и Левицкий сидели
  % в зале консерватории в тот вечер, когда певец дебютировал в сольном
  % концерте. Павлов и писатель вместе позировали художнику. Писатель написал
  % биографическую повесть о Сахарове и собирается написать о Воронове.
  % Воронов никогда не слышал о Левицком. Кто чем занимается?

rule5([voronov,singer]). % Воронов и Левицкий сидели в зале консерватории в тот вечер, когда певец дебютировал
rule5([levitskiy,singer]). % Воронов и Левицкий сидели в зале консерватории в тот вечер, когда певец дебютировал
rule5([pavlov,writer]). % Павлов и писатель вместе позировали художнику
rule5([pavlov,artist]). % Павлов и писатель вместе позировали художнику
rule5([sacharov,writer]). % Писатель написал биографическую повесть о Сахарове
rule5([voronov,writer]). % Писатель собирается написать о Воронове.
pravilo5([]).
pravilo5([Head|Tail]):-
  not(rule5(Head)),
  pravilo5(Tail).

task_6:-
  Gifted = [_,_,_,_],
  in_list(Gifted, [voronov,_]),
  in_list(Gifted, [pavlov,_]),
  in_list(Gifted, [levitskiy,_]),
  in_list(Gifted, [sacharov,_]),
  in_list(Gifted, [_,dancer]),
  in_list(Gifted, [_,artist]),
  in_list(Gifted, [_,singer]),
  in_list(Gifted, [_,writer]),
  pravilo5(Gifted),
  write(Gifted).

  % 7 Три друга заняли первое, второе, третье места в
  % соревнованиях универсиады. Друзья разной национальности, зовут их по-
  % разному, и любят они разные виды спорта. Майкл предпочитает баскетбол и
  % играет лучше, чем американец. Израильтянин Саймон играет лучше
  % теннисиста. Игрок в крикет занял первое место. Кто является австралийцем?
  % Каким спортом увлекается Ричард?

  rule6([michael,american,_,_]). % Майкл играет лучше, чем американец.
  rule6([simon,_,tennis,_]). % Саймон играет лучше теннисиста.
  pravilo6([]).
  pravilo6([Head|Tail]):-
    not(rule6(Head)),
    pravilo6(Tail).
  
  task_7:-
    Sportsmen = [_,_,_],
    in_list(Sportsmen, [michael,_,basketball,2]), % Майкл предпочитает баскетбол и играет лучше, чем американец.
    in_list(Sportsmen, [simon,israilan,_,_]), % Израильтянин Саймон играет лучше теннисиста.
  	in_list(Sportsmen, [richard,_,_,_]),
  	in_list(Sportsmen, [_,australian,_,_]),
  	in_list(Sportsmen, [_,american,_,_]),
  	in_list(Sportsmen, [_,_,tennis,_]),
  	in_list(Sportsmen, [_,_,kriket,1]), % Игрок в крикет занял первое место
  	in_list(Sportsmen, [_,_,_,2]),
  	in_list(Sportsmen, [_,_,_,3]),
  	pravilo6(Sportsmen),
  	write(Sportsmen).


  % 8 Познакомим читателей с тремя людьми: Аладаром, Белой и
  % Балашом. Один из них аптекарь, другой - бухгалтер, третий - агроном. Один
  % живет в Будапеште, другой- в Бекешчабе, третий - в Асоде. Требуется
  % выяснить, кто где живет и у какого какая профессия. Известно, что
  % 1) Балаш бывает в Будапеште лишь наездами и то весьма редко, хотя все
  % его родственники постоянно живут в столице;
  % 2) у двух из этих людей название профессий и городов, в которых они
  % живут, начинаются с той же буквы, что и их имена;
  % 3) жена аптекаря доводится Балашу младшей сестрой.

rule7(["balash","budapesht",_]). % Балаш бывает в Будапеште лишь наездами и то весьма редко
rule7(["balash",_,"aptekar"]). % жена аптекаря доводится Балашу младшей сестрой
  pravilo7([]).
  pravilo7([Head|Tail]):-
    not(rule7(Head)),
    pravilo7(Tail).

return_first_char([Head|Tail],Head).

is_sovpad([Name,City,Prof],Is_sovpad):-
  string_chars(Name,NameChars),
  string_chars(City,CityChars),
  string_chars(Prof,ProfChars),
  return_first_char(NameChars,FirstNameChar),
  return_first_char(CityChars,FirstCityChar),
  return_first_char(ProfChars,FirstProfChar),
  FirstCityChar = FirstNameChar,
  FirstProfChar = FirstNameChar ->
    Is_sovpad is 1;
    Is_sovpad is 0.

first_chars_count([],0).

first_chars_count([Head|Tail],Count):-
  is_sovpad(Head,Is_sovpad),
  first_chars_count(Tail,PrevCount),
  Count is PrevCount + Is_sovpad.

task_8:-
    People = [_,_,_],
    in_list(People, ["aladar",_,_]),
    in_list(People, ["bela",_,_]),
    in_list(People, ["balash",_,_]),
    in_list(People, [_,"beckeschab",_]),
    in_list(People, [_,"asod",_]),
    in_list(People, [_,"budapesht","aptekar"]), % Все родственники Балаш живут в столице, жена аптекаря - родственница Балаша.
    in_list(People, [_,_,"buchgalter"]),
    in_list(People, [_,_,"agronom"]),
    first_chars_count(People,2), % у двух из этих людей название профессий и городов, в которых они
                                 % живут, начинаются с той же буквы, что и их имена;
    pravilo7(People),
    write(People).


