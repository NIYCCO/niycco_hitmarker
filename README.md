
# niycco_hitmarker

This FiveM script enables a hit marker to be displayed when a player shoots another player. The hit marker displays the damage number and also signals the death of the player hit. The script is configurable and offers various settings to customize the display of the hit marker according to your own preferences.


## Config

The configuration file (Config.lua) allows the user to adjust various settings:

    The display time of the hitmarker (HitmarkerShowTime) and additional display time in case of a fatal hit (HitmarkerAddShowTimeLastHit).
    The text scaling, font and text alignment.
    The color of the hit marker and the option to use a separate color for headshots.
    The display of the text "Dead" in the event of a fatal hit.
    The option to play a sound when a hit marker is displayed.
    Deactivation of the hit marker for melee weapons.


## Usage/Examples

The script offers the option of activating or deactivating the hitmarker using the "/hitmarker" command. Alternatively, the toogleHitmarkerExport function can be called in other client scripts via exports.ds_hitmarker:toogleHitmarkerExport().

Example to create a custom command in another client script:
```lua
RegisterCommand('exportTest', function()
  exports.ds_hitmarker:toogleHitmarkerExport()
end, false)
```


## Screenshots

![App Screenshot](https://i.imgur.com/gPLZS5J.png)

Video: https://streamable.com/5k7ei1
