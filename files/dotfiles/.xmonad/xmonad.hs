import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig


myTerminal = "x-terminal-emulator"


main = do
    spawn "xmobar"

    xmonad $ docks def
        { layoutHook = avoidStruts (Full)
        , terminal = myTerminal
        }

        `additionalKeys`
        [ ((mod1Mask, xK_Return), spawn myTerminal)
        , ((mod1Mask, xK_b), spawn "x-www-browser")
        ]
