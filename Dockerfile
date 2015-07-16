FROM rastasheep/ubuntu-sshd:14.04

MAINTAINER Fabio Gibson <fabiogibson@hotmail.com>

RUN apt-get update \
 && apt-get install -y \
	wget \
	unzip \
	curl \
	xvfb \
	chromium-browser \
	firefox \
	libxpm4 \
	libxrender1 \
	libgtk2.0-0 \
	libnss3 \
	libgconf-2-4 \
	gtk2-engines-pixbuf \
	xfonts-cyrillic \
	xfonts-100dpi \
	xfonts-75dpi \
	xfonts-base \
	xfonts-scalable

# Create a symbolic link from chromium-browser to google-chrome
RUN ln -s /usr/bin/chromium-browser /usr/bin/google-chrome

# Set global env DISPLAY for Xvfb server
RUN echo "export DISPLAY=:99" >> ~/.bashrc

# Install chrome driver
RUN curl -SLO "https://chromedriver.storage.googleapis.com/2.16/chromedriver_linux64.zip" \
  && unzip "chromedriver_linux64.zip" -d /usr/local/bin \
  && rm "chromedriver_linux64.zip" \
  && chmod ugo+rx /usr/local/bin/chromedriver

WORKDIR /src

# Start ssh server and xvfb server in foreground
CMD /etc/init.d/ssh start && Xvfb -ac :99 -screen 0 1280x1024x16



