import XMonad
import XMonad.Actions.WorkspaceNames
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig


-- Colours
-- TODO: List all solarized colour in here - 0 to 15.
myActiveColour = "#b58900"
myInactiveColour = "#586e75"
black = "#000000"


myModMask = mod4Mask
myTerminal = "x-terminal-emulator"


openInTerminal application =
     spawn ( myTerminal ++ " -e " ++ application )


main = do
    spawn "xmobar"

    xmonad $ docks def
        { layoutHook = avoidStruts (Full)
        , logHook = workspaceNamesPP xmobarPP
            -- https://hackage.haskell.org/package/xmonad-contrib-0.14/docs/XMonad-Hooks-DynamicLog.html
            { ppOutput = hPutStrLn xmproc
            , ppTitle = (\x -> "")
            -- TODO: Display layouts as FontAwesome icons:
            -- 'pause', 'arrows-alt', 'th-large', 'th', 'square'
            , ppLayout = (\x -> "")
            , ppWsSep = "  "
            , ppCurrent = (\x -> xmobarColor myActiveColour black x)
            -- TODO: Solarize this text colour.
            , ppHiddenNoWindows = (\x -> xmobarColor "#222222" black x)
            }
            >>= dynamicLogWithPP
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
