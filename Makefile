image=majorgreys/nyc-geocoding

all: start

build:
	docker build -t $(image) .
start:
	docker run --rm -it --volume="$(PWD)"/work:/work --volume="$(PWD)"/data:/data -p 8888:8888 -p 8080:8080 $(image) --allow-root
