import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.ManageDocks (avoidStruts, docks)
import XMonad.Layout.Fullscreen (fullscreenSupport)
import XMonad.Layout.NoBorders (noBorders)
import XMonad.Layout.Spacing
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig (mkKeymap)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run (spawnPipe, hPutStrLn)

import Data.List (isInfixOf)
import Data.Map (Map)

myTerminal = "alacritty"
myBrowser = "/opt/firefox-nightly/firefox"

mySpacing = spacingRaw True (Border 0 10 10 10) True (Border 10 10 10 10) True
myLayoutHook = noBorders -- Don't want borders
    $ mySpacing -- Setup 10 spacing as above
    $ avoidStruts -- Needed to ensure XMobar stays on top
    $ layoutHook def

myStatusBar = "xmobar -x1"
-- Below is needed to ensure content is output to XMobar StdIn
myLogHook h = do
    dynamicLogWithPP $ def
        { ppOutput = hPutStrLn h
        }

myScratchpads = [
    NS "keepassxc" "keepassxc" (fmap (isInfixOf "KeePassXC") title) defaultFloating
    ]

myWorkspaces = ["web","dev","misc"]

myKeys :: XConfig l -> Map (KeyMask, KeySym) (X ())
myKeys c = mkKeymap c $
    [
    -- Essentials
      ("M-b", spawn myBrowser)
    , ("M-<Return>", spawn myTerminal)
    , ("M-<Backspace>", kill)
    , ("M-S-r", spawn "xmonad --recompile && xmonad --restart")

    -- Navigation
    , ("M-j", windows W.focusDown)
    , ("M-k", windows W.focusUp)

    -- Resizing Windows
    , ("M-h", sendMessage Shrink)
    , ("M-l", sendMessage Expand)

    -- Moving Windows
    , ("M-S-j", windows W.swapDown)
    , ("M-S-k", windows W.swapUp)

    -- Scratchpads
    , ("M-p", namedScratchpadAction myScratchpads "keepassxc")
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
      keys = myKeys
    , layoutHook = myLayoutHook
    , logHook = myLogHook p
    , manageHook = namedScratchpadManageHook myScratchpads
    , modMask = mod4Mask
    , workspaces = myWorkspaces
    }
