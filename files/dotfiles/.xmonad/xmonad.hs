import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig


myTerminal = "x-terminal-emulator"


openInTerminal application =
     spawn ( myTerminal ++ " -e " ++ application )


main = do
    spawn "xmobar"

    xmonad $ docks def
        { layoutHook = avoidStruts (Full)
        , terminal = myTerminal
        }

        `additionalKeys`
        [ ((mod1Mask, xK_Delete), spawn "power")
        , ((mod1Mask, xK_Return), spawn myTerminal)
        , ((mod1Mask, xK_a), openInTerminal "cmus")
        , ((mod1Mask, xK_b), spawn "x-www-browser")
        , ((mod1Mask .|. shiftMask, xK_b), spawn "chromium")
        , ((mod1Mask, xK_c), openInTerminal "abook")
        , ((mod1Mask, xK_d), spawn "devices")
        , ((mod1Mask, xK_i), openInTerminal "weechat")
        , ((mod1Mask, xK_m), openInTerminal "mutt")
        , ((mod1Mask, xK_n), openInTerminal "nmtui")
        , ((mod1Mask, xK_p), spawn "keepassx")
        , ((mod1Mask, xK_r), spawn "rofi -show run")
        , ((mod1Mask .|. shiftMask, xK_s), spawn "screenshot")
        , ((mod1Mask, xK_t), spawn "torbrowser-launcher")
        ]
