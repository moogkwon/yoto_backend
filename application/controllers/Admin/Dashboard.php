<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Dashboard extends CI_Controller {
	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function __construct()
	{
		parent::__construct();
		if(!$this->session->userdata('email')){
			redirect('Login/');
		}
		$this->load->model('user_model');
		$this->load->library('form_validation');
	}
	public function index()
	{
		$data['last24hrs'] 		= $this->user_model->last24hrs_online_user();
		$data['online_users'] 	= $this->user_model->online_users();
		$this->load->view('Admin/Dashboard',$data);
	}
	public function Logout(){
		$this->session->sess_destroy();
		redirect('Login/');
	}
}