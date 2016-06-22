import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig(additionalKeys)
import Graphics.X11.ExtraTypes.XF86
import System.IO
import XMonad.Util.Run

main = do
  xmproc <- spawnPipe "xmobar  .xmobarrc"         -- start xmobar
  xmproc <- spawnPipe "xmodmap .xmodmap"          -- set capslock to escape (for vim)
  xmproc <- spawnPipe "synclient MaxTapTime=0"    -- disable tap to highlight (mbp specific)
  xmproc <- spawnPipe "gnome-terminal"            -- start terminal
  xmproc <- spawnPipe "redshift"                  -- start redshift (screen temp prog)
  xmproc <- spawnPipe "nohup nautilus &"          -- start nautilus (for term transparency)

  xmonad $ defaultConfig
    { borderWidth = 3
    , focusedBorderColor = sol_magenta
    , manageHook = manageHook defaultConfig <+> manageDocks
    , layoutHook = avoidStruts (tall)
    } `additionalKeys`
    -- 0 as arg ignores pressing of mod key
    [
      ((0, volume_down), spawn "amixer set Master 5-")
    , ((0, volume_up  ), spawn "amixer set Master 5+")
    , ((0, volume_mute), spawn "amixer -D pulse set Master toggle")
    -- ((0, screen_light_down), spawn "echo $[`cat brightness` - 25] | sudo tee /sys/class/backlight/gmux_backlight/backlight"),
    -- ((0, screen_light_up  ), spawn "echo $[`cat brightness` + 25] | sudo tee /sys/class/backlight/gmux_backlight/backlight")
    ]

    where
      -- solarized colors
      sol_orange  = "#dtf500"
      sol_yellow  = "#af8700"
      sol_red     = "#d70000"
      sol_magenta = "#af005f"
      sol_violet  = "#5f5faf"
      sol_blue    = "#0087ff"
      sol_cyan    = "#00afaf"
      sol_green   = "#5f8700"

      -- other colors
      lime_green  = "#c9ff00"
      powder_pink = "#ffcce7"

      -- fn keybinds
      kb_light_down     = 0x1008ff06
      kb_light_up       = 0x1008ff05
      screen_light_down = 0x1008ff03
      screen_light_up   = 0x1008ff02
      volume_mute       = 0x1008ff12
      volume_down       = 0x1008ff11
      volume_up         = 0x1008ff13

      -- layout modes
      tall = Tall 1 (3/100) (1/2)
