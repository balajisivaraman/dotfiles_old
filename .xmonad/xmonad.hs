import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Layout.Fullscreen (fullscreenSupport)
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Util.SpawnOnce (spawnOnce)

myTerminal :: String
myTerminal = "alacritty"

myBrowser :: String
myBrowser = "/opt/firefox-nightly/firefox"

myStartupHook = do
    spawnOnce "$HOME/bin/wm/init-polybar"

myWorkspaces = ["web","dev","misc"]

main = xmonad
     $ fullscreenSupport
     $ ewmh desktopConfig
     { modMask = mod4Mask
     , startupHook = myStartupHook <+> startupHook desktopConfig
     , workspaces = myWorkspaces
     } `additionalKeys`
     [ ((mod4Mask, xK_b), spawn myBrowser),
       ((mod4Mask, xK_Return), spawn myTerminal),
       ((mod4Mask, xK_BackSpace), kill)
     ]
