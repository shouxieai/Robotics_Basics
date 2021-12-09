;; Auto-generated. Do not edit!


(when (boundp 'pub_sub::Spacecraft)
  (if (not (find-package "PUB_SUB"))
    (make-package "PUB_SUB"))
  (shadow 'Spacecraft (find-package "PUB_SUB")))
(unless (find-package "PUB_SUB::SPACECRAFT")
  (make-package "PUB_SUB::SPACECRAFT"))

(in-package "ROS")
;;//! \htmlinclude Spacecraft.msg.html


(defclass pub_sub::Spacecraft
  :super ros::object
  :slots (_name _stage _atmosphere_pressure _velocity ))

(defmethod pub_sub::Spacecraft
  (:init
   (&key
    ((:name __name) "")
    ((:stage __stage) 0)
    ((:atmosphere_pressure __atmosphere_pressure) 0.0)
    ((:velocity __velocity) 0.0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _stage (round __stage))
   (setq _atmosphere_pressure (float __atmosphere_pressure))
   (setq _velocity (float __velocity))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:stage
   (&optional __stage)
   (if __stage (setq _stage __stage)) _stage)
  (:atmosphere_pressure
   (&optional __atmosphere_pressure)
   (if __atmosphere_pressure (setq _atmosphere_pressure __atmosphere_pressure)) _atmosphere_pressure)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; int32 _stage
    4
    ;; float32 _atmosphere_pressure
    4
    ;; float32 _velocity
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; int32 _stage
       (write-long _stage s)
     ;; float32 _atmosphere_pressure
       (sys::poke _atmosphere_pressure (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _stage
     (setq _stage (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _atmosphere_pressure
     (setq _atmosphere_pressure (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _velocity
     (setq _velocity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get pub_sub::Spacecraft :md5sum-) "db0eadb26c1269c190f69829aca84a1f")
(setf (get pub_sub::Spacecraft :datatype-) "pub_sub/Spacecraft")
(setf (get pub_sub::Spacecraft :definition-)
      "string name
int32 stage
float32 atmosphere_pressure
float32 velocity
")



(provide :pub_sub/Spacecraft "db0eadb26c1269c190f69829aca84a1f")


