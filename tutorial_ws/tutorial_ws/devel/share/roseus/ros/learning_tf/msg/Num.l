;; Auto-generated. Do not edit!


(when (boundp 'learning_tf::Num)
  (if (not (find-package "LEARNING_TF"))
    (make-package "LEARNING_TF"))
  (shadow 'Num (find-package "LEARNING_TF")))
(unless (find-package "LEARNING_TF::NUM")
  (make-package "LEARNING_TF::NUM"))

(in-package "ROS")
;;//! \htmlinclude Num.msg.html


(defclass learning_tf::Num
  :super ros::object
  :slots (_encl _eclr _vl _vr _angle ))

(defmethod learning_tf::Num
  (:init
   (&key
    ((:encl __encl) 0.0)
    ((:eclr __eclr) 0.0)
    ((:vl __vl) 0.0)
    ((:vr __vr) 0.0)
    ((:angle __angle) 0.0)
    )
   (send-super :init)
   (setq _encl (float __encl))
   (setq _eclr (float __eclr))
   (setq _vl (float __vl))
   (setq _vr (float __vr))
   (setq _angle (float __angle))
   self)
  (:encl
   (&optional __encl)
   (if __encl (setq _encl __encl)) _encl)
  (:eclr
   (&optional __eclr)
   (if __eclr (setq _eclr __eclr)) _eclr)
  (:vl
   (&optional __vl)
   (if __vl (setq _vl __vl)) _vl)
  (:vr
   (&optional __vr)
   (if __vr (setq _vr __vr)) _vr)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; float32 _encl
    4
    ;; float32 _eclr
    4
    ;; float32 _vl
    4
    ;; float32 _vr
    4
    ;; float32 _angle
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _encl
       (sys::poke _encl (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _eclr
       (sys::poke _eclr (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vl
       (sys::poke _vl (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vr
       (sys::poke _vr (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _encl
     (setq _encl (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _eclr
     (setq _eclr (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vl
     (setq _vl (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vr
     (setq _vr (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angle
     (setq _angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get learning_tf::Num :md5sum-) "cd8c1b28c2ce359c8b3645a5240d4d70")
(setf (get learning_tf::Num :datatype-) "learning_tf/Num")
(setf (get learning_tf::Num :definition-)
      "float32 encl
float32 eclr
float32 vl
float32 vr
float32 angle

")



(provide :learning_tf/Num "cd8c1b28c2ce359c8b3645a5240d4d70")


