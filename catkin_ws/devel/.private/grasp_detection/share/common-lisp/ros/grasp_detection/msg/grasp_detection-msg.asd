
(cl:in-package :asdf)

(defsystem "grasp_detection-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "BoundingBox2D" :depends-on ("_package_BoundingBox2D"))
    (:file "_package_BoundingBox2D" :depends-on ("_package"))
    (:file "BoundingBox2DArray" :depends-on ("_package_BoundingBox2DArray"))
    (:file "_package_BoundingBox2DArray" :depends-on ("_package"))
    (:file "BoundingBox3D" :depends-on ("_package_BoundingBox3D"))
    (:file "_package_BoundingBox3D" :depends-on ("_package"))
    (:file "BoundingBox3DArray" :depends-on ("_package_BoundingBox3DArray"))
    (:file "_package_BoundingBox3DArray" :depends-on ("_package"))
    (:file "Grasp" :depends-on ("_package_Grasp"))
    (:file "_package_Grasp" :depends-on ("_package"))
    (:file "Perception" :depends-on ("_package_Perception"))
    (:file "_package_Perception" :depends-on ("_package"))
    (:file "PerceptionSingleCamera" :depends-on ("_package_PerceptionSingleCamera"))
    (:file "_package_PerceptionSingleCamera" :depends-on ("_package"))
  ))