%les differnt ligne de metro
ligne(2, metro, [
		 [nation, 0],
		 [avron, 1],
		 [alexandre_dumas,2],
		 [philippe_auguste,1],
		 [pere_lachaise,2],
		 [menilmontant,2],
		 [couronnes,1],
		 [belleville,2],
		 [colonel_fabien,1],
		 [jaures,1],
		 [stalingrad,2],
		 [la_chapelle,1],
		 [barbes_rochechouart,3],
		 [anvers,2],
		 [pigalle,1],
		 [blanche,2],
		 [place_clichy,3],
		 [rome,2],
		 [villiers,3],
		 [monceau,2],
		 [courcelles,2],
		 [ternes,3],
		 [charles_de_gaulle_etoile,3],
		 [victor_hugo,2],
		 [porte_dauphine,3]
		 ], [[5,0],2,[1,45]], [[5,15],2,[1,55]]
).

ligne(3, metro, [
		 [pont_levallois_becon,0],
		 [anatole_france,2],
		 [louise_michel,3],
		 [porte_de_champerret,2],
		 [pereire,2],
		 [wagram,2],
		 [malesherbes,3],
		 [villiers,2],
		 [europe,3],
		 [saint_lazare,4],
		 [havre_caumartin,2],
		 [opera,3],
		 [quatre_septembre,3],
		 [bourse,2],
		 [sentier,3],
		 [reaumur_sebastopol,3],
		 [arts_metiers,3],
		 [temple,2],
		 [republique,3],
		 [parmentier,2],
		 [rue_saint_maur,3],
		 [pere_lachaise,4],
		 [gambetta,2],
		 [porte_de_bagnolet,3],
		 [gallieni,3]
		 ], [[5,35],4,[0,20]], [[5,30],4,[0,20]]
).

ligne(bis_3, metro, [
		    [porte_lilas,0],
		    [saint_fargeau,2],
		    [pelleport,1],
		    [gambetta, 2]
		    ], [[6,0],7,[23,45]], [[6,10],7,[23,55]]
).

ligne(5, metro, [
		 [bobigny_pablo_picasso, 0],
		 [bobigny_pantin, 2],
		 [eglise_de_pantin, 3],
		 [hoche,4],
		 [porte_pantin,3],
		 [ourcq,4],
		 [laumiere,3],
		 [jaures,3],
		 [stalingrad,2],
		 [gare_du_nord,3],
		 [gare_de_est,1],
		 [jacques_bonsergent,2],
		 [republique,3],
		 [oberkampf,2],
		 [richard_lenoir,2],
		 [breguet_sabin,2],
		 [bastille,2],
		 [quai_de_la_rapee,3],
		 [gare_austerlitz,2],
		 [saint_marcel,3],
		 [campo_formio,2],
		 [place_italie,3]
		], [[5,24],3,[1,20]], [[5,30],3,[1,0]]
).

ligne(bis_7, metro, [
		    [pre_saint_gervais,0],
		    [place_fetes, 3],
		    [danube, 0],
		    [bolivar, 2],
		    [buttes_chaumont, 2],
		    [botzaris, 2],
		    [jaures, 3],
		    [louis_blanc,2]
		    ], [[5,35],8,[0,0]], [[5,50],8,[23,45]]
).

ligne(11, metro, [
                   [mairie_lilas, 0],
                   [porte_lilas, 3],
                   [telegraphe,1],
                   [place_fetes,1],
                   [jourdain, 1],
                   [pyrenees, 1],
                   [belleville, 2],
                   [goncourt, 2],
                   [republique, 3],
                   [arts_metiers, 2],
                   [rambuteau, 1],
                   [hotel_de_ville, 1],
                   [chatelet, 1]
                   ], [[5,15],5,[1,30]], [[5,0],5,[2,0]]
).
ligne(66, metro,
    [
        [a, 0],
        [b, 3],
        [c, 2]
    ],
    [[5,0], 10, [23,0]],
    [[6,0], 10, [23,30]]
).

