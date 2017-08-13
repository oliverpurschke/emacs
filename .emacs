(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-output-view-style
   (quote
    (("^dvi$"
      ("^landscape$" "^pstricks$\\|^pst-\\|^psfrag$")
      "%(o?)dvips -t landscape %d -o && gv %f")
     ("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "%(o?)dvips %d -o && gv %f")
     ("^dvi$"
      ("^a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4$" "^landscape$")
      "%(o?)xdvi %dS -paper a4r -s 0 %d")
     ("^dvi$" "^a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4$" "%(o?)xdvi %dS -paper a4 %d")
     ("^dvi$"
      ("^a5\\(?:comb\\|paper\\)$" "^landscape$")
      "%(o?)xdvi %dS -paper a5r -s 0 %d")
     ("^dvi$" "^a5\\(?:comb\\|paper\\)$" "%(o?)xdvi %dS -paper a5 %d")
     ("^dvi$" "^b5paper$" "%(o?)xdvi %dS -paper b5 %d")
     ("^dvi$" "^letterpaper$" "%(o?)xdvi %dS -paper us %d")
     ("^dvi$" "^legalpaper$" "%(o?)xdvi %dS -paper legal %d")
     ("^dvi$" "^executivepaper$" "%(o?)xdvi %dS -paper 7.25x10.5in %d")
     ("^dvi$" "." "%(o?)xdvi %dS %d")
     ("^pdf$" "." "evince %o %(outpage)
")
     ("^html?$" "." "netscape %o"))))
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes nil)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (org org-dropbox org-mobile-sync org-magit org-link-minor-mode ac-R ac-math auto-complete ## neotree magit zotelo visual-ascii-mode remark-mode polymode poker ox-reveal ox-ioslide ox-html5slide ox-gfm org-tree-slide org-pomodoro org-plus-contrib org-pandoc mkdown memolist md-readme markdown-toc markdown-preview-mode markdown-mode+ eww-lnum elpy dic-lookup-w3m cm-mode auctex 0blayout)))
 '(safe-local-variable-values (quote ((noweb-default-code-mode . R-mode))))
 '(transient-mark-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil)))))
(put 'dired-find-alternate-file 'disabled nil)
(set-default-font "Inconsolata-11")


(setq hcz-set-cursor-color-color "")
        (setq hcz-set-cursor-color-buffer "")
        (defun hcz-set-cursor-color-according-to-mode ()
          "change cursor color according to some minor modes."
          ;; set-cursor-color is somewhat costly, so we only call it when needed:
          (let ((color
                 (if buffer-read-only "black"
                   (if overwrite-mode "red"
                     "blue"))))
            (unless (and
                     (string= color hcz-set-cursor-color-color)
                     (string= (buffer-name) hcz-set-cursor-color-buffer))
              (set-cursor-color (setq hcz-set-cursor-color-color color))
              (setq hcz-set-cursor-color-buffer (buffer-name)))))
        (add-hook 'post-command-hook 'hcz-set-cursor-color-according-to-mode)


;;(autoload 'longlines-mode "longlines.el" "Minor mode for editing long lines." t)
;;(add-hook 'text-mode-hook 'longlines-mode) 

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;; matlab.el --- major mode for MATLAB dot-m files
;;
;; Author: Matt Wette <mwette@alumni.caltech.edu>,
;;         Eric M. Ludlam <eludlam@mathworks.com>
;; Maintainer: Eric M. Ludlam <eludlam@mathworks.com>
;; Created: 04 Jan 91
;; Version: 2.3.1
;; Keywords: MATLAB
;;
;; Copyright (C) 1997-2003 Eric M. Ludlam
;; Copyright (C) 1991-1997 Matthew R. Wette

(autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)

;; User Level customizations (You need not use them all):
   ;(setq matlab-indent-function t)	; if you want function bodies indented
   ;(setq matlab-verify-on-save-flag nil) ; turn off auto-verify on save
   ;(defun my-matlab-mode-hook ()
   ;  (setq fill-column 76))		; where auto-fill should wrap
   ;(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
   ;(defun my-matlab-shell-mode-hook ()
   ;	'())
   ;(add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)

;; If you are using a version of MATLAB with the Desktop enabled,
;; you may need to add this:
;;
   ;(setq matlab-shell-command-swithes '("-nojvm"))

;; Please read the mode help for matlab-mode for additional
;; configuration options.
;;
;; Syntax highlighting:
;;   For newer versions of Emacs:
     ;(global-font-lock-mode t)
;;   To get hilit19 support try adding:
     ;(matlab-mode-hilit)



(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
(cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
         (lambda ()
        (abbrev-mode 1)
           (auto-fill-mode 1)
           (if (eq window-system 'x)
               (font-lock-mode 1))))


;; ; activate reftex interface
(setq reftex-plug-into-AUCTeX t)



(setq x-select-enable-clipboard t) (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

(add-to-list 'load-path "~/elisp")

;;(require 'ess-jags-d)
(require 'ssh)
(require 'tramp)

;(autoload 'markdown-mode "markdown-mode"
;   "Major mode for editing Markdown files" t)
;(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
;(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;(defun rmd-mode ()

;  "ESS Markdown mode for rmd files"
;  (interactive)
;  (setq load-path 
;    (append (list "/home/oliver/.emacs.d/elpa/" "/home/oliver/.emacs.d/elpa/polymode-20160217.1228/")
;        load-path))
;  (require 'poly-R)
;  (require 'poly-markdown)    
 
;  (poly-markdown+r-mode))


;; add some packages repos
;; MELPA

(require 'package)
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                          ("gnu" . "http://elpa.gnu.org/packages/")
                          ("marmalade" . "http://marmalade-repo.org/packages/")
			  ("org" . "http://orgmode.org/elpa/")))

; Apparently needed for the package auto-complete (why?)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;;;;;;;;;;;;;;;;;;;;;;


;(package-initialize)
;; maybe uncomment the following
;;(setq url-http-attempt-keepalives nil)

;; MARKDOWN
;(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))

;;; R modes
;(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
;(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
;(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))
;(add-to-list 'auto-mode-alist '("\\.Rpres" . poly-markdown-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;Emacs: How to Install Packages Using ELPA, MELPA;
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;
;;; getting Rmd files to run according to: http://simon.bonners.ca/bonner-lab/wpblog/?p=142

;;; Markdown mode
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ronn?" . markdown-mode) auto-mode-alist))

;;; Polymode
;(setq load-path (append '("/home/oliver/polymode/" "/home/oliver/polymode/modes") load-path))

(require 'poly-R)
(require 'poly-markdown)
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

;;;
(autoload 'gfm-mode "gfm-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;; remove scroll bar
(scroll-bar-mode -1)
;; remove tool bar
(tool-bar-mode -1) 

;; ioslides
;(require 'ox-ioslide)

; (require 'eww)

(require 'markdown-preview-mode)

; add underscore instead of <- in ess
(require 'ess-site)
(ess-toggle-underscore nil)

                                        ; python

;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    ein
    elpy
    flycheck
    material-theme
    py-autopep8))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally

;; PYTHON CONFIGURATION
;; --------------------------------------

(elpy-enable)
(setq elpy-rpc-python-command "/home/oliver/anaconda2/envs/data_science/bin/python")
(setq python-shell-interpreter "/home/oliver/anaconda2/envs/data_science/bin/ipython")

(elpy-use-ipython "/home/oliver/anaconda2/envs/data_science/bin/ipython")
 
; use only if we ipython 5 is needed
;(setq python-shell-interpreter "/home/oliver/anaconda2/envs/my_projects_env_2/bin/ipython" python-shell-interpreter-args "--simple-prompt -i")


;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; init.el ends here
(put 'upcase-region 'disabled nil)


(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))


;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)
;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen


(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

;;; line wrap:
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
