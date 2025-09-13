# Humorous Carry Script - Ox\_Target Verzió

Ez a resource egy **humoros carry script** a FiveM szerverekhez, ox\_target integrációval.

## Főbb funkciók

* **Ox\_target menü**: Ránézés → interakció → carry indítása.
* **Humoros animációk**: mindkét játékos vicces pózban.
* **Stop / detach**: Parancs vagy event segítségével.
* **UI értesítés**: jelzi, ha carry folyamatban van.
* **Finomhangolható paraméterek**: távolság, magasság, spin.

## Fájlok

* `fxmanifest.lua` - Resource leírása és függőségek.
* `client.lua` - Carry logika, animációk, ox\_target integráció.
* `server.lua` - Szerver oldali szinkronizáció.

## Telepítés

1. Másold a `humorous_carry_resource` mappát a szerver `resources` mappájába.
2. Indítsd a resource-t a szerver `server.cfg` fájlban:

   ```
   ensure humorous_carry_resource
   ```
3. Győződj meg róla, hogy az `ox_target` telepítve van.

## Használat

* **Carry indítása**: Ránézel egy játékosra, megnyitod az ox\_target menüt, és kiválasztod a "Humoros Carry" opciót.
* **Carry leállítása**: Használd a `/carry_stop` parancsot vagy az ox\_target stop opcióját.

## Finomhangolás

* **distans / distans2 / height / spin**: Módosítható a `client.lua`-ban a carry pozíció és humoros hatás finomhangolásához.
* **Animáció**: A `lib` és `anim` értékek cserélhetők a GTA V anim listából, hogy más vicces pózokat adj hozzá.

## Megjegyzés

Ez a resource **client + server oldal** együttműködésével működik, így minden játékosnál stabil és szinkronizált carry animációt bizt
