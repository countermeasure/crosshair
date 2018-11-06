import XMonad
import XMonad.Actions.Navigation2D
    ( windowGo
    , windowSwap
    , Direction2D ( U, D, L, R )
    , defaultTiledNavigation
    , withNavigation2DConfig
    , hybridNavigation
    )
import XMonad.Actions.WorkspaceNames
    ( workspaceNamesPP
    , renameWorkspace
    )
import XMonad.Actions.CycleWS
    ( toggleWS
    , moveTo
    , WSType ( NonEmptyWS )
    )
import XMonad.Hooks.DynamicLog
    ( ppOutput
    , ppTitle
    , ppLayout
    , ppWsSep
    , ppCurrent
    , ppHiddenNoWindows
    , xmobarPP
    , xmobarColor
    , dynamicLogWithPP
    )
import XMonad.Hooks.ManageDocks
    ( docks
    , avoidStruts
    , Direction1D ( Next )
    )
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
    ( smartBorders )
import XMonad.Layout.NoFrillsDecoration
    ( inactiveColor
    , inactiveTextColor
    , inactiveBorderColor
    , activeColor
    , activeTextColor
    , activeBorderColor
    , decoHeight
    , shrinkText
    , noFrillsDeco
    )
import XMonad.Layout.Spacing
    ( spacingWithEdge )
import XMonad.Prompt
    ( XPPosition ( Top )
    , font
    , bgColor
    , fgColor
    , fgHLight
    , bgHLight
    , promptBorderWidth
    , position
    , height
    )
import XMonad.Util.EZConfig
    (additionalKeys)
import XMonad.Util.Run
    ( spawnPipe
    , hPutStrLn
    )

-- TODO: Work out how to format imports correctly, and alphabetise them all.

-- Colours
-- TODO: List all solarized colour in here - 0 to 15.
myActiveColour = "#b58900"
myInactiveColour = "#586e75"
black = "#000000"

-- Styling

myTopBarTheme = def
     { inactiveColor = myInactiveColour
     , inactiveTextColor = myInactiveColour
     , inactiveBorderColor = myInactiveColour
     , activeColor = myActiveColour
     , activeTextColor = myActiveColour
     , activeBorderColor = myActiveColour
     , decoHeight = 15
     }
promptTheme = def
    { font = "xft:Source Code Pro Medium-13"
    , bgColor = "#073642"
    , fgColor = "#839496"
    , fgHLight = "#eee8d5"
    , bgHLight = "#b58900"
    , promptBorderWidth = 0
    , position = Top
    , height = 25
    }

myModMask = mod4Mask
myTerminal = "x-terminal-emulator"


openInTerminal application =
     spawn ( myTerminal ++ " -e " ++ application )


main = do
    xmproc <- spawnPipe "xmobar"

    xmonad . docks
        $ withNavigation2DConfig def {defaultTiledNavigation=hybridNavigation}
        $ def
        { manageHook = manageHook def
        , layoutHook = avoidStruts
                     $ smartBorders
                     $ noFrillsDeco shrinkText myTopBarTheme
                     $ spacingWithEdge 7
                     $ Tall 1 (3/100) (1/2) ||| Grid ||| Full
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
        , borderWidth = 0
        }

        `additionalKeys`
        -- TODO: Add a line above each of these lines to explain where the
        -- shortcut comes from, like '"a" for audio'.
        [ ((myModMask, xK_BackSpace), kill)
        , ((myModMask, xK_Delete), spawn "power")
        , ((myModMask, xK_grave), toggleWS)
        , ((myModMask, xK_Return), spawn myTerminal)
        , ((myModMask, xK_0), moveTo Next NonEmptyWS)
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
        , ((myModMask, xK_w), renameWorkspace promptTheme)

        -- Master window resizing.
        , ((myModMask, xK_equal), sendMessage Expand)
        , ((myModMask, xK_minus), sendMessage Shrink)

        -- Moving focus between windows.
        , ((myModMask, xK_l), windowGo R False)
        , ((myModMask, xK_h), windowGo L False)
        , ((myModMask, xK_k), windowGo U False)
        , ((myModMask, xK_j), windowGo D False)

        -- Repositioning windows.
        , ((controlMask, xK_l), windowSwap R False)
        , ((controlMask, xK_h), windowSwap L False)
        , ((controlMask, xK_k), windowSwap U False)
        , ((controlMask, xK_j), windowSwap D False)

        -- Audio controls
        -- TODO: Use xev to understand why these work.
        -- XF86AudioRaiseVolume
        , ((0, 0x1008ff13), spawn "amixer sset Master 10%+ unmute")
        -- XF86AudioLowerVolume
        , ((0, 0x1008ff11), spawn "amixer sset Master 10%- unmute")
        -- XF86AudioMute
        , ((0, 0x1008ff12), spawn "amixer sset Master 10% toggle")
        ]
