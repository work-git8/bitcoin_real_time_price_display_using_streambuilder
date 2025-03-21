
# Flutter Bitcoin Real-Time Price Tracker

## Overview

This **Flutter** application fetches and displays real-time Bitcoin price data using the **CoinDesk API**. The app continuously updates Bitcoin prices at regular intervals and allows users to refresh the data manually.

## Tech Stack

- **Frontend:** Flutter (Dart)
- **API Services:** CoinDesk API - [https://api.coindesk.com/v1/bpi/currentprice.json](https://api.coindesk.com/v1/bpi/currentprice.json)
- **State Management:** StreamBuilder

## Setup Instructions

### Prerequisites

- Install **Flutter** by following the official [Flutter installation guide](https://flutter.dev/docs/get-started/install).
- Ensure you have an active internet connection.

### Installation Steps

```sh
# Clone the repository
git clone <repository-url>

# Navigate to the project directory
cd <flutter_bitcoin_tracker_directory>

# Get the dependencies
flutter pub get

# Run the application
flutter run
```

## Usage

1. Open the app.
2. The app automatically fetches and displays the latest Bitcoin price.
3. The price updates every 5 seconds.
4. Users can manually refresh the price by clicking the Refresh button.

## API Integration

- The app makes API requests to CoinDesk's Bitcoin Price Index (BPI) API.
- The received JSON response is parsed into a `Bitcoin` model.
- The data includes the current Bitcoin price in USD.







