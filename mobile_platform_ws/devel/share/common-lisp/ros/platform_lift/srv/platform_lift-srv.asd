
(cl:in-package :asdf)

(defsystem "platform_lift-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "PositionLift" :depends-on ("_package_PositionLift"))
    (:file "_package_PositionLift" :depends-on ("_package"))
  ))