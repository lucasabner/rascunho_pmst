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

				<?php extract($duration_estimates); ?>

				<div class="row">
					<div class="col-lg-12">
						<div class="panel-body">
							<h1 class="page-header">

								<?= $this->lang->line('ade_title')  ?>

							</h1>
								<!-- Textarea -->
								<ul class="abas">
									<!-- Aqui, criação da primeira aba -->

									<div class="col-lg-12 form-group">
										<label for="name"><?= $this->lang->line('ade_activity_name') ?></label>
										<div>
											<input disabled id="name_text" name="activity_id" type="text" class="form-control input-md" required="false" value="<?php echo $activity_id; ?>" disabled>
										</div>
									</div>

									<div class=" col-lg-4 form-group">
										<label for="estimated_duration"><?= $this->lang->line('ade_estimated_duration') ?></label>
										<a class="btn-sm btn-default" id="ade_tp_1" data-toggle="tooltip" data-placement="right" title="<?= $this->lang->line('ade_estimated_duration_tp') ?>"><i class="glyphicon glyphicon-comment"></i></a>
										<div>
											<input id="estimated_duration" type="number" min="0.00" max="10000.00" step="0.01" name="estimated_duration" class="form-control input-md" value="<?php echo $estimated_duration; ?>">
										</div>
									</div>

									<!-- <div class=" col-lg-4 form-group">
										<label for="replanted_duration"><?= $this->lang->line('ade_replanted_duration') ?></label>
										<a class="btn-sm btn-default" id="ade_tp_2" data-toggle="tooltip" data-placement="right" title="<?= $this->lang->line('ade_replanted_duration_tp') ?>"><i class="glyphicon glyphicon-comment"></i></a>
										<div>
											<input id="replanted_duration" type="number" min="0.00" max="10000.00" step="0.01" name="replanted_duration" class="form-control input-md" value="<?php echo $replanted_duration; ?>">
										</div>
									</div> -->
									<div class=" col-lg-4 form-group">
										<label for="estimated_end_date"><?= $this->lang->line('ade_estimated_end_date') ?></label>
										<a class="btn-sm btn-default" id="ade_tp_7" data-toggle="tooltip" data-placement="right" title="<?= $this->lang->line('ade_estimated_end_date_tp') ?>"><i class="glyphicon glyphicon-comment"></i></a>
										<div>
											<input id="estimated_end_date" type="date" name="estimated_end_date" class="form-control input-md" value="<?php echo $estimated_end_date; ?>">
										</div>
									</div>

									<div class=" col-lg-4 form-group">
										<label for="estimated_start_date"><?= $this->lang->line('ade_estimated_start_date') ?></label>
										<a class="btn-sm btn-default" id="ade_tp_4" data-toggle="tooltip" data-placement="right" title="<?= $this->lang->line('ade_estimated_start_date_tp') ?>"><i class="glyphicon glyphicon-comment"></i></a>
										<div>
											<input id="estimated_start_date" type="date" name="estimated_start_date" class="form-control input-md" value="<?php echo $estimated_start_date; ?>">
										</div>
									</div>

									<div class=" col-lg-4 form-group">
										<label for="performed_duration"><?= $this->lang->line('ade_performed_duration') ?></label>
										<a class="btn-sm btn-default" id="ade_tp_3" data-toggle="tooltip" data-placement="right" title="<?= $this->lang->line('ade_performed_duration_tp') ?>"><i class="glyphicon glyphicon-comment"></i></a>
										<div>
											<input id="performed_duration" type="number" min="0.00" max="10000.00" step="0.01" name="performed_duration" class="form-control input-md" value="<?php echo $performed_duration; ?>">
										</div>
									</div>

									

									<!-- <div class=" col-lg-4 form-group">
										<label for="replanted_start_date"><?= $this->lang->line('ade_replanted_start_date') ?></label>
										<a class="btn-sm btn-default" id="ade_tp_5" data-toggle="tooltip" data-placement="right" title="<?= $this->lang->line('ade_replanted_start_date_tp') ?>"><i class="glyphicon glyphicon-comment"></i></a>
										<div>
											<input id="replanted_start_date" type="date" name="replanted_start_date" class="form-control input-md" value="<?php echo $replanted_start_date; ?>">
										</div>
									</div> -->

									<div class=" col-lg-4 form-group">
										<label for="performed_start_date"><?= $this->lang->line('ade_performed_start_date') ?></label>
										<a class="btn-sm btn-default" id="ade_tp_6" data-toggle="tooltip" data-placement="right" title="<?= $this->lang->line('ade_performed_start_date_tp') ?>"><i class="glyphicon glyphicon-comment"></i></a>
										<div>
											<input id="performed_start_date" type="date" name="performed_start_date" class="form-control input-md" value="<?php echo $performed_start_date; ?>">
										</div>
									</div>

								

									<!-- <div class=" col-lg-4 form-group">
										<label for="replanted_end_date"><?= $this->lang->line('ade_replanted_end_date') ?></label>
										<a class="btn-sm btn-default" id="ade_tp_8" data-toggle="tooltip" data-placement="right" title="<?= $this->lang->line('ade_replanted_end_date_tp') ?>"><i class="glyphicon glyphicon-comment"></i></a>
										<div>
											<input id="replanted_end_date" type="date" name="replanted_end_date" class="form-control input-md" value="<?php echo $replanted_end_date; ?>">
										</div>
									</div> -->

									<div class=" col-lg-4 form-group">
										<label for="performed_end_date"><?= $this->lang->line('ade_performed_end_date') ?></label>
										<a class="btn-sm btn-default" id="ade_tp_9" data-toggle="tooltip" data-placement="right" title="<?= $this->lang->line('ade_performed_end_date_tp') ?>"><i class="glyphicon glyphicon-comment"></i></a>
										<div>
											<input id="performed_end_date" type="date" name="performed_end_date" class="form-control input-md" value="<?php echo $performed_end_date; ?>">
										</div>
									</div>



									<div class="col-lg-12">
									

							<form action="<?php echo base_url('schedule/duration-estimates/list/'); ?><?php echo $project_id; ?>">
								<button class="btn btn-lg btn-info pull-left"> <i class="glyphicon glyphicon-chevron-left"></i> <?= $this->lang->line('btn-back') ?></button>
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</body>
<script>
for (var i = 1; i <= 9; i++) {
		if (document.getElementById("ade_tp_"+i).title == "") {
			document.getElementById("ade_tp_"+i).hidden = true;
		}
		limite_textarea(document.getElementById("ade_txt_" + i).value, "ade_" + i);
	}

	function limite_textarea(valor, txt) {
		var limite = 2000;
		var caracteresDigitados = valor.length;
		var caracteresRestantes = limite - caracteresDigitados;
		$("." + txt).text(caracteresRestantes);
	}
</script>
<?php $this->load->view('frame/footer_view') ?>