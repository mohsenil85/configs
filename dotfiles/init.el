(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t )
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(defvar my-packages '(ac-dabbrev
                      ac-slime
                      aggressive-indent
                      better-defaults
                      color-theme-sanityinc-tomorrow
                      company eval-sexp-fu
                      evil-snipe evil-space
                      evil-surround
                      evil-tabs
                      elscreen
                      evil-terminal-cursor-changer
                      evil-tutor
                      evil-visual-mark-mode
                      evil-visualstar evil
                      flx-ido
                      flx-isearch
                      flx
                      flylisp
                      geiser
                      go-autocomplete
                      auto-complete
                      goto-chg
                      guru-mode highlight hippie-exp-ext
                      hippie-expand-slime hippie-namespace hl-sexp
                      ido-better-flex ido-vertical-mode linear-undo
                      linum-relative lisp-editing
                      lisp-extra-font-lock lisp-infection names popup
                      powerline projectile pkg-info epl dash
                      rainbow-delimiters rcirc-color s
                      scheme-complete slime sotlisp starter-kit-lisp elisp-slime-nav starter-kit magit git-rebase-mode git-commit-mode cl-lib ido-ubiquitous smex find-file-in-project idle-highlight-mode paredit switch-window undo-tree

                      ))


(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(load-theme 'sanityinc-tomorrow-night t)

(require 'flx-ido)
(require 'cl)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
                                        ;     disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
                                        ;
(global-aggressive-indent-mode 1)
(global-set-key (kbd "C-x o") 'switch-window)

(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
   ;;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(require 'slime-autoloads)
(add-to-list 'slime-contribs 'slime-fancy)
(setq inferior-lisp-program "/usr/bin/sbcl")
(load (expand-file-name "~/projects/lisp/quicklisp/slime-helper.el"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-rainbow-delimiters-mode t)
 '(scheme-program-name "csi -:c"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun slime-tab ()
  "slime-mode tab dwim, either indent, complete symbol or yas/expand"
  (interactive)
  (let ((r (slime-indent-and-complete-symbol)))
    (unless r
      (yas/expand))))

(defun my-slime-mode-hook ()
  (interactive)
  (define-key slime-mode-map (kbd "<tab>")
    'slime-tab)
  )
(add-hook 'slime-mode-hook 'my-slime-mode-hook)

(powerline-default-theme)
