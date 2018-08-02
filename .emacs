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
 '(package-selected-packages
   (quote
    (yaml-mode multiple-cursors markdown-preview-mode ag go-fill-struct neotree go-guru go-rename company company-go git-gutter go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-tooltip ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "steelblue" :foreground "white"))))
 '(go-guru-hl-identifier-face ((t (:background "black")))))

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
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "~/.emacs.d/auto-save/"))))

;; text editing
(menu-bar-mode -1) ;; hide menu bar
(setq x-select-enable-clipboard t)
(global-linum-mode t) ;; line numbers on the left
(setq linum-format "%d ") ;; add space between line numbers and text
(setq column-number-mode t)
(show-paren-mode t) ;; matching parenthesis

;; neotree
(setq neo-smart-open t)
(setq neo-show-hidden-files t)

;; git
(global-git-gutter-mode +1)

;; company (auto-completion)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)
(setq company-echo-delay 0)                          ;; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ;; start autocompletion only after typing

;; markdown
(setq markdown-preview-stylesheets nil) ;; remove awful stylesheets

;; golang
(add-hook 'go-mode-hook (lambda () ;; only enable in go-mode
			  (require 'company-go)
			  (add-hook 'before-save-hook 'gofmt-before-save)
			  (setq gofmt-command "goreturns")
			  (go-guru-hl-identifier-mode) ;; highlight matching variables
			  (setq go-guru-hl-identifier-idle-time 0)
			  (set (make-local-variable 'company-backends) '(company-go))
			  (company-mode)))

