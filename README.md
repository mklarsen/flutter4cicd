# make run-time environment variables available to flutter code is not really working, in docker

so, a typical problem, we would like to have dynamic environments so that we can minimize docker images and versions of our executables etc

which also applies when we use OneCode -language (such as Flutter, Cordova etc.)
This repo is based on Flutter in use with docker to support for Q&A regards article / port at stackoverflow

https://stackoverflow.com/questions/73837185/flutter-make-run-time-environment-variables-available-to-code-is-not-really-wor

# Test it out...

### Clone this repo, OR create you own Flutter starter app via Flutter Create and then copy/past from my lib/main.dart
```bash
git clone https://github.com/mklarsen/flutter4cicd.git

```

# Now prep. flutter for build
```bash
flutter clean
flutter pub get
flutter config --build-dir=build
flutter config --enable-web

```

# Build WebApp (no variables)
```bash
flutter build web -t lib/main.dart

```

# Build docker with WebApp
```bash
docker build . -t flutter4devops

```

# Now! Run the docker (with the variables as we like - It dosent work)
```bash
docker run \
  --env "BACKEND_APIURL=https://backendapi" \
  -p 80:80 flutter4devops

```

# So this is a work-around, it will work sices we build the WebApp with the variables, so they are static in the Docker images.

# Build WebApp (With variables)
```bash
flutter build web -t lib/main.dart --dart-define BACKEND_APIURL=http://backendapi.com
```

# Build docker with WebApp
```bash
docker build . -t flutter4devops
```

# Run the docker
```bash
docker run \
  -p 80:80 flutter4devops

```

# Example from the result (Static build)
![The WepAPP](https://github.com/mklarsen/flutter4cicd/blob/Main/webapp.png?raw=true)

![From the container](https://github.com/mklarsen/flutter4cicd/blob/Main/env_in_docker.png?raw=true)

# Example from the result (run-time environment - not working)
![From the container](https://github.com/mklarsen/flutter4cicd/blob/Main/novars.png?raw=true)

![From the container](https://github.com/mklarsen/flutter4cicd/blob/Main/env_in_docker.png?raw=true)


# You can also test it out localy via ex. Chrome
```bash
flutter run --dart-define BACKEND_APIURL=http://backendapi.com

```
