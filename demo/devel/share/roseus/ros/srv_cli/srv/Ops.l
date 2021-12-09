;; Auto-generated. Do not edit!


(when (boundp 'srv_cli::Ops)
  (if (not (find-package "SRV_CLI"))
    (make-package "SRV_CLI"))
  (shadow 'Ops (find-package "SRV_CLI")))
(unless (find-package "SRV_CLI::OPS")
  (make-package "SRV_CLI::OPS"))
(unless (find-package "SRV_CLI::OPSREQUEST")
  (make-package "SRV_CLI::OPSREQUEST"))
(unless (find-package "SRV_CLI::OPSRESPONSE")
  (make-package "SRV_CLI::OPSRESPONSE"))

(in-package "ROS")





(defclass srv_cli::OpsRequest
  :super ros::object
  :slots (_get_linear_velocity _get_radius ))

(defmethod srv_cli::OpsRequest
  (:init
   (&key
    ((:get_linear_velocity __get_linear_velocity) nil)
    ((:get_radius __get_radius) nil)
    )
   (send-super :init)
   (setq _get_linear_velocity __get_linear_velocity)
   (setq _get_radius __get_radius)
   self)
  (:get_linear_velocity
   (&optional (__get_linear_velocity :null))
   (if (not (eq __get_linear_velocity :null)) (setq _get_linear_velocity __get_linear_velocity)) _get_linear_velocity)
  (:get_radius
   (&optional (__get_radius :null))
   (if (not (eq __get_radius :null)) (setq _get_radius __get_radius)) _get_radius)
  (:serialization-length
   ()
   (+
    ;; bool _get_linear_velocity
    1
    ;; bool _get_radius
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _get_linear_velocity
       (if _get_linear_velocity (write-byte -1 s) (write-byte 0 s))
     ;; bool _get_radius
       (if _get_radius (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _get_linear_velocity
     (setq _get_linear_velocity (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _get_radius
     (setq _get_radius (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass srv_cli::OpsResponse
  :super ros::object
  :slots (_angular_velocity_value ))

(defmethod srv_cli::OpsResponse
  (:init
   (&key
    ((:angular_velocity_value __angular_velocity_value) 0.0)
    )
   (send-super :init)
   (setq _angular_velocity_value (float __angular_velocity_value))
   self)
  (:angular_velocity_value
   (&optional __angular_velocity_value)
   (if __angular_velocity_value (setq _angular_velocity_value __angular_velocity_value)) _angular_velocity_value)
  (:serialization-length
   ()
   (+
    ;; float32 _angular_velocity_value
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _angular_velocity_value
       (sys::poke _angular_velocity_value (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _angular_velocity_value
     (setq _angular_velocity_value (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass srv_cli::Ops
  :super ros::object
  :slots ())

(setf (get srv_cli::Ops :md5sum-) "debbba91dbbcfc26ea53ae9e87ba85d6")
(setf (get srv_cli::Ops :datatype-) "srv_cli/Ops")
(setf (get srv_cli::Ops :request) srv_cli::OpsRequest)
(setf (get srv_cli::Ops :response) srv_cli::OpsResponse)

(defmethod srv_cli::OpsRequest
  (:response () (instance srv_cli::OpsResponse :init)))

(setf (get srv_cli::OpsRequest :md5sum-) "debbba91dbbcfc26ea53ae9e87ba85d6")
(setf (get srv_cli::OpsRequest :datatype-) "srv_cli/OpsRequest")
(setf (get srv_cli::OpsRequest :definition-)
      "# client sending some data
bool get_linear_velocity
bool get_radius

---
# server sending the result back
float32 angular_velocity_value


")

(setf (get srv_cli::OpsResponse :md5sum-) "debbba91dbbcfc26ea53ae9e87ba85d6")
(setf (get srv_cli::OpsResponse :datatype-) "srv_cli/OpsResponse")
(setf (get srv_cli::OpsResponse :definition-)
      "# client sending some data
bool get_linear_velocity
bool get_radius

---
# server sending the result back
float32 angular_velocity_value


")



(provide :srv_cli/Ops "debbba91dbbcfc26ea53ae9e87ba85d6")


