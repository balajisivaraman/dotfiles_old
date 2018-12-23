import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.ManageDocks (avoidStruts, docks)
import XMonad.Layout.Fullscreen (fullscreenSupport)
import XMonad.Layout.NoBorders (noBorders)
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run (spawnPipe, hPutStrLn)

import Data.List (isInfixOf)

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

main = do
    xmproc <- spawnPipe myStatusBar
    xmonad
       $ fullscreenSupport -- Sets up everything for fullscreen support
       $ docks -- Needed to ensure stuff like XMobar stays on top
       $ ewmh -- Advertises EWMH support in XMonad
       $ myConfig xmproc

myConfig p = desktopConfig -- Sets up basic desktop related configuration
    {
      manageHook = namedScratchpadManageHook myScratchpads
    , modMask = mod4Mask
    , layoutHook = myLayoutHook
    , logHook = myLogHook p
    , workspaces = myWorkspaces
    } `additionalKeys`
    [ ((mod4Mask, xK_b), spawn myBrowser),
      ((mod4Mask, xK_Return), spawn myTerminal),
      ((mod4Mask, xK_BackSpace), kill),
      ((mod4Mask, xK_p), namedScratchpadAction myScratchpads "keepassxc")
    ]
