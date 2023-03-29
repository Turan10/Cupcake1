# Dokumentation til cupcake projektet



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