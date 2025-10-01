;; Auto-generated. Do not edit!


(when (boundp 'grasp_detection::BoundingBox3D)
  (if (not (find-package "GRASP_DETECTION"))
    (make-package "GRASP_DETECTION"))
  (shadow 'BoundingBox3D (find-package "GRASP_DETECTION")))
(unless (find-package "GRASP_DETECTION::BOUNDINGBOX3D")
  (make-package "GRASP_DETECTION::BOUNDINGBOX3D"))

(in-package "ROS")
;;//! \htmlinclude BoundingBox3D.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass grasp_detection::BoundingBox3D
  :super ros::object
  :slots (_object_id _center _size ))

(defmethod grasp_detection::BoundingBox3D
  (:init
   (&key
    ((:object_id __object_id) "")
    ((:center __center) (instance geometry_msgs::Pose :init))
    ((:size __size) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _object_id (string __object_id))
   (setq _center __center)
   (setq _size __size)
   self)
  (:object_id
   (&optional __object_id)
   (if __object_id (setq _object_id __object_id)) _object_id)
  (:center
   (&rest __center)
   (if (keywordp (car __center))
       (send* _center __center)
     (progn
       (if __center (setq _center (car __center)))
       _center)))
  (:size
   (&rest __size)
   (if (keywordp (car __size))
       (send* _size __size)
     (progn
       (if __size (setq _size (car __size)))
       _size)))
  (:serialization-length
   ()
   (+
    ;; string _object_id
    4 (length _object_id)
    ;; geometry_msgs/Pose _center
    (send _center :serialization-length)
    ;; geometry_msgs/Vector3 _size
    (send _size :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _object_id
       (write-long (length _object_id) s) (princ _object_id s)
     ;; geometry_msgs/Pose _center
       (send _center :serialize s)
     ;; geometry_msgs/Vector3 _size
       (send _size :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _object_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _object_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Pose _center
     (send _center :deserialize buf ptr-) (incf ptr- (send _center :serialization-length))
   ;; geometry_msgs/Vector3 _size
     (send _size :deserialize buf ptr-) (incf ptr- (send _size :serialization-length))
   ;;
   self)
  )

(setf (get grasp_detection::BoundingBox3D :md5sum-) "268b39b5abde96a8d0270813498c1aa3")
(setf (get grasp_detection::BoundingBox3D :datatype-) "grasp_detection/BoundingBox3D")
(setf (get grasp_detection::BoundingBox3D :definition-)
      "# A 3D bounding box that can be positioned and rotated about its center (6 DOF)
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
float64 z
")



(provide :grasp_detection/BoundingBox3D "268b39b5abde96a8d0270813498c1aa3")


