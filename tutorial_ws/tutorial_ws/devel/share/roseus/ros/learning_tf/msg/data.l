;; Auto-generated. Do not edit!


(when (boundp 'learning_tf::data)
  (if (not (find-package "LEARNING_TF"))
    (make-package "LEARNING_TF"))
  (shadow 'data (find-package "LEARNING_TF")))
(unless (find-package "LEARNING_TF::DATA")
  (make-package "LEARNING_TF::DATA"))

(in-package "ROS")
;;//! \htmlinclude data.msg.html


(defclass learning_tf::data
  :super ros::object
  :slots (_encl ))

(defmethod learning_tf::data
  (:init
   (&key
    ((:encl __encl) 0.0)
    )
   (send-super :init)
   (setq _encl (float __encl))
   self)
  (:encl
   (&optional __encl)
   (if __encl (setq _encl __encl)) _encl)
  (:serialization-length
   ()
   (+
    ;; float32 _encl
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _encl
       (sys::poke _encl (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _encl
     (setq _encl (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get learning_tf::data :md5sum-) "7df7554d5ca6fa53e385357d20f9e997")
(setf (get learning_tf::data :datatype-) "learning_tf/data")
(setf (get learning_tf::data :definition-)
      "float32 encl

")



(provide :learning_tf/data "7df7554d5ca6fa53e385357d20f9e997")


