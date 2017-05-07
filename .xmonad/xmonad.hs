import XMonad

-- Custom Configuration
myTerminal = "/usr/bin/st"
myModMask = mod4Mask

myStartupHook = do
    spawn "~/bin/wm/init-tilingwm"

main :: IO()
main = xmonad $ defaultConfig
    { terminal = myTerminal
    , modMask = myModMask
    , startupHook = myStartupHook
    }
