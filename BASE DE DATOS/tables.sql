use lingui_academy;

/*INDEPENDIENTES*/

CREATE TABLE document_type (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	name varchar(255) NOT NULL,
	abbrevation varchar(255) NOT NULL,
	CONSTRAINT idx_document_type_pk PRIMARY KEY (id)
);

CREATE TABLE role (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	name VARCHAR(255) NOT NULL,
	CONSTRAINT idx_role_pk PRIMARY KEY (id)
);

CREATE TABLE level (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	name varchar(255) NOT NULL,
	CONSTRAINT idx_level_pk PRIMARY KEY (id)
);

CREATE TABLE unit (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	name varchar(255) NOT NULL,
	CONSTRAINT idx_unit_pk PRIMARY KEY (id)
);

CREATE TABLE language (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	name varchar(255) NOT NULL,
	abbreviation varchar(255) NOT NULL,
	CONSTRAINT idx_language_pk PRIMARY KEY (id)
);

CREATE TABLE component (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	name varchar(255) NOT NULL,
	CONSTRAINT idx_component_pk PRIMARY KEY (id)
);

CREATE TABLE contract (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	name varchar(255) NOT NULL,
	month_amount BIGINT UNSIGNED NOT NULL,
	hour_amount BIGINT UNSIGNED NOT NULL,
	CONSTRAINT idx_contract_pk PRIMARY KEY (id)
);

CREATE TABLE workday (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	journal varchar(255) NOT NULL,
	CONSTRAINT idx_workday_pk PRIMARY KEY (id)
);

CREATE TABLE modality (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	kind varchar(255) NOT NULL,
	CONSTRAINT idx_modality_pk PRIMARY KEY (id)
);

CREATE TABLE class_type (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	`type` VARCHAR(255) NOT NULL,
	CONSTRAINT idx_class_type_pk PRIMARY KEY (id)
);

CREATE TABLE house (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	name varchar(255) NOT NULL,
	CONSTRAINT idx_house_pk PRIMARY KEY (id)
);


CREATE TABLE permission (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	name varchar(255) NOT NULL,
	CONSTRAINT idx_permission_pk PRIMARY KEY (id)
);

CREATE TABLE status (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	name varchar(255) NOT NULL,
	CONSTRAINT idx_status_pk PRIMARY KEY (id)
);

CREATE TABLE dashboard_component (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	name varchar(255) NOT NULL,
	CONSTRAINT idx_dashboard_component_pk PRIMARY KEY (id)
);

/*DEPENDIENTES*/

