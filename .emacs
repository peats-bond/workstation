(package-initialize)

;; packages
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages (quote (go-autocomplete auto-complete git-gutter go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; text file back ups
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
(setq backup-by-copying t)
(setq delete-old-versions t)
(setq kept-new-versions 11)
(setq kept-old-versions 5)
(setq version-control t)

;; text editing
(setq column-number-mode t)
(setq x-select-enable-clipboard t)
(global-linum-mode t) ;; line numbers on the left
(show-paren-mode t) ;; matching parenthesis

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; git
(global-git-gutter-mode +1)

;; golang
(setq gofmt-command "goreturns")
(add-hook 'before-save-hook 'gofmt-before-save)
(require 'go-autocomplete)
