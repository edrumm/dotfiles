default: install-packages set-symlinks

install-packages: 
	./script/install.sh

install-python-packages:
	pip install -r ~/script/python/requirements.txt

set-symlinks:
	ln -s ~/script/shell script
	ln -s "/mnt/c/users/esd06/AppData/local/Programs/Microsoft VS Code/" VSCode

makefile-test:
	@echo "OK" 
