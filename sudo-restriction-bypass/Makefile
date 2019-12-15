net := sudo-restriction-bypass
srb := cve-2019-14287

build:
	-docker network remove $(net)
	docker network create $(net)
	docker build -t $(srb) $(srb)/.

run_opts := --rm -it --network $(net) --security-opt=no-new-privileges:false

drun := docker run $(run_opts) --name $(srb) $(srb)

run:
	$(drun)
	-docker network remove $(net)

clean:
	-docker network remove $(net)
	-docker container rm $(srb)
	-docker image rm $(srb)
