import XMonad

-- Custom Configuration
myTerminal = "urxvt"
myModMask = mod4Mask

myStartupHook = do
    spawn "~/bin/wm/init-tilingwm"

main :: IO()
main = xmonad $ defaultConfig
    { terminal = myTerminal
    , modMask = myModMask
    , startupHook = myStartupHook
    }
