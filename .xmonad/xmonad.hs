{-# LANGUAGE RebindableSyntax #-}
import XMonad.Config.Prime

import Data.Map (Map)
import XMonad.Util.EZConfig (additionalKeys, mkKeymap)

myTerminal :: String
myTerminal = "alacritty"

myBrowser :: String
myBrowser = "/opt/firefox-nightly/firefox"

myKeys :: XConfig l -> Map (KeyMask, KeySym) (X ())
myKeys c = mkKeymap c $
    [
      ("M-b", spawn myBrowser)
    , ("M-<Return>", spawn myTerminal)
    , ("M-<Backspace>", kill)
    ]

main = xmonad $ do
    let keys = myKeys
    modMask =: mod4Mask
