# WeatherApp - iOS
This is an iOS app which displays weather for 6 days from current date in a simple Table View.

Using OpenWeatherMap URL, Make a GET request, Parse the response data, You need an apiKey which you need to append to the URL.

Simple App which follows MVC Architechture, 
Model - Holds the data 
  ex: WeatherData, Day
  
View - Takes care of Updating the UI
  ex: WeatherView, WeatherTableViewCell
 
Controller - Takes care of the Business logic
  ex: WeatherViewController
  
APIClient class - Makes API calls, All the interaction with the Server (GET, PUT, POST etc.)

Managers - Takes care of managing the Data - Singleton (One for the Application)
  ex: WeatherManager
  





