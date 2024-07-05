<?php
use App\User;
use App\Http\Controllers\MailController;
use Illuminate\Support\Facades\Storage;
use Illuminate\Contracts\Filesystem\Filesystem;

function checkEmptyString($string)
{
    return trim(!empty($string) ? $string : '');
}

function sendMailAllInOne($data, $template = '')
{
    Mail::send($template, ['data' => $data] , function($message) use ($data) {
        $message->to($data["to"],$data["name"]);
        $message->subject($data["subject"]);
        $message->from('knitup022@gmail.com','SparkD');
    });
}

function sendOtpMail($data)
{

    Mail::send('email_templates.otp', ['data' => $data], function($message) use ($data) {
     $message->to($data['email'], 'Fairbet')->subject('One Time Password');
     $message->from('enammt2@gmail.com','Fairbet');
  });
}





function isEmpty($string)
{
    return ( $string ) ? $string : '';
}


function send_notification_user($user_ids, $data)
{

        $API_ACCESS_KEY = 'AAAAbUz-MiI:APA91bGZXuk4hMkq6kOeWj-k3l3JWUEJrDzVEYRgx2Q6PDG6IFCq2Q-5j6RAazXFKHye_4ZvscJYNjOd1BIb2SNTfrq_0rsFdI_NYdjYIpLQMrRbpvIq8JzGkMQd5aGv7yt8EC0qdU9J';
        $passphrase = 'joashp';
        $channelName = "joashp";
        $apnsPem='apns-dev-cert.pem';
        
    foreach ($user_ids as $key => $user_id) {
        @$post = User::selectuserbyid($user_id);

        @$device_id = $post[0]->device_token;
        @$device_type = strtolower($post[0]->device_type);

        if ($device_type == 'android') {
            
            User::InsertNotification($user_id,$data['title'],$data['body'],$data['type']);
            
            $device_id = $post[0]->device_token;
            $url = 'https://fcm.googleapis.com/fcm/send';
            $message = $data;

            $headers = array(
                'Authorization: key=' . $API_ACCESS_KEY,
                'Content-Type: application/json',
            );
            
            // $data['message']=$data['title'];
             $data['title']=$data['title'];
             $data['body']=$data['body'];
			
			$data_payload=array("title"=>$data['title'],"body"=>$data['body']);

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
                if ($result === false) {
                }

                // Close connection
                curl_close($ch);

            }

        } elseif ($device_type == 'ios') {

            $deviceToken = $post[0]->device_token;
            $ctx = stream_context_create();
            // ck.pem is your certificate file
            stream_context_set_option($ctx, 'ssl', 'local_cert', $apnsPem);
            stream_context_set_option($ctx, 'ssl', 'passphrase', $passphrase);
            // Open a connection to the APNS server
            $fp = stream_socket_client(
                'ssl://gateway.sandbox.push.apple.com:2195', $err,
                $errstr, 60, STREAM_CLIENT_CONNECT | STREAM_CLIENT_PERSISTENT, $ctx);
            if (!$fp)
            //    exit("Failed to connect: $err $errstr" . PHP_EOL);
            {
                continue;
            }

            // Create the payload body
            $body['aps'] = array(
                'alert' => $data,
                'sound' => 'default',
            );
            // Encode the payload as JSON
            $payload = json_encode($body);
            // Build the binary notification
            $msg = chr(0) . pack('n', 32) . pack('H*', $deviceToken) . pack('n', strlen($payload)) . $payload;
            // Send it to the server
            $result = fwrite($fp, $msg, strlen($msg));

            // Close the connection to the server
            fclose($fp);
            if (!$result) {

            } 
            else {

            }
        } 
        else {

        }
    }
}

//Upload to S3---------------------------------------------
function uploadToS3($filePath,$url,$ext){
	$mimeType = '';
	if($ext == 'svg'){
	$mimeType = [
               'visibility' => 'public',
               'ContentType' => 'image/svg+xml'
           ];
	}
    try {
        Storage::disk('s3')->put($filePath, file_get_contents($url),$mimeType);
    } catch (S3Exception $e) {
        return $this->sendError($e->getMessage());
    }
}
//---------------------------------------------------------
//S3 Base url----------------------------------------------
function s3BaseUrl(){
    return 'https://bobanation.s3.amazonaws.com';
}
//---------------------------------------------------------
//Delete file from local-----------------------------------
function deleteFileFromLocal($path,$filename){
    unlink('/opt/lampp/htdocs/uploads/'.$path.'/'.$filename);
    return true;
}
//---------------------------------------------------------

//Remove special char--------------------------------------
function clean($string) {
   $string = str_replace(' ', '-', $string); // Replaces all spaces with hyphens.

   return preg_replace('/[^A-Za-z0-9\-]/', '', $string); // Removes special chars.
}
//---------------------------------------------------------

