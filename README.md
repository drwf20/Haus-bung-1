# Haus-bung-2


Name: Darile Rayane Wafo Fotse
Email-Adresse: darile.rayane.wafo.fotse@mnd.thm.de
Matrikulnummer: 5563913
 
 


# Verwendete Wetter-API
Ich verwende die **Open-Meteo API**, da sie ohne API-Key funktioniert und JSON-Daten über eine einfache HTTP-Anfrage liefert.

Dokumentation: https://open-meteo.com/en/docs

Beispiel-URL (aus der Hausübung):
https://api.open-meteo.com/v1/forecast?latitude=50.58&longitude=8.68&current=temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,wind_speed_10m&timezone=Europe%2FBerlin



# Dashboard-Konzept

Die Startseite besteht aus zwei Bereichen:

## 1. Wetter-Kachel (API)
Folgende Werte werden angezeigt:
- Temperatur  
- Gefühlte Temperatur  
- Luftfeuchtigkeit  
- Windgeschwindigkeit  

Die Daten werden über eine HTTP-Anfrage geladen, als JSON verarbeitet und im Dashboard angezeigt.  
Während des Ladens wird ein Ladezustand angezeigt, bei Fehlern eine Fehlermeldung.

### 2. Zweites Dashboard-Thema: Todo-Liste
Ich habe mich für eine **Todo-Übersicht** entschieden, weil sie gut zu einem persönlichen Dashboard passt.  
Angezeigt werden:
- Anzahl offener Aufgaben  
- Statische Aufgabenliste  

Dieses Thema benötigt keine API und erfüllt die Anforderungen der Hausübung.



## Aufbau der Startseite
- Oben eine AppBar mit dem Titel „Mein Dashboard“  
- Darunter zwei Karten (Cards):
  - Wetter-Kachel  
  - Todo-Kachel  
- Klare visuelle Hierarchie  
- Lesbare Struktur  
- Eine einzige Seite, wie in der Aufgabenstellung gefordert

---

## Startanleitung

Um die App zu starten:cd dashboard_app
flutter run


