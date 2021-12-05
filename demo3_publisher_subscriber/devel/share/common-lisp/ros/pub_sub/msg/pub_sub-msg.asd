
(cl:in-package :asdf)

(defsystem "pub_sub-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Spacecraft" :depends-on ("_package_Spacecraft"))
    (:file "_package_Spacecraft" :depends-on ("_package"))
  ))