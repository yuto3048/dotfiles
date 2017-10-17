import XMonad
import XMonad.Config.Desktop
import XMonad.Actions.CycleWS
import XMonad.Util.EZConfig (additionalKeys)

main = do
  xmonad $ defaultConfig
    { terminal = myTerminal
    , modMask = myModMask
    , workspaces = myWorkspaces
    } `additionalKeys` myAdditionalKeys

myTerminal = "terminator"
myModMask = mod4Mask
myWorkspaces = ["1","2","3","4"]

myAdditionalKeys = 
    [ ((mod1Mask .|. controlMask, xK_Right), nextWS)
    , ((mod1Mask .|. controlMask, xK_Left ), prevWS)
    , ((mod1Mask .|. shiftMask,   xK_Right), shiftToNext)
    , ((mod1Mask .|. shiftMask,   xK_Left ), shiftToPrev)
    ]