CREATE TABLE user (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	name varchar(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	document_type_id BIGINT UNSIGNED NOT NULL,
	document_number BIGINT UNSIGNED NOT NULL,
	email varchar(255) NOT NULL,
	phone_number BIGINT UNSIGNED NOT NULL,
	workday_id BIGINT UNSIGNED DEFAULT NULL NULL,
	CONSTRAINT idx_user_pk PRIMARY KEY (id),
	CONSTRAINT idx_user_document_number_unique UNIQUE KEY (document_number),
	CONSTRAINT idx_user_email_unique UNIQUE KEY (email),
	CONSTRAINT idx_user_document_type_id_FK FOREIGN KEY (document_type_id) REFERENCES lingui_academy.document_type(id),
	CONSTRAINT idx_user_workday_id_FK FOREIGN KEY (workday_id) REFERENCES lingui_academy.workday(id)
);

CREATE TABLE user_role (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	role_id BIGINT UNSIGNED NOT NULL,
	CONSTRAINT idx_user_role_pk PRIMARY KEY (id),
	CONSTRAINT idx_user_role_user_id_FK FOREIGN KEY (user_id) REFERENCES lingui_academy.`user`(id),
	CONSTRAINT idx_user_role_role_id_FK FOREIGN KEY (role_id) REFERENCES lingui_academy.`role`(id)
);

CREATE TABLE student (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	student_code BIGINT UNSIGNED NOT NULL,
	status_id BIGINT UNSIGNED NOT NULL, 
	CONSTRAINT idx_student_pk PRIMARY KEY (id),
	CONSTRAINT idx_student_user_id_FK FOREIGN KEY (user_id) REFERENCES lingui_academy.`user`(id),
	CONSTRAINT idx_student_status_id_FK FOREIGN KEY (status_id) REFERENCES lingui_academy.`status`(id)	
);

CREATE TABLE student_contract (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	student_id BIGINT UNSIGNED NOT NULL,
	contract_id BIGINT UNSIGNED NOT NULL,
	contract_start_date DATE NOT NULL,
	contract_end_date DATE NOT NULL,
	CONSTRAINT idx_student_contract_pk PRIMARY KEY (id),
	CONSTRAINT idx_student_contract_student_id_FK FOREIGN KEY (student_id) REFERENCES lingui_academy.student(id),
	CONSTRAINT idx_student_contract_contract_id_FK FOREIGN KEY (contract_id) REFERENCES lingui_academy.contract(id)
);

CREATE TABLE student_language (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	language_id BIGINT UNSIGNED NOT NULL,
	student_id BIGINT UNSIGNED NOT NULL,
	CONSTRAINT idx_student_language_id_pk PRIMARY KEY (id),
	CONSTRAINT idx_student_language_language_id_FK FOREIGN KEY (language_id) REFERENCES lingui_academy.`language`(id),
	CONSTRAINT idx_student_language_student_id_FK FOREIGN KEY (student_id) REFERENCES lingui_academy.student(id)
);

CREATE TABLE teacher_user_language (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	language_id BIGINT UNSIGNED NOT NULL,
	CONSTRAINT idx_teacher_user_language_pk PRIMARY KEY (id),
	CONSTRAINT idx_teacher_user_language_user_id_FK FOREIGN KEY (user_id) REFERENCES lingui_academy.`user`(id),
	CONSTRAINT idx_teacher_user_language_language_id_FK FOREIGN KEY (language_id) REFERENCES lingui_academy.`language`(id)
);

CREATE TABLE enrollment_level (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	student_language_id BIGINT UNSIGNED NOT NULL,
	level_id BIGINT UNSIGNED NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE DEFAULT NULL NULL,
	CONSTRAINT idx_enrollment_level_pk PRIMARY KEY (id),
	CONSTRAINT idx_enrollment_level_student_language_id_FK FOREIGN KEY (student_language_id) REFERENCES lingui_academy.student_language(id),
	CONSTRAINT idx_enrollment_level_level_id_FK FOREIGN KEY (level_id) REFERENCES lingui_academy.`level`(id)
);

CREATE TABLE enrollment_level_unit (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	enrollment_level_id BIGINT UNSIGNED NOT NULL,
	unit_id BIGINT UNSIGNED NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE DEFAULT NULL NULL,
	CONSTRAINT idx_enrollment_unit_pk PRIMARY KEY (id),
	CONSTRAINT idx_enrollment_unit_enrollment_level_id_FK FOREIGN KEY (enrollment_level_id) REFERENCES lingui_academy.enrollment_level(id),
	CONSTRAINT idx_enrollment_unit_unit_id_FK FOREIGN KEY (unit_id) REFERENCES lingui_academy.unit(id)
);

CREATE TABLE item (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	name varchar(255) NOT NULL,
	url TEXT NOT NULL,
	icon varchar(255) NOT NULL,
	item_id BIGINT UNSIGNED DEFAULT NULL NULL,
	CONSTRAINT idx_item_pk PRIMARY KEY (id),
	CONSTRAINT idx_item_item_id_FK FOREIGN KEY (item_id) REFERENCES lingui_academy.item(id)
);

CREATE TABLE permission_item (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	permission_id BIGINT UNSIGNED NOT NULL,
	item_id BIGINT UNSIGNED NOT NULL,
	CONSTRAINT idx_permission_item_pk PRIMARY KEY (id),
	CONSTRAINT idx_permission_item_permission_id_FK FOREIGN KEY (permission_id) REFERENCES lingui_academy.permission(id),
	CONSTRAINT idx_permission_item_item_id_FK FOREIGN KEY (item_id) REFERENCES lingui_academy.item(id)
);

CREATE TABLE role_permission_item (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	role_id BIGINT UNSIGNED NOT NULL,
	permission_id BIGINT UNSIGNED NOT NULL,
	item_id BIGINT UNSIGNED NOT NULL,
	CONSTRAINT idx_role_permission_item_pk PRIMARY KEY (id),
	CONSTRAINT idx_role_permission_item_role_id_FK FOREIGN KEY (role_id) REFERENCES lingui_academy.`role`(id),
	CONSTRAINT idx_role_permission_item_permission_id_FK FOREIGN KEY (permission_id) REFERENCES lingui_academy.permission(id),
	CONSTRAINT idx_role_permission_item_item_id_FK FOREIGN KEY (item_id) REFERENCES lingui_academy.item(id)
);

CREATE TABLE classroom (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	name varchar(255) NOT NULL,
	capacity BIGINT UNSIGNED NOT NULL,
	house_id BIGINT UNSIGNED NOT NULL,
	CONSTRAINT idx_classroom_pk PRIMARY KEY (id),
	CONSTRAINT idx_classroom_house_id_FK FOREIGN KEY (house_id) REFERENCES lingui_academy.house(id)
);

CREATE TABLE classroom_session (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	classroom_id BIGINT UNSIGNED NOT NULL,
	modality_id BIGINT UNSIGNED NOT NULL,
	level_id BIGINT UNSIGNED NOT NULL,
	unit_id BIGINT UNSIGNED NOT NULL,
	component_id BIGINT UNSIGNED DEFAULT NULL NULL,
	teacher_user_language_id BIGINT UNSIGNED NOT NULL,
	class_type_id BIGINT UNSIGNED NOT NULL,
	start_at DATETIME NOT NULL,
	end_at DATETIME NOT NULL,
	duration_hour BIGINT UNSIGNED NOT NULL,
	CONSTRAINT idx_classroom_session_pk PRIMARY KEY (id),
	CONSTRAINT idx_classroom_session_classroom_id_FK FOREIGN KEY (classroom_id) REFERENCES lingui_academy.classroom(id),
	CONSTRAINT idx_classroom_session_modality_id_FK FOREIGN KEY (modality_id) REFERENCES lingui_academy.modality(id),
	CONSTRAINT idx_classroom_session_level_id_FK FOREIGN KEY (level_id) REFERENCES lingui_academy.`level`(id),
	CONSTRAINT idx_classroom_session_unit_id_FK FOREIGN KEY (unit_id) REFERENCES lingui_academy.unit(id),
	CONSTRAINT idx_classroom_session_component_id_FK FOREIGN KEY (component_id) REFERENCES lingui_academy.component(id),
	CONSTRAINT idx_classroom_session_class_type_id_FK FOREIGN KEY (class_type_id) REFERENCES lingui_academy.class_type(id),
	CONSTRAINT idx_classroom_session_teacher_user_language_id_FK FOREIGN KEY (teacher_user_language_id) REFERENCES lingui_academy.teacher_user_language(id)
);	

CREATE TABLE student_attendance (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	student_id BIGINT UNSIGNED NOT NULL,
	classroom_session_id BIGINT UNSIGNED NOT NULL,
	CONSTRAINT idx_student_attendance_pk PRIMARY KEY (id),
	CONSTRAINT idx_student_attendance_student_id_FK FOREIGN KEY (student_id) REFERENCES lingui_academy.student(id),
	CONSTRAINT idx_student_attendance_classroom_information_id_FK FOREIGN KEY (classroom_session_id) REFERENCES lingui_academy.classroom_session(id)
);

CREATE TABLE role_dashboard_component (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	role_id BIGINT UNSIGNED NOT NULL,
	dashboard_component_id BIGINT UNSIGNED NOT NULL,
	CONSTRAINT idx_role_dashboard_component_pk PRIMARY KEY (id),
	CONSTRAINT idx_role_dashboard_component_role_id_FK FOREIGN KEY (role_id) REFERENCES lingui_academy.`role`(id),
	CONSTRAINT idx_role_dashboard_component_dashboard_component_id_FK FOREIGN KEY (dashboard_component_id) REFERENCES lingui_academy.dashboard_component(id)
);
