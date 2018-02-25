(require 'package)

;; packages
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages (quote (company company-go git-gutter go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; OS specific
(when (string= system-type "darwin")       
  (setq dired-use-ls-dired nil))

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

;; git
(global-git-gutter-mode +1)

;; auto-complete
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

;; golang
(require 'company-go)
(add-hook 'go-mode-hook (lambda () ;; only enable in go-mode
                         (set (make-local-variable 'company-backends) '(company-go))
			 (company-mode)))
(setq gofmt-command "goreturns")
(add-hook 'before-save-hook 'gofmt-before-save)
