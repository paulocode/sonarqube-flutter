
# Sonarqube 9.9LTS + Flutter  
### Build
Clone this repository, then run:
```
$ docker build -t sonarqube-flutter . 
$ docker images
$ docker create --name sonarqube-flutter -p 9000:9000 <insert created image ID>
$ docker start sonarqube-flutter
```

### Setup
1. Login to sonarqube (http://localhost:9000/), enable plugin (it will appear when you login)
2. Create Project Manually -> Fill in project key -> Analyze Locally -> Generate
3. Copy project token

### Local project setup

In the project you want to scan, create `sonar-project.properties`:
```
sonar.projectKey=<your project key>
sonar.projectName=<your project name>
sonar.projectVersion=1.0.0

sonar.host.url=http://localhost:9000

sonar.login=<insert project token, starts with sgp_>

sonar.sources=lib,pubspec.yaml
sonar.tests=test
sonar.sourceEncoding=UTF-8


# exclude generated files
sonar.exclusions=test/**/*_test.mocks.dart,lib/**/*.g.dart
```

### Scan
Install [sonar-scanner](https://docs.sonarsource.com/sonarqube/latest/analyzing-source-code/scanners/sonarscanner/) to $PATH,  then run on root of Flutter project:
```
$ flutter test --machine --coverage > tests.output
$ sonar-scanner
```
