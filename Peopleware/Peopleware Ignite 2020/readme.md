# Fear the Shell - or shouldn't you

Deze pagina heeft alle informatie m.b.t. de interne sessie voor Peopleware Ignite 2020.  
Allereerst excuses voor de verwarring aan de start van de presentatie, de meeting via een Teams Broadcast was helaas nog een nieuwe ervaring, dus niet alles verliep vlekkeloos ;) .

## Materiaal

Op deze pagina kan je alle gebruikte scripts terugvinden, zodat je er zelf naar kan kijken en/of mee spelen waar gewenst.  
Zoals aangegeven is ook het script over de variabelen gewoon aanwezig, hier kwamen we in verband met tijdsgebrek helaas niet aan toe.

* [De 3 belangrijkste cmdlets][3cmdlets]
* [PSProviders en PSDrives][providersndrives]
* [Meer cmdlets][MoreCmdlets]
* [De Pipeline, filtering en formatting][FilterAndFormat]
* [Variabelen][Variables]

Naast deze scripts en informatie is ook gewoon [de PowerPoint presentatie][pptx] beschikbaar, maar ik vermoed dat dit niet veel toegevoegde waarde zal hebben.  
De recording van Teams zal vermoedelijk intern gedeeld worden, wanneer de informatie van HR hierover beschikbaar is zal ik deze indien nodig hier ook nog bijvoegen.

## Extra resources

Over het algemeen als ik een training over PowerShell geef, geef ik de leden ook wat extra informatie mee indien ze verder willen met PowerShell.  
Hoewel het hier dus een digitale meeting betrof, zal ik alsnog de informatie proberen te delen.

Welke boeken ik adviseer te gebruiken als je PowerShell wilt gaan leren en wat andere resources:

* [Voor als je nog 0 ervaring hebt][PS4n00bs] en je weet net hoe je PowerShell moet schrijven 😉
* [HET boek][PSMoL] om de taal mee te leren
* Als je van Linux/MacOS komt is er een [nieuwere versie][PSMoLLinux] van HET boek, maar ook een nieuwe auteur
* [Het vervolg][PSTMoL] om te gaan van scripting naar Toolmaking (zelf functies/modules maken)
* Als je nu nog verder wilt gaan kan je [hier][tools] mee verder

Als je niet van de boeken bent, maar van videos kan je hier kijken voor een [Getting started][GettingStarted] met de maker van PowerShell [Jeffery Snover].

Verder zijn er [veel resources][New2PS] te vinden op [mijn blog][blog] en kan je altijd mij vragen als je meer informatie wilt hebben.

## Download links voor PowerShell versies + editors

Zoals aangegeven kan je PowerShell op verschillende manieren gebruiken:

* **Windows PowerShell**  
  Built-in op recente Windows OS'en.
* **Windows PowerShell ISE** (Integrated Script Editor)  
  Ook built-in feature op recente Windows OS'en.
* [**PowerShell**][PS]  
  Het 'oude' PowerShell Core (toen het nog versie 6 was), Open Source.  
  Draait op Windows, verschillende Linux varianten en MacOS.
* [**Visual Studio Code**][code]  
  Open Source code editor met PowerShell integratie.  
  Ingebouwde compatibiliteit met Version Control software zoals [Git][git].
  Mogelijkheid tot uitbreiding door middel van extensions.
* [**Windows Terminal (Preview)**][terminal]  
  Windows 10 App uit de Microsoft Store.  
  Een centrale locatie om al je Terminals te kunnen benaderen.
* [**CloudShell**][cshell]  
  Een online variant van PowerShell (de Open Source variant) beschikbaar als je Azure hebt om al je resources online te benaderen.

[3cmdlets]:3Cmdlets.ps1
[providersndrives]:ProvidersAndDrives.ps1
[MoreCmdlets]:MoreCmdlets.ps1
[FilterAndFormat]:FilterAndFormat.ps1
[Variables]:Variables.ps1
[pptx]:FearTheShell-OrShouldntYou.pptx
[PS4n00bs]:https://leanpub.com/powershell-4n00bs
[PSMoL]:https://www.manning.com/books/learn-windows-powershell-in-a-month-of-lunches-third-edition
[PSTMoL]:https://www.manning.com/books/learn-powershell-scripting-in-a-month-of-lunches
[PSMoLLinux]:https://www.manning.com/books/learn-powershell-in-a-month-of-lunches-linux-and-macos-edition
[tools]:https://leanpub.com/powershell-scripting-toolmaking
[GettingStarted]:https://www.microsoftvirtualacademy.com/en-us/training-courses/getting-started-with-powershell-3-0-jump-start-8276
[New2PS]:https://powershellpr0mpt.com/new-to-powershell/
[blog]:https://powershellpr0mpt.com
[PS]:https://github.com/powershell/powershell#get-powershell
[code]:https://code.visualstudio.com/
[git]:https://git-scm.com/downloads
[terminal]:https://aka.ms/windowsterminal
[cshell]:https://shell.azure.com/