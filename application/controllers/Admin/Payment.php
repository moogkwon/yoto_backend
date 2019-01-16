<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Payment extends CI_Controller {
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
		$this->load->model('payment_model');
		$this->load->library('form_validation');
	}
	public function index()
	{
		$payments = $this->payment_model->getPayments();
		foreach ($payments as $key => $payment) {
			$payment->dated = date_format(date_create($payment->dated), 'm/d/Y');
			$expire = strtotime($payment->dated) - strtotime('now');
			if ($payment->package == 'yoto.monthly1') {
				$expire = $expire + (30 * 24 * 60 * 60);
			} else if ($payment->package == 'yoto.monthly6') {
				$expire = $expire + (6 * 30 * 24 * 60 * 60);
			} else if ($payment->package == 'yoto.monthly12') {
				$expire = $expire + (365 * 24 * 60 * 60);
			}
			$payment->expire = $expire > 0 ? floor($expire / (24 * 60 * 60)) : 0;
			$payments[$key] = $payment;
		}
		$data['payments'] = $payments;
		$this->load->view('Admin/Payment/index',$data);
	}
}