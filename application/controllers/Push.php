<?php
use Kreait\Firebase\Factory;
use Kreait\Firebase\ServiceAccount;
use Kreait\Firebase\Messaging\Notification;
use Kreait\Firebase\Messaging\CloudMessage;



class Push extends CI_Controller {
    public function __construct()
	{
		parent::__construct();
		$this->load->model('user_model');
		$this->load->model('notification_model');
		// $this->status_arr = array('New','Ready to send','Sending','Finished');
    }
  
	public function send()
	{
        $serviceAccount = ServiceAccount::fromJsonFile(APPPATH.'config/serviceAccountKey.json');
        $firebase = (new Factory())
            ->withServiceAccount($serviceAccount)
            ->create();
        $messaging = $firebase->getMessaging();
        while(true) {
            // echo 'running...'.(time()).PHP_EOL;
            sleep(1);
            $notifications = $this->notification_model->getReadyNotification();
            // echo count($notifications) . PHP_EOL;
            if(!count($notifications)) continue;
            foreach ($notifications as $notification) {
                if (!$notification->device_token) continue;
                echo  $notification->device_token . PHP_EOL;
                if ($notification->type == '2') {
                    $message = CloudMessage::withTarget('token', $notification->device_token)
                        ->withData([
                            'type' => $notification->type,
                            'title' => $notification->title,
                            'content' => $notification->content,
                        ]);
                } else {
                    $message = CloudMessage::withTarget('token', $notification->device_token)
                        ->withNotification(Notification::create($notification->title, $notification->content))
                        ->withData([
                            'type' => $notification->type,
                            'title' => $notification->title,
                            'content' => $notification->content,
                        ]);
                }
                // var_dump($message);
                try {
                    $messaging->send($message);
                } catch (Exception $e) {
                    echo $e->getMessage() . PHP_EOL;
                }
            }
            $this->notification_model->updateSentNotification($notifications);
        }
	}
}