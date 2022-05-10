;;;; exwm:
(require 'exwm)
(require 'exwm-randr)
(setq exwm-randr-workspace-output-plist '(0 "eDP-1" 1 "DP-4"))
(add-hook 'exwm-randr-screen-change-hook
	  (lambda ()
	    (start-process-shell-command
	     "xrandr" nil
	     "xrandr --output eDP-1 --auto --right-of DP-4 --auto")))
(exwm-randr-enable)
(exwm-enable)
