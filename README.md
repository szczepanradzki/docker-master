# Notatki

Mamy 3 działające serwery na vps-ie: nginx i 2x node.

Nginx jest naszym frontendowym serwerem i obsługuje wszystkie 4 instancje.
Na serwerze uruchomiony jest pm2 który upewnia się, że node śmiga na 2 instancjach znajdujących
się w odpowiednich katalogach

Na serwerze znajdują się katalogi /var/www/calc-app, /var/www/roi-app (frontowe), /var/www/calc-app-cms, /var/www/roi-cms.

Nginx obsługuje te katalogi dla wersji frontowych. Wersje backendowe mają dodanego proxypassa na localhosta o odpowiednim porcie.

#Jak zdobyć najnowszego dumpa bazy?

Na vps.nazwa.pl można wejść do konsoli. Ona cały czas sypie błędami, ale to nam nie przeszkodzi.

Cały czas śmiga serwer nginxa, więc możemy wejść do dowolnego katalogu 

# Instalacja

Aby zaintalować projekt należy włożyć dumpa mongo do bazy. Do tego są nasze skrypty.
Uruchamiając polecenie "first_run.sh" powinieneś uruchomić projekt tak, jakbyś wklepał docker-compose up.

Zalecam przed działaniem pościągać repozytoria z kodem:

- git clone https://repository.kogifi.com/fanuc/fanuc-calculator-strapi.git
- git clone https://repository.kogifi.com/fanuc/fanuc-calculator-roi.git
- git clone https://repository.kogifi.com/fanuc-offer-app/backend.git
- git clone https://repository.kogifi.com/fanuc-offer-app/frontend.git

# Jak zrobić build?

Pracuję nad tym. Ale najogólniej w świecie należy na serwer przez SSH wysłać (zbuildowane) katalogi z backend i 
fanuc-calculator-strapi na (odpowiednio) calc-app-cms i roi_cms (mind the hyphens).

Następnie należy zbuildować htmlki/js z frontu i wysłać na serwer z katalogu buildowego (www, build) do katalogu  
/var/www/calc-app lub /var/www/roi-app.

Docelowo warto by zrestartować nginxa, ale nie wiem jak to zrobić. Być może trzeba zrobić 
`pm2 restart 0` i `pm2 restart 1`

WAŻNE: przy przerzucaniu (i buildowaniu) plików na serwer używaj envów z proda. Inaczej będą złe przekierowania.