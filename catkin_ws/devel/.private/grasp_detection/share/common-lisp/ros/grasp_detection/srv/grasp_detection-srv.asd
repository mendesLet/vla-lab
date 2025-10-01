
(cl:in-package :asdf)

(defsystem "grasp_detection-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :grasp_detection-msg
)
  :components ((:file "_package")
    (:file "DetectGrasps" :depends-on ("_package_DetectGrasps"))
    (:file "_package_DetectGrasps" :depends-on ("_package"))
  ))