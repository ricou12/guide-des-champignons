#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: utilisateurs
#------------------------------------------------------------

CREATE TABLE utilisateurs(
        iduser       Int  Auto_increment  NOT NULL ,
        dateuser     Date NOT NULL ,
        nomuser      Varchar (100) ,
        prenomuser   Varchar (100) ,
        roleuser     Enum ("Administrateur","Modérateur","Membre") NOT NULL ,
        passworduser Varchar (255) NOT NULL ,
        pseudouser   Varchar (255) NOT NULL
	,CONSTRAINT utilisateurs_PK PRIMARY KEY (iduser)
)ENGINE=InnoDB;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `utilisateurs` (`iduser`, `dateuser`, `nomuser`, `prenomuser`, `roleuser`, `passworduser`, `pseudouser`) VALUES
(0, '2020-03-10', NULL, NULL, 'Membre', '$2y$10$oA3fMK6JEaB9eArgj8jiyOb0LRDErmKgkcMJa/UY3nGI/xXpI.Pxe', 'lanza'),
(1, '2020-03-09', NULL, NULL, 'Administrateur', '$2y$10$3sdJ.FnOPKyKeoT/m0lnROoV5wLyanFW4UNFdYKoRsHwML0RlhC6y', 'eric'),
(13, '2020-03-12', NULL, NULL, 'Membre', '$2y$10$63DTwPNu16/MZnZc7Z4zceE6UBOP9FbXBLDIBdXEvBVgav/vJbisa', 'nadia');
COMMIT;

#------------------------------------------------------------
# Table: champ
#------------------------------------------------------------

CREATE TABLE champ(
        idchamp         Int  Auto_increment  NOT NULL ,
        authoriserchamp TinyINT NOT NULL ,
        datechamp       Date NOT NULL ,
        latinchamp      Varchar (200) ,
        communchamp     Varchar (200) NOT NULL ,
        localchamp      Varchar (200) ,
        chapeauchamp    Varchar (200) ,
        typelameschamp  Enum ("Adn�es","Décurrentes","Echancrées","Libres","Sécédentes","Sinuées","Subdécurrentes") ,
        lameschamp      Text ,
        piedchamp       Text ,
        chairchamp      Text ,
        habitatchamp    Text ,
        remarqueschamp  Text ,
        consochamp       Enum ("Excellent comestible","Bon comestible","Comestible médiocre","A rejeter","Toxique","Mortel") ,
        iduser          Int
	,CONSTRAINT champ_PK PRIMARY KEY (idchamp)

	,CONSTRAINT champ_utilisateurs_FK FOREIGN KEY (iduser) REFERENCES utilisateurs(iduser)
)ENGINE=InnoDB;

--
-- Déchargement des données de la table `champ`
--

