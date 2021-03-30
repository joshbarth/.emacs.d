;;; random-timer.el --- A timer that goes off randomly.
;;; Commentary:
;;; Code:
(defgroup random-timer nil
  "Group for random timer variables."
  :group 'Applications
  :prefix "random-timer-")

(defcustom random-timer-audio-player "aplay"
  "Program to run to play the sound."
  :type 'string
  :group 'random-timer)

(defcustom random-timer-chance 3
  "Percent chance a timer goes off every minute."
  :type 'integer
  :group 'random-timer)

(defcustom random-timer-audio-file "/home/josh/user/sound/string.wav"
  "File to be played when timer goes off."
  :type 'string
  :group 'random-timer)

(defcustom random-timer-audio-file-length 1
  "Length of the audio file in seconds."
  :type 'number
  :group 'random-timer)

(defcustom random-timer-log-file "/home/josh/org/log.csv"
  "File to log timer results to."
  :type 'string
  :group 'random-timer)

(defvar random-timer--alarm nil
  "Alarm that is currently sounding.")

(defvar random-timer--timer nil
  "Main timer for random timer.")

(defun random-timer--ding ()
  "Plays the audio file."
  (when (and (file-exists-p random-timer-audio-file)
             (executable-find random-timer-audio-player))
    (start-process "random-timer-sound-alarm" nil random-timer-audio-player
                   random-timer-audio-file)))

(defun random-timer--log (value)
  "Log VALUE to random-timer-log-file."
  (append-to-file (concat (current-time-string) "," value "\n")
                  nil random-timer-log-file))

(defun random-timer--sound-alarm ()
  "Plays the alarm until stopped, unless an alarm is already sounding."
  (unless random-timer--alarm
    (setq random-timer--alarm
          (run-with-timer 0 random-timer-audio-file-length 'random-timer--ding))))

(defun random-timer--schedule-timer ()
  "Randomly schedule a timer to go off in the next minute."
  (let ((seconds (abs (% (random) 60))))
    (run-with-timer seconds nil 'random-timer--sound-alarm)))

(defun random-timer-silence-alarm ()
  "Silence current alarm."
  (when random-timer--alarm
      (cancel-timer random-timer--alarm)
      (setq random-timer--alarm nil)))

(defun random-timer--maybe-schedule-timer ()
  "Has a random-timer-chance % chance to schedule a timer in the next minute."
  (when (< (% (abs (random)) 100) random-timer-chance)
    (random-timer--schedule-timer)))

(defun random-timer-start ()
  "Start the random timer."
  (interactive)
  (unless random-timer--timer
    (random-timer--log "start")
    (setq random-timer--timer (run-with-timer
                               60 60 'random-timer--maybe-schedule-timer))))

(defun random-timer-stop ()
  "Stop the random timer."
  (interactive)
  (when random-timer--timer
    (random-timer--log "stop")
    (when random-timer--timer
      (cancel-timer random-timer--timer))
    (when random-timer--alarm
      (cancel-timer random-timer--alarm))
    (setq random-timer--timer nil)
    (setq random-timer--alarm nil)))

(defun random-timer-log-true ()
  "Silence alarm and log true."
  (interactive)
  (random-timer-silence-alarm)
  (random-timer--log "t"))

(defun random-timer-log-false ()
  "Silence alarm and log false."
  (interactive)
  (random-timer-silence-alarm)
  (random-timer--log "nil"))

(provide 'random-timer)
;;; random-timer.el ends here
