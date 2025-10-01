; Auto-generated. Do not edit!


(cl:in-package gazebo_plugins_local-srv)


;//! \htmlinclude GazeboGetJointsAxes-request.msg.html

(cl:defclass <GazeboGetJointsAxes-request> (roslisp-msg-protocol:ros-message)
  ((joint_names
    :reader joint_names
    :initarg :joint_names
    :type (cl:vector std_msgs-msg:String)
   :initform (cl:make-array 0 :element-type 'std_msgs-msg:String :initial-element (cl:make-instance 'std_msgs-msg:String))))
)

(cl:defclass GazeboGetJointsAxes-request (<GazeboGetJointsAxes-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GazeboGetJointsAxes-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GazeboGetJointsAxes-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gazebo_plugins_local-srv:<GazeboGetJointsAxes-request> is deprecated: use gazebo_plugins_local-srv:GazeboGetJointsAxes-request instead.")))

(cl:ensure-generic-function 'joint_names-val :lambda-list '(m))
(cl:defmethod joint_names-val ((m <GazeboGetJointsAxes-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_plugins_local-srv:joint_names-val is deprecated.  Use gazebo_plugins_local-srv:joint_names instead.")
  (joint_names m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GazeboGetJointsAxes-request>) ostream)
  "Serializes a message object of type '<GazeboGetJointsAxes-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_names))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'joint_names))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GazeboGetJointsAxes-request>) istream)
  "Deserializes a message object of type '<GazeboGetJointsAxes-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_names)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'std_msgs-msg:String))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GazeboGetJointsAxes-request>)))
  "Returns string type for a service object of type '<GazeboGetJointsAxes-request>"
  "gazebo_plugins_local/GazeboGetJointsAxesRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GazeboGetJointsAxes-request)))
  "Returns string type for a service object of type 'GazeboGetJointsAxes-request"
  "gazebo_plugins_local/GazeboGetJointsAxesRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GazeboGetJointsAxes-request>)))
  "Returns md5sum for a message object of type '<GazeboGetJointsAxes-request>"
  "7e7fae98615461e70f83b405c6a2a27b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GazeboGetJointsAxes-request)))
  "Returns md5sum for a message object of type 'GazeboGetJointsAxes-request"
  "7e7fae98615461e70f83b405c6a2a27b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GazeboGetJointsAxes-request>)))
  "Returns full string definition for message of type '<GazeboGetJointsAxes-request>"
  (cl:format cl:nil "# list of joint names  ~%std_msgs/String[] joint_names~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GazeboGetJointsAxes-request)))
  "Returns full string definition for message of type 'GazeboGetJointsAxes-request"
  (cl:format cl:nil "# list of joint names  ~%std_msgs/String[] joint_names~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GazeboGetJointsAxes-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GazeboGetJointsAxes-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GazeboGetJointsAxes-request
    (cl:cons ':joint_names (joint_names msg))
))
;//! \htmlinclude GazeboGetJointsAxes-response.msg.html

(cl:defclass <GazeboGetJointsAxes-response> (roslisp-msg-protocol:ros-message)
  ((joints_axes
    :reader joints_axes
    :initarg :joints_axes
    :type (cl:vector joint_prediction-msg:JointAxis)
   :initform (cl:make-array 0 :element-type 'joint_prediction-msg:JointAxis :initial-element (cl:make-instance 'joint_prediction-msg:JointAxis))))
)

(cl:defclass GazeboGetJointsAxes-response (<GazeboGetJointsAxes-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GazeboGetJointsAxes-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GazeboGetJointsAxes-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gazebo_plugins_local-srv:<GazeboGetJointsAxes-response> is deprecated: use gazebo_plugins_local-srv:GazeboGetJointsAxes-response instead.")))

(cl:ensure-generic-function 'joints_axes-val :lambda-list '(m))
(cl:defmethod joints_axes-val ((m <GazeboGetJointsAxes-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_plugins_local-srv:joints_axes-val is deprecated.  Use gazebo_plugins_local-srv:joints_axes instead.")
  (joints_axes m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GazeboGetJointsAxes-response>) ostream)
  "Serializes a message object of type '<GazeboGetJointsAxes-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joints_axes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'joints_axes))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GazeboGetJointsAxes-response>) istream)
  "Deserializes a message object of type '<GazeboGetJointsAxes-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joints_axes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joints_axes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'joint_prediction-msg:JointAxis))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GazeboGetJointsAxes-response>)))
  "Returns string type for a service object of type '<GazeboGetJointsAxes-response>"
  "gazebo_plugins_local/GazeboGetJointsAxesResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GazeboGetJointsAxes-response)))
  "Returns string type for a service object of type 'GazeboGetJointsAxes-response"
  "gazebo_plugins_local/GazeboGetJointsAxesResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GazeboGetJointsAxes-response>)))
  "Returns md5sum for a message object of type '<GazeboGetJointsAxes-response>"
  "7e7fae98615461e70f83b405c6a2a27b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GazeboGetJointsAxes-response)))
  "Returns md5sum for a message object of type 'GazeboGetJointsAxes-response"
  "7e7fae98615461e70f83b405c6a2a27b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GazeboGetJointsAxes-response>)))
  "Returns full string definition for message of type '<GazeboGetJointsAxes-response>"
  (cl:format cl:nil "# list of joints axes ~%joint_prediction/JointAxis[] joints_axes~%~%================================================================================~%MSG: joint_prediction/JointAxis~%# This message defines the joint axes of a robot. ~%~%# The name of the joint~%std_msgs/String joint_name~%# Axis direction~%geometry_msgs/Vector3 axis~%# The origin of axis vector ~%geometry_msgs/Vector3 origin~%# The joint type (same order as defined in Gazebo)~%#   Joint_Type_REVOLUTE = 1,~%#   Joint_Type_REVOLUTE2 = 2,~%#   Joint_Type_PRISMATIC = 3,~%#   Joint_Type_UNIVERSAL = 4,~%#   Joint_Type_BALL = 5,~%#   Joint_Type_SCREW = 6,~%#   Joint_Type_GEARBOX = 7,~%#   Joint_Type_FIXED = 8~%###########################~%uint8 type ~%~%~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GazeboGetJointsAxes-response)))
  "Returns full string definition for message of type 'GazeboGetJointsAxes-response"
  (cl:format cl:nil "# list of joints axes ~%joint_prediction/JointAxis[] joints_axes~%~%================================================================================~%MSG: joint_prediction/JointAxis~%# This message defines the joint axes of a robot. ~%~%# The name of the joint~%std_msgs/String joint_name~%# Axis direction~%geometry_msgs/Vector3 axis~%# The origin of axis vector ~%geometry_msgs/Vector3 origin~%# The joint type (same order as defined in Gazebo)~%#   Joint_Type_REVOLUTE = 1,~%#   Joint_Type_REVOLUTE2 = 2,~%#   Joint_Type_PRISMATIC = 3,~%#   Joint_Type_UNIVERSAL = 4,~%#   Joint_Type_BALL = 5,~%#   Joint_Type_SCREW = 6,~%#   Joint_Type_GEARBOX = 7,~%#   Joint_Type_FIXED = 8~%###########################~%uint8 type ~%~%~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GazeboGetJointsAxes-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joints_axes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GazeboGetJointsAxes-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GazeboGetJointsAxes-response
    (cl:cons ':joints_axes (joints_axes msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GazeboGetJointsAxes)))
  'GazeboGetJointsAxes-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GazeboGetJointsAxes)))
  'GazeboGetJointsAxes-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GazeboGetJointsAxes)))
  "Returns string type for a service object of type '<GazeboGetJointsAxes>"
  "gazebo_plugins_local/GazeboGetJointsAxes")