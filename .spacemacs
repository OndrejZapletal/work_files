;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     javascript
     ansible
     markdown
     csv
    (auto-completion :variables
                     auto-completion-return-key-behavior 'complete
                     auto-completion-tab-key-behavior 'cycle
                     auto-completion-enable-snippets-in-popup t
                     auto-completion-enable-help-tooltip t
                     :disabled-for org)
    better-defaults
    ;;bibtex
    ;;(c-c++ :variables
           ;;c-c++-default-mode-for-headers 'c++-mode
           ;;c-c++-enable-clang-support t)
    emacs-lisp
    ;;(csharp :variables
            ;;omnisharp-server-executable-path "/home/derekin/sources/omnisharp-server_precompiled/OmniSharp")
    git
    html
    ;;ipython-notebook
    javascript
    ;;latex
    ;;markdown
    org
    ;;pandoc
    (python :variables
            ;; python-enable-yapf-format-on-save t
            python-sort-imports-on-save nil
            python-fill-column 99)
    semantic
    slack
    (shell :variables
           shell-default-shell 'shell
           shell-default-position 'bottom
           shell-default-height 30
           shell-enable-smart-eshell t)
    (spell-checking :variables spell-checking-enable-by-default t)

    ;;spotify
    syntax-checking
    version-control
    yaml
    extra-langs
    )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      org-beautify-theme
                                      cmake-ide
                                      calfw
                                      vlf
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 3
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents bookmarks projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 10
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         spacemacs-dark
                         monokai
                         spacemacs-light
                         solarized-light
                         afternoon
                         solarized-dark
                         zenburn
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.2)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key "<SPC>"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.2
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ;; TODO: Temporary fix for broken helm
   dotspacemacs-helm-use-fuzzy 'source
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
  It is called immediately after `dotspacemacs/init', before layer configuration
executes.
This function is mostly useful for variables that need to be set before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()

  ;;;;;;;;;;;;;;;;;
  ;;;; General ;;;;
  ;;;;;;;;;;;;;;;;;

  ;; Package that provides ASCII calendar
  ;; TODO: Learn how to use it
  (require 'calfw)

  ;; set default directory to ~/projects/
  (setq default-directory "~/projects/")

  ;; enables undo tree history to be saved into file
  ;; (setq undo-tree-auto-save-history t)

  ;; self explenatory
  (setq evil-want-Y-yank-to-eol t)

  ;; Makes emacs write "customization" changes (which I never use) into a
  ;; separate file and not this one. Also prevent errors if that file doesn't
  ;; exist.
  (setq custom-file "~/.spacemacs-custom.el")
  (load custom-file 'noerror)

  ;; Don't move back the cursor one position when exiting insert mode:
  (setq evil-move-cursor-back nil)

  ;; Ctrl + Scroll for text size modification
  (global-set-key [C-mouse-4] 'text-scale-increase)
  (global-set-key [C-mouse-5] 'text-scale-decrease)

  ;; substitutes yes or no responses with y or n
  (fset 'yes-or-no-p 'y-or-n-p)

  ;; documents (e.g. pdf and so on) will be automatically reloaded when they are changed on disk
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  ;; Suppress "Beginning of buffer" and "End of buffer" messages
  (defadvice previous-line (around silencer activate)
    (condition-case nil
        ad-do-it
      ((beginning-of-buffer))))
  (defadvice next-line (around silencer activate)
    (condition-case nil
        ad-do-it
      ((end-of-buffer))))

  ;; Directory for snippets.
  (add-to-list 'yas-snippet-dirs "~/yasnippet")

  ;; Make evil-mode up/down operate in screen lines instead of logical lines
  (define-key evil-motion-state-map "j" 'evil-next-visual-line)
  (define-key evil-motion-state-map "k" 'evil-previous-visual-line)
  ;; Also in visual mode
  (define-key evil-visual-state-map "j" 'evil-next-visual-line)
  (define-key evil-visual-state-map "k" 'evil-previous-visual-line)


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;; Org Mode settings ;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; this is for export to latex
  (require 'ox-latex)
  ;; bibtex is for citations
  (require 'ox-bibtex)

  ;; hide markers of emphasised words in org mode
  (setq org-hide-emphasis-markers t)

  ;; TODO: This doesn't work beacause it fails on the first pdflatex command
  ;; when it doesn't find reference to first glossary term.
  ;; org files are exported in background by default
  (setq org-export-in-background nil)

  ;; directory that is used to compose agenda
  (setq org-agenda-files '("~/projects/org/todo"))

  ;; default file for files
  (setq org-default-notes-file (concat default-directory "org/todo/tasks.org"))

  ;; defines number of org mode levels that will be exported to LATEX
  (setq org-export-headline-levels 6)

  ;; turn off automatic export of \hyperref command
  (setq org-latex-with-hyperref nil)

  ;; this will highlight source code in Org Mode
  (setq org-src-fontify-natively t)

  (setq org-highlight-latex-and-related '(latex script entities))

  ;; Hidden regions in org mode will signified by this character.
  (setq org-ellipsis "↴" )

  ;; definition of todo keywords cycle
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
                (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)"))))

  ;; settings for org mode agenda, adding all TODO from specified file into one agenda
  (setq org-agenda-custom-commands '(("c" "Simple agenda view"
                                      ((agenda "")
                                       (alltodo "")))))

  ;; List of languages that will have executable source code blocks.
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((shell . t)
     (python . t)
     (emacs-lisp . t)))

  ;; Following languages can be executed without confirmation
  (defun my-org-confirm-babel-evaluate (lang body)
    (not (member lang '("python" "shell"))))
  (setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

  ;; Org mode key maps
  (evil-define-key 'normal evil-org-mode-map
    ",r" 'org-todo ;; set flag for heading
    ",e" 'org-export-dispatch ;; org export
    )

  ;; settings for org mode
  (add-hook 'org-mode-hook (lambda ()
                             ;; org files will have beautiful theme
                             (load-theme 'org-beautify)
                             ;; visual line mode is turned on by default
                             (visual-line-mode t)
                             ;; disable line numbers in org mode
                             (linum-mode 0)
                             ))


  ;;;;;;;;;;;;;;;;
  ;;;; Python ;;;;
  ;;;;;;;;;;;;;;;;

  ;; Default python shell interpreter
  (setq python-shell-interpreter "ipython")



  ;; settings for edition of python files
  (add-hook 'python-mode-hook (lambda ()
                                (flycheck-mode 1)
                                (semantic-mode 1)
                                (setq
                                 flycheck-checker 'python-pylint
                                 flycheck-pylintrc "~/.pylintrc"
                                 indent-tabs-mode t
                                 tab-width 4
                                 python-indent-offset 4
                                 standard-indent 4)))



  ;;;;;;;;;;;;;;;;;;;;;
  ;;;; HTML/CSS/JS ;;;;
  ;;;;;;;;;;;;;;;;;;;;;

  (add-hook 'web-mode-hook
            (lambda ()
              (setq
               indent-tabs-mode t
               tab-width 4)))

  (setq web-mode-engines-alist
        '(("php"    . "\\.phtml\\'")
          ("jinja2"  . "\\.jinja2\\."))
        )

  (add-hook 'jinja2-mode-hook
            (lambda ()
              (setq
               indent-tabs-mode t
               tab-width 4)))

  ;;;;;;;;;;;;;;;
  ;;;; C/C++ ;;;;
  ;;;;;;;;;;;;;;;

  ;; optional, must have rtags installed
  ;;(require 'rtags)
  ;;(cmake-ide-setup)

  ;;;; Default styles for c-like languages
  ;;(setq c-default-style
  ;;      '((c-mode . "k&r")
  ;;        (c++-mode . "k&r")
  ;;        (java-mode . "java")
  ;;        (other . "gnu")))

  ;;;; Default indentation for languages.
  ;;(setq-default c-basic-offset 4)


  ;; Slack ;;

  (slack-register-team
   :name "emacs_slack"
   :default t
   :client-id "17844085235.229410480694"
   :client-secret "bbff696df262f27396a9f452bee51535"
   :token "SDCeOktcJo6xdwmecAmdBJN4"
   :subscribed-channels '(general slackbot))


  ;;;;;;;;;;;;;;;
  ;;;; Other ;;;;
  ;;;;;;;;;;;;;;;

  ;; Default indent for css files
  (setq-default css-indent-offset 2)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;; TODO Future updates ;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; I'm planning to add advice to jupt to definition function that would center after jump.
  ;; (defun jump-to-definition-center)
  ;; (defadvice spacemacs/jump-to-definition (after jump-to-definition-center)
  ;;   (evil-scroll-line-to-center)
  ;;   (message "centered"))
  ;; (add-function :after ())

  ;; (defadvice kill-line (after say-ouch activate)
  ;;   (message "Ouch!"))

  ;; (ad-advice 'jump-to-definition-center)


  ;; This is test for very large files
  (require 'vlf-setup)

)
