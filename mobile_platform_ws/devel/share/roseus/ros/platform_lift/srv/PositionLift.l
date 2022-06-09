;; Auto-generated. Do not edit!


(when (boundp 'platform_lift::PositionLift)
  (if (not (find-package "PLATFORM_LIFT"))
    (make-package "PLATFORM_LIFT"))
  (shadow 'PositionLift (find-package "PLATFORM_LIFT")))
(unless (find-package "PLATFORM_LIFT::POSITIONLIFT")
  (make-package "PLATFORM_LIFT::POSITIONLIFT"))
(unless (find-package "PLATFORM_LIFT::POSITIONLIFTREQUEST")
  (make-package "PLATFORM_LIFT::POSITIONLIFTREQUEST"))
(unless (find-package "PLATFORM_LIFT::POSITIONLIFTRESPONSE")
  (make-package "PLATFORM_LIFT::POSITIONLIFTRESPONSE"))

(in-package "ROS")





(defclass platform_lift::PositionLiftRequest
  :super ros::object
  :slots ())

(defmethod platform_lift::PositionLiftRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass platform_lift::PositionLiftResponse
  :super ros::object
  :slots (_position ))

(defmethod platform_lift::PositionLiftResponse
  (:init
   (&key
    ((:position __position) 0)
    )
   (send-super :init)
   (setq _position (round __position))
   self)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:serialization-length
   ()
   (+
    ;; uint16 _position
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _position
       (write-word _position s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _position
     (setq _position (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass platform_lift::PositionLift
  :super ros::object
  :slots ())

(setf (get platform_lift::PositionLift :md5sum-) "e6fa9d1b49571c7fff8bae5e451e5e59")
(setf (get platform_lift::PositionLift :datatype-) "platform_lift/PositionLift")
(setf (get platform_lift::PositionLift :request) platform_lift::PositionLiftRequest)
(setf (get platform_lift::PositionLift :response) platform_lift::PositionLiftResponse)

(defmethod platform_lift::PositionLiftRequest
  (:response () (instance platform_lift::PositionLiftResponse :init)))

(setf (get platform_lift::PositionLiftRequest :md5sum-) "e6fa9d1b49571c7fff8bae5e451e5e59")
(setf (get platform_lift::PositionLiftRequest :datatype-) "platform_lift/PositionLiftRequest")
(setf (get platform_lift::PositionLiftRequest :definition-)
      "---
uint16 position  

")

(setf (get platform_lift::PositionLiftResponse :md5sum-) "e6fa9d1b49571c7fff8bae5e451e5e59")
(setf (get platform_lift::PositionLiftResponse :datatype-) "platform_lift/PositionLiftResponse")
(setf (get platform_lift::PositionLiftResponse :definition-)
      "---
uint16 position  

")



(provide :platform_lift/PositionLift "e6fa9d1b49571c7fff8bae5e451e5e59")


