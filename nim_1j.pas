program nim;

uses crt;

CONST
    ALLUMETTE_MAX = 100;
    ALLUMETTE_MIN = 1;
    PIOCHE_MAX = 3;
    PIOCHE_MIN = 1;
    FINJEU = 0;

VAR
    nb, joueur, pioche,i : INTEGER;

begin
    //init des veriables
    joueur := 1;

    //init partie
    repeat
        writeln('Entrez le nombre d''allumette du jeu');
        readln(nb)
    until (nb>=ALLUMETTE_MIN) AND (nb<=ALLUMETTE_MAX);

    //déroulement de la partie
    repeat

        IF joueur = 1 THEN
        begin
            clrscr;
            writeln('Il y a ',nb, ' d''allumettes');
            repeat
                writeln('Combien d''allmettes voulez vous retirer ?');
                readln(pioche);
                IF nb - pioche <FINJEU THEN
                    writeln('Vous evez retiré trop d''allumettes')
            until ((pioche>=PIOCHE_MIN) AND (pioche<=PIOCHE_MAX)) AND (nb-pioche >= FINJEU);

            nb := nb - pioche;

            joueur := 2;
        END
        else
        begin
            //Tour IA
            clrscr;
            pioche := 3; //pioche par défaut
            randomize;
            FOR i := 1 TO (ALLUMETTE_MAX DIV 4 + 1) DO 
            begin
                IF nb-(random(2)+1) = 4 * (i-1) + 1 THEN
                pioche := random(2)+1;
			end;
            
            writeln('Il y a ',nb, ' d''allumettes');
            nb := nb - pioche;
            writeln('L''ordinateur à retiré ', pioche, ' allumettes.');
            joueur := 1;
            readln;
        end;

    until nb=FINJEU;

    IF joueur = 1 THEN
        writeln('Vous avez gagné !')
    else
    begin
        writeln('L"ordinateur gagne !');
    end;
    readln;

END.