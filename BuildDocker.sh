#1 prep.
flutter clean
flutter pub get
flutter config --build-dir=build
flutter config --enable-web

#1 build WebApp (no variables)
flutter build web -t lib/main.dart

#2 build docker with WebApp
docker build . -t flutter4devops

#3 run the docker (with the variables as we like - dosent work)
docker run \
  --env "BACKEND_APIURL=https://backendapi" \
  -p 80:80 flutter4devops


## this is a work-around it will work sices we build the WebApp with the variables.

#2 build WebApp (With variables)
flutter build web -t lib/main.dart --dart-define BACKEND_APIURL=http://backendapi.com

#3 build docker with WebApp
docker build . -t flutter4devops

# run the docker
docker run \
  -p 80:80 flutter4devops

# you can also test it out localy via ex. Chrome
# flutter run --dart-define BACKEND_APIURL=http://backendapi.com
