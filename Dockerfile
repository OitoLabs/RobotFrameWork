from centos:7

MAINTAINER "Amar khan" <amar.khan@oitolabs.io>

RUN yum --assumeyes update \
  && yum --assumeyes install epel-release \
  && yum --assumeyes install python wxPython  wget xorg-x11-server-Xvfb unzip \
  && yum --assumeyes install python-pip \
  && yum install Xvfb \
  && yum --assumeyes install git

WORKDIR /home/robotframework

VOLUME ["/home/robotframework/nocnoc-report"]

RUN yum --assumeyes install firefox \
  && wget https://github.com/mozilla/geckodriver/releases/download/v0.22.0/geckodriver-v0.22.0-linux64.tar.gz \
  && tar xvf geckodriver-v0.22.0-linux64.tar.gz \
  && cp geckodriver /usr/bin/ \
  && cp geckodriver /usr/local/bin

RUN yum --assumeyes install gcc openssl-devel libffi-devel python-devel \
  && pip install robotframework \
  && pip install robotframework-selenium2library \
  && pip install pycrypto

RUN wget http://chromedriver.storage.googleapis.com/2.9/chromedriver_linux64.zip \
  && yum install unzip \
  && unzip chromedriver_linux64.zip \
  && cp chromedriver /usr/bin/ \
  && cp chromedriver /usr/local/bin

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

RUN yum -y install ./google-chrome-stable_current_*.rpm

RUN pip install robotframework-excellibrary \
  && pip install robotframework-debuglibrary

RUN yum --assumeyes install bind-utils  

COPY / /home/robotframework/

RUN chmod +x Scripts/EnvSetup.sh

ENTRYPOINT ["/home/robotframework/Scripts/EnvSetup.sh"]

CMD [""]
