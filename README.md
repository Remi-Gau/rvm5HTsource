# README

# Que contient ce dossier et comment sont organisées ces données ?

Le dossier racine contient toutes les données brutes des expériences
d’électrophysiologie que celles-ci aient abouties à un neurone injecté ou pas.
Chaque expérience est numérotée de 1 à 308.

Seules les expériences faites par des enregistrements papiers (i.e avant les
enregistrements par spike 2) ne sont pas présentes dans ce dossier : pour des
infos sur ces manips (expérience de 1 à 111), il faut se référer aux cahiers de
manip et aux tracés papiers.

Dans le dossier racine on trouve, pour chaque expérience :

- un fichier excel qui indique :
  - la date de la manip,
  - le numéro du rat,
  - l’heure de début de manip,
  - les cellules rencontrées et enregistrées (avec profondeur, latéralité,
    antéro-postériorité),
  - quelques infos sur la caractérisation électrophysiologique des cellules, le
    temps d’injection juxtacellulaire, la durée jusqu’à perfusion…

Si l’expérience a donné lieu à une injection juxtacellulaire réussie, le fichier
excel aura comme format :

```
[numéro de l’expérience] – [numéro de l’injection juxtacellulaire réussie].xls
```

- et les fichiers spikes 2 d’enregistrements des différentes cellules de cette
  expérience.

# cells

Use the sample entity to denote each recorded cell.

Dans chaque expérience, chaque cellule enregistrée est dénotée par une lettre :

- A pour la première,
- B pour la seconde…

Les fichiers spikes 2 d’enregistrements de données fonctionnent toujours par 2 :

- un fichier `.smr`, qui contient les données elles-mêmes et qui est donc le
  plus volumineux,
- un fichier `.S2R` qui contient la « mise en forme » des données.

# runs

Different recordings of the same cell are denoted using the run entity.

En général le premier enregistrement correspond à la caractérisation
électrophysiologique du neurone et le deuxième à son injection juxtacellulaire
(qu’elle ait réussi ou non).

## injected cells

Le dossier racine contient aussi des sous-dossiers numérotés de 28 à 140 (avec
quelques numéros manquants). Ce numéro correspond au numéro de l’injection
juxtacellulaire réussie.

Dans chacun de ces dossiers, on trouve les données brutes, les analyses et les
photos des expériences « réussies » : où l’injection juxtacellulaire ET la
révélation immuhisto (fluo et/ou chimique) ont TOUTES LES DEUX réussies.

Dans ces sous dossiers, on trouve le fichier excel de l’expérience concernée et
les données sont triés par cellule (dossier A pour la cellule A, B pour la
cellule B…) et il y a souvent un dossier archive qui contient les photos brutes
des différentes cellules.

Ces photos brutes sont : celles issues de la prise de vue faite au microscope du
7ème étage qui donne des fichiers `.tif` (fichiers TIFF mais il faut rajouter
manuellement l’extension pour pouvoir les ouvrir) et celles au format `.psd`
(photoshop).

Dans les dossiers dédiés à chaque cellule, on trouve :

- les enregistrements spike 2 bruts de cette cellule,
- un fichier excel où on trouve les résultats des différentes quantifications de
  cette cellule : intensité de la réponse lorsque telle patte est stimulée à
  tant de degré…
- des fichiers d’analyses de spikes 2. Ces fichiers marchent aussi par paire.
  Les fichiers « INTH » sont des histogrammes de la distribution des intervalles
  interspikes. Les fichiers « spike » sont le tracé du spike moyen. Les fichiers
  « AC » sont l’autocorrélogramme de la cellule concernée.
- Des fichiers `.psd` qui sont les photos plus ou moins retouchées du neurone en
  fluo ou en immunohistochimie (IHC) à différents grossissements.


### stain

Cells can have:
- fluo: serotonergic staining (5HT)
- fluo: neurobiotin staining (nb)
- immunohistochemistry: dab nickel staining (dab)

### chuncks

Several images of the different injected neurons were taken are denoted using the chunck entity.

The label denotes the lens magnification used on the microscope:
- X4 --> 0400
- X10 --> 1000
- ...
