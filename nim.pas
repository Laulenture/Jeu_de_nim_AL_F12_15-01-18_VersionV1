﻿program nim;

uses crt;

CONST
    ALLUMETTE_MAX = 100;
    ALLUMETTE_MIN = 1;
    PIOCHE_MAX = 3;
    PIOCHE_MIN = 1;
    FINJEU = 0;

VAR
    nb, joueur, pioche : INTEGER;

begin
    //init des veriables
    joueur := 1;

    //init partie
    repeat
        writeln('Entrez le nombre d''allumette du jeu');
        readln(nb)
    until (nb>=ALLUMETTE_MIN) AND (nb<=ALLUMETTE_MAX);

    //tour joueur
    repeat
          
        clrscr;
        writeln('Il y a ',nb, ' d''allumettes');
        repeat
            writeln('Joueur ',joueur, ', combien d''allmettes voulez vous retirer ?');
            readln(pioche);
            IF nb - pioche <FINJEU THEN
                writeln('Vous evez retiré trop d''allumettes')
        until ((pioche>=PIOCHE_MIN) AND (pioche<=PIOCHE_MAX)) AND (nb-pioche >= FINJEU);

        nb := nb - pioche;

        IF joueur = 1 THEN
            joueur := 2
        else
            joueur := 1; 

    until (nb = FINJEU);

    writeln('Le joueur ',joueur,' gagne !');
    readln;
end.