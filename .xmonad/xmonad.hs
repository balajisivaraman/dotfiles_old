import XMonad
import XMonad.Util.Cursor

-- Custom Configuration
myTerminal = "/usr/bin/st"
myModMask = mod4Mask

myStartupHook = do
    spawn "~/bin/wm/init-tilingwm"
    setDefaultCursor xC_left_ptr

main :: IO()
main = xmonad $ defaultConfig
    { terminal = myTerminal
    , modMask = myModMask
    , startupHook = myStartupHook
    }
