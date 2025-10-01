;; Auto-generated. Do not edit!


(when (boundp 'gazebo_plugins_local::GazeboGetBoundingBoxes)
  (if (not (find-package "GAZEBO_PLUGINS_LOCAL"))
    (make-package "GAZEBO_PLUGINS_LOCAL"))
  (shadow 'GazeboGetBoundingBoxes (find-package "GAZEBO_PLUGINS_LOCAL")))
(unless (find-package "GAZEBO_PLUGINS_LOCAL::GAZEBOGETBOUNDINGBOXES")
  (make-package "GAZEBO_PLUGINS_LOCAL::GAZEBOGETBOUNDINGBOXES"))
(unless (find-package "GAZEBO_PLUGINS_LOCAL::GAZEBOGETBOUNDINGBOXESREQUEST")
  (make-package "GAZEBO_PLUGINS_LOCAL::GAZEBOGETBOUNDINGBOXESREQUEST"))
(unless (find-package "GAZEBO_PLUGINS_LOCAL::GAZEBOGETBOUNDINGBOXESRESPONSE")
  (make-package "GAZEBO_PLUGINS_LOCAL::GAZEBOGETBOUNDINGBOXESRESPONSE"))

(in-package "ROS")



(if (not (find-package "GRASP_DETECTION"))
  (ros::roseus-add-msgs "grasp_detection"))


(defclass gazebo_plugins_local::GazeboGetBoundingBoxesRequest
  :super ros::object
  :slots ())

(defmethod gazebo_plugins_local::GazeboGetBoundingBoxesRequest
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

(defclass gazebo_plugins_local::GazeboGetBoundingBoxesResponse
  :super ros::object
  :slots (_bboxes_3d ))

(defmethod gazebo_plugins_local::GazeboGetBoundingBoxesResponse
  (:init
   (&key
    ((:bboxes_3d __bboxes_3d) ())
    )
   (send-super :init)
   (setq _bboxes_3d __bboxes_3d)
   self)
  (:bboxes_3d
   (&rest __bboxes_3d)
   (if (keywordp (car __bboxes_3d))
       (send* _bboxes_3d __bboxes_3d)
     (progn
       (if __bboxes_3d (setq _bboxes_3d (car __bboxes_3d)))
       _bboxes_3d)))
  (:serialization-length
   ()
   (+
    ;; grasp_detection/BoundingBox3D[] _bboxes_3d
    (apply #'+ (send-all _bboxes_3d :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; grasp_detection/BoundingBox3D[] _bboxes_3d
     (write-long (length _bboxes_3d) s)
     (dolist (elem _bboxes_3d)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; grasp_detection/BoundingBox3D[] _bboxes_3d
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _bboxes_3d (let (r) (dotimes (i n) (push (instance grasp_detection::BoundingBox3D :init) r)) r))
     (dolist (elem- _bboxes_3d)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass gazebo_plugins_local::GazeboGetBoundingBoxes
  :super ros::object
  :slots ())

(setf (get gazebo_plugins_local::GazeboGetBoundingBoxes :md5sum-) "4a5148ef6b2e02f98aaa72ae4f26020a")
(setf (get gazebo_plugins_local::GazeboGetBoundingBoxes :datatype-) "gazebo_plugins_local/GazeboGetBoundingBoxes")
(setf (get gazebo_plugins_local::GazeboGetBoundingBoxes :request) gazebo_plugins_local::GazeboGetBoundingBoxesRequest)
(setf (get gazebo_plugins_local::GazeboGetBoundingBoxes :response) gazebo_plugins_local::GazeboGetBoundingBoxesResponse)

(defmethod gazebo_plugins_local::GazeboGetBoundingBoxesRequest
  (:response () (instance gazebo_plugins_local::GazeboGetBoundingBoxesResponse :init)))

(setf (get gazebo_plugins_local::GazeboGetBoundingBoxesRequest :md5sum-) "4a5148ef6b2e02f98aaa72ae4f26020a")
(setf (get gazebo_plugins_local::GazeboGetBoundingBoxesRequest :datatype-) "gazebo_plugins_local/GazeboGetBoundingBoxesRequest")
(setf (get gazebo_plugins_local::GazeboGetBoundingBoxesRequest :definition-)
      "---
grasp_detection/BoundingBox3D[] bboxes_3d


================================================================================
MSG: grasp_detection/BoundingBox3D
# A 3D bounding box that can be positioned and rotated about its center (6 DOF)
# Dimensions of this box are in meters

# ID or label of the detected object
string object_id

# The 3D position and orientation of the bounding box center
geometry_msgs/Pose center

# The size of the bounding box, in meters, surrounding the object's center
geometry_msgs/Vector3 size
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

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

(setf (get gazebo_plugins_local::GazeboGetBoundingBoxesResponse :md5sum-) "4a5148ef6b2e02f98aaa72ae4f26020a")
(setf (get gazebo_plugins_local::GazeboGetBoundingBoxesResponse :datatype-) "gazebo_plugins_local/GazeboGetBoundingBoxesResponse")
(setf (get gazebo_plugins_local::GazeboGetBoundingBoxesResponse :definition-)
      "---
grasp_detection/BoundingBox3D[] bboxes_3d


================================================================================
MSG: grasp_detection/BoundingBox3D
# A 3D bounding box that can be positioned and rotated about its center (6 DOF)
# Dimensions of this box are in meters

# ID or label of the detected object
string object_id

# The 3D position and orientation of the bounding box center
geometry_msgs/Pose center

# The size of the bounding box, in meters, surrounding the object's center
geometry_msgs/Vector3 size
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

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



(provide :gazebo_plugins_local/GazeboGetBoundingBoxes "4a5148ef6b2e02f98aaa72ae4f26020a")