INSERT INTO `champ` (`idchamp`, `authoriserchamp`, `datechamp`, `latinchamp`, `communchamp`, `localchamp`, `chapeauchamp`, `typelameschamp`, `lameschamp`, `piedchamp`, `chairchamp`, `habitatchamp`, `remarqueschamp`, `consochamp`, `iduser`) VALUES
(1, 1, '0000-00-00', 'BOLETUS EDULIS', 'Cépe de bordeaux', NULL, 'de 10 à 20 cm, hémisphérique puis convexe, charnu, de couleur allant du beige au marron à brun noisette ou brun ochracé clair, parfois plus clair selon exposition, à marge épaisse, souvent excédente e', '', ' tubes fins et serrés prolongés de pores d\'abord de couleur blanche à blanchâtre puis jaune, devenant ensuite verdâtre sur la fin', 'robuste et ferme, renflé à ventru ou allongé en massue vers la base, de couleur fauve strié d\'un fin réseau blanc en saillie, devenant blanc vers la base', 'blanche.', NULL, 'excellent comestible.', 'Excellent comestible', 13),
(2, 1, '0000-00-00', 'BOLETUS AEREUS', 'Cèpe bronzé', '', 'de 7 à 15-20, voire 30 cm, hémisphérique puis largement étalé et parfois bosselé, cuticule brun-noir, d\'abord noire (parfois gris blanc lorsqu\'il est jeune, à l\'état de bouchon couvert par la végétati', '', 'blanc pur puis jaunissant ou verdissant. ', ' 6 à 10 cm, très trapu, brun clair finement réticulé. ', 'saveur et odeur douces.', 'thermophile, il pousse de la fin de l\'été au début de l\'hiver, généralement dans les chênaies aérées', 'excellent comestible.', 'Excellent comestible', 0),
(3, 1, '0000-00-00', 'AMANITA MUSCARIA', 'Amanite tue mouches', NULL, 'après avoir émergé du sol, le chapeau est couvert de nombreuses verrues blanches en forme de pyramides.', '', 'libres, sont blanches, de même que l\'empreinte de spore.', 'est blanc, il mesure 5 à 20 centimètres de haut pour 1 à 2 centimètres de diamètre, et a la texture fibreuse et légèrement friable typique de la plupart des grands champignons. À sa base, la volve (ou bulbe) porte des résidus du voile universel sous la forme d\'un ou deux anneaux concentriques.', 'blanche.', 'Amanita muscaria est un champignon cosmopolite, qui croît dans les forêts de conifères et de feuillus de toutes les régions tempérées et boréales de l\'hémisphère Nord.', 'toxique, hallucinogène.', 'Toxique', 13),
(4, 1, '0000-00-00', 'AMANITA CAESAREA', 'Amanite des césars', 'Oronge', 'de 8 à 15-20 cm, est ovoïde jeune puis hémisphérique et enfin convexe. La cuticule est rouge orangé vif, luisante, assez souvent couvert de grands lambeaux de la volve, blancs.', '', 'serrées, jaune d\'or clair.', 'de 8 à 15 cm est robuste, droit ou légèrement courbé, de la couleur des lames. La base du stipe est ovoïde vers le sol. La volve est épaisse, blanc grisâtre, s\'écartant du stipe et ample.Son anneau membraneux, concolore au pied, placé haut et pendant. L\'odeur est agréable, sa saveur douce de noix. La sporée est blanche. ', 'ferme, blanche, jaune sous la cuticule. La marge est nettement striée, jaune d\'or.', NULL, 'sa réputation d\'excellent comestible, sa beauté et sa relative rareté en font un champignon recherché.', 'Excellent comestible', 13),
(5, 1, '0000-00-00', 'SUILLUS COLLINITUS', 'Bolet enduit', 'Pissacan', 'brun clair à brun gris', '', 'jaunes,adnés.', 'cylindrique,a base pointue,blanchâtre a jaune.', 'jaunâtre, molle.', 'sous les pins et plus particulierement pins d\'alep, milieu herbeux.', 'considèré comme comestible. il reste cependant laxatif.', 'A rejeter', 0),
(6, 1, '0000-00-00', 'SUILLUS LUTEUS', 'Bolet jaune', ' Nonnette voilée', 'de 5 à 12 cm, hémisphérique puis convexe, à marge lisse, de couleur brune à brun ochracé, parfois nettement plus clair et jusqu\'à jaune, à l\'aspect brillant et visqueux', '', 'tubes d\'abord jaunes devenant ensuite verdâtres, longtemps cachés par une cortine blanche', 'court et massif, blanchâtre à jaunâtre, plutôt granuleux vers le sommet', 'blanchâtre à jaunâtre.', NULL, 'bon comestible à l\'état juvénile.', 'Bon comestible', 0),
(7, 1, '0000-00-00', 'SUILLUS VARIEGATUS', 'Bolet moucheté', NULL, 'brun, Crème, Gris, Jaune. Entièrement feutré mécheux ou moucheté.', '', 'brun, Jaune, Vert.', 'brun, Crème, Gris, Jaune.', 'blanc, Crème, Jaune.', NULL, 'comestible.', 'Comestible médiocre', 0),
(8, 1, '0000-00-00', 'LACTARIUS SANGUIFLUUS', 'Lactaire sanguin', 'Sanguin\r\nrouge', 'blanc cassé à orangé,verdissant.', '', 'rosé à reflets vineux, tachées de vert et de rouge vineux dans les blessures', 'rosé vineux pâle,blanchâtre au sommet,vite creux', 'blanchatre a la coupe puis sécretion d\'un latex rouge vineux', 'sous les pins maritimes, d’Alep..., en mélange avec chênes, arbousiers, bruyères,romarin.', 'excellent comestible.', 'Excellent comestible', 0),
(9, 1, '0000-00-00', 'LACTARIUS DELICIOSUS', 'Lactaire délicieux', 'Safrané', 'convexe puis creusé, orangé,marqué de petite tache concentrique,tache blanche, verdissant dans les blessures.', '', 'orangé se tachant orange vif puis verdissant aux endroits blessés.', 'blanchâtre à orangé pâle. creux', 'blanchâtre se colorant d\'un lait couleur carotte.', 'en automne sous pins maritimes,sylvestre, en forêts mixtes pins, chênes, bruyère.', 'Bon comestible', 'Bon comestible', 0),
(10, 1, '0000-00-00', 'LECCINUM LEPIDUM', 'Bolet joli', 'Bolet du chène vert', NULL, '', NULL, NULL, NULL, NULL, NULL, 'Comestible médiocre', 0),
(11, 1, '0000-00-00', 'LACTARIUS TESQUORUM', 'Lactaire des lieux sauvages', '', 'Crème, Jaune, Saumon', '', 'Crème, Jaune, Saumon', 'Blanc, Crème, Saumon', 'latex blanc saveur âcre', 'sous les pins', 'Sans intérêt', 'A rejeter', 0),
(12, 1, '0000-00-00', 'RUSSULA VIRESCENS', 'Russule verdoyante', 'Palomet', 'chapeau vert allant du vert pâle au vert-bleu-gris mesurant de 5 à 10 cm, souvent craquelé et parsemé de petites plaques lui donnant un aspect de moisi.', '', 'blanc-crème, assez serrées.', ' est blanc, cassant (comme chez toutes les russules) et mesure 1,5 à 2 cm de diamètre pour 4 à 8 cm de hauteur.', 'blanche avec une odeur fongique faible et une saveur de noisette', 'Sous feuillus(chêne, hêtre, châtaignier),sous conifères.', 'excellent comestible, sans doute la meilleure des russules', 'Excellent comestible', 0),
(13, 1, '0000-00-00', 'MACROLEPIOTA PROCERA', 'Lepiote élevée', 'Coulemelle', 'ovoïde puis convexe et enfin largement étalé en parasol, de 10 à 30 cm de diamètre, surmonté d\'un mamelon, avec une cuticule sèche, gris-roux, couvert d\'écailles brunes, plus denses vers le centre.', '', 'blanches, serrées, molles', 'haut de 15 à 40 cm, est élancé, creux, bulbeux à la base, brun tigré et de plus en plus écaillé en allant vers la base ; il est pourvu d\'un anneau double, blanchâtre et coulissant. Le pied est fibreux, ce qui le rend immangeable. ', 'est blanche, molle, avec une odeur et une saveur fruitées agréables.', 'sur sol à tendance acide de type schiteux. sous-bois dégagés ou les clairières. ', 'Comestible recherché.', 'Bon comestible', 0),
(14, 1, '0000-00-00', 'BOLETUS AESTIVALIS', 'Cèpe d\'été', 'Cèpe réticulé', 'jusqu’à 25 cm, hémisphérique puis convexe, sec, velouté, brun noisette.', '', 'blancs puis jaunâtres ou ocre.', 'de 5 à 15 cm, ventru, allongé, réseau saillant, brun plus pâle que le chapeau.', 'blanche, épaisse, ferme.', 'bois de feuillus, lisières, souvent sous hêtres & chênes, clairières.', 'de Mai à Septembre\r\nLe cèpes d’été est un des meilleurs cèpes, incontestablement ! C’est le plus précoce, mais on le trouve rarement après le mois de septembre.', 'Excellent comestible', 0),
(15, 1, '0000-00-00', 'CANTHARELLUS CIBARIUS', 'Chanterelle comestible', 'Girolle', 'taille de 3 à 10 cm. Jaune orangé plus ou moins claire quelque fois couleur blanc cassé lorsque très jeune, convexe  puis déprimé,irrégulier,marge enroulé puis étalée et ondulée.', '', 'constitué de plis décurrents fourchus.', 'plein,lisse, atténué à la base.', 'blanc crème.Odeur fruitée, saveur douce à un peu piquante.', 'Sous feuillus et sous conifère, du printemps a l\'automne.', 'Bon comestible', 'Bon comestible', 0),
(16, 1, '0000-00-00', 'CANTHARELLUS LUTESCENS', 'Chanterelle jaunissante', '', 'de 2 à 5 cm jaune brun ; Marge ondulée.', '', 'veiné, jaune pâle, sporée crème.', 'arrondi à aplati, creux,jaune, creux, jaune orangé.', 'fibreuse. odeur fruitée saveur douce.', 'en colonie sous feuillus,conifère souvent sous bruyère. Sur sol a tendance acide de type schites.', 'bon comestible.', 'Bon comestible', 0),
(17, 1, '0000-00-00', 'RAMARIA FLAVA', 'Clavaire jaune', 'Barbe', 'non différencié, forme coralloïde, Haut. 5 à 12 cm, Diam. 6 à 15 cm', '', 'lisse', 'tronc épais', 'blanchâtre. Odeur légère, agréable', 'sous les chênes.', ' comestible médiocre', 'Comestible médiocre', 0),
(18, 1, '0000-00-00', 'COPRINUS COMATUS', 'Coprin chevelu', 'Goutte d\'encre', ' de 5 à 15 cm en forme de fuseau fragile lorsque le spécimen est jeune, évoluant vers une forme cylindrique, puis vers une forme de cloche à mesure que le champignon vieillit', '', 'blanches virent rapidement au rose puis au noir.  L\'anneau est léger, mobile, et ne présente pas de volve.', 'est long et blanc, renflé à la base. Entièrement lisse et blanche au début, la cuticule devient méchuleuse jaunâtre ou ocrée (d\'où son qualificatif de « chevelu »)', NULL, 'dans les prairies, les endroits dégagés des bois, les clairières, les bords de chemin et même les jardins, sur sols riches en azote.', 'considéré comme un excellent comestible, à condition toutefois de le consommer jeune, c\'est-à-dire entièrement blanc à la coupe, s\'il y a du noir il est à rejeter.', 'Bon comestible', 0),
(19, 1, '0000-00-00', 'SARCOSPHAERA CORONARIA', 'Pezize étoilée', 'Golbelet', NULL, '', 'en forme de pomme de terre, blanchâtre à l\'état jeune puis s\'ouvrant en étoile. Face intérieur( hyménium) blanchâtre puis vite violet et enfin brun violet. face exterieur blanchetachée de jaune.', NULL, 'blanchâtre à violacée, cassante. Odeur et saveurs faible.', 'Sous conifères, chênes sur sol calcaire.', 'toxique(mortel cru)', 'Toxique', 0),
(20, 1, '0000-00-00', 'Hydnum repandum', 'Hydne commun', 'Pied-de-mouton. Barbe de chèvre. Hydne sinué. Hydne commun. Langue-de-veau.', 'de 4 à 15 cm, massif, de forme très variable, irrégulièrement bosselé, souvent soudé les uns aux autres, convexe puis étalé, déprimé ;\r\ncuticule adnée, sèche, mate, de crème à chamois, non zonée et no', '', 'serrés, décurrents, longs de 3-5 mm, fragiles, blancs puis crèmes et brunissants', 'épais, charnu, trapu, plein, de 3 à 8 x 1 à 4 cm, difforme, excentré rarement central, s\'épaississant à la base, blanchâtre puis roussissant par endroits ', 'épaisse, ferme, cassante, blanche fonçant légèrement au contact de l\'air, très légère odeur agréable, saveur parfois légèrement amère', NULL, 'c\'est un excellent comestible, mais non de premier choix, sa chair présentant souvent l\'inconvénient d\'une légère amertume.', 'Excellent comestible', 0),
(21, 1, '0000-00-00', 'Gomphus clavatus', 'Chanterelle violette', NULL, '5 à 10 cm de diamètre, un peu déprimé au sommet; marge sinueuse, devenant lobée; lilas, puis brun-jaune.', '', 'sinueux, fourchus et boursoufflés, violacés, puis brun-ocre.', 'court, souvent latéral, plus mince en bas, violet, devenant plus terne avec l\' âge.', 'blanche et ferme.', 'conifères ( pins, sapins ) surtout en montagne.Souvent en touffes.Fin de l\' été et automne.Peu courant à assez courant selon les régions.', 'bon comestible jeune, légèrement amer par la suite.Ce champignon est apprécié pour sa chair plus tendre que la girolle mais il est aussi moins parfumé que cette dernière.', 'Bon comestible', 0),
(22, 1, '0000-00-00', 'Geastrum fimbriatum', 'Géastre sessile', NULL, 'Sphérique de 2 à 4 cm de diamètre avant ouverture.\r\nIl éclate en 6 à 10 segments ocre avec une boule au centre allant de l\' ocre au gris parfois brun surmontée d\' une pointe plus sombre', '', NULL, NULL, 'molle blanche à grise.', NULL, 'non comestible', 'A rejeter', 0),
(23, 1, '0000-00-00', 'Phallus impudicus', 'Satyre puant', 'œuf du Diable', 'dans son premier stade, le phallus se présente sous forme d\'un œuf oblong.À la coupe, l\'œuf montre plusieurs couches en allant vers le centre : d\'abord une enveloppe externe, le péridium, puis une épa', '', NULL, '10 à 20 cm sur 2 à 4 cm de diamètre, allongé et s\'amincissant graduellement vers le haut, blanc, alvéolé, creux, caverneux et fragile - il s\'affaisse fréquemment au bout de quelques jours. Il est chaussé d\'une volve, reste de l\'œuf éclaté.', 'blanche et poreuse, inodore en elle-même. En revanche la gléba, tant qu\'elle est présente, répand une odeur pestilentielle de cadavre que l\'on sent à plusieurs mètres à la ronde avant même d\'avoir aperçu le champignon.', NULL, 'L\'œuf, débarrassé de sa gélatine, est comestible cru, par exemple en salade, et un goût se situant entre le radis et le raifort. Il est surtout consommé en Extrême-Orient. Une fois le champignon développé, son odeur de charogne proscrit toute utilisation culinaire. ', 'Comestible médiocre', 0),
(24, 1, '0000-00-00', 'clitocybe odora', 'Clitocybe anisé', NULL, '6 (10) cm de diam, convexe puis plat, légèrement omboné-déprimé ;\r\nrevêtement vert finement fibrilleux, vert, bleu-vert surtout au disque, pâlissant et décoloré dans l\'âge, sec, non visqueux ;\r\nmarge ', '', 'adnées, très légèrement décurrentes, blanchâtres à concolores au chapeau mais plus pâles, inégales, moyennement serrées, parfois fourchues, veinées sur la face et interveinées dans le fond, surtout sur vieux sujets', '8 x 1,5 cm, cylindrique, blanchâtre plus ou moins bleuté verdâtre, pruineux, floconneux-fibrilleux, base velue légèrement épaissie.', 'blanc sale à bleutée, élastique, peu épaisse sauf au disque, odeur forte d\'anis, saveur douce fortement anisée', NULL, 'bon comestible, mais très (trop) parfumé, à utiliser de préférence en condiment', 'Bon comestible', 0),
(25, 1, '0000-00-00', 'Morchella elata', 'Morille conique', NULL, '6 à 12 cm, conique, brun à brun-noir, côtes longitudinales rectilignes.', '', ' alvéoles irrégulières', 'jusqu’à 12 cm, trapu, crème, creux, granuleux', 'Crème, peu épaisse', NULL, NULL, 'Excellent comestible', 0),
(26, 1, '0000-00-00', 'Fomes fomentarius', 'Amadouvier', NULL, 'de 15 à 30, voire 50 cm, épais de 8 à 15 cm, en sabot de cheval, gris-brun, porte des bourrelets concentriques de taille décroissante en allant vers le sommet.', '', 'les tubes sont bruns, la sporée jaunâtre', 'il n\'y a pas de pied, le champignon pousse en console.', 'La chair est épaisse, brune, d\'aspect ligneux, coriace.', 'C\'est un redoutable parasite de plusieurs feuillus : hêtre, platane, bouleau, peuplier, chêne ou marronnier, entre autres. Il se fixe sur des arbres faibles ou blessés, produit une pourriture blanche et finit en quelques années par tuer son hôte. ', 'l\'amadouvier n\'est pas comestible. Il était utilisé comme substance inflammable dès la Préhistoire.', NULL, 0),
(27, 1, '0000-00-00', 'Rhizopogon', 'Rhizopogon rose', NULL, 'en forme de pomme de terre, blanchâtre à jaune.', '', 'gléba spongieux,jaunâtre puis olive foncé à maturation. Sporée olivâtre.', NULL, NULL, 'à demi enterrré sous les pins en automne.', 'A rejeter. Il existe des nombreuse espèces de rhizopogon, très difficile à différencier les unes des autres.', 'A rejeter', 0),
(28, 1, '0000-00-00', 'Lycoperdon perlatum', 'Vesse-de-loup perlée', NULL, 'de 3 à 5 cm pour 4 à 9 cm de hauteur, en forme de globe, d\'ampoule globuleuse ou de poire inversée, à mamelon obtus plus ou moins marqué, blanc à blanc crème brunissant, couverte de petites aspérités ', '', 'néant', 'non marqué, dans le prolongement du carpophore, également recouvert des mêmes aspérités que celui-ci', 'blanc bistre.', 'principalement dans les bois de conifères, en lisières, talus et chemins les bordant, parfois aussi dans les herbus contigus moins fréquemment sous les feuillus', ' considérées comme comestibles quand elles sont jeunes et que la gleba est homogène et blanche.', 'Comestible médiocre', 0),
(59, 0, '2020-03-20', 'nadia test latin', 'nadia test', 'nadia test local', 'nadia test chapeau', 'Sécédentes', 'nadia test lames', 'nadia test pied', 'nadia test chair', 'nadia test habitat', 'nadia test remarques', 'Excellent comestible', 13),
(60, 0, '2020-03-20', '', 'ss', '', '', '', '', '', '', '', '', '', 13),
(61, 0, '2020-03-20', 'latin', 'zzzz', 'é', '3', '', '4', '5', '6', '7', '8', 'A rejeter', 13),
(62, 0, '2020-03-20', 'w', 'test', 'w', 'w', '', 'w', 'w', '', 'w', '', 'Toxique', 13);


