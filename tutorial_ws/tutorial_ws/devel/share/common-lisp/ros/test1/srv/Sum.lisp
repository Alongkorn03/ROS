; Auto-generated. Do not edit!


(cl:in-package test1-srv)


;//! \htmlinclude Sum-request.msg.html

(cl:defclass <Sum-request> (roslisp-msg-protocol:ros-message)
  ((A
    :reader A
    :initarg :A
    :type cl:integer
    :initform 0)
   (B
    :reader B
    :initarg :B
    :type cl:integer
    :initform 0))
)

(cl:defclass Sum-request (<Sum-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Sum-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Sum-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name test1-srv:<Sum-request> is deprecated: use test1-srv:Sum-request instead.")))

(cl:ensure-generic-function 'A-val :lambda-list '(m))
(cl:defmethod A-val ((m <Sum-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader test1-srv:A-val is deprecated.  Use test1-srv:A instead.")
  (A m))

(cl:ensure-generic-function 'B-val :lambda-list '(m))
(cl:defmethod B-val ((m <Sum-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader test1-srv:B-val is deprecated.  Use test1-srv:B instead.")
  (B m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Sum-request>) ostream)
  "Serializes a message object of type '<Sum-request>"
  (cl:let* ((signed (cl:slot-value msg 'A)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'B)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Sum-request>) istream)
  "Deserializes a message object of type '<Sum-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'A) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'B) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Sum-request>)))
  "Returns string type for a service object of type '<Sum-request>"
  "test1/SumRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Sum-request)))
  "Returns string type for a service object of type 'Sum-request"
  "test1/SumRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Sum-request>)))
  "Returns md5sum for a message object of type '<Sum-request>"
  "713e5cf1444846805670f946f08bfc96")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Sum-request)))
  "Returns md5sum for a message object of type 'Sum-request"
  "713e5cf1444846805670f946f08bfc96")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Sum-request>)))
  "Returns full string definition for message of type '<Sum-request>"
  (cl:format cl:nil "int64 A~%int64 B~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Sum-request)))
  "Returns full string definition for message of type 'Sum-request"
  (cl:format cl:nil "int64 A~%int64 B~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Sum-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Sum-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Sum-request
    (cl:cons ':A (A msg))
    (cl:cons ':B (B msg))
))
;//! \htmlinclude Sum-response.msg.html

(cl:defclass <Sum-response> (roslisp-msg-protocol:ros-message)
  ((Sum
    :reader Sum
    :initarg :Sum
    :type cl:integer
    :initform 0))
)

(cl:defclass Sum-response (<Sum-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Sum-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Sum-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name test1-srv:<Sum-response> is deprecated: use test1-srv:Sum-response instead.")))

(cl:ensure-generic-function 'Sum-val :lambda-list '(m))
(cl:defmethod Sum-val ((m <Sum-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader test1-srv:Sum-val is deprecated.  Use test1-srv:Sum instead.")
  (Sum m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Sum-response>) ostream)
  "Serializes a message object of type '<Sum-response>"
  (cl:let* ((signed (cl:slot-value msg 'Sum)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Sum-response>) istream)
  "Deserializes a message object of type '<Sum-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Sum) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Sum-response>)))
  "Returns string type for a service object of type '<Sum-response>"
  "test1/SumResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Sum-response)))
  "Returns string type for a service object of type 'Sum-response"
  "test1/SumResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Sum-response>)))
  "Returns md5sum for a message object of type '<Sum-response>"
  "713e5cf1444846805670f946f08bfc96")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Sum-response)))
  "Returns md5sum for a message object of type 'Sum-response"
  "713e5cf1444846805670f946f08bfc96")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Sum-response>)))
  "Returns full string definition for message of type '<Sum-response>"
  (cl:format cl:nil "int64 Sum~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Sum-response)))
  "Returns full string definition for message of type 'Sum-response"
  (cl:format cl:nil "int64 Sum~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Sum-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Sum-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Sum-response
    (cl:cons ':Sum (Sum msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Sum)))
  'Sum-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Sum)))
  'Sum-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Sum)))
  "Returns string type for a service object of type '<Sum>"
  "test1/Sum")