; Auto-generated. Do not edit!


(cl:in-package grasp_detection-msg)


;//! \htmlinclude BoundingBox2DArray.msg.html

(cl:defclass <BoundingBox2DArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (detections
    :reader detections
    :initarg :detections
    :type (cl:vector grasp_detection-msg:BoundingBox2D)
   :initform (cl:make-array 0 :element-type 'grasp_detection-msg:BoundingBox2D :initial-element (cl:make-instance 'grasp_detection-msg:BoundingBox2D))))
)

(cl:defclass BoundingBox2DArray (<BoundingBox2DArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BoundingBox2DArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BoundingBox2DArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasp_detection-msg:<BoundingBox2DArray> is deprecated: use grasp_detection-msg:BoundingBox2DArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BoundingBox2DArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_detection-msg:header-val is deprecated.  Use grasp_detection-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'detections-val :lambda-list '(m))
(cl:defmethod detections-val ((m <BoundingBox2DArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_detection-msg:detections-val is deprecated.  Use grasp_detection-msg:detections instead.")
  (detections m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BoundingBox2DArray>) ostream)
  "Serializes a message object of type '<BoundingBox2DArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'detections))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'detections))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BoundingBox2DArray>) istream)
  "Deserializes a message object of type '<BoundingBox2DArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'detections) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'detections)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'grasp_detection-msg:BoundingBox2D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BoundingBox2DArray>)))
  "Returns string type for a message object of type '<BoundingBox2DArray>"
  "grasp_detection/BoundingBox2DArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BoundingBox2DArray)))
  "Returns string type for a message object of type 'BoundingBox2DArray"
  "grasp_detection/BoundingBox2DArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BoundingBox2DArray>)))
  "Returns md5sum for a message object of type '<BoundingBox2DArray>"
  "8808fd7ac6a4a8b8ea412f6bc79036f7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BoundingBox2DArray)))
  "Returns md5sum for a message object of type 'BoundingBox2DArray"
  "8808fd7ac6a4a8b8ea412f6bc79036f7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BoundingBox2DArray>)))
  "Returns full string definition for message of type '<BoundingBox2DArray>"
  (cl:format cl:nil "# This message contains array of BoundingBox2D messages ~%~%std_msgs/Header header~%~%BoundingBox2D[] detections~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: grasp_detection/BoundingBox2D~%# The message defines the 2D bounding box of a certain object in the image.~%~%# ID or label of the detected object~%string object_id~%~%# 2D coordinatses of the bounding box in the image plane~%int32 x_min~%int32 y_min~%int32 x_max~%int32 y_max~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BoundingBox2DArray)))
  "Returns full string definition for message of type 'BoundingBox2DArray"
  (cl:format cl:nil "# This message contains array of BoundingBox2D messages ~%~%std_msgs/Header header~%~%BoundingBox2D[] detections~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: grasp_detection/BoundingBox2D~%# The message defines the 2D bounding box of a certain object in the image.~%~%# ID or label of the detected object~%string object_id~%~%# 2D coordinatses of the bounding box in the image plane~%int32 x_min~%int32 y_min~%int32 x_max~%int32 y_max~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BoundingBox2DArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'detections) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BoundingBox2DArray>))
  "Converts a ROS message object to a list"
  (cl:list 'BoundingBox2DArray
    (cl:cons ':header (header msg))
    (cl:cons ':detections (detections msg))
))
