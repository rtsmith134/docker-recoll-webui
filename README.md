# docker-recoll-webui
recoll with webui in a docker container

- optimized for docker running on a qnap nas
- creates a python standalone recoll server inside a docker container listening on port 80
- to start indexing run this command on your synology:
    `docker exec CONTAINER_ID recollindex`
- to run the indexer as a time-based task on a synology nas, use the task scheduler to run this recollindex.sh script:
    https://raw.githubusercontent.com/dsheyp/docker-recoll-webui/master/recollindex.sh
- change `CONTAINER_ID` and paths to your needs
- settings for recoll are stored in `/root/.recoll/recoll.conf`
- the path of what will be indexed is `/data`

# links
- WebUI homepage: https://github.com/koniu/recoll-webui
- Recoll homepage: http://www.lesbonscomptes.com/recoll

# installation steps
- Build a docker image with the command "docker build -t recoll-docker . ". This will create a local image named recoll-docker
- The docker-compose.yaml assumes several things
   1) You will use http://localhost:8888 to access the webui
   2) Your recoll.conf and gunicorn files will be at /home/rsmith/.recoll
   3) copy gunicorn.conf and recoll.conf to /home/rsmith/.recoll
   4) recoll will index /home/rsmith/Diary -> /data/Diary
- Run "docker compose up -d"  to create the docker container.
- Now get recollindex ready for your first indexing
   1) chmod +x recollindex.
   2) replace <CONTAINER_ID> with the actual id from "docker ps"
   3) run "./recollindex".  
   4) This will create an index but it is a one-shot deal. Setting up periodic updates is not covered here.
- Open a webpage to http://localhost:8888

