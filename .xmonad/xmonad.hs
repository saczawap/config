import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
     xmproc <- spawnPipe "xmobar"
     _ <- spawn "/usr/bin/setxkbmap -option \"caps:swapescape\""
     xmonad $ defaultConfig
        {borderWidth=0, 
         manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
	, logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        },
        modMask = mod4Mask
        } `additionalKeys`
        [ ((mod4Mask , xK_d), spawn "nautilus --no-desktop")
          ,((mod4Mask , xK_f), spawn "chromium-browser")
          ,((mod4Mask , xK_n), spawn "gnome-screensaver-command -l")
          ,((mod4Mask , xK_m), spawn "gnome-screensaver-command -l; systemctl suspend")
        ]
