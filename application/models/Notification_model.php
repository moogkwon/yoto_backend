<?php
class Notification_model extends CI_Model{
	public $searchItems = array(
        "title",
        "content",
		"status",
		"added_date",
    );
	public function __construct() {
        parent::__construct();
	}
	public function getReadyNotification () {
		$result = $this->db
			->select('notifications.*,user_firebase_tokens.token as device_token')
			->from('notifications')
			->where('notifications.status', '1')
			->join('notification_users', 'notification_users.notification_id = notifications.id', 'left')
			->join('user_firebase_tokens', 'user_firebase_tokens.user_id = notification_users.user_id', 'left')
			->get()
			->result();
		return $result;
	}
	public function updateSentNotification($notifications)
	{	
		$map_id = function ($notification)
		{
			return $notification->id;
		};
		$ids = array_map($map_id, $notifications);
		return $this->db
			->where_in('id', $ids)
			->update('notifications', ['status' => '3']);
	}
	public function insertRejectNotification($id)
	{
		$notification = [
			'title' => 'Your vid has been rejected 🙈',
			'content' => 'Let\'s upload a new vid 🤳📹',
			'status' => '1',
			'type' => '1',
			'created_date' => date('Y-m-d H:i:s'),
			'updated_date' => date('Y-m-d H:i:s'),
		];
		$this->db->insert('notifications',$notification);
		$notification_id = $this->db->insert_id();
		$this->db->insert('notification_users', [
			'notification_id' => $notification_id,
			'user_id' => $id
		]);
	}
	public function insertBlockNotification($id)
	{
		$notification = [
			'title' => 'You’ve been reported by users too many times for misconduct.',
			'content' => 'We will be reviewing you account to determine what action needs to be made',
			'status' => '1',
			'type' => '2',
			'created_date' => date('Y-m-d H:i:s'),
			'updated_date' => date('Y-m-d H:i:s'),
		];
		$this->db->insert('notifications',$notification);
		$notification_id = $this->db->insert_id();
		$this->db->insert('notification_users', [
			'notification_id' => $notification_id,
			'user_id' => $id
		]);
	}
	public function getTotalCount() {
        $result = $this->db->select("COUNT(id) AS 'count'")
                            ->from('notifications')
                            //->where('role_id',2)
                            ->get()
                            ->result();
        return $result[0]->count;
    }
	public function getFilterCondition($search) {
        if ($search == "")  return "";
        $where = "";
        foreach($this->searchItems as $i => $searchItem) {
            if ($i != 0)    $where .= " OR ";
            $where .= "$searchItem LIKE '%$search%' ";
        }
        return $where;
    }
    public function getFilterCount($search) {
        $where = $this->getFilterCondition($search);
        $this->db->select("COUNT(id) AS 'count'");
        $this->db->from('notifications');
		//$this->db->where('role_id',2);
        if ($where != "")
        $this->db->where($where);
		$result	= $this->db->get();
        $result = $result->result();
        return $result[0]->count;
    }
	 public function getOrder($order) {
        $orderItems = 	array(
							/*"phoneNumber", */
							"id", 
                            "title", 
                            "type", 
                            "content", 
                            "status", 
                            "added_date"
                        );
		 return $orderItems[$order["column"]];
        return $orderItems [$order ["column"] - 1];
    }
	public function getData($search, $order, $start, $length) {
        $where = $this->getFilterCondition($search);
        $this->db->select("*");
        $this->db->from("notifications");
        if ($where != "")
        $this->db->where($where);
        if ($this->getOrder($order) != "")
        $this->db->order_by($this->getOrder($order), $order["dir"]);
		else
        $this->db->order_by('id','desc');
		$this->db->limit($length, $start);
		$result = $this->db->get();
        return  $result->result();  
    }
	public function getNotifications($id = false){
		$this->db->select('T1.*,T2.title type_title');
		$this->db->from('notifications T1');
		$this->db->join('notification_type T2','T1.type=T2.id','inner');
		if($id)
		$this->db->where('T1.id',$id);
		$query	= $this->db->get();
		if($id)
		$rows  	= $query->row();
		else
		$rows  	= $query->result();
		return $rows;
	}
	public function filterNotifications($filter){
		$this->db->select('T1.*,T2.title type_title');
        $this->db->from('notifications T1');
		$this->db->join('notification_type T2','T1.type=T2.id','inner');
		if($filter['status']!='all')
		$this->db->where('status',$filter['status']);
		if(!empty($filter['added_date']))
		$this->db->where('added_date',$filter['added_date']);
		if(!empty($filter['title']))
		$this->db->like('T1.title',$filter['title']);
		if(!empty($filter['type']))
		$this->db->where('T1.type',$filter['type']);
		$result	= $this->db->get();
		
        $rows 	= $result->result();
		return $rows;
    }
	public function filterCheckUsers($form_data){
		$country = $this->db->select()
			->where('country_id', $form_data['country_id'])
			->get('countries')
			->row();
		$state = $this->db->select()
			->where('state_id', $form_data['state_id'])
			->get('states')
			->row();
		$city = $this->db->select()
			->where('city_id', $form_data['city_id'])
			->get('cities')
			->row();
			
		$this->db->select('id,first_name,last_name,gender,email,birthyear,lgbtq');
		$this->db->from('users');
		if(!empty($form_data['activity']))
			$this->db->where('online',$form_data['activity'] == '1' ? '1' : '0');
		if(!empty($form_data['country_id'])) {
			$this->db->where('location_country', $country->country_name);
		}
		if(!empty($form_data['state_id'])) {
			$this->db->where('location_state', $state->state_name);
		}
		if(!empty($form_data['city_id'])) {
			$this->db->where('location_city', $city->city_name);
		}
		if(!empty($form_data['state_id']))
			$this->db->where('state_id',$form_data['state_id']);
		if(!empty($form_data['city_id']))
			$this->db->where('city_id',$form_data['city_id']);
		if(!empty($form_data['lgbtq']))
			$this->db->where('lgbtq',$form_data['lgbtq']=='yes'?'1':'0');
		if(!empty($form_data['gender']))
			$this->db->where('gender',$form_data['gender']);
		if(!empty($form_data['birth_year_from']))
			$this->db->where('birthyear >=', $form_data['birth_year_from']);
		if(!empty($form_data['birth_year_to']))
			$this->db->where('birthyear <=', $form_data['birth_year_to']);
		
		$query = $this->db->get();
		///echo '<pre>'; print_r($this->db->last_query()); echo '</pre>'; die(__FILE__.' On this line '.__LINE__);

		return $query->result();
	}
	public function insertFilteredNotification($form_data,$notis_data){
		$user_ids 						= isset($form_data['checked_user'])?$form_data['checked_user']:0;
		unset($form_data['user_ids']);
		unset($form_data['checked_user']);
		foreach($notis_data as $key=>$noti_data){
			$form_data['notification_id'] 	= $noti_data->id;
			$form_data['title'] 			= $noti_data->title;
			$form_data['type'] 				= $noti_data->type;
			$row 							= $this->checkFilterNoti($noti_data->id);
			
			if(isset($row->id)&&!empty($row->id)){
				unset($form_data['created_date']);
				$this->db->where('id',$row->id);
				$this->db->update('filtered_notifications',$form_data);
				$insert_id  = $row->id;
			}else{
				$res 							= $this->db->insert('filtered_notifications',$form_data);
				$insert_id 						= $this->db->insert_id();
			}
			if(!empty($user_ids)){
				foreach($user_ids as $user_id){
					$form_data1['user_id'] 					= $user_id;
					$form_data1['notification_id'] 			= $form_data['notification_id'];
					$form_data1['filtered_notification_id'] = $insert_id;
					$form_data1['status'] = '0';
					$this->insertUserForNoti($form_data1);
				}
			}
			
		}
		
		return true;
	}
	public function checkFilterNoti($notification_id){
		$this->db->select('*');
		$this->db->from('filtered_notifications');
		$this->db->where('notification_id',$notification_id);
		$query 	= $this->db->get();
		$row 	= $query->row();
		return $row;
	}
	public function insertUserForNoti($form_data1){
		$res = $this->db->insert('notification_users',$form_data1);
		return $res;
	}
	public function getNotiType(){
		$this->db->select('*');
		$this->db->from('notification_type');
		$query	= $this->db->get();
		$rows  	= $query->result();
		return $rows;
	}
	public function insertNotification($data, $user_ids){
		$res = $this->db->insert('notifications',$data);
		if ($res) {
			$notification_id = $this->db->insert_id();
			foreach ($user_ids as $user_id) {
				$this->db->insert('notification_users', [
					'notification_id' => $notification_id,
					'user_id' => $user_id
				]);
			}
			return $notification_id;
		}
		return false;
	}
	
	public function deleteData($data){
		$this->db->where_in('id',$data);
		$this->db->delete('notifications');
	}
	public function updateNotification($data){
		$this->db->where('id',$data['id']);
		$res = $this->db->update('notifications',$data);
		return $res;
	}
	public function filteredNotifications(){
		$this->db->select('GROUP_CONCAT(T6.user_id) user_ids,T1.*,T2.title type_title,T3.country_name country,T4.state_name state,T5.city_name city');
		$this->db->from('filtered_notifications T1');
		$this->db->join('notification_type T2','T1.type=T2.id','inner');
		$this->db->join('countries T3','T1.country_id=T3.country_id','left');
		$this->db->join('states T4','T1.state_id=T4.state_id','left');
		$this->db->join('cities T5','T1.city_id=T5.city_id','left');
		$this->db->join('notification_users T6','T1.id=T6.filtered_notification_id','left');
		$this->db->group_by('T1.id');
		$query 	= $this->db->get();
		//echo $this->db->last_query(); die();
		$rows 	= $query->result();
		return $rows;
	}
}