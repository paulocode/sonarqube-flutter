FROM sonarqube:9.9-community

USER root

RUN apt-get clean \
    && apt-get update \
    && apt-get install -y git curl unzip \
    && rm -rf /var/lib/apt/lists/*

RUN cd /opt/ \
    && git clone https://github.com/flutter/flutter.git \
    && chown -R sonarqube:sonarqube /opt/flutter

RUN cd /opt/sonarqube/extensions/plugins \
    && wget https://github.com/insideapp-oss/sonar-flutter/releases/download/0.5.1-SNAPSHOT/sonar-flutter-plugin-0.5.1-SNAPSHOT.jar
ENV PATH="/opt/flutter/bin:${PATH}"
ENV PATH="/opt/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter doctor

USER sonarqube
