#!/usr/bin/bash
set -e

sudo cp org.cinnamon.desktop.overview.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
