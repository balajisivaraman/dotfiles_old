import XMonad
import XMonad.Util.Cursor
import XMonad.Util.NamedActions
import XMonad.Util.EZConfig
import XMonad.Util.Run (spawnPipe)
import System.IO

-- Custom Configuration
myTerminal = "/usr/bin/st"
myModMask = mod4Mask
myLauncher = "rofi -matching fuzzy -modi combi -show combi -combi-modi run,drun"

myStartupHook = do
    setDefaultCursor xC_left_ptr

myKeys conf = let

    subKeys title keys = subtitle title : mkNamedKeymap conf keys

    in
    --------------------------------------------------------
    -- System / Utilities
    --------------------------------------------------------
    subKeys "System"
    [ ("M-q"       , addName "Restart XMonad"           $ spawn "xmonad --restart")
    , ("M-C-q"     , addName "Rebuild & restart XMonad" $ spawn "xmonad --recompile && xmonad --restart")
    ] ^++^

    --------------------------------------------------------
    -- Launchers
    --------------------------------------------------------
    subKeys "Launchers"
    [ ("M-<Space>" , addName "Launcher"                 $ spawn myLauncher) ]

main :: IO()
main = do
    xmonad
       $ addDescrKeys ((myModMask, xK_F1), showKeybindings) myKeys
       $ myConfig

myConfig = defaultConfig
    { terminal = myTerminal
    , modMask = myModMask
    , startupHook = myStartupHook
    }

showKeybindings :: [((KeyMask, KeySym), NamedAction)] -> NamedAction
showKeybindings x = addName "Show Keybindings" $ io $ do
    h <- spawnPipe "zenity --text-info --font=terminus"
    hPutStr h (unlines $ showKm x)
    hClose h
    return ()
