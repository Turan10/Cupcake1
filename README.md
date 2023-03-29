# Dokumentation til cupcake projektet

##Indledning
Vi har fået til opgave at udarbejde et projekt, som kan håndtere et bestillingssystem for vores kunde, Olsker Cupcakes.
Det er et lille bageri i bornholm, som har ønsket et system som kan bestille cupcakes, med noget topping
og bund til. Kunden skal bl.a kunde bestille en ordre for en cupcake, hvor en valgfri bund/top kan tilvælges,
indsætte ordren i en indkøbskurv, og få en ordrebekræftelse på det man har bestilt.

Hertil har vi udarbejdet en domain model, som viser hvordan de forskellige entities er relateret til hinanden og et 
eer-diagram som viser forholdet af entities på databasen.

##Domæne Model
![img.png](img.png)
Vores domæne model beskriver hvordan vi havde udtænkt vores opgave til at starte med, og hvad systemet arbejder med.
Vi havde tanke om, at vi ville lave både en customer, en employee og en administrator. Hver customer har en 1 til 1* relation
til en order, da en customer kan have mange order, men der kun må være en customer. Vi havde tænkt os, at vi ville samle et 
cupcake ID ud fra et ID fra top og bund, som samlet skulle give et ID videre til order, og på den måde kunne man altid hente
en order fra systemet - Dette nåede vi også i mål mål med.

Vores shoppingcart skulle på en måde snakke både med customeren med også med cupcaken. Vi blev klogere senere hen, og vurderede
at shoppingcarten blot skulle være en del af customerens session scope og ikke have et direkte forhold til cupcaken.
Customer, admin og employee synes vi blev for rodet at dele op. Vi havnede vi med en user, som havde en role der kunne være
enten Customer, admin eller employee. Cupcaken snakkede vi lidt om, hvordan vi ville lave relationerne her. En fra gruppen 
snakkede om, om vi skulle gøre det muligt at få lavet en cupcake med mere end 1 bund (eller en cupcake med 2 toppe), men det
det besluttede vi os om ikke skulle være tilfældet. Vores domæne diagram har ændret sig siden, men sammenspillet mellem dem 
"in its core" er stadig den samme - Valgfri bund/top med ID's som sendes til en cupcake (1-1 relation) - lav en cupcake ud 
fra dem og giv den et ID (sørge for at kunne oprette flere cupcakes til en ordre) - sende den til en ordre som så kan sende det
til en shoppingcart.

##EER-Diagram
![img_1.png](img_1.png)
Vores EER diagram er blevet ændret en del gange henover opgaven - Vi havde flere tabeller til at starte med som vi har kortet ned til 6.
Vores top og bottom er tilknyttet til cupcake tabellen med FK's, således at vi kan få info fra de tabeller ved cupcake tabellen.
Ved vores order tabel, har vi valgt at bruge username som en sekundær PK som er tilkoblet attributen userName i user tabellen.
Det har vi gjort da vi i vores kode har username som det unikke - Der er ingen bruger som kommer til at have det samme brugernavn.
Som udgangspunkt har vi sørget for at overholde normaliseringskravet om, Alle non-prime attributter skal være fuldt funktionelt 
afhængige af primær nøglen. (dvs. ingen partiel funktionel afhængighed). Ellers er relationerne
- 1 user kan have mange ordre, men en ordre kan ikke blive skabt uden at være tilknyttet 1 user
- En ordre kan have mange cupcakes, men cupcakes kan kun tilknyttes til 1 ordre
- En cupcake kan kun have 1 top og 1 bund, men der kan laves adskillige cupcakes med 1 bund og 1 top



# Særlige forhold

### Sessionscope

Det skal påpeges at shoppingcart kører i sessionscope. Dette gøres da der ikke tale om indhold der skal gemmes i en database, men blot et sted for brugeren at kunne bekræfte sine valg.
Når brugeren vælger at fortsætte fra shoppingcart til checkout, gemmes indholdet i databasen i form af 2 tabeller. Den ene for ordren, mens den anden er for de cupcakes der er bestilt. Dette gøres for at kunne holde styr på hvilke cupcakes der er bestilt, samt hvilken ordre de hører til. Dette gøres ved at bruge ordreID som foreign key i cupcake tabellen.

### Exceptions

Exceptions håndteres i servlets, og i mapperne. Mapperne sender database exceptions videre til servlets, som så håndterer dem. Dette gøres for at sikre at exceptions ikke bliver sendt videre til jsp siderne, da dette kan give en sikkerhedshul.
Vi har i vores kode en klasse for DatabaseExceptions som vi gør brug af. Dette gøres for at sikre at exceptions bliver håndteret på samme måde i hele vores kode. Dette gøres ved at lave en metode der håndterer exceptions, og som så bliver kaldt i alle mapperne. 

