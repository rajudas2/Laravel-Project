<?php
                 $deviceToken='0a19020ae93e0fbdb8667ab69d989aafda4dc5747bce82b02dec087b77ce2268';
                 $passphrase = 'joashp';
		 $ctx = stream_context_create();
		// ck.pem is your certificate file
		stream_context_set_option($ctx, 'ssl', 'local_cert', 'apns-dev-cert.pem');
		stream_context_set_option($ctx, 'ssl', 'passphrase', $passphrase);
		// Open a connection to the APNS server
		$fp = stream_socket_client(
			'ssl://gateway.sandbox.push.apple.com:2195', $err,
			$errstr, 60, STREAM_CLIENT_CONNECT|STREAM_CLIENT_PERSISTENT, $ctx);
		if (!$fp)
			exit("Failed to connect: $err $errstr" . PHP_EOL);
		//continue;
                $data=array("title"=>"Notification IOS","body"=>"Notification IOS","menu_id"=>"","training_id"=>"","notification_id"=>"");
		// Create the payload body
		//$body['aps'] = array(
		//	'alert' => $data,
		//	'sound' => 'default'
		//);
		
		
//		 $body['headers'] = array(
//                'apns-priority' => 5,
//                'apns-push-type' => 'background',
//		 );
            
		 $body['aps'] = array(
		     'content-available' => 1,
		     'alert' => ''
		 );
		 $body['data'] = array(
		     'body' => $data,
		 );
	    
	    
		// Encode the payload as JSON
		$payload = json_encode($body);
		
		// Build the binary notification
		$msg = chr(0) . pack('n', 32) . pack('H*', $deviceToken). pack('n', strlen($payload)) . $payload;
		// Send it to the server
		$result = fwrite($fp, $msg, strlen($msg));
		print_r($result);
		// Close the connection to the server
		fclose($fp);
		//print_r($result);
		if (!$result)
		{
		 echo 'Message not delivered' . PHP_EOL;
			// echo '<br>';
		}
		else{
			 echo 'Message successfully delivered' . PHP_EOL;
			// echo '<br>';
		}
        ?>