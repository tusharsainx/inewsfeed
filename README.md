# iNewsFeed

A news app, that displays top headlines.

## Demo Video Android

https://github.com/user-attachments/assets/63a36e5c-5831-4465-b476-0163fc944876

## Demo Video iOS

https://github.com/user-attachments/assets/2f7c50eb-db77-46a2-aaee-3e3256c4ff58

# App Overview

## Snapshots from App

![Screenshot 1](https://github.com/user-attachments/assets/b5dc2233-0c78-433f-81ab-8da99676920d)
![Screenshot 2](https://github.com/user-attachments/assets/bcca35f4-1b77-474e-b406-84f54c8c7f17)
![Screenshot 3](https://github.com/user-attachments/assets/fa857d48-032a-4781-9d16-08aff2b9bb48)

---

## How to Run the App

### Pre-Requisites:
- **Flutter SDK version**: 3.22.3  
  [Download Flutter SDK](https://docs.flutter.dev/release/archive?gad_source=1&gclid=Cj0KCQiAsOq6BhDuARIsAGQ4-zhki3SNxsbsnjNqmxDSA8XST2fKgCSIrPn2c4ZRUoV9CcIA7aDhS1kaAp2SEALw_wcB&gclsrc=aw.ds#stable-channel-macos)

### Steps to Run the App:

1. **Clone the Repository**  
   Clone this repo using:  
   ```bash
   git clone <RepoLink>

2. **Run the following command to install dependencies:**
    flutter pub get

3. **Get your API key from NewsAPI.**
   [NewsAPI](https://newsapi.org/)


4. **Add the API key during compile time using the following flag:**
  --dart-define=NEWS_API_KEY=<YOUR_API_KEY>

You can also create a launch.json file where you can append the following args block for different build modes (debug, release, profile):
{
  "configurations": [
    {
      "name": "Debug",
      "program": "lib/main.dart",
      "args": ["--dart-define=NEWS_API_KEY=<YOUR_API_KEY>"]
    },
    {
      "name": "Release",
      "program": "lib/main.dart",
      "args": ["--dart-define=NEWS_API_KEY=<YOUR_API_KEY>"]
    },
    {
      "name": "Profile",
      "program": "lib/main.dart",
      "args": ["--dart-define=NEWS_API_KEY=<YOUR_API_KEY>"]
    }
  ]
}
