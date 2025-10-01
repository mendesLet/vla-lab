
(cl:in-package :asdf)

(defsystem "gazebo_plugins_local-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :grasp_detection-msg
               :joint_prediction-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "GazeboGetBoundingBoxes" :depends-on ("_package_GazeboGetBoundingBoxes"))
    (:file "_package_GazeboGetBoundingBoxes" :depends-on ("_package"))
    (:file "GazeboGetJointsAxes" :depends-on ("_package_GazeboGetJointsAxes"))
    (:file "_package_GazeboGetJointsAxes" :depends-on ("_package"))
  ))