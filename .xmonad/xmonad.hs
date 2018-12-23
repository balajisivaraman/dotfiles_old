{-# LANGUAGE RebindableSyntax #-}
import XMonad.Config.Prime

import Data.Map (Map)
import XMonad.Util.EZConfig (additionalKeysP, removeKeysP)

myTerminal :: String
myTerminal = "alacritty"

myBrowser :: String
myBrowser = "/opt/firefox-nightly/firefox"

addKeyBindings :: XConfig l -> XConfig l
addKeyBindings c = additionalKeysP c
    [
      ("M-b", spawn myBrowser)
    , ("M-<Return>", spawn myTerminal)
    , ("M-<Backspace>", kill)
    ]

removeKeyBindings :: XConfig l -> XConfig l
removeKeyBindings c = removeKeysP c [ "M-S-c" ]

myKeys :: XConfig l -> XConfig l
myKeys = addKeyBindings . removeKeyBindings

main = xmonad $ do
    apply $ myKeys
    modMask =: mod4Mask
