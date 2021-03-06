<?php
class RiskChecklist_model extends CI_Model
{
	function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	public function get($id)
	{
		$query = $this->db->get_where('communication_item', array('communication_item_id' => $id));
		return $query->row_array();
	}

	public function getAll($project_id)
	{
		$query = $this->db->get_where('risk_checklist', array('risk_checklist.project_id' => $project_id));
		return $query->result();
	}

	public function insert($communication_item)
	{
		return $this->db->insert('communication_item', $communication_item);
	}

	// public function update($communication_item, $communication_item_id)
	// {
	// 	$this->db->where('communication_item.communication_item_id', $communication_item_id);
	// 	return $this->db->update('communication_item', $communication_item);
	// }

	public function delete($id)
	{
		$this->db->where('communication_item.communication_item_id', $id);
		return $this->db->delete('communication_item');
	}

	//--------------------
	// public function getAllResponsability(){
	// 	$query = $this->db->get('communication_responsability');
	// 	return $query->result();
	// }

	public function getAllResponsability($communication_item_id)
	{
		$query = $this->db->get_where('communication_stakeholder_responsability', array('communication_stakeholder_responsability.communication_item_id' => $communication_item_id));
		return $query->result();
	}

	function updateRiskCheckList($risk_checklist, $project_id)
	{
		$this->db->trans_start();

		// $this->db->where('communication_item_id', $communication_item_id);
		// $this->db->where('communication_responsability_id', $communication_responsability_id);
		// $this->db->delete('package', $data);

		//DELETE DETAIL PACKAGE
		$result = array();
		$this->db->delete('risk_checklist', array('project_id' => $project_id));
		if ($risk_checklist != null) {

			for ($j = 0; $j < count($risk_checklist) / 5; $j++) {
				for ($i = 0; $i < count($_POST['aspects']); $i++) {
					$result[] = array(
						'aspects' => $_POST['aspects'][$i],
						'weight' => $_POST['weight'][$i],
						'level' => $_POST['level'][$i],
						'project_id' => $project_id,
						'score' => $_POST['score'][$i],
						'comments' => $_POST['comments'][$i],
					);
				}
			}
			//MULTIPLE INSERT TO DETAIL TABLE
			$this->db->insert_batch('risk_checklist', $result);
		}
		$this->db->trans_complete();
		return $result;
	}

	function templateRiskCheckList($project_id)
	{
		$this->db->trans_start();

		$data = array(
			array(
				'aspects' => 'Os objetivos do projeto foram validados com o cliente?',
				'project_id' => $project_id,
			),
			array(
				'aspects' => 'Existe clareza sobre o que ser?? produzido pelo projeto, e todas as principais partes interessadas est??o cientes e concordam?',
				'project_id' => $project_id,
			),
			array(
				'aspects' => 'Existe comprometimento das principais partes interessadas com o sucesso do projeto?',
				'project_id' => $project_id,
			),
			array(
				'aspects' => 'O cliente tem experi??ncia com este tipo de projeto?',
				'project_id' => $project_id,
			),
			array(
				'aspects' => 'O gerente do projeto tem experi??ncia e compet??ncia para conduzir um projeto com estas caracter??sticas?',
				'project_id' => $project_id,
			),
			array(
				'aspects' => 'A organiza????o tem capacidade financeira para suportar um desvio significativo no or??amento do projeto?',
				'project_id' => $project_id,
			),
			array(
				'aspects' => 'O projeto tem prioridade tanto para o cliente quanto para a organiza????o executora?',
				'project_id' => $project_id,
			),
			array(
				'aspects' => 'O projeto envolve o uso de tecnologia inovadora?',
				'project_id' => $project_id,
			),
			array(
				'aspects' => 'Existem depend??ncias externas?',
				'project_id' => $project_id,
			),
			array(
				'aspects' => 'O ambiente utiliza gest??o profissional de projetos? Existe maturidade organizacional com rela????o ao assunto?',
				'project_id' => $project_id,
			),
			array(
				'aspects' => 'Os prazos s??o realistas?',
				'project_id' => $project_id,
			),
			array(
				'aspects' => 'O ambiente externo onde o projeto ser?? realizado ?? est??vel? (Pa??s, cidade, bairro)',
				'project_id' => $project_id,
			),
			array(
				'aspects' => 'Existe hist??rico positivo com rela????o ao cliente que ser?? atendido?',
				'project_id' => $project_id,
			),
			array(
				'aspects' => 'Caso n??o existam recursos financeiros suficientes para a condu????o do projeto, existem fonte de recursos externos dispon??veis para atender ?? necessidade?',
				'project_id' => $project_id,
			),
			array(
				'aspects' => 'Inclua outros aspectos que considerar importantes para o projeto, e distribua os percentuais para somarem 100%.',
				'project_id' => $project_id,
			),
		);

		//MULTIPLE INSERT TO DETAIL TABLE
		$this->db->insert_batch('risk_checklist', $data);

		$this->db->trans_complete();
	}

	public function getCommunication_stakeholder_item_id($project_id)
	{
		$query = $this->db->get_where('stakeholder', array('stakeholder.project_id' => $project_id));
		return $query->result();
	}
	public function insertCSR($stakeholder_responsability)
	{
		return $this->db->insert('communication_stakeholder_responsability', $stakeholder_responsability);
	}
}
