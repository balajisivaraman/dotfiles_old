import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.ManageDocks (avoidStruts, docks)
import XMonad.Layout.Fullscreen (fullscreenSupport)
import XMonad.Layout.NoBorders (noBorders)
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Util.Run (spawnPipe, hPutStrLn)
import XMonad.Util.SpawnOnce (spawnOnce)

myTerminal :: String
myTerminal = "alacritty"

myBrowser :: String
myBrowser = "/opt/firefox-nightly/firefox"

myWorkspaces = ["web","dev","misc"]

mySpacing = spacingRaw True (Border 0 10 10 10) True (Border 10 10 10 10) True
myLayoutHook = noBorders $ mySpacing $ avoidStruts $ layoutHook def
myStatusBar = "xmobar -x1"
myLogHook h = do
    dynamicLogWithPP $ def
        { ppOutput = hPutStrLn h
        }

main = do
    xmproc <- spawnPipe myStatusBar
    xmonad
       $ fullscreenSupport
       $ docks
       $ ewmh
       $ myConfig xmproc

myConfig p = desktopConfig
    { modMask = mod4Mask
    , layoutHook = myLayoutHook
    , logHook = myLogHook p
    , workspaces = myWorkspaces
    } `additionalKeys`
    [ ((mod4Mask, xK_b), spawn myBrowser),
      ((mod4Mask, xK_Return), spawn myTerminal),
      ((mod4Mask, xK_BackSpace), kill)
    ]
