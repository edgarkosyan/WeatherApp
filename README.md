#  Weather App


##### A Swift-based weather application built using SwiftUI that allows users to search for cities, display weather details, and persist the selected city across app launches. This application demonstrates clean architecture principles (MVVM), protocol-oriented programming, and API integration with WeatherAPI.com.

## Features
### Home Screen
- Displays the weather for a saved city:
    - City name.
    - Current temperature.
    - Weather condition with a corresponding icon.
    - Humidity (%).
    - UV index.
    - "Feels like" temperature.
- Search bar for querying new cities when no city is saved.

### Search Behavior
- Shows a search result card for the queried city.
- Tapping the result updates the Home Screen with the city's weather and persists the selection using UserDefaults.

## Architecture
- MVVM (Model-View-ViewModel):
    - Ensures modularity and testability of the code.
- Protocol-Oriented Programming:
    - Enables flexible and maintainable code through dependency injection.

## Tech Stack
- Language: Swift
- UI Framework: SwiftUI
- Networking: URLSession (built-in library)
- Local Storage: UserDefaults

## API Integration
Weather data is sourced from WeatherAPI.com:
- Endpoint: https://api.weatherapi.com/v1/current.json
- Parameters include:
    - `key` - API Key (replace with your API Key in the code).
    - `q` - Query city name.
- Data returned includes:
    - Temperature.
    - Weather conditions (with an icon URL).
    - Humidity (%).
    - UV Index.
    - "Feels Like" temperature.
