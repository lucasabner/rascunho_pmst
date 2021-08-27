<body class="hold-transition skin-gray sidebar-mini">
	<script>
		(function() {
			if (Boolean(sessionStorage.getItem('sidebar-toggle-collapsed'))) {
				var body = document.getElementsByTagName('body')[0];
				body.className = body.className + ' sidebar-collapse';
			}
		})();
	</script>
	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content">
				<?php if ($this->session->flashdata('success')) : ?>
					<div class="alert alert-success">
						<a href="#" class="close" data-dismiss="alert">&times;</a>
						<strong><?php echo $this->session->flashdata('success'); ?></strong>
					</div>
				<?php elseif ($this->session->flashdata('error')) : ?>
					<div class="alert alert-warning">
						<a href="#" class="close" data-dismiss="alert">&times;</a>
						<strong><?php echo $this->session->flashdata('error'); ?></strong>
					</div>
				<?php endif; ?>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel-body">
							<h1 class="page-header">

								<?= $this->lang->line('wp-title')  ?>

							</h1>

							<form method="POST" action="<?php echo base_url('integration/work-performance-reports/insert/'); ?><?php echo $project_id; ?>">
								<input type="hidden" id="project_id" name="project_id" value="<?php echo $project_id; ?>">

								<div class="col-lg-6 form-group">
										<label><?= $this->lang->line('wpr_responsible') ?></label>
										<a class="btn-sm btn-default" id="wpr_tp_1" data-toggle="tooltip" data-placement="right" title="<?= $this->lang->line('wpr_responsible_tp') ?>"><i class="glyphicon glyphicon-comment"></i></a>
										<select name="responsible" size="1" class="form-control" tabindex="1" required>
										<option selected="selected" disabled="disabled" value=""> Select </option>
											<?php foreach ($stakeholder as $item) { ?>
												<option value="<?= $item->stakeholder_id; ?>">
													<?=  getStakeholderName($item->stakeholder_id); ?></option>
											<?php  } ?>
										</select>
									</div>

								<div class=" col-lg-3 form-group">
									<label for="date"><?= $this->lang->line('wpr_date') ?></label>
									<a class="btn-sm btn-default" id="wpr_tp_2" data-toggle="tooltip" data-placement="right" title="<?= $this->lang->line('wpr_date_tp') ?>"><i class="glyphicon glyphicon-comment"></i></a>
									<div>
										<input id="date" type="date" name="date" class="form-control input-md">
									</div>
								</div>


								<div class="col-lg-12 form-group">
									<label for="main_activities"><?= $this->lang->line('wpr_main_activities') ?></label>
									<span class="wpr_2">2000</span><?= $this->lang->line('character') ?>
									<a class="btn-sm btn-default" id="wpr_tp_3" data-toggle="tooltip" data-placement="right" title="<?= $this->lang->line('wpr_main_activities_tp') ?>"><i class="glyphicon glyphicon-comment"></i></a>
									<div>
									<textarea onkeyup="limite_textarea(this.value, 'wpr_2')" id="wpr_txt_2" maxlength="2000" oninput="eylem(this, this.value)" class="form-control elasticteste" name="main_activities"></textarea>
									</div>
								</div>

								<div class="col-lg-12 form-group">
									<label for="next_activities"><?= $this->lang->line('wpr_next_activities') ?></label>
									<span class="wpr_3">2000</span><?= $this->lang->line('character') ?>
									<a class="btn-sm btn-default" id="wpr_tp_4" data-toggle="tooltip" data-placement="right" title="<?= $this->lang->line('wpr_next_activities_tp') ?>"><i class="glyphicon glyphicon-comment"></i></a>
									<div>
									<textarea onkeyup="limite_textarea(this.value, 'wpr_3')" id="wpr_txt_3" maxlength="2000" oninput="eylem(this, this.value)" class="form-control elasticteste" name="next_activities"></textarea>
									</div>
								</div>

								<div class="col-lg-12 form-group">
									<label for="comments"><?= $this->lang->line('wpr_comments') ?></label>
									<span class="wpr_4">2000</span><?= $this->lang->line('character') ?>
									<a class="btn-sm btn-default" id="wpr_tp_5" data-toggle="tooltip" data-placement="right" title="<?= $this->lang->line('wpr_comments_tp') ?>"><i class="glyphicon glyphicon-comment"></i></a>
									<div>
									<textarea onkeyup="limite_textarea(this.value, 'wpr_4')" id="wpr_txt_4" maxlength="2000" oninput="eylem(this, this.value)" class="form-control elasticteste" name="comments"></textarea>
									</div>
								</div>

								<div class="col-lg-12 form-group">
									<label for="issues"><?= $this->lang->line('wpr_issues') ?></label>
									<span class="wpr_5">2000</span><?= $this->lang->line('character') ?>
									<a class="btn-sm btn-default" id="wpr_tp_6" data-toggle="tooltip" data-placement="right" title="<?= $this->lang->line('wpr_issues_tp') ?>"><i class="glyphicon glyphicon-comment"></i></a>
									<div>
									<textarea onkeyup="limite_textarea(this.value, 'wpr_5')" id="wpr_txt_5" maxlength="2000" oninput="eylem(this, this.value)" class="form-control elasticteste" name="issues"></textarea>
									</div>
								</div>

								<div class="col-lg-12 form-group">
									<label for="changes"><?= $this->lang->line('wpr_changes') ?></label>
									<span class="wpr_6">2000</span><?= $this->lang->line('character') ?>
									<a class="btn-sm btn-default" id="wpr_tp_7" data-toggle="tooltip" data-placement="right" title="<?= $this->lang->line('wpr_changes_tp') ?>"><i class="glyphicon glyphicon-comment"></i></a>
									<div>
									<textarea onkeyup="limite_textarea(this.value, 'wpr_6')" id="wpr_txt_6" maxlength="2000" oninput="eylem(this, this.value)" class="form-control elasticteste" name="changes"></textarea>
									</div>
								</div>

								<div class="col-lg-12 form-group">
									<label for="risks"><?= $this->lang->line('wpr_risks') ?></label>
									<span class="wpr_7">2000</span><?= $this->lang->line('character') ?>
									<a class="btn-sm btn-default" id="wpr_tp_8" data-toggle="tooltip" data-placement="right" title="<?= $this->lang->line('wpr_risks_tp') ?>"><i class="glyphicon glyphicon-comment"></i></a>
									<div>
									<textarea onkeyup="limite_textarea(this.value, 'wpr_7')" id="wpr_txt_7" maxlength="2000" oninput="eylem(this, this.value)" class="form-control elasticteste" name="risks"></textarea>
									</div>
								</div>

								<div class="col-lg-12 form-group">
									<label for="attention_points"><?= $this->lang->line('wpr_attention_points') ?></label>
									<span class="wpr_8">2000</span><?= $this->lang->line('character') ?>
									<a class="btn-sm btn-default" id="wpr_tp_9" data-toggle="tooltip" data-placement="right" title="<?= $this->lang->line('wpr_attention_points_tp') ?>"><i class="glyphicon glyphicon-comment"></i></a>
									<div>
									<textarea onkeyup="limite_textarea(this.value, 'wpr_8')" id="wpr_txt_8" maxlength="2000" oninput="eylem(this, this.value)" class="form-control elasticteste" name="attention_points"></textarea>
									</div>
								</div>


								<div class="col-lg-12">
									<button id="work_performance_report-submit" type="submit" value="Save" class="btn btn-lg btn-success pull-right">
										<i class="glyphicon glyphicon-ok"></i> <?= $this->lang->line('btn-save') ?>
									</button>
							</form>
							<form action="<?php echo base_url('integration/work-performance-reports/list/'); ?><?php echo $project_id; ?>">
								<button class="btn btn-lg btn-info pull-left"> <i class="glyphicon glyphicon-chevron-left"></i> <?= $this->lang->line('btn-back') ?></button>
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</body>
<script src="<?= base_url() ?>assets/js/jquery-1.11.1.js" type="text/javascript"></script>
<script type="text/javascript">
	for (var i = 1; i <= 9; i++) {
		if (document.getElementById("wpr_tp_" + i).title == "") {
			document.getElementById("wpr_tp_" + i).hidden = true;
		}
		limite_textarea(document.getElementById("wpr_txt_" + i).value, "wpr_" + i);
	}

	function limite_textarea(valor, txt) {
		var limite = 2000;
		var caracteresDigitados = valor.length;
		var caracteresRestantes = limite - caracteresDigitados;
		$("." + txt).text(caracteresRestantes);
	}
  </script>
<?php $this->load->view('frame/footer_view') ?>