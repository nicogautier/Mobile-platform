; Auto-generated. Do not edit!


(cl:in-package platform_lift-msg)


;//! \htmlinclude MoveLiftGoal.msg.html

(cl:defclass <MoveLiftGoal> (roslisp-msg-protocol:ros-message)
  ((goal_position
    :reader goal_position
    :initarg :goal_position
    :type cl:fixnum
    :initform 0))
)

(cl:defclass MoveLiftGoal (<MoveLiftGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveLiftGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveLiftGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name platform_lift-msg:<MoveLiftGoal> is deprecated: use platform_lift-msg:MoveLiftGoal instead.")))

(cl:ensure-generic-function 'goal_position-val :lambda-list '(m))
(cl:defmethod goal_position-val ((m <MoveLiftGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader platform_lift-msg:goal_position-val is deprecated.  Use platform_lift-msg:goal_position instead.")
  (goal_position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveLiftGoal>) ostream)
  "Serializes a message object of type '<MoveLiftGoal>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'goal_position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'goal_position)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveLiftGoal>) istream)
  "Deserializes a message object of type '<MoveLiftGoal>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'goal_position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'goal_position)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveLiftGoal>)))
  "Returns string type for a message object of type '<MoveLiftGoal>"
  "platform_lift/MoveLiftGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveLiftGoal)))
  "Returns string type for a message object of type 'MoveLiftGoal"
  "platform_lift/MoveLiftGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveLiftGoal>)))
  "Returns md5sum for a message object of type '<MoveLiftGoal>"
  "6ade19871d93a0d47c904b5b9a7a247f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveLiftGoal)))
  "Returns md5sum for a message object of type 'MoveLiftGoal"
  "6ade19871d93a0d47c904b5b9a7a247f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveLiftGoal>)))
  "Returns full string definition for message of type '<MoveLiftGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%uint16 goal_position  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveLiftGoal)))
  "Returns full string definition for message of type 'MoveLiftGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%uint16 goal_position  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveLiftGoal>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveLiftGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveLiftGoal
    (cl:cons ':goal_position (goal_position msg))
))
