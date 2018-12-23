import XMonad
import XMonad.Util.EZConfig

main = xmonad $ def
     { modMask = mod4Mask
     } `additionalKeys`
     [ ((mod4Mask, xK_b), spawn "/opt/firefox-nightly/firefox")
     ]
