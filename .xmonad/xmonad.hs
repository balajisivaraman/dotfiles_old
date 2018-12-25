import XMonad
import qualified XMonad.Core as XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops (ewmh, fullscreenEventHook)
import XMonad.Hooks.ManageDocks (avoidStruts, docks)
import XMonad.Layout.Fullscreen (fullscreenSupport)
import XMonad.Layout.NoBorders (noBorders)
import XMonad.Layout.NoFrillsDecoration
import XMonad.Layout.Spacing
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig (mkKeymap)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run (spawnPipe, hPutStrLn)

import Data.List (isInfixOf)
import Data.Map (Map, union)

myTerminal = "alacritty"
myBrowser = "/opt/firefox-nightly/firefox"
myLauncher = "rofi -matching fuzzy -modi combi -show combi -combi-modi drun,window"
myDocumentLauncher = "~/bin/wm/document-launcher"

myFont = "xft:xos4 Terminus:pixelsize=10"
topBarDracula = def
    { fontName = myFont
    , activeColor = "#BD93F9"
    , activeBorderColor = "#BD93F9"
    , activeTextColor = "#BD93F9"
    , inactiveColor = "#44475A"
    , inactiveBorderColor = "#44475A"
    , inactiveTextColor = "#44475A"
    , urgentBorderColor = "#FF5555"
    , urgentTextColor = "#F8F8F2"
    , decoHeight = 10
    }
addTopBar = noFrillsDeco shrinkText topBarDracula

mySpacing = spacingRaw True (Border 0 10 10 10) True (Border 10 10 10 10) True
myLayoutHook = addTopBar
    $ avoidStruts -- Needed to ensure XMobar stays on top
    $ mySpacing -- Setup 10 spacing as above
    $ noBorders -- Don't want borders
    $ layoutHook desktopConfig

myStatusBar = "xmobar -x1"
-- Below is needed to ensure content is output to XMobar StdIn
myLogHook h = do
    dynamicLogWithPP $ def
        { ppOutput = hPutStrLn h
        }

myScratchpads =
    [
      NS "keepassxc" "keepassxc" (fmap (isInfixOf "KeePassXC") title) defaultFloating
    , NS "cmus" "alacritty --title cmus -e cmus" (title =? "cmus")
        (customFloating $ W.RationalRect (1/6) (1/6) (1/3) (1/3))
    , NS "thunderbird" "thunderbird" (className =? "Thunderbird")
        (customFloating $ W.RationalRect (1/8) (1/8) (3/4) (3/4))
    ]

myManageHook =
        namedScratchpadManageHook myScratchpads
    <+> manageHook desktopConfig

-- fullscreenEventHook from EWMH module is needed for proper fullscreen behaviour
myEventHook = handleEventHook def <+> fullscreenEventHook

myWorkspaces = ["web","dev","misc"]

myKeys :: XConfig l -> Map (KeyMask, KeySym) (X ())
myKeys c = mkKeymap c $
    [
    -----------------------------------------------------------
    -- Launchers
    -----------------------------------------------------------
      ("M-b", spawn myBrowser)
    , ("M-d", spawn myDocumentLauncher)
    , ("M-<Space>", spawn myLauncher)
    , ("M-<Return>", spawn myTerminal)

    -----------------------------------------------------------
    -- Layouts
    -----------------------------------------------------------
    , ("M-<Tab>", sendMessage NextLayout)

    -----------------------------------------------------------
    -- Navigation
    -----------------------------------------------------------
    , ("M-j", windows W.focusDown)
    , ("M-k", windows W.focusUp)

    -----------------------------------------------------------
    -- Scratchpads
    -----------------------------------------------------------
    , ("M-p", namedScratchpadAction myScratchpads "keepassxc")
    , ("M-m", namedScratchpadAction myScratchpads "cmus")
    , ("M-t", namedScratchpadAction myScratchpads "thunderbird")

    -----------------------------------------------------------
    -- System/Utilities
    -----------------------------------------------------------
    , ("M-<Backspace>", kill)
    , ("M-S-r", spawn "xmonad --recompile && xmonad --restart")
    , ("M-S-l", spawn "dm-tool lock")

    -----------------------------------------------------------
    -- Volume Control
    -----------------------------------------------------------
    , ("M-S-.", spawn "~/bin/wm/volume-control inc 5")
    , ("M-S-,", spawn "~/bin/wm/volume-control dec 5")
    , ("M-S-m", spawn "~/bin/wm/volume-control mute")

    -----------------------------------------------------------
    -- Window Operations
    -----------------------------------------------------------
    , ("M-h", sendMessage Shrink)
    , ("M-l", sendMessage Expand)
    , ("M-S-j", windows W.swapDown)
    , ("M-S-k", windows W.swapUp)
    ]

main = do
    xmproc <- spawnPipe myStatusBar
    xmonad
       $ fullscreenSupport -- Sets up everything for fullscreen support
       $ docks -- Needed to ensure stuff like XMobar stays on top
       $ ewmh -- Advertises EWMH support in XMonad
       $ myConfig xmproc

myConfig p = desktopConfig -- Sets up basic desktop related configuration
    {
      borderWidth = 0
    , handleEventHook = myEventHook
    , keys = \c -> myKeys c `union` keys XMonad.def c
    , layoutHook = myLayoutHook
    , logHook = myLogHook p
    , manageHook = myManageHook
    , modMask = mod4Mask
    , workspaces = myWorkspaces
    }
