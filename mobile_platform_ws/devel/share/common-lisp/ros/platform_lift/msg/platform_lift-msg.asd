
(cl:in-package :asdf)

(defsystem "platform_lift-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "MoveLiftAction" :depends-on ("_package_MoveLiftAction"))
    (:file "_package_MoveLiftAction" :depends-on ("_package"))
    (:file "MoveLiftActionFeedback" :depends-on ("_package_MoveLiftActionFeedback"))
    (:file "_package_MoveLiftActionFeedback" :depends-on ("_package"))
    (:file "MoveLiftActionGoal" :depends-on ("_package_MoveLiftActionGoal"))
    (:file "_package_MoveLiftActionGoal" :depends-on ("_package"))
    (:file "MoveLiftActionResult" :depends-on ("_package_MoveLiftActionResult"))
    (:file "_package_MoveLiftActionResult" :depends-on ("_package"))
    (:file "MoveLiftFeedback" :depends-on ("_package_MoveLiftFeedback"))
    (:file "_package_MoveLiftFeedback" :depends-on ("_package"))
    (:file "MoveLiftGoal" :depends-on ("_package_MoveLiftGoal"))
    (:file "_package_MoveLiftGoal" :depends-on ("_package"))
    (:file "MoveLiftResult" :depends-on ("_package_MoveLiftResult"))
    (:file "_package_MoveLiftResult" :depends-on ("_package"))
  ))