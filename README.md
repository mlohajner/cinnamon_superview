# Cinnamon Menu + Overview integration = Cinnamon SuperView

Brings a bit of GNOME-style flair to Cinnamon: pressing the **Super key**
now opens the **Overview** (Expo-style view of your windows)
together with the main menu, as one seamless experience.

Open the menu → see your windows laid out behind it. Close the menu (pick
something, hit Escape, click away, lock/log out) → the overview closes right
along with it. No extra keybindings, no extra clicks - it just feels like
part of the menu now.

## Why

Cinnamon has always had the Overview, but it lives on its own (underused),
bound to its own key, disconnected from the menu you actually use to launch
things.  
This project ties the two together so opening the menu doubles as a quick visual
overview of what you're already doing - closer to how GNOME's activities
view works, but keeping Cinnamon's traditional menu.

## What you get

- Super key → **toggles** menu **and** overview open together
  (click on menu in panel deliberately opens only the menu -assuming you want menu only)
- Overview closes automatically with the menu - no lingering overview, no manual dismissal
- Toggleable - if you don't want the overview tagging along, turn it off in GSettings
  and the menu behaves exactly like before, and customize if you want panel visible or not

## Compatibility

Works on Cinnamon 6.4 and 6.6 (patches provided for both, since Cinnamon
changed some internals between the two).

## Installation

1. Backup your originals (optional but highly recommended)
```bash
sudo cp -a /usr/share/cinnamon/applets/menu@cinnamon.org/applet.js{,.orig}
sudo cp -a /usr/share/cinnamon/js/ui/overview.js{,.orig}
```  
2. Install Gsettings schema included, so the behavior can be customized in realtime
```bash
sudo cp org.cinnamon.desktop.overview.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
```  
3. Apply the patch to your Cinnamon files (`applet.js` for the menu,
   `overview.js` for the Overview).
```bash
# 6.6.x or 6.4.x -> matching your version

cd /usr/share/cinnamon
sudo patch -p1 < /path/to/superview-6.6.x.patch
```  
**OR just use pre-patched included files:  **
```bash
# same version principle applies here: matching your version

sudo cp cinnaon6.6.x/applet.js /usr/share/cinnamon/applets/menu@cinnamon.org/applet.js
sudo cp cinnamon6.6.x/overview.js /usr/share/cinnamon/js/ui/overview.js
```  
4. Restart Cinnamon (`killall -3 cinnamon`) - no logout needed.

## Settings

```bash
gsettings set org.cinnamon.desktop.overview overview-in-menu true
gsettings set org.cinnamon.desktop.overview panel-enabled true
```  
...or simply use GUI (dconf-editor)
