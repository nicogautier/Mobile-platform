; Auto-generated. Do not edit!


(cl:in-package platform_lift-srv)


;//! \htmlinclude PositionLift-request.msg.html

(cl:defclass <PositionLift-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass PositionLift-request (<PositionLift-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PositionLift-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PositionLift-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name platform_lift-srv:<PositionLift-request> is deprecated: use platform_lift-srv:PositionLift-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PositionLift-request>) ostream)
  "Serializes a message object of type '<PositionLift-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PositionLift-request>) istream)
  "Deserializes a message object of type '<PositionLift-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PositionLift-request>)))
  "Returns string type for a service object of type '<PositionLift-request>"
  "platform_lift/PositionLiftRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PositionLift-request)))
  "Returns string type for a service object of type 'PositionLift-request"
  "platform_lift/PositionLiftRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PositionLift-request>)))
  "Returns md5sum for a message object of type '<PositionLift-request>"
  "e6fa9d1b49571c7fff8bae5e451e5e59")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PositionLift-request)))
  "Returns md5sum for a message object of type 'PositionLift-request"
  "e6fa9d1b49571c7fff8bae5e451e5e59")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PositionLift-request>)))
  "Returns full string definition for message of type '<PositionLift-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PositionLift-request)))
  "Returns full string definition for message of type 'PositionLift-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PositionLift-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PositionLift-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PositionLift-request
))
;//! \htmlinclude PositionLift-response.msg.html

(cl:defclass <PositionLift-response> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type cl:fixnum
    :initform 0))
)

(cl:defclass PositionLift-response (<PositionLift-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PositionLift-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PositionLift-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name platform_lift-srv:<PositionLift-response> is deprecated: use platform_lift-srv:PositionLift-response instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <PositionLift-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader platform_lift-srv:position-val is deprecated.  Use platform_lift-srv:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PositionLift-response>) ostream)
  "Serializes a message object of type '<PositionLift-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'position)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PositionLift-response>) istream)
  "Deserializes a message object of type '<PositionLift-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'position)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PositionLift-response>)))
  "Returns string type for a service object of type '<PositionLift-response>"
  "platform_lift/PositionLiftResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PositionLift-response)))
  "Returns string type for a service object of type 'PositionLift-response"
  "platform_lift/PositionLiftResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PositionLift-response>)))
  "Returns md5sum for a message object of type '<PositionLift-response>"
  "e6fa9d1b49571c7fff8bae5e451e5e59")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PositionLift-response)))
  "Returns md5sum for a message object of type 'PositionLift-response"
  "e6fa9d1b49571c7fff8bae5e451e5e59")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PositionLift-response>)))
  "Returns full string definition for message of type '<PositionLift-response>"
  (cl:format cl:nil "uint16 position  ~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PositionLift-response)))
  "Returns full string definition for message of type 'PositionLift-response"
  (cl:format cl:nil "uint16 position  ~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PositionLift-response>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PositionLift-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PositionLift-response
    (cl:cons ':position (position msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PositionLift)))
  'PositionLift-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PositionLift)))
  'PositionLift-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PositionLift)))
  "Returns string type for a service object of type '<PositionLift>"
  "platform_lift/PositionLift")