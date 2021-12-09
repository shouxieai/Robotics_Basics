
(cl:in-package :asdf)

(defsystem "srv_cli-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "AddInts" :depends-on ("_package_AddInts"))
    (:file "_package_AddInts" :depends-on ("_package"))
    (:file "Ops" :depends-on ("_package_Ops"))
    (:file "_package_Ops" :depends-on ("_package"))
  ))