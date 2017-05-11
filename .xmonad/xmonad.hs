import XMonad
import XMonad.Config
import XMonad.Util.Cursor
import XMonad.Util.NamedActions
import XMonad.Util.EZConfig
import XMonad.Util.Run (spawnPipe)
import XMonad.Layout.Spacing
import XMonad.Layout.NoFrillsDecoration
import XMonad.Layout.Decoration
import System.IO

-------------------------------------------------------------------------
-- Config Init                                                          {{{
-------------------------------------------------------------------------
main :: IO()
main = do
    xmonad
       $ addDescrKeys ((myModMask, xK_F1), showKeybindings) myKeys
       $ myConfig

myConfig = def
    { borderWidth = myBorder
    , terminal = myTerminal
    , modMask = myModMask
    , startupHook = myStartupHook
    , focusFollowsMouse = myFocusFollowsMouse
    , layoutHook = myLayoutHook
    }

------------------------------------------------------------------------}}}
-- Custom Overrides                                                     {{{
-------------------------------------------------------------------------

myTerminal = "/usr/bin/st"
myModMask = mod4Mask
myLauncher = "rofi -matching fuzzy -modi combi -show combi -combi-modi run,drun"
myFocusFollowsMouse = False

------------------------------------------------------------------------}}}
-- Theme                                                                {{{
---------------------------------------------------------------------------

-- Solarized Colors, taken from https://github.com/altercation/solarized
base03  = "#002b36"
base02  = "#073642"
base01  = "#586e75"
base00  = "#657b83"
base0   = "#839496"
base1   = "#93a1a1"
base2   = "#eee8d5"
base3   = "#fdf6e3"
yellow  = "#b58900"
orange  = "#cb4b16"
red     = "#dc322f"
magenta = "#d33682"
violet  = "#6c71c4"
blue    = "#268bd2"
cyan    = "#2aa198"
green   = "#859900"

myNormalBorderColor     = "#000000"
myFocusedBorderColor    = active

active      = blue
activeWarn  = red
inactive    = base02
focusColor  = blue
unfocusColor = base02

myBorder = 0
topBar = 10
mySpacing = spacing 10

myFont = "-*-terminus-medium-*-*-*-*-160-*-*-*-*-*-*"

topBarTheme = def
    { fontName              = myFont
    , inactiveBorderColor   = base03
    , inactiveColor         = base03
    , inactiveTextColor     = base03
    , activeBorderColor     = active
    , activeColor           = active
    , activeTextColor       = active
    , urgentBorderColor     = red
    , urgentTextColor       = yellow
    , decoHeight            = topBar
    }

addTopBar = noFrillsDeco shrinkText topBarTheme
myLayoutHook = addTopBar $ mySpacing $ Tall 1 (3/100) (1/2)

myStartupHook = do
    setDefaultCursor xC_left_ptr

------------------------------------------------------------------------}}}
-- Keybindings                                                          {{{
---------------------------------------------------------------------------
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


showKeybindings :: [((KeyMask, KeySym), NamedAction)] -> NamedAction
showKeybindings x = addName "Show Keybindings" $ io $ do
    h <- spawnPipe "zenity --text-info --font=terminus"
    hPutStr h (unlines $ showKm x)
    hClose h
    return ()
------------------------------------------------------------------------}}}
