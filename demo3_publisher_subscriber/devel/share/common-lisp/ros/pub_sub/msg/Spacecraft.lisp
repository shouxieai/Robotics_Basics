; Auto-generated. Do not edit!


(cl:in-package pub_sub-msg)


;//! \htmlinclude Spacecraft.msg.html

(cl:defclass <Spacecraft> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (stage
    :reader stage
    :initarg :stage
    :type cl:integer
    :initform 0)
   (atmosphere_pressure
    :reader atmosphere_pressure
    :initarg :atmosphere_pressure
    :type cl:float
    :initform 0.0)
   (velocity
    :reader velocity
    :initarg :velocity
    :type cl:float
    :initform 0.0))
)

(cl:defclass Spacecraft (<Spacecraft>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Spacecraft>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Spacecraft)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pub_sub-msg:<Spacecraft> is deprecated: use pub_sub-msg:Spacecraft instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <Spacecraft>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pub_sub-msg:name-val is deprecated.  Use pub_sub-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'stage-val :lambda-list '(m))
(cl:defmethod stage-val ((m <Spacecraft>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pub_sub-msg:stage-val is deprecated.  Use pub_sub-msg:stage instead.")
  (stage m))

(cl:ensure-generic-function 'atmosphere_pressure-val :lambda-list '(m))
(cl:defmethod atmosphere_pressure-val ((m <Spacecraft>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pub_sub-msg:atmosphere_pressure-val is deprecated.  Use pub_sub-msg:atmosphere_pressure instead.")
  (atmosphere_pressure m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <Spacecraft>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pub_sub-msg:velocity-val is deprecated.  Use pub_sub-msg:velocity instead.")
  (velocity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Spacecraft>) ostream)
  "Serializes a message object of type '<Spacecraft>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let* ((signed (cl:slot-value msg 'stage)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'atmosphere_pressure))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Spacecraft>) istream)
  "Deserializes a message object of type '<Spacecraft>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'stage) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'atmosphere_pressure) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Spacecraft>)))
  "Returns string type for a message object of type '<Spacecraft>"
  "pub_sub/Spacecraft")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Spacecraft)))
  "Returns string type for a message object of type 'Spacecraft"
  "pub_sub/Spacecraft")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Spacecraft>)))
  "Returns md5sum for a message object of type '<Spacecraft>"
  "db0eadb26c1269c190f69829aca84a1f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Spacecraft)))
  "Returns md5sum for a message object of type 'Spacecraft"
  "db0eadb26c1269c190f69829aca84a1f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Spacecraft>)))
  "Returns full string definition for message of type '<Spacecraft>"
  (cl:format cl:nil "string name~%int32 stage~%float32 atmosphere_pressure~%float32 velocity~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Spacecraft)))
  "Returns full string definition for message of type 'Spacecraft"
  (cl:format cl:nil "string name~%int32 stage~%float32 atmosphere_pressure~%float32 velocity~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Spacecraft>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Spacecraft>))
  "Converts a ROS message object to a list"
  (cl:list 'Spacecraft
    (cl:cons ':name (name msg))
    (cl:cons ':stage (stage msg))
    (cl:cons ':atmosphere_pressure (atmosphere_pressure msg))
    (cl:cons ':velocity (velocity msg))
))
