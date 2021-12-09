; Auto-generated. Do not edit!


(cl:in-package srv_cli-srv)


;//! \htmlinclude Ops-request.msg.html

(cl:defclass <Ops-request> (roslisp-msg-protocol:ros-message)
  ((get_linear_velocity
    :reader get_linear_velocity
    :initarg :get_linear_velocity
    :type cl:boolean
    :initform cl:nil)
   (get_radius
    :reader get_radius
    :initarg :get_radius
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Ops-request (<Ops-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Ops-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Ops-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name srv_cli-srv:<Ops-request> is deprecated: use srv_cli-srv:Ops-request instead.")))

(cl:ensure-generic-function 'get_linear_velocity-val :lambda-list '(m))
(cl:defmethod get_linear_velocity-val ((m <Ops-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srv_cli-srv:get_linear_velocity-val is deprecated.  Use srv_cli-srv:get_linear_velocity instead.")
  (get_linear_velocity m))

(cl:ensure-generic-function 'get_radius-val :lambda-list '(m))
(cl:defmethod get_radius-val ((m <Ops-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srv_cli-srv:get_radius-val is deprecated.  Use srv_cli-srv:get_radius instead.")
  (get_radius m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Ops-request>) ostream)
  "Serializes a message object of type '<Ops-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'get_linear_velocity) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'get_radius) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Ops-request>) istream)
  "Deserializes a message object of type '<Ops-request>"
    (cl:setf (cl:slot-value msg 'get_linear_velocity) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'get_radius) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Ops-request>)))
  "Returns string type for a service object of type '<Ops-request>"
  "srv_cli/OpsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Ops-request)))
  "Returns string type for a service object of type 'Ops-request"
  "srv_cli/OpsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Ops-request>)))
  "Returns md5sum for a message object of type '<Ops-request>"
  "debbba91dbbcfc26ea53ae9e87ba85d6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Ops-request)))
  "Returns md5sum for a message object of type 'Ops-request"
  "debbba91dbbcfc26ea53ae9e87ba85d6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Ops-request>)))
  "Returns full string definition for message of type '<Ops-request>"
  (cl:format cl:nil "# client sending some data~%bool get_linear_velocity~%bool get_radius~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Ops-request)))
  "Returns full string definition for message of type 'Ops-request"
  (cl:format cl:nil "# client sending some data~%bool get_linear_velocity~%bool get_radius~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Ops-request>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Ops-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Ops-request
    (cl:cons ':get_linear_velocity (get_linear_velocity msg))
    (cl:cons ':get_radius (get_radius msg))
))
;//! \htmlinclude Ops-response.msg.html

(cl:defclass <Ops-response> (roslisp-msg-protocol:ros-message)
  ((angular_velocity_value
    :reader angular_velocity_value
    :initarg :angular_velocity_value
    :type cl:float
    :initform 0.0))
)

(cl:defclass Ops-response (<Ops-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Ops-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Ops-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name srv_cli-srv:<Ops-response> is deprecated: use srv_cli-srv:Ops-response instead.")))

(cl:ensure-generic-function 'angular_velocity_value-val :lambda-list '(m))
(cl:defmethod angular_velocity_value-val ((m <Ops-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srv_cli-srv:angular_velocity_value-val is deprecated.  Use srv_cli-srv:angular_velocity_value instead.")
  (angular_velocity_value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Ops-response>) ostream)
  "Serializes a message object of type '<Ops-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angular_velocity_value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Ops-response>) istream)
  "Deserializes a message object of type '<Ops-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angular_velocity_value) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Ops-response>)))
  "Returns string type for a service object of type '<Ops-response>"
  "srv_cli/OpsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Ops-response)))
  "Returns string type for a service object of type 'Ops-response"
  "srv_cli/OpsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Ops-response>)))
  "Returns md5sum for a message object of type '<Ops-response>"
  "debbba91dbbcfc26ea53ae9e87ba85d6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Ops-response)))
  "Returns md5sum for a message object of type 'Ops-response"
  "debbba91dbbcfc26ea53ae9e87ba85d6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Ops-response>)))
  "Returns full string definition for message of type '<Ops-response>"
  (cl:format cl:nil "# server sending the result back~%float32 angular_velocity_value~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Ops-response)))
  "Returns full string definition for message of type 'Ops-response"
  (cl:format cl:nil "# server sending the result back~%float32 angular_velocity_value~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Ops-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Ops-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Ops-response
    (cl:cons ':angular_velocity_value (angular_velocity_value msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Ops)))
  'Ops-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Ops)))
  'Ops-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Ops)))
  "Returns string type for a service object of type '<Ops>"
  "srv_cli/Ops")