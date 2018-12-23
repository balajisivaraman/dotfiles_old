import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.ManageDocks (avoidStruts, docks)
import XMonad.Layout.Fullscreen (fullscreenSupport)
import XMonad.Layout.NoBorders (noBorders)
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Util.SpawnOnce (spawnOnce)

myTerminal :: String
myTerminal = "alacritty"

myBrowser :: String
myBrowser = "/opt/firefox-nightly/firefox"

myStartupHook = do
    spawnOnce "$HOME/bin/wm/init-polybar"

myWorkspaces = ["web","dev","misc"]

mySpacing = spacingRaw True (Border 0 10 10 10) True (Border 10 10 10 10) True
myLayoutHook = noBorders $ mySpacing $ avoidStruts $ layoutHook def

main = xmonad
     $ fullscreenSupport
     $ docks
     $ ewmh desktopConfig
     { modMask = mod4Mask
     , layoutHook = myLayoutHook
     , startupHook = myStartupHook <+> startupHook desktopConfig
     , workspaces = myWorkspaces
     } `additionalKeys`
     [ ((mod4Mask, xK_b), spawn myBrowser),
       ((mod4Mask, xK_Return), spawn myTerminal),
       ((mod4Mask, xK_BackSpace), kill)
     ]
