
(cl:in-package :asdf)

(defsystem "learning_tf-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Num" :depends-on ("_package_Num"))
    (:file "_package_Num" :depends-on ("_package"))
    (:file "data" :depends-on ("_package_data"))
    (:file "_package_data" :depends-on ("_package"))
  ))