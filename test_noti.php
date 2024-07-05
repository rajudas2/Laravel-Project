<?php
 $device_id='eJKxyd5sS5SriYbEB27Vpy:APA91bGdMztoGThzB1UaKEdRIjSuSLNO1y_pKVObDne--gKEWOyK5XZhB6bsoY18qPXvnRMxticcSnrXtQwRl2GtyGAN_h11Z0AChfwrTD39Sw-JNN4DvI7oq1maGYI42CbGAGcc7Ofa';
 $url = 'https://fcm.googleapis.com/fcm/send';
$API_ACCESS_KEY = 'AAAAbUz-MiI:APA91bGZXuk4hMkq6kOeWj-k3l3JWUEJrDzVEYRgx2Q6PDG6IFCq2Q-5j6RAazXFKHye_4ZvscJYNjOd1BIb2SNTfrq_0rsFdI_NYdjYIpLQMrRbpvIq8JzGkMQd5aGv7yt8EC0qdU9J';
	        //$message = $data;
	        
	            $headers = array(
	        	'Authorization: key='.$API_ACCESS_KEY,
	        	'Content-Type: application/json'
			);   
			
			
			$data['message']="Test Notification4";
                        $data['title']="Test Notification4";
                        $data['body']="Test Notification4";
			
			$data_payload=array("title"=>"New Training added","body"=>'Tr1');

			 $fields = array(
                        'registration_ids' => array($device_id),
			'priority' => 10,
			'data'=> $data_payload,
                        'notification' => array('title' => $data['title'], 'body' =>  $data['body'] ,'data'=> $data_payload),
                    );
	
			
		$ch = curl_init();
	        if ($url) {
	            // Set the url, number of POST vars, POST data
	            curl_setopt($ch, CURLOPT_URL, $url);
	            curl_setopt($ch, CURLOPT_POST, true);
	            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
	            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	     
	            // Disabling SSL Certificate support temporarly
	            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	            if ($fields) {
	                curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
	            }
	     
	            // Execute post
	            $result = curl_exec($ch);
	            if ($result === FALSE) {
                            die('FCM Send Error: ' . curl_error($ch));
                    }
	     
	            // Close connection
	            curl_close($ch);
	
			echo $result;
				
				// echo 'Message successfully delivered';
				// echo '<br>';
        }
        //------------------------------------------------------------------------------------------------------------------
      
?>