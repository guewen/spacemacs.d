;;; packages.el --- blog layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Guewen Baconnier <guewen@anduril>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `blog-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `blog/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `blog/pre-init-PACKAGE' and/or
;;   `blog/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst blog-packages
  '(
    ;;(org-page :location local)
    org-page
    ))

;; see https://github.com/wjain/spacemacs.d/blob/master/layers/myorg/packages.el#L80
(defun blog/init-org-page ()

  (spacemacs/declare-prefix "ab" "blog")
  (use-package org-page
    :defer t
    ;; :commands (op/do-publication op/new-post op/new-repository)
    :init
    (progn
      (require 'org-page)
        (setq op/repository-directory "~/guewen.github.io/")
        (setq op/site-domain "https://guewen.github.io/")
        (setq op/personal-github-link "https://github.com/guewen/")
        ;; This two are optional, only needed for a custom theme
        ;; (setq op/theme-root-directory "~/.spacemacs.d/layers/blog/themes/")
        ;; (setq op/theme 'kactus)
        (setq op/site-main-title "Guewen Baconnier")
        (setq op/site-sub-title "(ﾉ◕ヮ◕)ﾉ*:・ﾟ✧")
        (spacemacs/set-leader-keys
          "abp" 'op/do-publication-and-preview-site
          "abP" 'op/do-publication)
      )
    )
  )

;;; packages.el ends here
