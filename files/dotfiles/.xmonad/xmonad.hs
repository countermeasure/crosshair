import XMonad
import XMonad.Hooks.ManageDocks

main = do
    spawn "xmobar"

    xmonad $ docks def { layoutHook = avoidStruts (Full)}
