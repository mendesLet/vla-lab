;; Auto-generated. Do not edit!


(when (boundp 'grasp_detection::BoundingBox2DArray)
  (if (not (find-package "GRASP_DETECTION"))
    (make-package "GRASP_DETECTION"))
  (shadow 'BoundingBox2DArray (find-package "GRASP_DETECTION")))
(unless (find-package "GRASP_DETECTION::BOUNDINGBOX2DARRAY")
  (make-package "GRASP_DETECTION::BOUNDINGBOX2DARRAY"))

(in-package "ROS")
;;//! \htmlinclude BoundingBox2DArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass grasp_detection::BoundingBox2DArray
  :super ros::object
  :slots (_header _detections ))

(defmethod grasp_detection::BoundingBox2DArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:detections __detections) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _detections __detections)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:detections
   (&rest __detections)
   (if (keywordp (car __detections))
       (send* _detections __detections)
     (progn
       (if __detections (setq _detections (car __detections)))
       _detections)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; grasp_detection/BoundingBox2D[] _detections
    (apply #'+ (send-all _detections :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; grasp_detection/BoundingBox2D[] _detections
     (write-long (length _detections) s)
     (dolist (elem _detections)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; grasp_detection/BoundingBox2D[] _detections
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _detections (let (r) (dotimes (i n) (push (instance grasp_detection::BoundingBox2D :init) r)) r))
     (dolist (elem- _detections)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get grasp_detection::BoundingBox2DArray :md5sum-) "8808fd7ac6a4a8b8ea412f6bc79036f7")
(setf (get grasp_detection::BoundingBox2DArray :datatype-) "grasp_detection/BoundingBox2DArray")
(setf (get grasp_detection::BoundingBox2DArray :definition-)
      "# This message contains array of BoundingBox2D messages 

std_msgs/Header header

BoundingBox2D[] detections
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: grasp_detection/BoundingBox2D
# The message defines the 2D bounding box of a certain object in the image.

# ID or label of the detected object
string object_id

# 2D coordinatses of the bounding box in the image plane
int32 x_min
int32 y_min
int32 x_max
int32 y_max
")



(provide :grasp_detection/BoundingBox2DArray "8808fd7ac6a4a8b8ea412f6bc79036f7")


