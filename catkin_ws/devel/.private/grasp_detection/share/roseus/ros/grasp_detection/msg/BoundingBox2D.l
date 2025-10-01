;; Auto-generated. Do not edit!


(when (boundp 'grasp_detection::BoundingBox2D)
  (if (not (find-package "GRASP_DETECTION"))
    (make-package "GRASP_DETECTION"))
  (shadow 'BoundingBox2D (find-package "GRASP_DETECTION")))
(unless (find-package "GRASP_DETECTION::BOUNDINGBOX2D")
  (make-package "GRASP_DETECTION::BOUNDINGBOX2D"))

(in-package "ROS")
;;//! \htmlinclude BoundingBox2D.msg.html


(defclass grasp_detection::BoundingBox2D
  :super ros::object
  :slots (_object_id _x_min _y_min _x_max _y_max ))

(defmethod grasp_detection::BoundingBox2D
  (:init
   (&key
    ((:object_id __object_id) "")
    ((:x_min __x_min) 0)
    ((:y_min __y_min) 0)
    ((:x_max __x_max) 0)
    ((:y_max __y_max) 0)
    )
   (send-super :init)
   (setq _object_id (string __object_id))
   (setq _x_min (round __x_min))
   (setq _y_min (round __y_min))
   (setq _x_max (round __x_max))
   (setq _y_max (round __y_max))
   self)
  (:object_id
   (&optional __object_id)
   (if __object_id (setq _object_id __object_id)) _object_id)
  (:x_min
   (&optional __x_min)
   (if __x_min (setq _x_min __x_min)) _x_min)
  (:y_min
   (&optional __y_min)
   (if __y_min (setq _y_min __y_min)) _y_min)
  (:x_max
   (&optional __x_max)
   (if __x_max (setq _x_max __x_max)) _x_max)
  (:y_max
   (&optional __y_max)
   (if __y_max (setq _y_max __y_max)) _y_max)
  (:serialization-length
   ()
   (+
    ;; string _object_id
    4 (length _object_id)
    ;; int32 _x_min
    4
    ;; int32 _y_min
    4
    ;; int32 _x_max
    4
    ;; int32 _y_max
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _object_id
       (write-long (length _object_id) s) (princ _object_id s)
     ;; int32 _x_min
       (write-long _x_min s)
     ;; int32 _y_min
       (write-long _y_min s)
     ;; int32 _x_max
       (write-long _x_max s)
     ;; int32 _y_max
       (write-long _y_max s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _object_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _object_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _x_min
     (setq _x_min (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _y_min
     (setq _y_min (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _x_max
     (setq _x_max (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _y_max
     (setq _y_max (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get grasp_detection::BoundingBox2D :md5sum-) "c4fc0b85aa66abd487251c52c48c7267")
(setf (get grasp_detection::BoundingBox2D :datatype-) "grasp_detection/BoundingBox2D")
(setf (get grasp_detection::BoundingBox2D :definition-)
      "# The message defines the 2D bounding box of a certain object in the image.

# ID or label of the detected object
string object_id

# 2D coordinatses of the bounding box in the image plane
int32 x_min
int32 y_min
int32 x_max
int32 y_max
")



(provide :grasp_detection/BoundingBox2D "c4fc0b85aa66abd487251c52c48c7267")


