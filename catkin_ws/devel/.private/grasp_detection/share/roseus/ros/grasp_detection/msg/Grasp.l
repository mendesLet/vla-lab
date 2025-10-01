;; Auto-generated. Do not edit!


(when (boundp 'grasp_detection::Grasp)
  (if (not (find-package "GRASP_DETECTION"))
    (make-package "GRASP_DETECTION"))
  (shadow 'Grasp (find-package "GRASP_DETECTION")))
(unless (find-package "GRASP_DETECTION::GRASP")
  (make-package "GRASP_DETECTION::GRASP"))

(in-package "ROS")
;;//! \htmlinclude Grasp.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass grasp_detection::Grasp
  :super ros::object
  :slots (_object_id _grasp_pose _grasp_width _grasp_depth _grasp_score ))

(defmethod grasp_detection::Grasp
  (:init
   (&key
    ((:object_id __object_id) "")
    ((:grasp_pose __grasp_pose) (instance geometry_msgs::Pose :init))
    ((:grasp_width __grasp_width) 0.0)
    ((:grasp_depth __grasp_depth) 0.0)
    ((:grasp_score __grasp_score) 0.0)
    )
   (send-super :init)
   (setq _object_id (string __object_id))
   (setq _grasp_pose __grasp_pose)
   (setq _grasp_width (float __grasp_width))
   (setq _grasp_depth (float __grasp_depth))
   (setq _grasp_score (float __grasp_score))
   self)
  (:object_id
   (&optional __object_id)
   (if __object_id (setq _object_id __object_id)) _object_id)
  (:grasp_pose
   (&rest __grasp_pose)
   (if (keywordp (car __grasp_pose))
       (send* _grasp_pose __grasp_pose)
     (progn
       (if __grasp_pose (setq _grasp_pose (car __grasp_pose)))
       _grasp_pose)))
  (:grasp_width
   (&optional __grasp_width)
   (if __grasp_width (setq _grasp_width __grasp_width)) _grasp_width)
  (:grasp_depth
   (&optional __grasp_depth)
   (if __grasp_depth (setq _grasp_depth __grasp_depth)) _grasp_depth)
  (:grasp_score
   (&optional __grasp_score)
   (if __grasp_score (setq _grasp_score __grasp_score)) _grasp_score)
  (:serialization-length
   ()
   (+
    ;; string _object_id
    4 (length _object_id)
    ;; geometry_msgs/Pose _grasp_pose
    (send _grasp_pose :serialization-length)
    ;; float64 _grasp_width
    8
    ;; float64 _grasp_depth
    8
    ;; float64 _grasp_score
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _object_id
       (write-long (length _object_id) s) (princ _object_id s)
     ;; geometry_msgs/Pose _grasp_pose
       (send _grasp_pose :serialize s)
     ;; float64 _grasp_width
       (sys::poke _grasp_width (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _grasp_depth
       (sys::poke _grasp_depth (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _grasp_score
       (sys::poke _grasp_score (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _object_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _object_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Pose _grasp_pose
     (send _grasp_pose :deserialize buf ptr-) (incf ptr- (send _grasp_pose :serialization-length))
   ;; float64 _grasp_width
     (setq _grasp_width (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _grasp_depth
     (setq _grasp_depth (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _grasp_score
     (setq _grasp_score (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get grasp_detection::Grasp :md5sum-) "93b875bae0cc2881618b2d917c5f5523")
(setf (get grasp_detection::Grasp :datatype-) "grasp_detection/Grasp")
(setf (get grasp_detection::Grasp :definition-)
      "# This message defines the grasp detection results from the models 
# TODO: consider all other possible information that can be useful for manipulation

string object_id 

# The grasp pose 
geometry_msgs/Pose grasp_pose

# The grasp width
float64 grasp_width 

# The grasp depth 
float64 grasp_depth

# The score of the grasp, which is the probability of the grasp being successful
float64 grasp_score

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

")



(provide :grasp_detection/Grasp "93b875bae0cc2881618b2d917c5f5523")


