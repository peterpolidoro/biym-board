# This file is generated automatically from .metadata.org
# File edits may be overwritten!

upload: metadata package twine add clean

GUIX-SHELL = guix time-machine -C .channels.scm -- shell -m .manifest.scm
GUIX-CONTAINER = $(GUIX-SHELL) --container
GUIX-CONTAINER-GUI = $(GUIX-CONTAINER) --preserve='^DISPLAY$$' --preserve='^TERM$$' --share=/tmp/.X11-unix --expose=/run/user/1001/at-spi/bus_0

metadata-edits:
	$(GUIX-CONTAINER-GUI) -- sh -c "emacs -q --no-site-file --no-site-lisp --no-splash -l .init.el --file .metadata.org"

metadata:
	$(GUIX-CONTAINER) -- sh -c "emacs --batch -Q  -l .init.el --eval '(process-org \".metadata.org\")'"

file-edits:
	$(GUIX-CONTAINER-GUI) -- kicad

add:
	$(GUIX-CONTAINER) -- sh -c "git add --all"

clean:
	$(GUIX-CONTAINER) -- sh -c "git clean -xdf"
