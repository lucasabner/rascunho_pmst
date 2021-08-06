  -- MySQL Script generated by MySQL Workbench
  -- Thu Oct 25 16:14:00 2018
  -- Model: New Model    Version: 1.0
  -- MySQL Workbench Forward Engineering

  SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
  SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
  SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


  -- -----------------------------------------------------
  -- Table `communication_item`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `communication_item` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `communication_item` (
    `communication_item_id` INT(11) NOT NULL AUTO_INCREMENT,
    `type` VARCHAR(45) NULL DEFAULT NULL,
    `description` VARCHAR(45) NULL DEFAULT NULL,
    `content` VARCHAR(255) NULL DEFAULT NULL,
    `distribution_reason` VARCHAR(255) NULL DEFAULT NULL,
    `language` VARCHAR(45) NULL DEFAULT NULL,
    `channel` VARCHAR(45) NULL DEFAULT NULL,
    `documento_format` VARCHAR(45) NULL DEFAULT NULL,
    `metod` VARCHAR(45) NULL DEFAULT NULL,
    `frequency` VARCHAR(45) NULL DEFAULT NULL,
    `allocated_resources` VARCHAR(45) NULL DEFAULT NULL,
    `format` VARCHAR(45) NULL DEFAULT NULL,
    `local` VARCHAR(45) NULL DEFAULT NULL,
    `project_id` INT(11) NOT NULL,
    `status` BIT(1) NULL DEFAULT NULL,
    PRIMARY KEY (`communication_item_id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `communication_responsability`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `communication_responsability` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `communication_responsability` (
    `communication_responsability_id` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NULL DEFAULT NULL,
    `initials` VARCHAR(45) NULL DEFAULT NULL,
    `status` BIT(1) NULL DEFAULT NULL,
    PRIMARY KEY (`communication_responsability_id`))
  ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARACTER SET = utf8
  COMMENT = 'communication_type';

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `communication_stakeholder_responsability`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `communication_stakeholder_responsability` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `communication_stakeholder_responsability` (
    `communication_item_id` INT(11) NOT NULL,
    `stakeholder_id` INT(11) NOT NULL,
    `communication_responsability_id` INT(11) NOT NULL,
    PRIMARY KEY (`communication_item_id`, `stakeholder_id`, `communication_responsability_id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `cost_mp`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `cost_mp` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `cost_mp` (
    `cost_mp_id` INT(11) NOT NULL AUTO_INCREMENT,
    `project_costs_m` VARCHAR(255) NULL DEFAULT NULL,
    `accuracy_level` TEXT NULL DEFAULT NULL,
    `organizational_procedures` VARCHAR(255) NULL DEFAULT NULL,
    `measurement_rules` TEXT NULL DEFAULT NULL,
    `format_report` VARCHAR(255) NULL DEFAULT NULL,
    `project_id` INT(11) NOT NULL,
    `status` BIT(1) NULL DEFAULT NULL,
    PRIMARY KEY (`cost_mp_id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `human_resources_mp`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `human_resources_mp` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `human_resources_mp` (
    `human_resources_mp_id` INT(11) NOT NULL AUTO_INCREMENT,
    `roles_responsibilities` TEXT NULL DEFAULT NULL,
    `organizational_chart` VARCHAR(255) NULL DEFAULT NULL,
    `staff_mp` TEXT NULL DEFAULT NULL,
    `project_id` INT(11) NOT NULL,
    `status` BIT(1) NULL DEFAULT NULL,
    PRIMARY KEY (`human_resources_mp_id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `procurement_mp`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `procurement_mp` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `procurement_mp` (
    `procurement_mp_id` INT(11) NOT NULL AUTO_INCREMENT,
    `products_services_obtained` TEXT NULL DEFAULT NULL,
    `team_actions` TEXT NULL DEFAULT NULL,
    `performance_metrics` TEXT NULL DEFAULT NULL,
    `procurement_management` VARCHAR(45) NULL,
    `project_id` INT(11) NOT NULL,
    `status` BIT(1) NULL DEFAULT NULL,
    PRIMARY KEY (`procurement_mp_id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `project`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `project` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `project` (
    `project_id` INT(11) NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NULL DEFAULT NULL,
    `objectives` VARCHAR(255) NULL DEFAULT NULL,
    `created_by` INT(11) NOT NULL,
    PRIMARY KEY (`project_id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `project_charter`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `project_charter` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `project_charter` (
    `project_charter_id` INT(11) NOT NULL AUTO_INCREMENT,
    `project_description` TEXT NULL DEFAULT NULL,
    `project_purpose` TEXT NULL DEFAULT NULL,
    `project_objective` TEXT NULL DEFAULT NULL,
    `benefits` TEXT NULL DEFAULT NULL,
    `high_level_requirements` TEXT NULL DEFAULT NULL,
    `initial_assumptions` TEXT NULL DEFAULT NULL,
    `initial_restrictions` TEXT NULL DEFAULT NULL,
    `project_limits` TEXT NULL DEFAULT NULL,
    `high_level_risks` TEXT NULL DEFAULT NULL,
    `summary_schedule` TEXT NULL DEFAULT NULL,
    `budge_summary` TEXT NULL DEFAULT NULL,
    `project_approval_requirements` TEXT NULL DEFAULT NULL,
    `start_date` DATE NULL DEFAULT NULL,
    `end_date` DATE NULL DEFAULT NULL,
    `project_id` INT(11) NOT NULL,
    `status` BIT(1) NULL DEFAULT NULL,
    PRIMARY KEY (`project_charter_id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `project_charter_stakeholder`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `project_charter_stakeholder` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `project_charter_stakeholder` (
    `stakeholder_id` INT(11) NOT NULL,
    `project_charter_id` INT(11) NOT NULL,
    `status` BIT(1) NULL DEFAULT NULL,
    PRIMARY KEY (`stakeholder_id`, `project_charter_id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `project_mp`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `project_mp` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `project_mp` (
    `project_mp_id` INT(11) NOT NULL AUTO_INCREMENT,
    `project_lifecycle` TEXT NULL DEFAULT NULL,
    `project_guidelines` TEXT NULL DEFAULT NULL,
    `change_mp` TEXT NULL DEFAULT NULL,
    `configuration_mp` TEXT NULL DEFAULT NULL,
    `baseline_maintenance` TEXT NULL DEFAULT NULL,
    `stakeholders_communication` TEXT NULL DEFAULT NULL,
    `key_review` TEXT NULL DEFAULT NULL,
    `project_id` INT(11) NOT NULL,
    `status` BIT(1) NULL DEFAULT NULL,
    PRIMARY KEY (`project_mp_id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `project_user`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `project_user` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `project_user` (
    `project_id` INT(11) NOT NULL,
    `user_id` INT(11) NOT NULL,
    `access_level` INT(11) NOT NULL)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `quality_mp`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `quality_mp` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `quality_mp` (
    `quality_mp_id` INT(11) NOT NULL AUTO_INCREMENT,
    `methodology` TEXT NULL DEFAULT NULL,
    `related_processes` VARCHAR(255) NULL DEFAULT NULL,
    `expectations_tolerances` TEXT NULL DEFAULT NULL,
    `traceability` TEXT NULL DEFAULT NULL,
    `project_id` INT(11) NOT NULL,
    `status` BIT(1) NULL DEFAULT NULL,
    PRIMARY KEY (`quality_mp_id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `requirements_mp`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `requirements_mp` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `requirements_mp` (
    `requirements_mp_id` INT(11) NOT NULL AUTO_INCREMENT,
    `requirements_collection_proc` TEXT NULL DEFAULT NULL,
    `requirements_prioritization` TEXT NULL DEFAULT NULL,
    `product_metrics` TEXT NULL DEFAULT NULL,
    `project_id` INT(11) NOT NULL,
    `status` BIT(1) NULL DEFAULT NULL,
    PRIMARY KEY (`requirements_mp_id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `risk_mp`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `risk_mp` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `risk_mp` (
    `risk_mp_id` INT(11) NOT NULL AUTO_INCREMENT,
    `methodology` TEXT NULL DEFAULT NULL,
    `roles_responsibilities` TEXT NULL DEFAULT NULL,
    `risk_management_processes` VARCHAR(255) NULL DEFAULT NULL,
    `risks_categories` VARCHAR(255) NULL DEFAULT NULL,
    `risks_probability_impact` VARCHAR(255) NULL DEFAULT NULL,
    `probability_impact_matrix` VARCHAR(255) NULL DEFAULT NULL,
    `reviewed_tolerances` TEXT NULL DEFAULT NULL,
    `traceability` VARCHAR(255) NULL DEFAULT NULL,
    `project_id` INT(11) NOT NULL,
    `status` BIT(1) NULL DEFAULT NULL,
    PRIMARY KEY (`risk_mp_id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `schedule_mp`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `schedule_mp` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `schedule_mp` (
    `schedule_mp_id` INT(11) NOT NULL AUTO_INCREMENT,
    `schedule_model` VARCHAR(255) NULL DEFAULT NULL,
    `accuracy_level` VARCHAR(255) NULL DEFAULT NULL,
    `organizational_procedures` VARCHAR(255) NULL DEFAULT NULL,
    `schedule_maintenance` VARCHAR(255) NULL DEFAULT NULL,
    `performance_measurement` TEXT NULL DEFAULT NULL,
    `report_format` VARCHAR(255) NULL DEFAULT NULL,
    `project_id` INT(11) NOT NULL,
    `status` BIT(1) NULL DEFAULT NULL,
    PRIMARY KEY (`schedule_mp_id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `scope_mp`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `scope_mp` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `scope_mp` (
    `scope_mp_id` INT(11) NOT NULL AUTO_INCREMENT,
    `scope_specification` TEXT NULL DEFAULT NULL,
    `eap_process` TEXT NULL DEFAULT NULL,
    `deliveries_acceptance` TEXT NULL DEFAULT NULL,
    `scope_change_mp` TEXT NULL DEFAULT NULL,
    `project_id` INT(11) NOT NULL,
    `status` BIT(1) NULL DEFAULT NULL,
    PRIMARY KEY (`scope_mp_id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `stakeholder`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `stakeholder` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `stakeholder` (
    `stakeholder_id` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NULL DEFAULT NULL,
    `type` VARCHAR(45) NULL DEFAULT NULL,
    `organization` VARCHAR(45) NULL DEFAULT NULL,
    `position` VARCHAR(45) NULL DEFAULT NULL,
    `role` VARCHAR(45) NULL DEFAULT NULL,
    `responsibility` VARCHAR(45) NULL DEFAULT NULL,
    `email` VARCHAR(45) NULL DEFAULT NULL,
    `phone_number` VARCHAR(45) NULL DEFAULT NULL,
    `work_place` VARCHAR(45) NULL DEFAULT NULL,
    `essential_requirements` TEXT NULL DEFAULT NULL,
    `main_expectations` TEXT NULL DEFAULT NULL,
    `interest_phase` TEXT NULL DEFAULT NULL,
    `observations` TEXT NULL DEFAULT NULL,
    `project_id` INT(11) NOT NULL,
    PRIMARY KEY (`stakeholder_id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `stakeholder_mp`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `stakeholder_mp` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `stakeholder_mp` (
    `stakeholder_mp_id` INT(11) NOT NULL AUTO_INCREMENT,
    `stakeholder_id` INT(11) NOT NULL,
    `interest` INT(11) NULL DEFAULT NULL,
    `power` INT(11) NULL DEFAULT NULL,
    `influence` INT(11) NULL DEFAULT NULL,
    `impact` INT(11) NULL DEFAULT NULL,
    `average` INT(11) NULL DEFAULT NULL,
    `expected_engagement` VARCHAR(45) NULL DEFAULT NULL,
    `current_engagement` VARCHAR(45) NULL DEFAULT NULL,
    `strategy` TEXT NULL DEFAULT NULL,
    `scope` TEXT NULL DEFAULT NULL,
    `observation` TEXT NULL DEFAULT NULL,
    `project_id` INT(11) NOT NULL,
    PRIMARY KEY (`stakeholder_mp_id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `user`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `user` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `user` (
    `user_id` INT(11) NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `role` VARCHAR(50) NOT NULL,
    `status` TINYINT(1) NOT NULL DEFAULT '1',
    `institution` VARCHAR(255) NULL DEFAULT NULL,
    `lattes_address` VARCHAR(255) NULL DEFAULT NULL,
    `created_at` DATETIME NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`user_id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `issues_record`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `issues_record` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `issues_record` (
    `issues_record_id` INT NOT NULL AUTO_INCREMENT,
    `identification` VARCHAR(45) NULL,
    `identification_date` DATE NULL,
    `question_description` VARCHAR(255) NULL,
    `type` VARCHAR(45) NULL,
    `responsable` VARCHAR(45) NULL,
    `situation` VARCHAR(45) NULL,
    `action` VARCHAR(255) NULL,
    `resolution_date` DATE NULL,
    `replan_date` DATE NULL,
    `observations` VARCHAR(255) NULL,
    `status` BIT(1) NULL,
    `project_id` INT(11) NOT NULL,
    PRIMARY KEY (`issues_record_id`))
  ENGINE = InnoDB;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `team_performance_evaluation`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `team_performance_evaluation` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `team_performance_evaluation` (
    `team_performance_evaluation_id` INT NOT NULL AUTO_INCREMENT,
    `team_member_name` VARCHAR(45) NULL,
    `role` VARCHAR(45) NULL,
    `project_function` VARCHAR(45) NULL,
    `report_date` DATE NULL,
    `team_member_comments` VARCHAR(255) NULL,
    `strong_points` VARCHAR(255) NULL,
    `improvement` VARCHAR(255) NULL,
    `development_plan` VARCHAR(255) NULL,
    `already_developed` VARCHAR(255) NULL,
    `external_comments` VARCHAR(255) NULL,
    `team_mates_comments` VARCHAR(255) NULL,
    `team_performance_evaluationcol` VARCHAR(255) NULL,
    `project_id` INT(11) NOT NULL,
    PRIMARY KEY (`team_performance_evaluation_id`))
  ENGINE = InnoDB;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `notification_board`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `notification_board` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `notification_board` (
    `notification_board_id` INT NOT NULL AUTO_INCREMENT,
    `running_activities` TEXT NULL,
    `important_activities` TEXT NULL,
    `open_issues` TEXT NULL,
    `changes_approval` TEXT NULL,
    `general_warnings` TEXT NULL,
    `project_id` INT(11) NOT NULL,
    PRIMARY KEY (`notification_board_id`))
  ENGINE = InnoDB;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `project_closure_term`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `project_closure_term` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `project_closure_term` (
    `project_closure_term_id` INT NOT NULL AUTO_INCREMENT,
    `client` VARCHAR(45) NULL,
    `project_closure_date` DATE NULL,
    `main_changes_approved` VARCHAR(255) NULL,
    `main_deviations` VARCHAR(255) NULL,
    `main_lessons_learned` VARCHAR(255) NULL,
    `client_comments` VARCHAR(255) NULL,
    `sponsor_comments` VARCHAR(45) NULL,
    `project_id` INT(11) NOT NULL,
    PRIMARY KEY (`project_closure_term_id`))
  ENGINE = InnoDB;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `risk_register`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `risk_register` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `risk_register` (
    `risk_register_id` INT NOT NULL AUTO_INCREMENT,
    `impacted_objective` VARCHAR(255) NULL,
    `risk_status` VARCHAR(255) NULL,
    `date` DATE NULL,
    `type` VARCHAR(255) NULL,
    `priority` VARCHAR(255) NULL,
    `event` VARCHAR(255) NULL,
    `identifier` VARCHAR(255) NULL,
    `status` BIT(1) NULL,
    `project_id` INT(11) NOT NULL,
    PRIMARY KEY (`risk_register_id`))
  ENGINE = InnoDB;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `scope_specification`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `scope_specification` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `scope_specification` (
    `scope_specification_id` INT NOT NULL AUTO_INCREMENT,
    `scope_description` VARCHAR(255) NULL,
    `acceptance_criteria` VARCHAR(255) NULL,
    `deliveries` VARCHAR(255) NULL,
    `exclusions` VARCHAR(255) NULL,
    `restrictions` VARCHAR(255) NULL,
    `assumptions` VARCHAR(45) NULL,
    `project_id` INT(11) NOT NULL,
    PRIMARY KEY (`scope_specification_id`))
  ENGINE = InnoDB;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `requirement_registration`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `requirement_registration` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `requirement_registration` (
    `requirement_registration_id` INT NOT NULL AUTO_INCREMENT,
    `associated_id` VARCHAR(45) NULL,
    `business_strategy` VARCHAR(45) NULL,
    `requirement_name` VARCHAR(45) NULL,
    `priority` VARCHAR(45) NULL,
    `description` VARCHAR(255) NULL,
    `version` VARCHAR(45) NULL,
    `phase` VARCHAR(45) NULL,
    `associated_delivery` VARCHAR(45) NULL,
    `type` VARCHAR(45) NULL,
    `requester` VARCHAR(45) NULL,
    `complexity` VARCHAR(45) NULL,
    `acceptance_criteria` VARCHAR(45) NULL,
    `responsible` VARCHAR(45) NULL,
    `validity` VARCHAR(45) NULL,
    `supporting_documentation` VARCHAR(45) NULL,
    `requirement_situation` VARCHAR(45) NULL,
    `project_id` INT(11) NOT NULL,
    PRIMARY KEY (`requirement_registration_id`))
  ENGINE = InnoDB;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `change_log`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `change_log` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `change_log` (
    `change_log_id` INT NOT NULL AUTO_INCREMENT,
    `id_number` VARCHAR(45) NULL,
    `requester` VARCHAR(45) NULL,
    `request_date` DATE NULL,
    `change_type` VARCHAR(45) NULL,
    `situation` VARCHAR(45) NULL,
    `change_description` VARCHAR(700) NULL,
    `project_management_feedback` VARCHAR(1000) NULL,
    `ccc_feedback` VARCHAR(1000) NULL,
    `ccc_feedback_date` DATE NULL,
    `comments` VARCHAR(1000) NULL,
    `project_id` INT(11) NOT NULL,
    PRIMARY KEY (`change_log_id`))
  ENGINE = InnoDB;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `process_improvement_plan`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `process_improvement_plan` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `process_improvement_plan` (
    `process_improvement_plan_id` INT NOT NULL,
    `process_limits` VARCHAR(45) NULL,
    `process_configuration` VARCHAR(45) NULL,
    `process_metrics` VARCHAR(45) NULL,
    `goals_performace_improvement` VARCHAR(45) NULL,
    `project_id` INT(11) NOT NULL,
    PRIMARY KEY (`process_improvement_plan_id`))
  ENGINE = InnoDB;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- Table `view`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `view` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `view` (
    `view_id` INT NOT NULL,
    `view_name` VARCHAR(55) NULL,
    `view_status` INT NULL,

    PRIMARY KEY (`view_id`))
  ENGINE = InnoDB;

  SHOW WARNINGS;

    -- -----------------------------------------------------
  -- Table `field`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `field` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `field` (
    `field_id` INT NOT NULL,
    `view_id` INT NOT NULL,
    `field_name` VARCHAR(55) NULL,
    `field_status` INT NULL,

    PRIMARY KEY (`field_id`))
  ENGINE = InnoDB;

  SHOW WARNINGS;

      -- -----------------------------------------------------
  -- Table `anexo`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `anexo` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `anexo` (
    `anexo_id` INT NOT NULL AUTO_INCREMENT,
    `project_id` INT(11) NOT NULL,
    `user_id` INT(11) NOT NULL,
    `date` TIMESTAMP NULL,
    `identifier` VARCHAR(100) NULL,
    `view_id` INT NOT NULL,
    `field_id` INT NOT NULL,
    `field_name` VARCHAR(55) NULL,
    `path` VARCHAR(300) NOT NULL,

    PRIMARY KEY (`anexo_id`))
  ENGINE = InnoDB;

  SHOW WARNINGS;

  -- -----------------------------------------------------
  -- INSERTS VIEWS
  -- -----------------------------------------------------
  INSERT INTO `view` (view_id, view_name)
  VALUES (1, "project_charter"),
  (2, "change_log"),
  (3, "requirement_registration"),
  (4, "scope_management_specification"),
  (5, "project_general_risk_checklist"),
  (6, "stakeholder_registration"),
  (7, "project_management_plan"),
  (8, "stakeholder_management_plan"),
  (9, "communication_management_plan"),
  (10, "scope_management_plan"),
  (11, "requirement_management_plan"),
  (12, "schedule_management_plan"),
  (13, "cost_management_plan"),
  (14, "risk_management_plan"),
  (15, "requirements_traceability_matrix"),
  (16, "analytical_structure_of_the_project"),
  (17, "analytical_structure_of_resources"),
  (18, "human_resources_management_plan"),
  (19, "schedule"),
  (20, "procurement_management_plan"),
  (21, "procurement_statement_of_the_work"),
  (22, "risk_register"),
  (23, "quality_management_plan"),
  (24, "process_improvement_plan"),
  (25, "checklist_of_quality"),
  (26, "project_financial_resource_requiriments"),
  (27, "change_request"),
  (28, "billboard"),
  (29, "team_performance_evaluation"),
  (30, "project_performance_report"),
  (31, "project_performance_and_monitoring_report"),
  (32, "delivery_acceptance_term"),
  (33, "procurement_close_documentation"),
  (34, "phase_closing_term"),
  (35, "project_closing_statement"),
  (36, "issue_log"),
  (37, "log_register");

-- -----------------------------------------------------
  -- INSERTS FIELD
  -- -----------------------------------------------------
  INSERT INTO `field` (field_id, view_id, field_name)
  VALUES (1, 13, "process_for_managing_project_costs"),
    (2, 14, "methodology"),
    (3, 14, "roles_responsibilities"),
    (4, 14, "probability_impact_matrix"),
    (5, 14, "risk_management_processes"),
    (6, 14, "risks_categories"),
    (7, 14, "risks_probability_impact"),
    (8, 14, "reviewed_tolerances"),
    (9, 14, "traceability"),
    (10, 18, "roles_responsibilities"),
    (11, 18, "organizational_chart"),
    (12, 18, "staff"),
    (13, 20, "products_services_obtained"),
    (14, 20, "team_actions"),
    (15, 20, "performance_metrics"),
    (16, 20, "procurement_management"),
    (17, 23, "process_related_to_project_quality_management"),
    (18, 24, "process_configuration");

  -- -----------------------------------------------------
  -- Table `requirement_log`
  -- -----------------------------------------------------
  DROP TABLE IF EXISTS `requirement_log` ;

  SHOW WARNINGS;
  CREATE TABLE IF NOT EXISTS `requirement_log` (
    `requirement_log_id` INT NOT NULL AUTO_INCREMENT,
    `creation_date` DATE NULL,
    `last_change_date` DATE NULL,
    `last_change_responsible` DATE NULL,
    `last_change_reason` VARCHAR(45) NULL,
    `requirement_registration_id` INT NOT NULL,
    PRIMARY KEY (`requirement_log_id`))
  ENGINE = InnoDB;

  SHOW WARNINGS;

  SET SQL_MODE=@OLD_SQL_MODE;
  SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
  SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

  -- -----------------------------------------------------
  -- INSERTS USERS
  -- -----------------------------------------------------
  INSERT INTO `user` (email, password, name, role, status, institution, lattes_address)
  VALUES ("teste@teste.com", "698dc19d489c4e4db73e28a713eab07b", "Testador 1", "1", 1, "UNIPAMPA", "www.lattes.com"),
  ("teste2@teste.com", "698dc19d489c4e4db73e28a713eab07b", "Testador 2", "1", 1, "UNIPAMPA", "www.lattes.com"),
  ("teste3@teste.com", "698dc19d489c4e4db73e28a713eab07b", "Testador 2", "1", 1, "UNIPAMPA", "www.lattes.com"),
  ("teste4@teste.com", "698dc19d489c4e4db73e28a713eab07b", "Testador 1", "1", 2, "UNIPAMPA", "www.lattes.com"),
  ("teste5@teste.com", "698dc19d489c4e4db73e28a713eab07b", "Testador 1", "1", 3, "UNIPAMPA", "www.lattes.com");