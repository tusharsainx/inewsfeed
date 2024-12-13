# iNewsFeed

A news app, that displays top headlines.

## Demo Video Android

https://github.com/user-attachments/assets/63a36e5c-5831-4465-b476-0163fc944876

## Demo Video iOS

https://github.com/user-attachments/assets/2f7c50eb-db77-46a2-aaee-3e3256c4ff58


 ## Snapshots from app 

 ![Screenshot_20241213_074014](https://github.com/user-attachments/assets/b5dc2233-0c78-433f-81ab-8da99676920d)   ![Screenshot_20241213_074020](https://github.com/user-attachments/assets/bcca35f4-1b77-474e-b406-84f54c8c7f17) ![Screenshot_20241213_074026](https://github.com/user-attachments/assets/fa857d48-032a-4781-9d16-08aff2b9bb48)



## How to run app
# Pre Requisite:
Flutter Sdk version: 3.22.3 
https://docs.flutter.dev/release/archive?gad_source=1&gclid=Cj0KCQiAsOq6BhDuARIsAGQ4-zhki3SNxsbsnjNqmxDSA8XST2fKgCSIrPn2c4ZRUoV9CcIA7aDhS1kaAp2SEALw_wcB&gclsrc=aw.ds#stable-channel-macos

Step 1: Clone this repo using git clone <RepoLink>
Step 2: run, flutter pub get
Step 3: Get your Api Key from https://newsapi.org/  
Step 4: Add that key during compile time using this flag  --dart-define=NEWS_API_KEY=<YOUR_API_KEY>" when you make build. Or You can create launch.json file where you can append
args:[ --dart-define=NEWS_API_KEY=<YOUR_API_KEY>"] to each json block signifying debug, release and profile mode.
