# docker-development-base
This is a base docker image meant to be used for development environments. 

It should never be used in production.

Provides:
* Open SSH server for remote debugging. (User: root, password: root)
* Xvfb server for headless browser tests.
* ChromeDriver and Chromium Browser for Selenium E2E tests.

You can check a more specific image implementation (Python development environment) at: 

https://registry.hub.docker.com/u/fgibson/docker-development-base/
