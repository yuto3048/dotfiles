import XMonad
import XMonad.Config.Desktop
import XMonad.Actions.CycleWS
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run

import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps

main = do
--  myStatusBar <- spawnPipe "xmobar"
  xmonad $ defaultConfig
    { terminal = myTerminal
    , modMask = myModMask
    , workspaces = myWorkspaces
    , startupHook = myStartupHook
    , layoutHook = myLayoutHook
    , manageHook = myManageHook
--    , logHook = myLogHook myStatusBar
    , handleEventHook = fullscreenEventHook
--    , startupHook = setWMName "LG3D"
    } `additionalKeys` myAdditionalKeys

myTerminal = "terminator"
myModMask = mod4Mask
myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

myStartupHook = do
    spawn "$HOME/.config/polybar/launch.sh"
--    spawnOnce "nm-applet"

--myLayoutHook = avoidStruts $ ResizableTall 1 (3/100) (1/2) []
myLayoutHook = avoidStruts $ spacing 5 $ gaps [(U,24),(D,4),(L,26),(R,26)]
                    $ layoutHook defaultConfig
myManageHook = manageDocks <+> manageHook defaultConfig
--myLogHook h = dynamicLogWithPP xmobarPP 
--    { ppOutput = hPutStrLn h
--    }

myAdditionalKeys = 
    [ ((mod1Mask .|. controlMask, xK_Right), nextWS)
    , ((mod1Mask .|. controlMask, xK_Left ), prevWS)
    , ((mod1Mask .|. shiftMask,   xK_Right), shiftToNext)
    , ((mod1Mask .|. shiftMask,   xK_Left ), shiftToPrev)
    , ((mod4Mask, xK_p), spawn "rofi -show run")
    ]