ligne(99, bus,
    [
        [b, 4],
        [c, 5],
        [d, 3]
    ],
    [[5,30], 15, [22,0]],
    [[6,0], 15, [22,30]]
).

% 2)-Les outils de manipulation des horaires:

% pridact addh(X,M,R):Ajouter un certain nombre de minutes M � uneheure
% repr�sent�e par X, et obtenir le r�sultat R
%X=[H,M]; M=temps en minutes ;R=X+M en [H,M]
%
addh([H, M], TM, [HR, MR]) :-
    TTM is (H * 60) + TM+M,  % calculer le temps total en minutes
    HR is TTM div 60,     % Calculer les heures
    MR is TTM mod 60, % Calculer les minutes restantes
    HR<24,MR<60 .

% Fonction d'affichage:qui affiche sur l��cran l�horaire dans un format lisible
affiche([H, M]) :-
    format('~d:~d', [H, M]).
affi([H, M]) :-
    write(H), write(':'), write(M), nl.
%exercice 3 :manipuler les informations des lignes de transport

%"lig" est vrai quand une ligne passe par l'arret 1 et l'arret2:
lig(Ar1, Ar2, Ligne) :-
    ligne(Ligne, _, Arrets, _, _),%on rechercher l'existence des arrets 1 et 2 dans la ligne
    member([Ar1, _], Arrets),
    member([Ar2, _], Arrets).

%"ligtot"qui est vrai quand ligne part plus tot
ligtot(Ar1, Ar2, Ligne, [H,M]) :-
    ligne(Ligne, _, _, [[DH,DM], _, _], _),
    lig(Ar1,Ar2,Ligne),
    (DH >H ;(DH=:=H,DM>=M) ).



%`ligtard` qui est vrai quand Ligne arrive le plus tard.

ligtard(Ar1, Ar2, Ligne, [H, M]) :-
    ligne(Ligne, _, _, [[DH, DM], _, _], _),
    lig(Ar1, Ar2, Ligne),
    (DH < H ; (DH =:= H, DM < M)).
%exo3:


% Predicate to find a common stop between two lines
findCommonStop(Line1, Line2, CommonStop) :-
    ligne(Line1, _, Stops1, _, _),
    ligne(Line2, _, Stops2, _, _),
    member([CommonStop, _], Stops1),
    member([CommonStop, _], Stops2).

% Predicate to find the route between two stops across different lines



% Predicate to find a common stop between two lines
commonStopOnDifferentLines(Arret1, Arret2, CommonStop, Line1, Line2) :-
    ligne(Line1, _, Stops1, _, _),
    ligne(Line2, _, Stops2, _, _),
    member([CommonStop, _], Stops1),
    member([CommonStop, _], Stops2),
    member([Arret1, _], Stops1),
    member([Arret2, _], Stops2).

% Predicate to find an itinerary between two stops without considering time
itinTot(Arret1, Arret2, Parcours) :-
    lig(Arret1, _, Line1),
    lig(Arret2, _, Line2),
    Line1 \= Line2, % Ensure they are on different lines
    commonStopOnDifferentLines(Arret1, Arret2, CommonStop, Line1, Line2),
    ligne(Line1, _, Stops1, _, _),
    ligne(Line2, _, Stops2, _, _),
    member([Arret1, _], Stops1),
    member([Arret2, _], Stops2),
    member([CommonStop, _], Stops1),
    Parcours = [Arret1, CommonStop, Arret2].

% Recursive predicate to find an itinerary through intermediate stops
itinTot(Arret1, Arret2, Parcours) :-
    lig(Arret1, _, Line1),
    lig(Arret2, _, Line2),
    Line1 \= Line2, % Ensure they are on different lines
    commonStopOnDifferentLines(Arret1, Arret2, CommonStop, Line1, Line2),
    itinTot(Arret1, CommonStop, Parcours1),
    itinTot(CommonStop, Arret2, Parcours2),
    append(Parcours1, [CommonStop | Parcours2], Parcours).
