submodules-init:
	git submodule update --init

submodules-pull:
	git submodule foreach git pull origin master