//Ratio calculate--------------------------------------
function getRatio($num1, $num2){
    for($i = $num2; $i > 1; $i--) {
        if(($num1 % $i) == 0 && ($num2 % $i) == 0) {
            $num1 = $num1 / $i;
            $num2 = $num2 / $i;
        }
    }
    return "$num1:$num2";
}
//---------------------------------------------------------


//generate transction --------------------------------------
   
      
function generateTransaction()
{
    $charset='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    $length=20;
    $str = '';
    $count = strlen($charset);
    while ($length--) {
        $str .= $charset[mt_rand(0, $count-1)];
    }

    return $str;
}

//Cinetpay Login api---------------------------------------
function cinetPayLogin(){
     $curl = curl_init();
      curl_setopt_array($curl, array(
      CURLOPT_URL => 'https://client.cinetpay.com/v1/auth/login',
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => '',
      CURLOPT_MAXREDIRS => 10,
      CURLOPT_TIMEOUT => 0,
      CURLOPT_FOLLOWLOCATION => true,
      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
      CURLOPT_CUSTOMREQUEST => 'POST',
      CURLOPT_POSTFIELDS => 'apikey=113808881619b4c3724db74.96084050&password=Gulf123456%2B',
      CURLOPT_HTTPHEADER => array(
	'Content-Type: application/x-www-form-urlencoded'
      ),
    ));

    $response = curl_exec($curl);
    
    curl_close($curl);
    return json_decode($response, true);
}
//---------------------------------------------------------
//CinetPay Add Contacts----------------------------------
function cinetPayAddContacts($token,$body){
    $curl = curl_init();

    curl_setopt_array($curl, array(
      CURLOPT_URL => 'https://client.cinetpay.com/v1/transfer/contact?token='.$token,
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => '',
      CURLOPT_MAXREDIRS => 10,
      CURLOPT_TIMEOUT => 0,
      CURLOPT_FOLLOWLOCATION => true,
      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
      CURLOPT_CUSTOMREQUEST => 'POST',
      CURLOPT_POSTFIELDS => 'data='.$body,
      CURLOPT_HTTPHEADER => array(
	'Content-Type: application/x-www-form-urlencoded'
      ),
    ));
    
    $response = curl_exec($curl);
    curl_close($curl);
    $result = json_decode($response, true);
    return $result;
}
//---------------------------------------------------------

//CinetPay Transfer money----------------------------------
function cinetPayTransferMoney($token,$transaction_id,$body){
    $curl = curl_init();

    curl_setopt_array($curl, array(
      CURLOPT_URL => 'https://client.cinetpay.com/v1/transfer/money/send/contact?token='.$token,
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => '',
      CURLOPT_MAXREDIRS => 10,
      CURLOPT_TIMEOUT => 0,
      CURLOPT_FOLLOWLOCATION => true,
      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
      CURLOPT_CUSTOMREQUEST => 'POST',
      CURLOPT_POSTFIELDS => 'data='.$body,
      CURLOPT_HTTPHEADER => array(
	'Content-Type: application/x-www-form-urlencoded'
      ),
    ));
    
    $response = curl_exec($curl);
    curl_close($curl);
    $result = json_decode($response, true);
    return $result;
}
//---------------------------------------------------------


