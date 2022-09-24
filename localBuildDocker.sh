
flutter clean
flutter pub get
flutter config --build-dir=build
flutter config --enable-web

flutter build web -t lib/main.dart --release --dart-define BACKEND_APIURL=${BACKEND_APIURL}
docker build . -t flutter4devops

docker run \
  --env "BACKEND_APIURL=https://some-api-url.com" \
  -p 80:80 flutter4devops
