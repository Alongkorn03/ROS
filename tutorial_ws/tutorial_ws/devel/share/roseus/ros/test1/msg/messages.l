;; Auto-generated. Do not edit!


(when (boundp 'test1::messages)
  (if (not (find-package "TEST1"))
    (make-package "TEST1"))
  (shadow 'messages (find-package "TEST1")))
(unless (find-package "TEST1::MESSAGES")
  (make-package "TEST1::MESSAGES"))

(in-package "ROS")
;;//! \htmlinclude messages.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass test1::messages
  :super ros::object
  :slots (_name _id _fl _points _another_field ))

(defmethod test1::messages
  (:init
   (&key
    ((:name __name) "")
    ((:id __id) 0)
    ((:fl __fl) 0.0)
    ((:points __points) ())
    ((:another_field __another_field) 0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _id (round __id))
   (setq _fl (float __fl))
   (setq _points __points)
   (setq _another_field (round __another_field))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:fl
   (&optional __fl)
   (if __fl (setq _fl __fl)) _fl)
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:another_field
   (&optional __another_field)
   (if __another_field (setq _another_field __another_field)) _another_field)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; int64 _id
    8
    ;; float64 _fl
    8
    ;; geometry_msgs/Point[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ;; uint8 _another_field
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; int64 _id
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _id (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _id) (= (length (_id . bv)) 2)) ;; bignum
              (write-long (ash (elt (_id . bv) 0) 0) s)
              (write-long (ash (elt (_id . bv) 1) -1) s))
             ((and (class _id) (= (length (_id . bv)) 1)) ;; big1
              (write-long (elt (_id . bv) 0) s)
              (write-long (if (>= _id 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _id s)(write-long (if (>= _id 0) 0 #xffffffff) s)))
     ;; float64 _fl
       (sys::poke _fl (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; geometry_msgs/Point[] _points
     (write-long (length _points) s)
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;; uint8 _another_field
       (write-byte _another_field s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _id
#+(or :alpha :irix6 :x86_64)
      (setf _id (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _id (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _fl
     (setq _fl (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; geometry_msgs/Point[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; uint8 _another_field
     (setq _another_field (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get test1::messages :md5sum-) "4f801381feac4b323373c99609c73f67")
(setf (get test1::messages :datatype-) "test1/messages")
(setf (get test1::messages :definition-)
      "string name
int64 id
float64 fl
geometry_msgs/Point[] points
uint8 another_field

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :test1/messages "4f801381feac4b323373c99609c73f67")


