import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers (isFullscreen,  doFullFloat)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Config.Xfce
import XMonad.Layout.NoBorders
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName

myTerminal :: String
myTerminal = "xfce4-terminal"

myBorderWidth :: Dimension
myBorderWidth = 1

myModMask :: KeyMask
myModMask = mod4Mask

myWorkspaces :: [String]
myWorkspaces = ["web","term","emacs","dev","misc"]

main :: IO()
main = xmonad $ xfceConfig
    { terminal = myTerminal
    , borderWidth = myBorderWidth
    , modMask = myModMask
    , workspaces = myWorkspaces
    , manageHook = ( isFullscreen --> doFullFloat ) <+> manageDocks <+> manageHook xfceConfig
    , layoutHook = smartBorders $ avoidStruts $ layoutHook xfceConfig
    , handleEventHook = fullscreenEventHook <+> ewmhDesktopsEventHook
    , startupHook = ewmhDesktopsStartup <+> setWMName "LG3D"
    , normalBorderColor = "#ABABAB"
    , focusedBorderColor = "#800000"
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_e), spawn "thunar")
    , ((mod4Mask .|. shiftMask, xK_c), spawn "firefox")
    , ((mod4Mask .|. shiftMask, xK_v), spawn "vlc")
    , ((mod4Mask .|. shiftMask, xK_k), kill)
    , ((mod4Mask .|. shiftMask, xK_t), spawn myTerminal)
    , ((mod4Mask .|. shiftMask, xK_r), spawn "xfce4-appfinder")
    ]
