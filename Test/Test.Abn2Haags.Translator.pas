unit Test.Abn2Haags.Translator;

interface
uses
  Abn2Haags.Translator,
  DUnitX.TestFramework;

type

  [TestFixture]
  TranslatorTests = class(TObject)
  public
    [Test]
    [TestCase('', '')]
    [TestCase('Schilderswijk', 'Schild�hsw�k')]
    [TestCase('Zuiderpark', 'Z�id�hparrek')]
    [TestCase('achter. achter, achter ', 'acht�h. acht�h, acht�h ')]
    [TestCase('Voorwoord', 'Vo�hwo�hd')]
    [TestCase('Ik zweer je, meneer, doe je het nog een keer, krijg je een peer, ga je neer.', 'Ik zwe�h je, mene�h, doejenut nog un ke�h, kr�ggie un pe�h, ga je ne�h.')]
    [TestCase('directie, aktie.', 'direksie, aksie.')]
    [TestCase('Lekker laten hangen. Hier ', 'Lekk�h late hang�h. Hie�h ')]
    [TestCase('Vrijheid. Mooie duur Huur er kermis', 'Vr�h�d. Mauie du�h Hu�h d''r kerremis')]
    [TestCase('Slimmer naar de pier in Scheveningen Voorburg', 'Slimm�h naah de pie�h in Scheiveninge Vo�hburrag')]
    [TestCase('Lekker naar het Binnenhof en daarna gaan stappen.', 'Lekk�h naah ut Binnehof en daahna gan stapp�h.')]
    [TestCase('Den Haag, het Plein, het Vredespaleis, Zuiderpark, park, Zwarte Pad, Grote Markt, de kerk, Rijswijkseplein', 'De Haag, ut Pl�n, ut Vreidespel�s, Z�id�hparrek, parrek, Zwagte Pad, Graute Marrek, de kerrek, R�sw�ksepl�n')]
    [TestCase('Verkoopprijs, prijs Kurhaus, Restaurants, romantisch, romantische, rommel, Maurice, Maurice Majesteit', 'Vekauppr�s, pr�s Koe�hh�hs, Resterans, raumanties, raumantiese, rommel, M�hpie, M�hpie Majest�t')]
    [TestCase('ADO ADO Den Haag, gefeliciteerd met de verjaardag doosje smarties ', 'Adau FC De Haag, gefeilicite�hd met de vejaahdag daussie smagties ')]
    [TestCase('Gert, barst, Martin, harte smarties, ooievaar dat is raar maar wel waar.', 'Gegt, bagst, Magtin, hagte smagties, auievaah da''s raah maah wel waah.')]
{    [TestCase('Door een kier in de deur van de bar rook ik de meur van goor bier ', 'Do�h un kie�h in de deu�h van de b�h rauk ik de meu�h van go�h bie�h ')]
    [TestCase('De juiste uitspraak vanuit Haags wordt dus altijd aangegeven door diverse accenten.', 'De j�iste �itspraak van�it Haags wogt dus alt�d angegeive do�h divegse aksent�h.')]
    [TestCase('Ik houd van jou, goude vrouw voor jou val ik flauw.', 'Ik h�h vajj�h, g�hwe vr�h vo�h j�h vallik fl�h.')]
    [TestCase('Die ongein kan wel waar zijn, maar je blijft wel even mooi van mijn lijf, geil wijf', 'Die ong�n ken wel waah z�n, maah je bl�f wel eive maui van m�n l�f, g�l w�f')]
    [TestCase('Dat is helemaal niet fijn, dat is ronduit. Weet je wat klote is?', 'Da''s heilemaal nie f�n, da''s rond�it. Weit je wat klaute is?')]
    [TestCase('De tram die met opzet heel langzaam rijdt. auto volkslied', 'De trem die met opzet heil langzaam r�d. �htau vollekslied')]
    [TestCase('Ik raak altijd weer tot tranen toe beroerd', 'Ik raak alt�d we�h tot trane toe beroe�hd')]
    [TestCase('Waarom we ze klinkers noemen.', 'Warom we ze klink�hs noem�h.')]
    [TestCase('Het eerste boekje verscheen tien jaar geleden. Sinds die tijd is er veel veranderd in Den Haag. En vaak ten goede.', 'Ut e�hste boekie veschein tien jaah geleije. Sins die t�d ist�h veil verand�hd in De Haag. En vaak te goede.')]
    [TestCase('Hoogste tijd dus dat er een herziene en geactualiseerde versie kwam van dit boekje in Haagse kleuren, waarin recht wordt gedaan aan de dynamiek in onze stad.', 'Haugste t�d dus datt�h un he�hziene en geaktewalise�hde vegsie kwam van dit boekie in Haagse kleure, waarin rech wogt gedaan an de dinamiek in onze stad.')]
    [TestCase('Sommige zeggen weleens dat het Haags geen dialect is maar. Immers, dit Haags is van de Hagenezen. Ik meen echter dat er veel overeenkomsten te beluisteren zijn met een andere zogenaamd.', 'Sommige zegge welles dat ut Haags gein dialek is maah. Imm�hs, dit Haags is van de Hageneize. Ik meint echt�h datt�h veil auvereinkompste te bel�istere z�n met un andere zaugenaamp.')]
    [TestCase('Luister maar eens naar de R zoals veel Hagenaars die uitspreken. Of naar de klanken van de korte klinkers.', 'L�ist�h maah ''ns naah de R zauas veil Hagenaahs die �itspreik�h. Of naah de klanke van de kogte klink�hs.')]
    [TestCase('Het lijkt allemaal erg veel op elkaar. Haast geen verschil. Het bekakte Haags is wel wat meer geknepen. Of, zoals de samenstellers ergens zeggen omdat ze om die aardappel heen moeten.', 'Ut l�k allemaal errag veil op elkaah. Haas gein veschil. Ut bekakte Haags is wel wat me�h gekneip�h. Of, zauas de samestell�hs erreges zegge omdat ze om die aahdappel hein motte.')]
    [TestCase('Eigenlijk zou je dus kunnen zeggen dat alle Hagenaars dezelfde taal spreken, het Haags. Zij het dan met nuanceverschillen.', '�gelijk z�h je dus kenne zegge dat alle Hagenaahs dezellufde taal spreike, ut Haags. Z� ut dan met nuwanseveschill�h.')]
    [TestCase('Dit standaardwerk is daarom voor de buitenstaander, de niet-Hagenaar of Hagenees, een noodzakelijk instrument om goed Haags te kunnen leren praten. En zich daarmee toegang te verschaffen tot alle Haagse kringen.', 'Dit standaahdwerrek is darom vo�h de b�itestaand�h, de nie-Hagenaah of Hageneis, un naudzakelijk instrument om goed Haags te kenne lere prat�h. En ze �ge daahmei toegang te veschaffe tot alle Haagse kring�h.')]
    [TestCase('Lees het, leer de spelling, blijf de uitspraak oefenen. Knijp indien nodig. En u kan in heel Den Haag terecht. Van de Schilderswijk tot in het Statenkwartier en van de Gouveneurlaan tot op de Dennenweg.', 'Leis ut, le�h de spelling, bl�f de �itspraak oefen�h. Kn�p indien naudag. En u ken in heil De Haag terech. Van de Schild�hsw�k tot innut Statekwagtie�h en van de Goeveneu�hlaan tot op de Denneweg.')]
    [TestCase('Als burgemeester van Den Haag juich ik dit leuke en humoristische initiatief van harte toe. Ik beveel het ten zeerste aan bij iedereen die zich wil verdiepen in de Haagse taal en de Haagse ziel.', 'As burragemeist�h van De Haag j�ich ik dit leuke en humoristiese initiatief van hagte toe. Ik beveil ut te ze�hste an b� iederein die ze �ge wil vediepe in de Haagse taal en de Haagse ziel.')]
    [TestCase('De blote geslachtsdelen schoten hem in het verkeerde keelgat', 'De blaute geslachsdeile schaute hem innut veke�hde keilgat')]
    [TestCase('Iemand dood maken met een blije mus. Ik word met scheve schaatsen aangekeken.', 'Iemand daud make met un bl�je mus. Ik wogt met scheive schaatse angekeik�h.')]
    [TestCase('Je bent een mongool, een halve zool, een mooie grote klootviool', 'Je ben un megaul, un halleve zaul, un mauie graute klautviaul')]
    [TestCase('Je moet geen oude schoenen weggooien voordat je een nieuwe doos hebt.', 'Je mot gein �hwe schoene weggauie vo�hdat je un nieuwe daus hep.')]
    [TestCase('De wereld is een pijp kaneel, je zuigt er aan met pijn in je keel.', 'De wereld issun p�p kaneil, je z�ig d''ran met p�n in je keil.')]
    [TestCase('Ik werd urenlang ondergevraagd.', 'Ik wegd urelang ond�hgevraag.')]
    [TestCase('Die heeft spullen, die zijn al heel lang oud, zeg maar antiek.', 'Die hep spulle, die z�n al heil lang �hd, zeg maah antiek.')]
    [TestCase('koets, prostituee, klokkenluider, tribunaal, onsympatieke, verlaten, politici, bierfeest ', 'pats�hbak, prostitewei, klokkel�i�h, tribenaal, onsympetieke, velate, pauliticie, bie�hfeis ')]
    [TestCase('natuurlijke barri�re, reisbestemming, oude taaie, zo gek als een kaartspel', 'natu�hlijke barr�jerre, r�sbestemming, �hwe taaie, zau gek assun kaagtspel')]
    [TestCase('uitnodiging om een boom om te hakken. met z''n alle zo hard als je kan achter een neger aanrennen, City Pier City loop ', '�itnaudiging om un baum om te hakk�h. met ze alle zau hard asje ken acht�h un neg�h anrenne, City Pie�h City laup ')]
    [TestCase('Achter de pui aan het Spui is iedereen in een luie bui ', 'Acht�h de p�i annut Sp�i is iederein innun l�ie b�i ')]
    [TestCase('Geel is heel wat anders als geil, maar je kan er wel allebei een ziekte van krijgen ', 'Geil is heil wat and�hs as g�l, maah je kand�h wel alleb� un ziekte van kr�ge ')]
    [TestCase('Van die hete sat� zat ik een uur of twee met m''n reet op de plee aan de diaree ', 'Van die heite satei zattik un u�h of twei met me reit op de plei an de diarei ')]// met m'n niet vertaald
    [TestCase('Menstruatie is een bloederige situatie, net als fluctuatie van de ', 'Menstruwasie issun bloed�hrige sitewasie, net as fluktewasie van de ')]
    [TestCase('De vla lag in de la van ma en zij lag op d''r pa, die dat niet echt naar of raar vond, medeklinkers ', 'De vla lag in de la van ma en z� lag op d''r pa, die dat nie ech naah of raah vond, meideklink�hs ')]
    [TestCase('Ruud zei resoluut ik huur acuut een wijf a la minuut ', 'Ruud z� reisoluut ik hu�h akuut un w�f a la minuut ')]
    [TestCase('Is dat je haar of heb je jongen gekregen Maar troost jezelf op een ooievaar groeit helemaal geen haar, dat is raar maar wel waar en zo kennen we er nog wel een paar ', 'Is dat je haah of hebbie jonge gekreige Maah traus je �ge op un auievaah groeit heilemaal gein haah, da''s raah maah wel waah en zau kenne we d''r nog wel un paah ')]
    [TestCase('Die hoer is te duur, dan worden m''n druiven maar zuur ', 'Die hoe�h is te du�h, dan wogde me dr�ive maah zu�h ')]
    [TestCase('Mijn hart smacht met alle macht naar een neut in de nacht. Een racist krijgt een vuist voor z''n puist en hij denkt het wordt nou wel erg zwart ', 'M�n hagt smach met alle mach naah un neut in de nach. Un rassis kr�g un v�is vo�h ze p�is en h� denk ut wogt n�h wel errag zwagt ')]
    [TestCase('M''n ijs smelt fout gespelt ', 'Me �s smelt f�ht gespelt ')]
    [TestCase('Het arme volk in Voorburg bad in de kerk heb je geen werk ', 'Ut arreme vollek in Vo�hburrag bad in de kerrek hebbie gein werrek ')]
    [TestCase('De vlerk stak zijn dolk in de snurkende Turk. elk valk erg', 'De vlerrek stak z�n dollek in de snurrekende Turrek. ellek valluk errag')]
    [TestCase('De keeper wil hem nog houden, maar de voetbal hangt al in de touwen. hangen komen komt nemen ', 'De keep�h wil ''m nog h�hwe, maah de foebal hank al in de t�hw�h. hange kaume komp neime ')]
    [TestCase('Ik heb een houten bek, heb je een fles olie? Heb je een step om te surfen op het wereldwijde web ', 'Ik hep''n h�hte bek, hebbie un fles aulie? Hebbie un steppie om te surrefe op ut wereldw�de wep ')]
    [TestCase('Kinderen zijn lastpakken, ik koop nooit geen postzegels van die pusbakken.', 'Kind�hre z�n laspakke, ik kaup nauit gein poszeigels van die pusbakk�h.')]
    [TestCase('bezoeken festivalstad achtergelaten doen hebben zondag avondje bieden uitzicht indeling.', 'bezoeke festivalstad acht�hgelate doen hebbe zondag avondje biede �itzich indeiling.')]
    [TestCase('De godsdienstige stadswacht stond bij de gebedsdienst als een scheidsrechter te huilen ', 'De gosdienstige staswach stond b� de gebesdiens assun sch�dsrecht�h te h�ile ')]
    [TestCase('Het wordt almaar kouder, zei de strandpaviljoenhouder. De vermoeide ouder kreeg een schuit in z''n schouder ', 'Ut wogt almaah k�hw�h, z� de stgandpavejoenh�hw�h. De vemoeide �hw�h kreig un sch�it in ze sch�hw�h ')]
    [TestCase('Kan het wat zachter, zei de strandwachter tegen de kreunende verkrachter ', 'Ken ut wat zacht�h, z� de stgandwacht�h teige de kreunende vekracht�h ')]
    [TestCase('Als ik een asbak was, vrat ik as als gras', 'As ik un asbak was, vrattik as as gras')]
    [TestCase('Krijg jij lekker de kanker', 'Kr�g j� lekk�h de kank�h')]
    [TestCase('Wilders is groot, Wilders is machtig, hij is een lul van ��n meter tachtig ', 'Wild�hs is graut, Wild�hs is machtag, h� issun lul van ein meit�h tachtag ')]
    [TestCase('De directie van Milieudefensie werd op vakantie door de politie betrapt op incontinentie.', 'De direksie van Mejuidefensie wegd op vekansie do�h de paulisie betrap op inkontinensie.')]
    [TestCase('De redactie van het boekje neemt geen notie van de klachten van lezers over inconsequenties ', 'De redaksie vannut boekie neimp gein nausie van de klachte van leiz�hs auv�h inkonsekwensies ')]
    [TestCase('Als je gaat lopen zeiken zal ik de oren van je harses trekken.', 'Asje gaat laupe z�ke zallik de ore vajje hagses trekk�h.')]
    [TestCase('Zal ik even het behang van je knars aftrekken.', 'Zallik eive ut behang vajje knags aftrekk�h.')]
    [TestCase('Van zo''n bakje koffie krijg ik huisje boompje beestje in m''n koppie', 'Van zaun bakkie pleu�h kr�g ik h�issie baumpie beissie imme koppie')]
    [TestCase('Ken ik, ken u, ken jij, als u, mag het, aan het, van het, ik dacht het, van jou, kijk dan', 'Kennik, kennu, kejj�h, assu, maggut, annut, vannut, dachut, vajj�h, k�ktan')]
    [TestCase('Gaat het niet lekker dan loop je met je ziel onder je hart gestoken ', 'Gaat-ie nie lekk�h dan laupie mejje ziel ond�h je hagt gestauke ')]
    [TestCase('M''n been slaapt, vind je het erg als ik er even bij ga liggen?', 'Me bein slaap, vijje ut errag as ik d''r eive b� ga legg�h?')]
    [TestCase('Waar ligt madurodam nou? Die heb ik dacht ik in de kast neergelegd.', 'Waah leg meduraudam n�h? Die heppik dach ik in de kas ne�hgeleige.')]
    [TestCase('Kan het zijn dat ik u ken? kunnen', 'Ken ut z�n dattik u ken? kenne')]
    [TestCase('Het zou niet mogen moeten, maar wat kan mij het rotten ', 'Ut z�h nie mauge motte, maah wat ken m�nnut rotte ')]
    [TestCase('Er is een regel die zegt: als er wordt gegeten dan kan er ook worden gescheten ', 'D''r issun reigel die zeg: ast�h wogt gegeite dan kand�h auk wogde gescheite ')]
    [TestCase('Zorg dat je er op tijd bent, dan kun je er nog bij', 'Zorrag dat je d''r op t�d ben, dan kejjed�h nog b�')]
    [TestCase('Een biertje is net zo gezond als een bruine boterham, alleen veel slapper', 'Un bie�htsje is net zau gezond assun br�ine baut�hham, enkelt veil slapp�h')]
    [TestCase('Ik heb alleen vijf jaar zandbak, nou en?', 'Ik hep enkelt v�f jaah zandbak, n�h en?')]
    [TestCase('vliegtuig Waar literatuur orgineel kinderboekenmuseum oudste ontmoet enkele ', 'vliegt�ig Waah literatu�h o�hgineil kind�hboekemuseum �hdste ontmoet enkele ')]
    [TestCase('ver vers tour kopje tradities kidstips behulp sport deze ', 've�h vegs toe�h koppie tradisies kind�htips behullep spogt deize ')]
    [TestCase('festivals hofvijver greep Vermeers bekende beker voorhoofd toerist audiovisueel verkeersaderlating reserveren ', 'festivals hofv�v�h greip Veme�hs bekende beik�h vo�hhauf toeris �hdiauviseweil veke�hsad�hlating reis�hvere ')]
    [TestCase('highlights menu see zorgen omgeving boulevard ideaal platform vormgeving externe depot warm ', 'haailaaits menu sie zorrage omgeiving boelev�h ideiaal platfo�hm vorremgeiving eksterrene deipau warrem ')]
    [TestCase('huisjes food fastfood ''t tegenover station stijl ', 'h�issies foet fastfoet ut teigenauv�h stasion st�l ')]
    [TestCase('This is The Hague jeugd strand strandpaviljoen lunchroom Uitgaanscentrum Outdoor outdoor', 'Dis is De Heek jeug stgand stgandpavejoen lunsroem �itgaanscentrum �htdo�h �htdo�h')]
    [TestCase('Restaurant shopping theater Jeugdprijs Last-minute ticketshop Normale prijs Overige Cabaret', 'Resterant sjopping theijat�h Jeugpr�s Lasminnut tikketsjop No�hmale pr�s Auverige Kabberet')]
    [TestCase('Circus Culinair Tentoonstelling Folklore Jazz jazz Moderne dans Hedendaagse Film Musical', 'Cirrekus Kulin��h Tetaunstelling Folklore Djez djez Maud�rrene dans Heidedaagse Fillem Musikol')]
    [TestCase('Niet-westerse dans Toneel Poppentheater lezing Show beurs workshop events Locaties', 'Niet westagse dans Tauneil Poppetheijat�h leizing Sjow beu�hs wurreksjop ievents Laukasies')]
    [TestCase('Strand & Buiten Concerten Shoppen Excursies Dit weekend Vandaag Advertentie Reserveer nu', 'Stgand & B�it�h Konsegte Sjopp�h Ekskugsies Dit wiekend Vedaag Adv�htensie Reis�hve�h n�h')]
    [TestCase('Data & tickets Tentoonstellingen Extra informatie must see Privacy policy', 'Data & tikkets Tetaunstellinge Ekstra info�hmasie mus-sie Praaivesie pollesie')]
    [TestCase('Kun je VVV-informatiepunten stadswandelingen eindelijk per ter bied informatiebrochures prof professor ', 'Kajje VVV-info�hmasiepunte staswandelinge �ndelijk pe�h te�h biedt info�hmasiebrausjures prof praufessor ')]
    [TestCase('souvenirs cadeau bureau vervoersbewijzen bibliotheek touchscreen actuele Palace medewerkers werkdagen ', 'soevenie�hs kado buro vevoe�hsbew�ze biebeleteik tatskrien akteweile Pellus meidewerrek�hs werrekdage ')]
    [TestCase('Gevers gevestigd kunt Herenstraat aankomsthal airport Airport vele gele waarin speciale begeleiding Telefonische ', 'Geiv�hs gevestag ken Herestraat ankompshal ��hpogt ��hpogt veile geile waarin speiciale begel�ding Telefauniese ')]
    [TestCase('voorjaarsvakantie Nederland Favorite koninklijke event evenementen internationale januari februari ', 'vo�hjaahsvekansie Neid�hland Favveriet�h kauninklijke ievent eivenemente int�hnasjaunale jannewarie feibruwarie ')]
    [TestCase('movies that literatuurfestival favoriete cultureel Ook gemeentemuseum collectie Hieronymus Dance beroemdste winkelen ', 'moevies det literatu�hfestival favveriet�h kultereil Auk gemeintemuseum kolleksie Hieraunimus Dens beroempste winkele ')]
    [TestCase('flagshipstores Bijenkorf talloze vintage Shop till you drop marktstraat yoga Bergen chique Corona eigentijds ', 'fleksjipsto�hs B�jekorref tallauze vintuts Sjop til joe drop marrekstraat yauga Berrege sjieke Korauna �get�ds ')]
    [TestCase('plekjes watertanden bijzondere Facebook social media jenever- en likeurdistilleerderij ', 'plekkies wat�htande biezondere Feisboek sausjel miedieja jeneiv�h- en likeu�hdistille�hder� ')]
    [TestCase('touch vakantiegevoel hofjes dagje ', 'tats vekansiegevoel hoffies daggie ')]
    [TestCase('stoere surfers populairste Geniet van de weidsheid dynamisch decor beroemde erwtensoep ', 'stoere surref�hs paupel�hste Geniet van de w�dsh�d dinamies deko�h beroemde erretesoep ')]
    [TestCase('Zinnenprikkelende producten verser dan vers kwalitatieve reeds overgebleven instaprondleiding, je zult je Beauty & the Beast', 'Zinneprikkelende praudukte vegs�h dan vegs kwalitatieve reids auv�hgebleive instaprondl�ding, je zal je �ge Bjoetie & de Bies')]
    [TestCase('modeontwerper bezienswaardigheden relaxen markante bloederigste originele dichtbij spectaculaire stork vegetarisch Cuisine cuisine volgens', 'maudeontwerrep�h bezienswaahdigheide rielekse magkante bloed�hragste orresjineile dichb� spektakel�re storrek veigetaries Kwiesien kwiesien volleges')]
    [TestCase('Tripadvisor ski�n Overnachten SEA LIFE Europese Nachtje Bites Crowne .com instituut sterker', 'Tripetfaaiso�h skieje Auv�hnachte SIEL�F Euraipeise Nachie B�ts Kraun .com instituut sterrek�h')]
    [TestCase('bospaddenstoelen saus uitwaaien roots bezoekerscentrum strandseizoen plezierig dertig beach verder parkeervergunning vertegenwoordiger tussenletter broer automatiek', 'bospaddestoele s�hs �itwaaie roets bezoek�hscentrum stgands�zoen plezie�hrag de�htag bietsj ve�hdahs pagke�hvegunning veteigewo�hdeg�h tusselett�h broe�h �htaumatiek')]
    [TestCase('cultuurschatten �bergezellige dieren vooral teams theatervoorstellingen wandelen kenmerken karakteristieke kleding supermarktjes Eten koffietentjes Zeeheldenkwartier borrelen', 'kultu�hschatte �b�hgezellage diere vo�hal tiems theijat�hvo�hstellinge wandele kenmerreke karakt�hristieke kleiding sup�hmarrekkies Eite koffietentjes Zeiheldekwagtie�h borrele')]
    [TestCase('dagvers gehele algoritme beginselen hen goedkeuring euro bijbehorende ontworpen stuks levendige Omdat nou', 'dagvegs geheile algauritme beginsele hen goedkeu�hring eu�hro b�beho�hrende ontworrepe stuks leivendege Omdat n�h')]
    [TestCase('Kijkduin Zuiderstrand genieten periode bedenken hieronder routes stap je Iedere Oud', 'K�kd�in Z�id�hstgand geniete periaude bedenke hie�hond�h roetes stappie Iedere �hd')]
    [TestCase('gokje Zo zeventig expo projectleider kopje koffie routes', 'gokkie Zau zeiventag expau praujekl�ij�h bakkie pleu�h roetes')]
}
    procedure GivenAbnTranslatesToHaags(const ABN,Dutch:string);
  end;

implementation

procedure TranslatorTests.GivenAbnTranslatesToHaags(const ABN,
  Dutch: string);
begin
  Assert.AreEqual(Dutch, Translate(ABN));
end;

initialization
  TDUnitX.RegisterTestFixture(TranslatorTests);
end.
