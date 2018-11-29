import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig


myModMask = mod4Mask
myTerminal = "x-terminal-emulator"


openInTerminal application =
     spawn ( myTerminal ++ " -e " ++ application )


main = do
    spawn "xmobar"

    xmonad $ docks def
        { layoutHook = avoidStruts (Full)
        , modMask = myModMask
        , terminal = myTerminal
        }

        `additionalKeys`
        [ ((myModMask, xK_Delete), spawn "power")
        , ((myModMask, xK_Return), spawn myTerminal)
        , ((myModMask, xK_a), openInTerminal "cmus")
        , ((myModMask, xK_b), spawn "x-www-browser")
        , ((myModMask .|. shiftMask, xK_b), spawn "chromium")
        , ((myModMask, xK_c), openInTerminal "abook")
        , ((myModMask, xK_d), spawn "devices")
        , ((myModMask, xK_i), openInTerminal "weechat")
        , ((myModMask, xK_m), openInTerminal "mutt")
        , ((myModMask, xK_n), openInTerminal "nmtui")
        , ((myModMask, xK_p), spawn "keepassx")
        , ((myModMask, xK_r), spawn "rofi -show run")
        , ((myModMask .|. shiftMask, xK_s), spawn "screenshot")
        , ((myModMask, xK_t), spawn "torbrowser-launcher")
        ]
