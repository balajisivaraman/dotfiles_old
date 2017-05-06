import XMonad

-- Custom Configuration
myTerminal = "urxvt"
myModMask = mod4Mask

main :: IO()
main = xmonad $ defaultConfig
    { terminal = myTerminal
    , modMask = myModMask
    }
