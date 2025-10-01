;; Auto-generated. Do not edit!


(when (boundp 'gazebo_plugins_local::GazeboGetJointsAxes)
  (if (not (find-package "GAZEBO_PLUGINS_LOCAL"))
    (make-package "GAZEBO_PLUGINS_LOCAL"))
  (shadow 'GazeboGetJointsAxes (find-package "GAZEBO_PLUGINS_LOCAL")))
(unless (find-package "GAZEBO_PLUGINS_LOCAL::GAZEBOGETJOINTSAXES")
  (make-package "GAZEBO_PLUGINS_LOCAL::GAZEBOGETJOINTSAXES"))
(unless (find-package "GAZEBO_PLUGINS_LOCAL::GAZEBOGETJOINTSAXESREQUEST")
  (make-package "GAZEBO_PLUGINS_LOCAL::GAZEBOGETJOINTSAXESREQUEST"))
(unless (find-package "GAZEBO_PLUGINS_LOCAL::GAZEBOGETJOINTSAXESRESPONSE")
  (make-package "GAZEBO_PLUGINS_LOCAL::GAZEBOGETJOINTSAXESRESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(if (not (find-package "JOINT_PREDICTION"))
  (ros::roseus-add-msgs "joint_prediction"))


(defclass gazebo_plugins_local::GazeboGetJointsAxesRequest
  :super ros::object
  :slots (_joint_names ))

(defmethod gazebo_plugins_local::GazeboGetJointsAxesRequest
  (:init
   (&key
    ((:joint_names __joint_names) ())
    )
   (send-super :init)
   (setq _joint_names __joint_names)
   self)
  (:joint_names
   (&rest __joint_names)
   (if (keywordp (car __joint_names))
       (send* _joint_names __joint_names)
     (progn
       (if __joint_names (setq _joint_names (car __joint_names)))
       _joint_names)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/String[] _joint_names
    (apply #'+ (send-all _joint_names :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/String[] _joint_names
     (write-long (length _joint_names) s)
     (dolist (elem _joint_names)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/String[] _joint_names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_names (let (r) (dotimes (i n) (push (instance std_msgs::String :init) r)) r))
     (dolist (elem- _joint_names)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass gazebo_plugins_local::GazeboGetJointsAxesResponse
  :super ros::object
  :slots (_joints_axes ))

(defmethod gazebo_plugins_local::GazeboGetJointsAxesResponse
  (:init
   (&key
    ((:joints_axes __joints_axes) ())
    )
   (send-super :init)
   (setq _joints_axes __joints_axes)
   self)
  (:joints_axes
   (&rest __joints_axes)
   (if (keywordp (car __joints_axes))
       (send* _joints_axes __joints_axes)
     (progn
       (if __joints_axes (setq _joints_axes (car __joints_axes)))
       _joints_axes)))
  (:serialization-length
   ()
   (+
    ;; joint_prediction/JointAxis[] _joints_axes
    (apply #'+ (send-all _joints_axes :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; joint_prediction/JointAxis[] _joints_axes
     (write-long (length _joints_axes) s)
     (dolist (elem _joints_axes)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; joint_prediction/JointAxis[] _joints_axes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joints_axes (let (r) (dotimes (i n) (push (instance joint_prediction::JointAxis :init) r)) r))
     (dolist (elem- _joints_axes)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass gazebo_plugins_local::GazeboGetJointsAxes
  :super ros::object
  :slots ())

(setf (get gazebo_plugins_local::GazeboGetJointsAxes :md5sum-) "7e7fae98615461e70f83b405c6a2a27b")
(setf (get gazebo_plugins_local::GazeboGetJointsAxes :datatype-) "gazebo_plugins_local/GazeboGetJointsAxes")
(setf (get gazebo_plugins_local::GazeboGetJointsAxes :request) gazebo_plugins_local::GazeboGetJointsAxesRequest)
(setf (get gazebo_plugins_local::GazeboGetJointsAxes :response) gazebo_plugins_local::GazeboGetJointsAxesResponse)

(defmethod gazebo_plugins_local::GazeboGetJointsAxesRequest
  (:response () (instance gazebo_plugins_local::GazeboGetJointsAxesResponse :init)))

(setf (get gazebo_plugins_local::GazeboGetJointsAxesRequest :md5sum-) "7e7fae98615461e70f83b405c6a2a27b")
(setf (get gazebo_plugins_local::GazeboGetJointsAxesRequest :datatype-) "gazebo_plugins_local/GazeboGetJointsAxesRequest")
(setf (get gazebo_plugins_local::GazeboGetJointsAxesRequest :definition-)
      "# list of joint names  
std_msgs/String[] joint_names

================================================================================
MSG: std_msgs/String
string data
---
# list of joints axes 
joint_prediction/JointAxis[] joints_axes

================================================================================
MSG: joint_prediction/JointAxis
# This message defines the joint axes of a robot. 

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
")

(setf (get gazebo_plugins_local::GazeboGetJointsAxesResponse :md5sum-) "7e7fae98615461e70f83b405c6a2a27b")
(setf (get gazebo_plugins_local::GazeboGetJointsAxesResponse :datatype-) "gazebo_plugins_local/GazeboGetJointsAxesResponse")
(setf (get gazebo_plugins_local::GazeboGetJointsAxesResponse :definition-)
      "# list of joint names  
std_msgs/String[] joint_names

================================================================================
MSG: std_msgs/String
string data
---
# list of joints axes 
joint_prediction/JointAxis[] joints_axes

================================================================================
MSG: joint_prediction/JointAxis
# This message defines the joint axes of a robot. 

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
")



(provide :gazebo_plugins_local/GazeboGetJointsAxes "7e7fae98615461e70f83b405c6a2a27b")


