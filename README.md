# Projet-de-Systeme-de-Transport--prolog

Ce programme est conçu pour fournir des informations et des manipulations relatives aux lignes de métro et de bus dans une zone spécifique. Il comprend des fonctionnalités pour récupérer les détails des lignes, trouver des arrêts communs, calculer des itinéraires et manipuler des données temporelles.

## Utilisation

### Exécution

Pour exécuter le programme, suivez ces étapes :

1. **Prérequis :** Assurez-vous d'avoir [Prolog](prolog.org) installé.
2. **Cloner le dépôt :** Clonez ce dépôt sur votre machine locale.
    ```bash
    git clone https://github.com/Nahla-yasmine/Projet-Systeme-de-Transport-prolog
    ```
3. **Lancer le programme :** Ouvrez votre interpréteur Prolog et chargez le fichier principal :
    ```prolog
    consult('projet1.pl').
    ```

### Prédicats

#### `lig(Arret1, Arret2, Ligne)`

Ce prédicat vérifie si une ligne (`Ligne`) passe par les arrêts `Arret1` et `Arret2`.

**Utilisation :**
```prolog
lig(Arret1, Arret2, Ligne).
```

#### `ligtot(Arret1, Arret2, Ligne, [H, M])`

Détermine si une ligne arrive à `Arret2` plus tard qu'à `Arret1`.

**Utilisation :**
```prolog
ligtot(Arret1, Arret2, Ligne, [H, M]).
```

#### `ligtard(Arret1, Arret2, Ligne, [H, M])`

Détermine si une ligne arrive à `Arret2` plus tard qu'à `Arret1`.

**Utilisation :**
```prolog
ligtard(Arret1, Arret2, Ligne, [H, M]).
```

#### `findCommonStop(Line1, Line2, CommonStop)`

Trouve un arrêt commun entre deux lignes.

**Utilisation :**
```prolog
findCommonStop(Line1, Line2, CommonStop).
```

#### `itinTot(Arret1, Arret2, Parcours)`

Trouve un itinéraire entre deux arrêts sans considérer le temps.

**Utilisation :**
```prolog
itinTot(Arret1, Arret2, Parcours).
```

### Exemples

#### Trouver un Arrêt Commun

Pour trouver un arrêt commun entre deux lignes :
```prolog
findCommonStop(Line1, Line2, CommonStop).
```

#### Calculer un Itinéraire

Pour calculer un itinéraire entre deux arrêts sans considérer le temps :
```prolog
itinTot(Arret1, Arret2, Parcours).
```

