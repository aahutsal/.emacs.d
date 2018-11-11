;;; package --- summary
;; My emacs config initialization file
;; ELPA makes it easy to install packages without tracking down all the
;; different websites. Let's define a function that makes it easy to
;; install packages. I don't actually use this a lot any more, but it can
;; be handy.
;; This sets up the load path so that we can override it

;;; Commentary:
;; ***


(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; (set-specifier menubar-visible-p nil)
;; (set-specifier default-toolbar-visible-p nil)
;; (set-specifier bottom-toolbar-visible-p nil)
;; (set-specifier left-toolbar-visible-p nil)
;; (set-specifier right-toolbar-visible-p nil)
;; (set-specifier top-toolbar-visible-p nil)

(setq x-select-enable-primary 't)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.emacs.d/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

;; now either el-get is `require'd already, or have been `load'ed by the
;; el-get installer.
;; set local recipes, el-get-sources should only accept PLIST element
(setq
 el-get-sources
 '(
   (:name buffer-move; have to add your own keys
          :after (progn
                   (global-set-key (kbd "C-M-p") 'buf-move-up)
                   (global-set-key (kbd "C-M-n") 'buf-move-down)
                   (global-set-key (kbd "C-M-b") 'buf-move-left)
                   (global-set-key (kbd "C-M-f") 'buf-move-right)))

   (:name smex; a better (ido like) M-x
          :after (progn
                   (setq smex-save-file "~/.emacs.d/.smex-items")
                   (global-set-key (kbd "M-x") 'smex)
                   (global-set-key (kbd "M-X") 'smex-major-mode-commands)))

   (:name nodejs-repl; nodejs REPL
          :after (progn
                   (global-set-key (kbd "C-c C-n") 'nodejs-repl)
                   ))
   (:name magit; git meet emacs, and a binding
          :after (progn
                   (global-set-key (kbd "C-x C-z") 'magit-status)
                   ))
   (:name magithub;
          :after (progn
                   ;;initialization
                   ))
   (:name goto-last-change; move pointer back to last change
          :after (progn
                   ;; when using AZERTY keyboard, consider C-x C-_
                   (global-set-key (kbd "C-x C-/") 'goto-last-change)
                   ))
   (:name markdown-mode; markdown
          :after (progn
                   ;;initialization
                   ))
   (:name org-trello;
          :after (progn
                   ;;initialization
                   ))
   (:name docker;
          :after (progn
                   ;;initialization
                   ))
   (:name yasnippet;
          :after (progn
                   ;;initialization
                   ))
   (:name yasnippet-snippets;
          :after (progn
                   ;;initialization
                   ))
   (:name js2-mode;
          :after (progn
                   ;;initialization
                   ))
   (:name js2-refactor;
          :after (progn
                   ;;initialization
                   ))
   (:name flycheck;
          :after (progn
                   ;;initialization
                   ))
   (:name json-mode;
          :after (progn
                   ;;initialization
                   ))
   (:name web-mode;
          :after (progn
                   ;;initialization
                   ))

   (:name editorconfig;
          :after (progn
                   ;;initialization
                   (require 'editorconfig)
                   (editorconfig-mode 1)

                   :ensure t
                   :config
                   (editorconfig-mode 1)
                   ))

   (:name ivy-bibtex;
          :after (progn
                   ;;initialization
                   ))
   (:name docker-tramp;
          :after (progn
                   ;;initialization
                   ))
   (:name skype;
          :after (progn
                   ;;initialization
                   ))
   (:name multi-term;
          :after (progn
                   ;;initialization
                   ))

   (:name js2-mode;
          :after (progn
                   ;;initialization
                   ))
   (:name js2-refactor;
          :after (progn
                   ;;initialization
                   ))
   ;; (:name xfer-js2;
   ;;        :after (progn
   ;;                 ;;initialization
   ;;                 ))
   (:name skewer-mode;
          :after (progn
                   ;;initialization
                   ))
   (:name ac-js2;
          :after (progn
                   ;;initialization
                   ))
   ;; (:name csv;
   ;;        :after (progn
   ;;                 ;;initialization
   ;;                 ))
   (:name psvn;
          :after (progn
                   ;;initialization
                   ))
   (:name org-pomodoro; pomodoro
          :after (progn
                   ;;initialization
                   ))
   (:name tomatinho; pomodoro
          :after (progn
                   ;;initialization
                   (global-set-key (kbd "<f9>") 'tomatinho)
                   ;; (local-set-key (kbd "<return>") 'tomatinho-interactive-new-pomodoro)
                   ))
   ;; (:name org-babel; org-babel
   ;;        :after (progn
   ;;                 ;;initialization
   ;;                 ;; active Org-babel languages
   ;;                 (org-babel-do-load-languages
   ;;                  'org-babel-load-languages
   ;;                  '(;; other Babel languages
   ;;                    (plantuml . t)))

   ;;                 (setq org-plantuml-jar-path "/home/archer/.emacs.d/plantuml.jar")
   ;;                 (defun my-org-confirm-babel-evaluate (lang body)
   ;;                   (not (string= lang "plantuml")))  ; don't ask for ditaa
   ;;                 (setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)
   ;;                 ))
   ))

;; (require 'ng2-mode)

;; now set our own packages
(setq
 my:el-get-packages
 '(el-get ; el-get is self-hosting

   use-package websocket request oauth2 circe alert emojify evil ; needed for slack
   switch-window ; takes over C-x o
   auto-complete ; complete as you type with overlays
   zencoding-mode ; http://www.emacswiki.org/emacs/ZenCoding
   color-theme    ; nice looking emacs
   color-theme-solarized ; check out color-theme-solarized
   emacs-w3m))


                                        ;
;; Some recipes require extra tools to be installed
;;
;; Note: el-get-install requires git, so we know we have at least that.
;;
;; TODO: fix it
;; (when (el-get-executable-find "cvs")
;;   (add-to-list 'my:el-get-packages 'emacs-goodies-el)) ; the debian addons for emacs

;; (when (el-get-executable-find "svn")
;;   (loop for p in '(psvn    ; M-x svn-status
;;                    yasnippet; powerful snippet mode
;;                    )
;;         do (add-to-list 'my:el-get-packages p)))

(setq my:el-get-packages
      (append my:el-get-packages
              (mapcar #'el-get-source-name el-get-sources)))

;; install new packages and init already installed packages
(el-get 'sync my:el-get-packages)


;; (package-initialize nil)
;; (package-initialize t)
;; (setq package-enable-at-startup nil)

;; (defun sacha/package-install (package &optional repository)
;;   "Install PACKAGE if it has not yet been installed. If REPOSITORY is specified, use that."
;;   (unless (package-installed-p package)
;;     (let ((package-archives (if repository
;;                                 (list (assoc repository package-archives))
;;                               package-archives)))
;;     (package-install package))))

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "melpa-stable") t)

(setq-default indent-tabs-mode nil)

;;
;; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; deleting trailing whitespaces before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

;; use local eslint from node_modules before global
;; http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
  "Hooks for Web mode. Adjust indents"
  ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
    (let ((web-mode-enable-part-face nil))
      ad-do-it)
    ad-do-it))
(setq js2-mode-hook
  '(lambda () (progn
    (set-variable 'indent-tabs-mode nil))))

(setq window-system "x")

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)


;; markdown-mode
;; (use-package markdown-mode+
;;   :ensure t
;;   :commands (markdown-mode gfm-mode)
;;   :mode (("README\\.md\\'" . gfm-mode)
;; 	 ("\\.md\\'" . markdown-mode)
;; 	 ("\\.markdown\\'" . markdown-mode))
;;   :init (setq markdown-command "markdown2"))

(require 'org)

(require 'ob)
;; org-mode plantuml
(require 'ob-plantuml)

(setq org-plantuml-jar-path
      (expand-file-name "~/.emacs.d/plantuml.jar"))

;; active Org-babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)))

;; YAS Snippets
;; (el-get-bundle yas)
;; (yas-load-directory "~/.emacs.d/snippets")

;; I keep slightly more sensitive information in a separate file so that I can easily publish my main configuration.
(load "~/.emacs.secrets" t)

;; This is one of the things people usually want to change right away.
;; By default, Emacs saves backup files in the current directory.
;; These are the files ending in =~= that are cluttering up your directory lists.
;; The following code stashes them all in =~/.emacs.d/backups=, where I can find them with =C-x C-f= (=find-file=) if I really need to.

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Disk space is cheap. Save lots.

(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; From http://www.wisdomandwonder.com/wordpress/wp-content/uploads/2014/03/C3F.html
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))

;; My custom keybindings
(global-set-key (kbd "C-x C-o") 'previous-multiframe-window)

;; =winner-mode= lets you use =C-c <left>= and =C-c <right>= to switch between window configurations.
;; This is handy when something has popped up a buffer that you want to look at briefly before returning to whatever you were working on.
;; When you're done, press =C-c <left>=.

(require 'winner)

;; Helm configuraion
;;(load "~/.emacs.d/helm.el" t)

;; In my world, sentences ends with a single space. This makes
;; sentence navigation commands work for me.

(setq sentence-end-double-space nil)

(add-hook 'js2-mode-hook 'js2-refactor-mode)

(load-theme 'wheatgrass t)

;; Mode by file extension
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; Custom functions

;;
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;; kill all dired buffers
(defun kill-all-dired-buffers ()
  "Kill all dired buffers."
  (interactive)
  (save-excursion
    (let ((count 0))
      (dolist (buffer (buffer-list))
        (set-buffer buffer)
        (when (equal major-mode 'php-mode)
          (setq count (1+ count))
          (kill-buffer buffer)))
      (message "Killed %i dired buffer(s)." count))))

(defun kill-next-buffer ()
  "If there are multiple windows, then close the other pane and kill the buffer in it also."
  (interactive)
  (other-window 1)
  (kill-this-buffer))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; custom keybindings
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("a4a04f7c497d2953ccb0efed4753e34db63ca470797e580dd0a227c5019eaa4b" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(fci-rule-color "#073642")
 '(js2-strict-missing-semi-warning nil)
 '(org-trello-current-prefix-keybinding "C-c o" nil (org-trello))
 '(org-trello-files
   (quote
    ("/home/archer/dev/" "/home/archer/Desktop/Projects")) nil (org-trello))
 '(package-selected-packages
   (quote
    (ng2-mode alert restclient-test restclient-helm ob-restclient lsp-intellij smart-tabs-mode w3m react-snippets slack markdown-mode+ ox-ioslide skype nodejs-repl mocha-snippets js2-highlight-vars editorconfig-core discover-js2-refactor chess angular-snippets ac-js2)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil)
 '(yas-global-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Sometimes you want to be able to do fancy things with the text
;; that you're entering into the minibuffer. Sometimes you just want
;; to be able to read it, especially when it comes to lots of text.
;; This binds =C-M-e= in a minibuffer) so that you can edit the
;; contents of the minibuffer before submitting it.

;; FIXME didn't get it
;; (sacha/package-install 'miniedit)
;; (use-package miniedit
;;   :commands minibuffer-edit
;;   :init (miniedit-install))

;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (package-initialize)

;;; IVY
(ivy-mode)

;;;;;; ORG-TRELLO
(require 'org-trello)


;; I'm using use-package and el-get and evil

(use-package alert
             :commands (alert)
             :init
               (setq alert-default-style 'notifier))


(put 'upcase-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

;; skype
(require 'skype)
(setq skype--my-user-handle "gutsal.arsen@gmail.com")
;; multiterm
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(global-set-key (kbd "C-x RET") 'multi-term)

;; tabs
(setq tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;; (require 'smart-tabs-mode)
;; (autoload 'smart-tabs-mode "smart-tabs-mode"
;;   "Intelligently indent with tabs, align with spaces!")
;; (autoload 'smart-tabs-mode-enable "smart-tabs-mode")
;; (autoload 'smart-tabs-advice "smart-tabs-mode")
;; (autoload 'smart-tabs-insinuate "smart-tabs-mode")
;; (smart-tabs-insinuate 'c 'c++ 'java 'javascript 'cperl 'python
;;                       'ruby 'nxml)

(setq nxml-child-indent 2 nxml-attribute-indent 2)

;; Clipboard
(defun my-copy-to-xclipboard(arg)
  (interactive "P")
  (cond
    ((not (use-region-p))
      (message "Nothing to yank to X-clipboard"))
    ((and (not (display-graphic-p))
         (/= 0 (shell-command-on-region
                 (region-beginning) (region-end) "xsel -i -b")))
      (error "Is program `xsel' installed?"))
    (t
      (when (display-graphic-p)
        (call-interactively 'clipboard-kill-ring-save))
      (message "Yanked region to X-clipboard")
      (when arg
        (kill-region  (region-beginning) (region-end)))
      (deactivate-mark))))

(defun my-cut-to-xclipboard()
  (interactive)
  (my-copy-to-xclipboard t))

(defun my-paste-from-xclipboard()
  "Uses shell command `xsel -o' to paste from x-clipboard. With
one prefix arg, pastes from X-PRIMARY, and with two prefix args,
pastes from X-SECONDARY."
  (interactive)
  (if (display-graphic-p)
    (clipboard-yank)
   (let*
     ((opt (prefix-numeric-value current-prefix-arg))
      (opt (cond
       ((=  1 opt) "b")
       ((=  4 opt) "p")
       ((= 16 opt) "s"))))
     (insert (shell-command-to-string (concat "xsel -o -" opt))))))

;; ACE window
(global-set-key (kbd "C-x M-p")     'evil-window-up)
(global-set-key (kbd "C-x M-n")     'evil-window-down)
(global-set-key (kbd "C-x M-f")     'evil-window-right)
(global-set-key (kbd "C-x M-b")     'evil-window-left)
(global-set-key (kbd "C-x M-a")     'ace-window)

;; ac-js-mode

(add-hook 'js2-mode-hook 'ac-js2-mode)

;; nxml
(setq nxml-child-indent 2 nxml-attribute-indent 2)

(require 'docker-tramp-compat)
;; (require 'custom-func)

;; Docker TRAMP
;; Open files in Docker containers like so: /docker:drunk_bardeen:/etc/passwd
(push
 (cons
  "docker"
  '((tramp-login-program "docker")
    (tramp-login-args (("exec" "-it") ("%h") ("/bin/bash")))
    (tramp-remote-shell "/bin/sh")
    (tramp-remote-shell-args ("-i") ("-c"))))
 tramp-methods)

(defadvice tramp-completion-handle-file-name-all-completions
    (around dotemacs-completion-docker activate)
  "(tramp-completion-handle-file-name-all-completions \"\" \"/docker:\" returns
    a list of active Docker container names, followed by colons."
  (if (equal (ad-get-arg 1) "/docker:")
      (let* ((dockernames-raw (shell-command-to-string "docker ps | perl -we 'use strict; $_ = <>; m/^(.*)NAMES/ or die; my $offset = length($1); while(<>) {substr($_, 0, $offset, q()); chomp; for(split m/\\W+/) {print qq($_:\n)} }'"))
             (dockernames (cl-remove-if-not
                           #'(lambda (dockerline) (string-match ":$" dockerline))
                           (split-string dockernames-raw "\n"))))
        (setq ad-return-value dockernames))
    ad-do-it))

;; Skewer mode
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

(el-get-bundle doremi)
(put 'downcase-region 'disabled nil)


;; w3m-search
;;  ------------------------------------------------------------------------------------------------------------------
;; As far as I know, there is no tight integration of CPAN into Emacs, so going through shell will probably be your best
;; bet. If you use w3m-el, you may also find this useful:
;; (add-to-list 'w3m-search-engine-alist '("cpan" "http://search.cpan.org/search?query=%s&n=100"))
;; From within any w3m buffer, I use this and a few keystrokes (C-u S RET cpan RET <search-term>) to find CPAN modules.
;; ------------------------------------------------------------------------------------------------------------------
(require 'w3m-search)
(add-to-list 'w3m-search-engine-alist
             '("stackoverflow" "http://www.stackoverflow.com/search?q=%s")
             '("google" "http://www.stackoverflow.com/search?q=%s")
)
(setq w3m-search-default-engine "stackoverflow")
;;  -----------------------------------------------------------------------------------------------------------------

;; TODO fix it
(defadvice w3m-search (after change-default activate)
  (let ((engine (nth 1 minibuffer-history)))
    (when (assoc engine w3m-search-engine-alist)
      (setq w3m-search-default-engine engine))))

;; Make the previous search engine the default for the next
;; search.;

;; keybindings
(global-set-key (kbd "C-x w s") 'w3m-search)
(global-set-key (kbd "C-x g s") 'w3m-goto-url)

(provide 'init)
