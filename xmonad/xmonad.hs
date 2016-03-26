import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig(additionalKeys)
import Graphics.X11.ExtraTypes.XF86
import System.IO
import XMonad.Util.Run

main = do
  xmproc <- spawnPipe "xmobar .xmobarrc"          -- start xmobar
  xmproc <- spawnPipe "xmodmap .xmodmap"          -- set capslock to escape (for vim)
  xmproc <- spawnPipe "synclient MaxTapTime=0"    -- disable tap to highlight
  xmproc <- spawnPipe "gnome-terminal"            -- start gnome terminal
  xmproc <- spawnPipe "redshift"                    -- start chrome

  xmonad $ defaultConfig
    { borderWidth = 3
    , focusedBorderColor = sol_magenta
    , manageHook = manageHook defaultConfig <+> manageDocks
    }

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