### Validering

Validering af brugerinput gøres under oprettelsen af en bruger, og login.
For oprettelsen tjekkes der om brugeren skriver den samme password i begge felter (password og repeat password). Dette gøres ved at sammenligne de to felter, og hvis de ikke er ens, bliver brugeren sendt tilbage til signup siden med en fejlbesked.
For login tjekkes der om inputtet i usernamme og password eksistere i databasen. Dette gøres ved at kalde en metode i UserMapper som tjekker om brugeren eksistere i databasen. Hvis brugeren ikke eksistere, bliver brugeren sendt tilbage til login siden med en fejlbesked.

### Brugertype

Vi har valgt at lave et felt i vores user tabel kaldet role. 
Denne role skal differentiere brugerens rolle i vores system.
Vi har valgt at lave 2 brugertyper, nemlig user/kunde og admin.
Dette har vi gjort for at kunne sikre at brugere ikke kan tilgå sider de ikke har adgang til.
Brugertyperne bruges i jdbc, således at der tjekkes om brugeren har den korrekte rolle, før de kan tilgå admin relaterede sider.


### Sikkerhed
Udover vores tjek på login og opret brugere, samt ikke at kunne ligge en ordre uden at have nok midler, har vi ikke implementeret sikkerhed. 


# Status på implementation
Vi har i vores gruppe haft udfordringer med at få kodet funktionel kode. 
Dette har gjort at vi ikke har nået at implementere alle de krav der er stillet i opgaven, og har derfor valgt at håndplukke de essentielle elementer, og krav for at kunne have en kode der virker.
Dermed kan man med vores program, logge ind, eller oprette sig, sammensætte en cupcake, og bestille den.

###
Vi mangler at implementere en side hvor brugeren har adgang til alle sine ordre, og det der er bestilt på hver ordre. 
Vi mangler samtidig også at style vores sider, så de er mere brugervenlige.
Admin mangler en jsp side, hvor admin kan se alle ordre, og hvad der er bestilt på hver ordre.
I vores shoppingcart har vi ikke implementeret en funktion for afhentningstidspunkt.

Vi mangler at implementere test i vores program.



##Proces
Vores planer i starten for projektet gik rigtig godt. Vi lagde alle sammen en fælles plan, havde en fælles afstemning om hvordan det
vi ville gribe projektet an, hvor morgenmøder, tidsrum vi arbejdede, spørge hvis der var behov for hjælp og vigtigst af alt, give
det projektet alt det vi har. Som projektet forløb sig, kom 3 fra gruppen mere og mere bagud. Dette blev ikke kommunikeret ud, hvilket
resulterede sig i, at ingen vidste hvorn det rigtig gik. Morgenmøderne blev skippet. Man skrev hurtigt hvorn det gik, men der var ingen
reele resultater der hverken blev lavet eller fremvist så man havde en idé om hvor henne man var med opgaven.
Efter flere dage med dette, kom der en ret sent udmelding om, at man faktisk havde det rigtig svært. Folk havde svært ved at sige
det højt, trods aftalen der blev lavet for start. Det har derfor resulteret i, at Turan har skulle step op og som følge af dette
har lavet langt største delen af opgaven. Vi har slet ikke været gode til være et hold og der har været et enormt stort pres på vores 
gruppemedlem. 
 
###Hvad har vi lært?
Udbyttet af projektet har været mest synlig da vi sad med Jon d. 28 april, hvor de som har været bagud har kunne få noget hjælp og
få forklaret diverse syntaxer og sammenspillet mellem de enkelte klasse med JSP'en.
Turan har været i stand til at få udbyttet ved at kode for sig selv, fejle og spurgt om eksternt hjælp når behovet har været der. 
Vi er sikre på, at hvis planen var fulgt op på og man havde kommet til læren meget tidligere i forløbet, at mange af vores udfordringer
ikke havde været nært det her niveau.

###Til næste gang
Vi skal have lagt en god plan. Hvis planen ikke afholdes, så reagerer man som gruppemedlem ASAP. Man får snakket med ens gruppe og får
vendt tingene med dem, således at alle ved hvad der foregår og hvor der er udfordringer. Muligheden for at hjælpe når intet siges eller gøres,
bliver i den grad udfordret hvis ingen i gruppen handler på en udfordringer man har.
Vi har også forstået vigtigheden i at læse godt op på det stof man er udfordret med inden man går ind i et stort projekt. Den første tid 
bør ikke bruges på at undersøge hvad teorien går ud på, men istedet en plan på hvordan man vil takle opgaven.
