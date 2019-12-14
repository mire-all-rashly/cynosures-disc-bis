net := auto-scans-and-honeypots
hp  := opencanary
sc  := scanner

build:
	-docker network remove $(net)
	docker network create $(net)
	docker build -t $(hp) $(hp)/.
	docker build -t $(sc) $(sc)/.

run_opts := --rm -it --network $(net)

drun_hp := docker run $(run_opts) --name $(hp) $(hp)
drun_sc := docker run $(run_opts) --name $(sc) $(sc)

run:
	tmux new-session -d "/bin/sh -c '$(drun_hp); exec bash'"
	tmux split-window -v "/bin/sh -c '$(drun_sc); exec bash'"
	tmux attach
	-docker network remove $(net)

clean:
	-docker network remove $(net)
	-docker container rm $(hp) $(sc)
	-docker image rm $(hp) $(sc)

