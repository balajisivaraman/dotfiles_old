import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Layout.Fullscreen (fullscreenSupport)
import XMonad.Util.EZConfig (additionalKeys)

myTerminal :: String
myTerminal = "alacritty"

myBrowser :: String
myBrowser = "/opt/firefox-nightly/firefox"

main = xmonad
     $ fullscreenSupport
     $ ewmh desktopConfig
     { modMask = mod4Mask
     } `additionalKeys`
     [ ((mod4Mask, xK_b), spawn myBrowser),
       ((mod4Mask, xK_Return), spawn myTerminal),
       ((mod4Mask, xK_BackSpace), kill)
     ]
