;; Auto-generated. Do not edit!


(when (boundp 'srv_cli::AddInts)
  (if (not (find-package "SRV_CLI"))
    (make-package "SRV_CLI"))
  (shadow 'AddInts (find-package "SRV_CLI")))
(unless (find-package "SRV_CLI::ADDINTS")
  (make-package "SRV_CLI::ADDINTS"))
(unless (find-package "SRV_CLI::ADDINTSREQUEST")
  (make-package "SRV_CLI::ADDINTSREQUEST"))
(unless (find-package "SRV_CLI::ADDINTSRESPONSE")
  (make-package "SRV_CLI::ADDINTSRESPONSE"))

(in-package "ROS")





(defclass srv_cli::AddIntsRequest
  :super ros::object
  :slots (_num1 _num2 ))

(defmethod srv_cli::AddIntsRequest
  (:init
   (&key
    ((:num1 __num1) 0)
    ((:num2 __num2) 0)
    )
   (send-super :init)
   (setq _num1 (round __num1))
   (setq _num2 (round __num2))
   self)
  (:num1
   (&optional __num1)
   (if __num1 (setq _num1 __num1)) _num1)
  (:num2
   (&optional __num2)
   (if __num2 (setq _num2 __num2)) _num2)
  (:serialization-length
   ()
   (+
    ;; int32 _num1
    4
    ;; int32 _num2
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _num1
       (write-long _num1 s)
     ;; int32 _num2
       (write-long _num2 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _num1
     (setq _num1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _num2
     (setq _num2 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass srv_cli::AddIntsResponse
  :super ros::object
  :slots (_sum ))

(defmethod srv_cli::AddIntsResponse
  (:init
   (&key
    ((:sum __sum) 0)
    )
   (send-super :init)
   (setq _sum (round __sum))
   self)
  (:sum
   (&optional __sum)
   (if __sum (setq _sum __sum)) _sum)
  (:serialization-length
   ()
   (+
    ;; int32 _sum
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _sum
       (write-long _sum s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _sum
     (setq _sum (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass srv_cli::AddInts
  :super ros::object
  :slots ())

(setf (get srv_cli::AddInts :md5sum-) "4781436a0c2affec8025955a6041e481")
(setf (get srv_cli::AddInts :datatype-) "srv_cli/AddInts")
(setf (get srv_cli::AddInts :request) srv_cli::AddIntsRequest)
(setf (get srv_cli::AddInts :response) srv_cli::AddIntsResponse)

(defmethod srv_cli::AddIntsRequest
  (:response () (instance srv_cli::AddIntsResponse :init)))

(setf (get srv_cli::AddIntsRequest :md5sum-) "4781436a0c2affec8025955a6041e481")
(setf (get srv_cli::AddIntsRequest :datatype-) "srv_cli/AddIntsRequest")
(setf (get srv_cli::AddIntsRequest :definition-)
      "# 客户端请求时发送的两个数字
int32 num1
int32 num2
---
# 服务器响应发送的数据
int32 sum
")

(setf (get srv_cli::AddIntsResponse :md5sum-) "4781436a0c2affec8025955a6041e481")
(setf (get srv_cli::AddIntsResponse :datatype-) "srv_cli/AddIntsResponse")
(setf (get srv_cli::AddIntsResponse :definition-)
      "# 客户端请求时发送的两个数字
int32 num1
int32 num2
---
# 服务器响应发送的数据
int32 sum
")



(provide :srv_cli/AddInts "4781436a0c2affec8025955a6041e481")


