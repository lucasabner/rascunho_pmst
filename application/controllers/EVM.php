<?php
defined('BASEPATH') or exit('No direct script access allowed');

class EVM extends CI_Controller
{

	function __construct()
	{
		parent::__construct();
		if (!$this->session->userdata('logged_in')) {
			redirect(base_url());
		}
		$this->load->helper('url');
		$this->load->model('Activity_model');
		$this->load->model('view_model');
		$this->load->model('log_model');
		$this->load->helper('log_activity');


		$this->lang->load('btn', 'english');
		// $this->lang->load('btn','portuguese-brazilian');
		$this->lang->load('earned_value', 'english');

		// $this->lang->load('manage-cost','portuguese-brazilian');

	}

	//AGREGATE VALUE
	public function list($project_id)
	{
		$dado['project_id'] = $project_id;
		$dado['activity'] = $this->Activity_model->getAll($project_id);
		$this->load->view('frame/header_view');
		$this->load->view('frame/topbar');
		$this->load->view('frame/sidebar_nav_view');
		$this->load->view('project/schedule/agregate_value/list', $dado);
	}

	public function edit($project_id)
	{
		$query['activity'] = $this->Activity_model->get($project_id);

		$this->load->view('frame/header_view.php');
		$this->load->view('frame/topbar');
		$this->load->view('frame/sidebar_nav_view.php');
		$this->load->view('project/schedule/agregate_value/edit', $query);
	}

	public function update($project_id)
	{
		$activity['agregate_value'] = $this->input->post('agregate_value');
		$activity['planned_value'] = $this->input->post('planned_value');
		$activity['real_agregate_cost'] = $this->input->post('real_agregate_cost');
		$activity['budget_at_cumulative_end'] = $this->input->post('budget_at_cumulative_end');
		$activity['variation_of_terms'] = $this->input->post('variation_of_terms');
		$activity['variation_of_costs'] = $this->input->post('variation_of_costs');
		$activity['variation_at_the_end'] = $this->input->post('variation_at_the_end');
		$activity['deadline_performance_index'] = $this->input->post('deadline_performance_index');
		$activity['costs_performance_index'] = $this->input->post('costs_performance_index');
		$activity['estimated_of_completation'] = $this->input->post('estimated_of_completation');
		$activity['estimate_for_completion'] = $this->input->post('estimate_for_completion');


		$activity['project_id'] = $this->input->post('project_id');

		$data['activity'] = $activity;
		$query = $this->Activity_model->update($data['activity'], $project_id);

		if ($query) {
			insertLogActivity('update', 'earned value management');
			$this->session->set_flashdata('success', 'Earned Value Management has been successfully changed!');
			redirect('schedule/earned-value-management/list/' . $activity['project_id']);
		}
	}
}