#------------------------------------------------------------
# Table: images
#------------------------------------------------------------

CREATE TABLE images(
        idimg    Int  Auto_increment  NOT NULL ,
        firstimg TinyINT NOT NULL ,
        nomimg   Varchar (100) NOT NULL ,
        pathimg  Varchar (255) NOT NULL ,
        idchamp  Int NOT NULL
	,CONSTRAINT images_PK PRIMARY KEY (idimg)

	,CONSTRAINT images_champ_FK FOREIGN KEY (idchamp) REFERENCES champ(idchamp)
)ENGINE=InnoDB;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`idimg`, `firstimg`, `nomimg`, `pathimg`, `idchamp`) VALUES
(1, 1, NULL, 'AMADOUVIER-01.jpg', 26),
(2, 0, NULL, 'AMADOUVIER-02.jpg', 26),
(3, 1, NULL, 'AMANITE-DES-CESARS-01.jpg', 4),
(4, 1, NULL, 'AMANITE-TUE-MOUCHES-01.jpg', 3),
(5, 0, NULL, 'AMANITE-TUE-MOUCHES-02.jpg', 3),
(6, 0, NULL, 'AMANITE-TUE-MOUCHES-03.jpg', 3),
(7, 0, NULL, 'AMANITE-TUE-MOUCHES-04.jpg', 3),
(8, 0, NULL, 'AMANITE-TUE-MOUCHES-05.jpg', 3),
(9, 0, NULL, 'AMANITE-TUE-MOUCHES-06.jpg', 3),
(10, 0, NULL, 'AMANITE-TUE-MOUCHES-07.jpg', 3),
(11, 1, NULL, 'BOLET-ENDUIT-01.jpg', 5),
(12, 0, NULL, 'BOLET-ENDUIT-02.jpg', 5),
(13, 0, NULL, 'BOLET-ENDUIT-03.jpg', 5),
(14, 1, NULL, 'BOLET-JAUNE-01.jpg', 6),
(15, 0, NULL, 'BOLET-JAUNE-02.jpg', 6),
(16, 0, NULL, 'BOLET-JAUNE-03.jpg', 6),
(17, 0, NULL, 'BOLET-JAUNE-04.jpg', 6),
(18, 1, NULL, 'BOLET-JOLI-01.jpg', 10),
(19, 0, NULL, 'BOLET-JOLI-02.jpg', 10),
(20, 0, NULL, 'BOLET-JOLI-03.jpg', 10),
(21, 0, NULL, 'BOLET-JOLI-04.jpg', 10),
(22, 1, NULL, 'BOLET-MOUCHETE-01.jpg', 7),
(23, 0, NULL, 'BOLET-MOUCHETE-02.jpg', 7),
(24, 1, NULL, 'CEPE-BRONZE-01.jpg', 2),
(25, 0, NULL, 'CEPE-BRONZE-02.jpg', 2),
(26, 0, NULL, 'CEPE-BRONZE-03.jpg', 2),
(27, 1, NULL, 'CEPE-DE-BORDEAUX-01.jpg', 1),
(28, 0, NULL, 'CEPE-DE-BORDEAUX-02.jpg', 1),
(29, 0, NULL, 'CEPE-DE-BORDEAUX-03.jpg', 1),
(30, 0, NULL, 'CEPE-DE-BORDEAUX-04.jpg', 1),
(31, 0, NULL, 'CEPE-DE-BORDEAUX-05.jpg', 1),
(32, 0, NULL, 'CEPE-DE-BORDEAUX-06.jpg', 1),
(33, 0, NULL, 'CEPE-DE-BORDEAUX-07.jpg', 1),
(34, 1, NULL, 'CEPE-ETE-01.jpg', 14),
(35, 0, NULL, 'CEPE-ETE-02.jpg', 14),
(36, 0, NULL, 'CEPE-ETE-03.jpg', 14),
(37, 1, NULL, 'CHANTERELLE-COMESTIBLE-01.jpg', 15),
(38, 0, NULL, 'CHANTERELLE-COMESTIBLE-02.jpg', 15),
(39, 0, NULL, 'CHANTERELLE-COMESTIBLE-03.jpg', 15),
(40, 0, NULL, 'CHANTERELLE-COMESTIBLE-04.jpg', 15),
(41, 0, NULL, 'CHANTERELLE-COMESTIBLE-05.jpg', 15),
(42, 0, NULL, 'CHANTERELLE-COMESTIBLE-06.jpg', 15),
(43, 0, NULL, 'CHANTERELLE-COMESTIBLE-07.jpg', 15),
(44, 0, NULL, 'CHANTERELLE-COMESTIBLE-08.jpg', 15),
(45, 0, NULL, 'CHANTERELLE-COMESTIBLE-09.jpg', 15),
(46, 0, NULL, 'CHANTERELLE-COMESTIBLE-10.jpg', 15),
(47, 0, NULL, 'CHANTERELLE-COMESTIBLE-11.jpg', 15),
(48, 0, NULL, 'CHANTERELLE-COMESTIBLE-12.jpg', 15),
(49, 0, NULL, 'CHANTERELLE-COMESTIBLE-13.jpg', 15),
(50, 0, NULL, 'CHANTERELLE-COMESTIBLE-14.jpg', 15),
(51, 1, NULL, 'CHANTERELLE-JAUNISSANTE-01.jpg', 16),
(52, 0, NULL, 'CHANTERELLE-JAUNISSANTE-02.jpg', 16),
(53, 0, NULL, 'CHANTERELLE-JAUNISSANTE-03.jpg', 16),
(54, 0, NULL, 'CHANTERELLE-JAUNISSANTE-04.jpg', 16),
(55, 0, NULL, 'CHANTERELLE-JAUNISSANTE-05.jpg', 16),
(56, 0, NULL, 'CHANTERELLE-JAUNISSANTE-06.jpg', 16),
(57, 1, NULL, 'CHANTERELLE-VIOLETTE-01.jpg', 21),
(58, 0, NULL, 'CHANTERELLE-VIOLETTE-02.jpg', 21),
(59, 0, NULL, 'CHANTERELLE-VIOLETTE-03.jpg', 21),
(60, 1, NULL, 'CLAVAIRE-JAUNE-01.jpg', 17),
(61, 0, NULL, 'CLAVAIRE-JAUNE-02.jpg', 17),
(62, 0, NULL, 'CLAVAIRE-JAUNE-03.jpg', 17),
(63, 0, NULL, 'CLAVAIRE-JAUNE-04.jpg', 17),
(64, 0, NULL, 'CLAVAIRE-JAUNE-05.jpg', 17),
(65, 1, NULL, 'CLITOCYBE-ANISE-01.jpg', 24),
(66, 0, NULL, 'CLITOCYBE-ANISE-02.jpg', 24),
(67, 1, NULL, 'COPRIN-CHEVELU-01.jpg', 18),
(68, 0, NULL, 'COPRIN-CHEVELU-02.jpg', 18),
(69, 0, NULL, 'COPRIN-CHEVELU-03.jpg', 18),
(70, 0, NULL, 'COPRIN-CHEVELU-04.jpg', 18),
(71, 0, NULL, 'COPRIN-CHEVELU-05.jpg', 18),
(72, 0, NULL, 'COPRIN-CHEVELU-06.jpg', 18),
(73, 0, NULL, 'COPRIN-CHEVELU-07.jpg', 18),
(74, 1, NULL, 'GEASTRE-SESSILE-01.jpg', 22),
(75, 0, NULL, 'GEASTRE-SESSILE-02.jpg', 22),
(76, 0, NULL, 'GEASTRE-SESSILE-03.jpg', 22),
(77, 1, NULL, 'HYDNE-COMMUN-01.jpg', 20),
(78, 0, NULL, 'HYDNE-COMMUN-02.jpg', 20),
(79, 0, NULL, 'HYDNE-COMMUN-03.jpg', 20),
(80, 0, NULL, 'HYDNE-COMMUN-04.jpg', 20),
(81, 0, NULL, 'HYDNE-COMMUN-05.jpg', 20),
(82, 0, NULL, 'HYDNE-COMMUN-06.jpg', 20),
(83, 1, NULL, 'LACTAIRE-DELICIEUX-01.jpg', 9),
(84, 0, NULL, 'LACTAIRE-DELICIEUX-02.jpg', 9),
(85, 0, NULL, 'LACTAIRE-DELICIEUX-03.jpg', 9),
(86, 0, NULL, 'LACTAIRE-DELICIEUX-04.jpg', 9),
(87, 1, NULL, 'LACTAIRE-LIEUX-SAUVAGES-01.jpg', 11),
(88, 0, NULL, 'LACTAIRE-LIEUX-SAUVAGES-02.jpg', 11),
(89, 0, NULL, 'LACTAIRE-LIEUX-SAUVAGES-03.jpg', 11),
(90, 1, NULL, 'LACTAIRE-SANGUIN-01.jpg', 8),
(91, 0, NULL, 'LACTAIRE-SANGUIN-02.jpg', 8),
(92, 0, NULL, 'LACTAIRE-SANGUIN-03.jpg', 8),
(93, 0, NULL, 'LACTAIRE-SANGUIN-04.jpg', 8),
(94, 0, NULL, 'LACTAIRE-SANGUIN-05.jpg', 8),
(95, 0, NULL, 'LACTAIRE-SANGUIN-06.jpg', 8),
(96, 0, NULL, 'LACTAIRE-SANGUIN-07.jpg', 8),
(97, 0, NULL, 'LACTAIRE-SANGUIN-08.jpg', 8),
(98, 0, NULL, 'LACTAIRE-SANGUIN-09.jpg', 8),
(99, 0, NULL, 'LACTAIRE-SANGUIN-10.jpg', 8),
(100, 0, NULL, 'LACTAIRE-SANGUIN-11.jpg', 8),
(101, 1, NULL, 'LEPIOTE-ELEVEE-01.jpg', 13),
(102, 0, NULL, 'LEPIOTE-ELEVEE-02.jpg', 13),
(103, 0, NULL, 'LEPIOTE-ELEVEE-03.jpg', 13),
(104, 0, NULL, 'LEPIOTE-ELEVEE-04.jpg', 13),
(105, 0, NULL, 'LEPIOTE-ELEVEE-05.jpg', 13),
(106, 1, NULL, 'MORILLE-CONIQUE-01.jpg', 25),
(107, 0, NULL, 'MORILLE-CONIQUE-02.jpg', 25),
(108, 0, NULL, 'MORILLE-CONIQUE-03.jpg', 25),
(109, 0, NULL, 'MORILLE-CONIQUE-04.jpg', 25),
(110, 0, NULL, 'MORILLE-CONIQUE-05.jpg', 25),
(111, 0, NULL, 'MORILLE-CONIQUE-06.jpg', 25),
(112, 1, NULL, 'PEZIZE-ETOILEE-01.jpg', 19),
(113, 1, NULL, 'RHIZOPOGON-ROSE-01.jpg', 27),
(114, 1, NULL, 'RUSSULE-VERDOYANTE-01.jpg', 12),
(115, 0, NULL, 'RUSSULE-VERDOYANTE-02.jpg', 12),
(116, 0, NULL, 'RUSSULE-VERDOYANTE-03.jpg', 12),
(117, 0, NULL, 'RUSSULE-VERDOYANTE-04.jpg', 12),
(118, 0, NULL, 'RUSSULE-VERDOYANTE-05.jpg', 12),
(119, 0, NULL, 'RUSSULE-VERDOYANTE-06.jpg', 12),
(122, 1, NULL, 'VESSE-DE-LOUP-PERLEE-01.jpg', 28),
(123, 0, NULL, 'VESSE-DE-LOUP-PERLEE-02.jpg', 28),
(124, 0, NULL, 'VESSE-DE-LOUP-PERLEE-03.jpg', 28),
(125, 0, NULL, 'VESSE-DE-LOUP-PERLEE-04.jpg', 28);