//CinetPay Transfer money----------------------------------
function monetbilTransferMoney($body){
    

    $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, 'https://api.monetbil.com/v1/payouts/withdrawal');
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($body, '', '&'));
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);

        $json = curl_exec($ch);
        $result = json_decode($json, true);

     // print_r($result);die;
      return $result;
}
//---------------------------------------------------------
//Get isports match result by match id---------------------
function getIsportsMatchResult($api_url){
    $json = file_get_contents($api_url);
    $result = json_decode($json, true);
    return $result;
}
//---------------------------------------------------------
//Get isports match status text----------------------------
function getIsportsMatchStatusText($sports_type,$match_status){
    $status_text = '';
    if($sports_type == 'Football'){
	switch ($match_status) {
	    case 0:
	      $status_text = "Not started";
	      break;
	    case 1:
	      $status_text = "First half";
	      break;
	    case 2:
	      $status_text = "Half-time break";
	      break;
	    case 3:
	      $status_text = "Second half";
	      break;
	    case 4:
	      $status_text = "Extra time";
	      break;
	    case 5:
	      $status_text = "Penalty";
	      break;
	    case -1:
	      $status_text = "Finished";
	      break;
	    case -10:
	      $status_text = "Cancelled";
	      break;
	    case -11:
	      $status_text = "TBD";
	      break;
	    case -12:
	      $status_text = "Terminated";
	      break;
	    case -13:
	      $status_text = "Interrupted";
	      break;
	    case -14:
	      $status_text = "Postponed";
	      break;
	    default:
	      echo "Your favorite color is neither red, blue, nor green!";
	}
    }
    elseif($sports_type == 'Basketball'){
	switch ($match_status) {
	    case 0:
	      $status_text = "Not started";
	      break;
	    case 1:
	      $status_text = "The first quarter";
	      break;
	    case 2:
	      $status_text = "The second quarter";
	      break;
	    case 3:
	      $status_text = "The third quarter";
	      break;
	    case 4:
	      $status_text = "The fourth quarter";
	      break;
	    case 5:
	      $status_text = "The first OT";
	      break;
	    case 6:
	      $status_text = "The second OT";
	      break;
	    case 7:
	      $status_text = "The third OT";
	      break;
	    case 50:
	      $status_text = "Half-time";
	      break;
	    case -1:
	      $status_text = "Finished";
	      break;
	    case -2:
	      $status_text = "TBD";
	      break;
	    case -3:
	      $status_text = "Interrupted";
	      break;
	    case -4:
	      $status_text = "Cancelled";
	      break;
	    case -5:
	      $status_text = "Postponed";
	      break;
	    default:
	      echo "Your favorite color is neither red, blue, nor green!";
	}
    }

    return $status_text;
}
//---------------------------------------------------------

//Get isports match result by match id---------------------
function getGsMatchResult($api_url){
    $xmlfile = file_get_contents($api_url);
    $object = simplexml_load_string($xmlfile);
    $json_val = json_encode($object);
    $result = json_decode($json_val, true);
    return $result;
}
//---------------------------------------------------------
//Get GoalServe match status text----------------------------
function getGSMatchStatusText($sports_type,$match_status){
    $status_text = '';
    if($sports_type == 'Football'){
	switch ($match_status) {
	    case 0:
	      $status_text = "Not started";
	      break;
	    case "FT":
	      $status_text = "Finished";
	      break;
	    case "Pen.":
	      $status_text = "Match finished after penalty shootout";
	      break;
	    case "ET":
	      $status_text = "extra time";
	      break;
	    case "AET":
	      $status_text = "Match finished after extra time";
	      break;
	    case "WO":
	      $status_text = "Walkover";
	      break;
	    case "Postp.":
	      $status_text = "Postponed";
	      break;
	    case "Aban.":
	      $status_text = "Abandoned";
	      break;
	    case "Cancl.":
	      $status_text = "Cancelled";
	      break;
	    case "Susp.":
	      $status_text = "Suspended";
	      break;
	    case "Int.":
	      $status_text = "Interrupted";
	      break;
	    case "Delayed":
	      $status_text = "Delayed";
	      break;
	    case "Awarded":
	      $status_text = "Awarded";
	      break;
	    default:
	      echo "Your favorite color is neither red, blue, nor green!";
	}
    }
    elseif($sports_type == 'Basketball'){
	switch ($match_status) {
	    case 0:
	      $status_text = "Not started";
	      break;
	    case "Finished":
	      $status_text = "Finished";
	      break;
	    case "After Over Time":
	      $status_text = "After Over Time";
	      break;
	    case "Awarded":
	      $status_text = "Awarded";
	      break;
	    case "Cancelled":
	      $status_text = "Cancelled";
	      break;
	    case "Suspended":
	      $status_text = "Suspended";
	      break;
	    case "Postponed":
	      $status_text = "Postponed";
	      break;
	    case "Abandoned":
	      $status_text = "Abandoned";
	      break;
	    default:
	      echo "Your favorite color is neither red, blue, nor green!";
	}
    }
    elseif($sports_type == 'Tennis'){
	switch ($match_status) {
	    case 0:
	      $status_text = "Not started";
	      break;
	    case "Finished":
	      $status_text = "Finished";
	      break;
	    case "After Over Time":
	      $status_text = "After Over Time";
	      break;
	    case "Awarded":
	      $status_text = "Awarded";
	      break;
	    case "Retired":
	      $status_text = "Retired";
	      break;
	    case "Walk over":
	      $status_text = "Walk over";
	      break;
	    case "Cancelled":
	      $status_text = "Cancelled";
	      break;
	    case "Suspended":
	      $status_text = "Suspended";
	      break;
	    case "Postponed":
	      $status_text = "Postponed";
	      break;
	    case "Abandoned":
	      $status_text = "Abandoned";
	      break;
	    default:
	      echo "Your favorite color is neither red, blue, nor green!";
	}
    }

    return $match_status;
}
//---------------------------------------------------------







//---------------------------------------------------------

