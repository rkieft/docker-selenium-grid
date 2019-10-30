# docker-selenium-grid

This docker image is used to have a generic selenium hub for selenium grid test, production and conzales.
To use this docker image you can simply run:

    docker run -d -p 30000:30000 docker-selenium-grid:latest

If you would like to run the docker on another port then simply change it to something else like:

    docker run -d -p 4444:30000 docker-selenium-grid:latest
 
 