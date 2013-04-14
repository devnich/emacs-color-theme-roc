;;; Author: Ethan Schoonover, Solarized; Greg Pfeil, Emacs adaptation
;;; URL: http://ethanschoonover.com/solarized

;;; This file is not (YET) part of GNU Emacs.

;;; # Usage

;;; 1. Install the color-theme package
;;;   (http://www.emacswiki.org/cgi-bin/wiki/ColorTheme)
;;; 2. Load this file
;;; 3. M-x color-theme-roc-[dark|light]

(let ((current-file-name (or load-file-name buffer-file-name)))
  (if current-file-name
    (let* ((reqname (concat (file-name-directory current-file-name)
                            "roc-definitions.el"))
           (compreqname (concat reqname "c")))
      (require 'roc-definitions
               (if (file-exists-p compreqname) compreqname reqname)))
    (require 'roc-definitions)))

(eval-when-compile
  (require 'color-theme))

;;;###autoload
(defun color-theme-roc (mode)
  "Color theme by Ethan Schoonover, created 2011-03-24.
Ported to Emacs by Greg Pfeil, http://ethanschoonover.com/solarized."
  (interactive "Slight or dark? ")
  (color-theme-install
   (let* ((definitions (roc-color-definitions mode))
          (faces (first definitions))
          (variables (second definitions)))
       (roc-color-definitions mode)
     `(,(intern (concat "color-theme-roc-" (symbol-name mode)))
       ,variables
       ,@faces))))

;;;###autoload
(defun color-theme-roc-dark ()
  (interactive)
  (color-theme-roc 'dark))

;;;###autoload
(defun color-theme-roc-light ()
  (interactive)
  (color-theme-roc 'light))

(add-to-list 'color-themes
             `(color-theme-roc-light
               "Roc Light"
               ,roc-description))
(add-to-list 'color-themes
             `(color-theme-roc-dark
               "Roc Dark"
               ,roc-description))

(provide 'color-theme-roc)
