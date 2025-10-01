
(cl:in-package :asdf)

(defsystem "joint_prediction-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "JointAxis" :depends-on ("_package_JointAxis"))
    (:file "_package_JointAxis" :depends-on ("_package"))
  ))