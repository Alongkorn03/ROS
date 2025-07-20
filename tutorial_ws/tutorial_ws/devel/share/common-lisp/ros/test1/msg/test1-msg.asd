
(cl:in-package :asdf)

(defsystem "test1-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "messages" :depends-on ("_package_messages"))
    (:file "_package_messages" :depends-on ("_package"))
  ))