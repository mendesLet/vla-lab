;; Auto-generated. Do not edit!


(when (boundp 'joint_prediction::JointAxis)
  (if (not (find-package "JOINT_PREDICTION"))
    (make-package "JOINT_PREDICTION"))
  (shadow 'JointAxis (find-package "JOINT_PREDICTION")))
(unless (find-package "JOINT_PREDICTION::JOINTAXIS")
  (make-package "JOINT_PREDICTION::JOINTAXIS"))

(in-package "ROS")
;;//! \htmlinclude JointAxis.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass joint_prediction::JointAxis
  :super ros::object
  :slots (_joint_name _axis _origin _type ))

(defmethod joint_prediction::JointAxis
  (:init
   (&key
    ((:joint_name __joint_name) (instance std_msgs::String :init))
    ((:axis __axis) (instance geometry_msgs::Vector3 :init))
    ((:origin __origin) (instance geometry_msgs::Vector3 :init))
    ((:type __type) 0)
    )
   (send-super :init)
   (setq _joint_name __joint_name)
   (setq _axis __axis)
   (setq _origin __origin)
   (setq _type (round __type))
   self)
  (:joint_name
   (&rest __joint_name)
   (if (keywordp (car __joint_name))
       (send* _joint_name __joint_name)
     (progn
       (if __joint_name (setq _joint_name (car __joint_name)))
       _joint_name)))
  (:axis
   (&rest __axis)
   (if (keywordp (car __axis))
       (send* _axis __axis)
     (progn
       (if __axis (setq _axis (car __axis)))
       _axis)))
  (:origin
   (&rest __origin)
   (if (keywordp (car __origin))
       (send* _origin __origin)
     (progn
       (if __origin (setq _origin (car __origin)))
       _origin)))
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:serialization-length
   ()
   (+
    ;; std_msgs/String _joint_name
    (send _joint_name :serialization-length)
    ;; geometry_msgs/Vector3 _axis
    (send _axis :serialization-length)
    ;; geometry_msgs/Vector3 _origin
    (send _origin :serialization-length)
    ;; uint8 _type
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/String _joint_name
       (send _joint_name :serialize s)
     ;; geometry_msgs/Vector3 _axis
       (send _axis :serialize s)
     ;; geometry_msgs/Vector3 _origin
       (send _origin :serialize s)
     ;; uint8 _type
       (write-byte _type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/String _joint_name
     (send _joint_name :deserialize buf ptr-) (incf ptr- (send _joint_name :serialization-length))
   ;; geometry_msgs/Vector3 _axis
     (send _axis :deserialize buf ptr-) (incf ptr- (send _axis :serialization-length))
   ;; geometry_msgs/Vector3 _origin
     (send _origin :deserialize buf ptr-) (incf ptr- (send _origin :serialization-length))
   ;; uint8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get joint_prediction::JointAxis :md5sum-) "27ce3d6dd4986aa57bba5e4b5251e6d3")
(setf (get joint_prediction::JointAxis :datatype-) "joint_prediction/JointAxis")
(setf (get joint_prediction::JointAxis :definition-)
      "# This message defines the joint axes of a robot. 

# The name of the joint
std_msgs/String joint_name
# Axis direction
geometry_msgs/Vector3 axis
# The origin of axis vector 
geometry_msgs/Vector3 origin
# The joint type (same order as defined in Gazebo)
#   Joint_Type_REVOLUTE = 1,
#   Joint_Type_REVOLUTE2 = 2,
#   Joint_Type_PRISMATIC = 3,
#   Joint_Type_UNIVERSAL = 4,
#   Joint_Type_BALL = 5,
#   Joint_Type_SCREW = 6,
#   Joint_Type_GEARBOX = 7,
#   Joint_Type_FIXED = 8
###########################
uint8 type 



================================================================================
MSG: std_msgs/String
string data

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :joint_prediction/JointAxis "27ce3d6dd4986aa57bba5e4b5251e6d3")


