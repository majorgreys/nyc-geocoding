# nyc-geocoding
Example Jupyter notebook with server with Geosupport libraries

I wanted to create an easier way to geocode over a million addresses using NYC
Planning's [Geosupport Desktop
Edition](https://www1.nyc.gov/site/planning/data-maps/open-data/dwn-gde-home.page)
than configuring a Windows machine with the correct libraries installed. Fortunately
[mlipper](https://github.com/mlipper/geosupport-docker) and
[riordan](https://github.com/riordan/nyc-batch-geocoder) have shared Dockerfiles
for using the Linux library from NodeJS. Being that I am more comfortable doing
my data analysis in Python, I combined their work on creating Docker images
preconfigured for Geosupport with the
[python-geosupport](https://github.com/ishiland/python-geosupport) package to
call the native C libraries from Python. Finally, I chose base the Docker image
on miniconda and install JupyterLab as the frontend for processing data files
and outputting geocoded results.

To run the JupyterLab server, first `make build` to build the Docker image and
then `make start` to start the server.

See [work/Example.ipynb] to see how a large file of addresses can be geocoded
using this approach.
