<?php
defined('BASEPATH') or exit('No direct script access allowed');

class BusinessCase extends CI_Controller
{

	function __construct()
	{
		parent::__construct();
		if (!$this->session->userdata('logged_in')) {
			redirect(base_url());
		}

		// $this->load->helper('url', 'english');

		$this->lang->load('btn', 'english');
		// $this->lang->load('btn','portuguese-brazilian');
		$this->lang->load('business_case', 'english');
		// $this->lang->load('quality_mp','portuguese-brazilian');

		$this->load->model('view_model');
		$this->load->model('Project_model');
		$this->load->model('log_model');
		$this->load->helper('url');
		$this->load->model('Business_case_model');
		$this->load->helper('log_activity');
	}

	public function new($project_id)
	{
		$this->db->where('user_id',  $_SESSION['user_id']);
		$this->db->where('project_id',  $_SESSION['project_id']);
		$project['dados'] = $this->db->get('project_user')->result();
		// Verificando se o usuario logado tem acesso a esse projeto

		if (count($project['dados']) > 0) {
			$dado['business_case'] = $this->Business_case_model->get($_SESSION['project_id']);
			if ($dado['business_case'] != null) {
				redirect("integration/business-case/edit/" . $_SESSION['project_id']);
			}
			$this->load->view('frame/header_view');
			$this->load->view('frame/topbar');
			$this->load->view('frame/sidebar_nav_view');
			$this->load->view('project/integration/business_case/new', $dado);
		} else {
			redirect(base_url());
		}
	}

	public function edit($project_id)
	{
		$this->db->where('user_id',  $_SESSION['user_id']);
		$this->db->where('project_id',  $_SESSION['project_id']);
		$project['dados'] = $this->db->get('project_user')->result();

		if (count($project['dados']) > 0) {
			$dado['business_case'] = $this->Business_case_model->get($_SESSION['project_id']);
			if ($dado['business_case'] == null) {
				redirect(base_url("integration/business-case/new/" . $_SESSION['project_id']));
			}
			$this->load->view('frame/header_view');
			$this->load->view('frame/topbar');
			$this->load->view('frame/sidebar_nav_view');
			$this->load->view('project/integration/business_case/edit', $dado);
		} else {
			redirect(base_url());
		}
	}


	function insert()
	{
		$business_case['business_deals'] = $this->input->post('business_deals');
		$business_case['situation_analysis'] = $this->input->post('situation_analysis');
		$business_case['recommendation'] = $this->input->post('recommendation');
		$business_case['evaluation'] = $this->input->post('evaluation');
		$business_case['project_id'] = $_SESSION['project_id'];

		$insert  = $this->Business_case_model->insert($business_case);
		if ($insert) {
			$this->session->set_flashdata('success', 'Bussiness Case has been successfully created!');
			insertLogActivity('insert', 'business case');
		}
		redirect("integration/business-case/edit/" . $_SESSION['project_id']);
		// echo json_encode($insert);
	}


	public function update()
	{
		$business_case['business_deals'] = $this->input->post('business_deals');
		$business_case['situation_analysis'] = $this->input->post('situation_analysis');
		$business_case['recommendation'] = $this->input->post('recommendation');
		$business_case['evaluation'] = $this->input->post('evaluation');

		//$insert = $this->project_model->insert_project_pgq($quality_mp);
		$query = $this->Business_case_model->update($business_case, $_SESSION['project_id']);
		if ($query) {
			$this->session->set_flashdata('success', 'Bussiness Case has been successfully changed!');
			insertLogActivity('update', 'business case');
		}

		$this->load->view('frame/header_view');
		$this->load->view('frame/topbar');
		$this->load->view('frame/sidebar_nav_view');
		redirect("integration/business-case/edit/" . $_SESSION['project_id']);
	}
}
