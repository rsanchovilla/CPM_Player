PROGRAM abuse(output);

(* ********************************** *)
(* Turbo-Pascal Version of UNIX abuse *)
(* ********************************** *)

BEGIN
 randomize;
 CASE random(4) OF
 0: write('Hey,');
 1: write('Hey, you');
 2: write('Why, you');
 3: write('You')
 END;
 write(' ');
 CASE random(16) OF
 0: write('anchovy eating');
 1: write('brain damaged');
 2: write('festering');
 3: write('foul smelling');
 4: write('hideous');
 5: write('mongoloid');
 6: write('pitiful');
 7: write('putrid');
 8: write('scum sucking');
 9: write('simpering');
 10:write('slimy');
 11:write('third degree');
 12:write('thoroughly pizzled');
 13:write('totally abominable');
 14:write('vile');
 15:write('worthless')
 END;
 write(' ');
 CASE random(10) OF
 0: write('halfwit!');
 1: write('heap of manure!');
 2: write('idiot!');
 3: write('imbecile!');
 4: write('jackass!');
 5: write('moron!');
 6: write('pig!');
 7: write('son of a bitch!');
 8: write('swine!');
 9: write('turtle turd!')
 END;
 write(' ');
 CASE random(3) OF
 0: write('Knowing you as a');
 1: write('Since you''re a');
 2: write('You')
 END;
 write(' ');
 CASE random(15) OF
 0: write('disgusting');
 1: write('filthy minded');
 2: write('gravy sucking');
 3: write('mediocre');
 4: write('perfectly incompetent');
 5: write('rancid');
 6: write('rank');
 7: write('rotten');
 8: write('sickening');
 9: write('sleazy');
 10:write('smoldering');
 11:write('thoroughly inferior');
 12:write('tin plated');
 13:write('truly obnoxious');
 14:write('villainous')
 END;
 writeln;
 CASE random(11) OF
 0: write('bastard');
 1: write('fool');
 2: write('jerk');
 3: write('load of excrement');
 4: write('mangled baby duck');
 5: write('pile of feces');
 6: write('scum bag of humanity');
 7: write('soul of foulness and inhumanity');
 8: write('submoron');
 9: write('thalidomide mutant');
 10:write('waste of human flesh')
 END;
 write(' ');
 CASE random(6) OF
 0: write('even the thought of you makes me');
 1: write('if I ever see you again I''ll');
 2: write('when I see you I');
 3: write('when I smell you I');
 4: write('when your stench pervades the air I');
 5: write('you make me')
 END;
 writeln;
 CASE random(6) OF
 0: write('feel compelled to');
 1: write('feel I should');
 2: write('have an uncontrollable urge to');
 3: write('want to');
 4: write('wish I could');
 5: write('wonder why I don''t')
 END;
 write(' ');
 CASE random(17) OF
 0: write('blow my cookies.');
 1: write('blow up your car.');
 2: write('commit gross abominations.');
 3: write(
    'contribute to the society for the prevention of whatever it is you are.');
 4: write('cringe.');
 5: write('cry.');
 6: write('defecate.');
 7: write('go into a convulsive fit.');
 8: write('lose my breakfast.');
 9: write('mumble.');
 10:write('puke.');
 11:write('reconfigure your face with an ice pick.');
 12:write('retch horribly.');
 13:write('retch.');
 14:write('roll over and die.');
 15:write('throw up.');
 16:write('vomit.')
 END;
 writeln;
 CASE random(8) OF
 0: write('Could you please do us all a favor and');
 1: write('Is there any thruth to the rumor that you plan to');
 2: write('Is there some reason you refuse to');
 3: write('When will you realize the best thing for you to do is to');
 4: write('Why don''t you');
 5: write('Would you be so kind as to');
 6: write('Would you please');
 7: write('When are you going to')
 END;
 write(' ');
 CASE random(14) OF
 0: write('drop dead');
 1: write('drink a banana slug pukeshake');
 2: write('find a rock to crawl under');
 3: write('french kiss a mule');
 4: write('go away');
 5: write('go write an RPG programm');
 6: write('hang yourself by the neck');
 7: write('leave');
 8: write('play jacks on Interstate 280');
 9: write('shower with brillo pads');
 10:write('slither back into the swamp');
 11:write('stick your head where the sun won''t shine');
 12:write('swell up like a rotten fish');
 13:write('take up chasing banana trucks on US 101')
 END;
 writeln;
 CASE random(7) OF
 0: write('and bring joy back to my life?');
 1: write('and fill a much needed gap in someone else''s life?');
 2: write('and improve the air quality in this area?');
 3: write('and leave me in peace?');
 4: write('and make this a better world?');
 5: write('and never darken my door again?');
 6: write('and revert to your elemental form?')
 END;
 writeln
END.
