; Auto-generated. Do not edit!


(cl:in-package joint_prediction-msg)


;//! \htmlinclude JointAxis.msg.html

(cl:defclass <JointAxis> (roslisp-msg-protocol:ros-message)
  ((joint_name
    :reader joint_name
    :initarg :joint_name
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String))
   (axis
    :reader axis
    :initarg :axis
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (origin
    :reader origin
    :initarg :origin
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0))
)

(cl:defclass JointAxis (<JointAxis>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JointAxis>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JointAxis)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name joint_prediction-msg:<JointAxis> is deprecated: use joint_prediction-msg:JointAxis instead.")))

(cl:ensure-generic-function 'joint_name-val :lambda-list '(m))
(cl:defmethod joint_name-val ((m <JointAxis>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader joint_prediction-msg:joint_name-val is deprecated.  Use joint_prediction-msg:joint_name instead.")
  (joint_name m))

(cl:ensure-generic-function 'axis-val :lambda-list '(m))
(cl:defmethod axis-val ((m <JointAxis>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader joint_prediction-msg:axis-val is deprecated.  Use joint_prediction-msg:axis instead.")
  (axis m))

(cl:ensure-generic-function 'origin-val :lambda-list '(m))
(cl:defmethod origin-val ((m <JointAxis>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader joint_prediction-msg:origin-val is deprecated.  Use joint_prediction-msg:origin instead.")
  (origin m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <JointAxis>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader joint_prediction-msg:type-val is deprecated.  Use joint_prediction-msg:type instead.")
  (type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JointAxis>) ostream)
  "Serializes a message object of type '<JointAxis>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'joint_name) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'axis) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'origin) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JointAxis>) istream)
  "Deserializes a message object of type '<JointAxis>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'joint_name) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'axis) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'origin) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JointAxis>)))
  "Returns string type for a message object of type '<JointAxis>"
  "joint_prediction/JointAxis")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JointAxis)))
  "Returns string type for a message object of type 'JointAxis"
  "joint_prediction/JointAxis")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JointAxis>)))
  "Returns md5sum for a message object of type '<JointAxis>"
  "27ce3d6dd4986aa57bba5e4b5251e6d3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JointAxis)))
  "Returns md5sum for a message object of type 'JointAxis"
  "27ce3d6dd4986aa57bba5e4b5251e6d3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JointAxis>)))
  "Returns full string definition for message of type '<JointAxis>"
  (cl:format cl:nil "# This message defines the joint axes of a robot. ~%~%# The name of the joint~%std_msgs/String joint_name~%# Axis direction~%geometry_msgs/Vector3 axis~%# The origin of axis vector ~%geometry_msgs/Vector3 origin~%# The joint type (same order as defined in Gazebo)~%#   Joint_Type_REVOLUTE = 1,~%#   Joint_Type_REVOLUTE2 = 2,~%#   Joint_Type_PRISMATIC = 3,~%#   Joint_Type_UNIVERSAL = 4,~%#   Joint_Type_BALL = 5,~%#   Joint_Type_SCREW = 6,~%#   Joint_Type_GEARBOX = 7,~%#   Joint_Type_FIXED = 8~%###########################~%uint8 type ~%~%~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JointAxis)))
  "Returns full string definition for message of type 'JointAxis"
  (cl:format cl:nil "# This message defines the joint axes of a robot. ~%~%# The name of the joint~%std_msgs/String joint_name~%# Axis direction~%geometry_msgs/Vector3 axis~%# The origin of axis vector ~%geometry_msgs/Vector3 origin~%# The joint type (same order as defined in Gazebo)~%#   Joint_Type_REVOLUTE = 1,~%#   Joint_Type_REVOLUTE2 = 2,~%#   Joint_Type_PRISMATIC = 3,~%#   Joint_Type_UNIVERSAL = 4,~%#   Joint_Type_BALL = 5,~%#   Joint_Type_SCREW = 6,~%#   Joint_Type_GEARBOX = 7,~%#   Joint_Type_FIXED = 8~%###########################~%uint8 type ~%~%~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JointAxis>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'joint_name))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'axis))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'origin))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JointAxis>))
  "Converts a ROS message object to a list"
  (cl:list 'JointAxis
    (cl:cons ':joint_name (joint_name msg))
    (cl:cons ':axis (axis msg))
    (cl:cons ':origin (origin msg))
    (cl:cons ':type (type msg))
))
