USE [matriFunDB]
GO

TRUNCATE TABLE [Resource] 
GO
--SCHOOL VIEW 
INSERT INTO [dbo].[Resource] VALUES (newid(), 'SCHOOL_MANT', 'es-CR', 'Mantenimiento Escuelas')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'SCHOOL_NAME', 'es-CR', 'Nombre Escuela')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'DESCRIPTION', 'es-CR', 'Descripci�n')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'SCHOOL_CODE', 'es-CR', 'Codigo Escuela')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ADD_SCHOOL', 'es-CR', 'Agregar Escuela')
-- KENDO Grid
INSERT INTO [dbo].[Resource] VALUES (newid(), 'UPDATE', 'es-CR', 'Actualizar')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'CANCEL', 'es-CR', 'Cancelar')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'DELETE', 'es-CR', 'Eliminar')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'EDIT', 'es-CR', 'Editar')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'SAVE', 'es-CR', 'Salvar')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'DELETE_CONFIRMATION', 'es-CR', '�Est� seguro que desea eliminar el registro?')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'IS_EQUAL_TO', 'es-CR', 'Sean iguales a')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'IS_NOT_EQUAL_TO', 'es-CR', 'Sean diferentes de')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'STARTS_WITH', 'es-CR', 'Empiezan con')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'CONTAINS', 'es-CR', 'Contienen')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'DOES_NOT_CONTAIN', 'es-CR', 'No Contienen')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ENDS_WITH', 'es-CR', 'Terminan con')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'FIND', 'es-CR', 'Buscar')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'CLEAN', 'es-CR', 'Limpiar')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'FIND_VAL_WHAT', 'es-CR', 'Buscar valores que:')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'NO_RECORDS', 'es-CR', 'No hay Registros')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'DISPLAY_GRID', 'es-CR', '{0} - {1} de {2} registros')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ITEMS_PER_PAGE', 'es-CR', 'Registros por p�gina')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PAGE', 'es-CR', 'P�gina')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'OF_GRID', 'es-CR', 'de {0}')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'FIRST_PAGE', 'es-CR', 'Primera P�gina')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PREVIOUS_PAGE', 'es-CR', 'P�gina Anterior')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'NEXT_PAGE', 'es-CR', 'Siguiente P�gina')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'LAST_PAGE', 'es-CR', 'Ultima P�gina')
--CLASSROOM VIEW
INSERT INTO [dbo].[Resource] VALUES (newid(), 'CLASSROOM_MANT', 'es-CR', 'Mantenimiento Aulas')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'CLASSROOM_CODE', 'es-CR', 'C�digo del Aula')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ADD_CLASSROOM', 'es-CR', 'Agregar Aula')
--LOCATION VIEW
INSERT INTO [dbo].[Resource] VALUES (newid(), 'LOCATION_MANT', 'es-CR', 'Mantenimiento Lugares F�sicos')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'LOCATION_LINE1', 'es-CR', 'Direcci�n')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'LOCATION_LINE2', 'es-CR', 'Otras Se�as')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'LOCATION_NAME', 'es-CR', 'Nombre del Lugar')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ADD_LOCATION', 'es-CR', 'Agregar Lugar F�sico')
--AUTHENTICATION VIEW
INSERT INTO [dbo].[Resource] VALUES (newid(), 'LOGIN_TITLE', 'es-CR', 'Inicio de sesi�n.')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'REQUIRED', 'es-CR', '{0} es requerido')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'CURRENT_PASS', 'es-CR', 'Contrase�a Actual')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PASS_STRING_LENGTH', 'es-CR', '{0} debe tener al menos {2} caracteres.')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'NEW_PASSWORD', 'es-CR', 'Nueva Contrase�a')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'OLD_PASSWORD', 'es-CR', 'Contrase�a Actual')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PASS_CONFIRM', 'es-CR', 'Confirmar Contrase�a')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PASS_CONFIRM_ERR', 'es-CR', 'Las contrase�as no coinciden.')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'USER', 'es-CR', 'Usuario')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PASSWORD', 'es-CR', 'Contrase�a')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'REMEMBER', 'es-CR', 'Recordar')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'USERNAME', 'es-CR', 'Nombre Usuario')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'EMAIL', 'es-CR', 'Correo Electr�nico')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'SIGNIN', 'es-CR', 'Ingresar')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'REGISTER', 'es-CR', 'Registrar')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'NEW_USER', 'es-CR', 'Registrar un nuevo Usuario') 
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PASS_STRING_LENGTH1', 'es-CR', 'La Contrase�a debe tener al menos')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PASS_STRING_LENGTH2', 'es-CR', 'caracteres.')
-- HOME MENU
INSERT INTO [dbo].[Resource] VALUES (newid(), 'HOME', 'es-CR', 'Inicio')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'STUDENT', 'es-CR', 'Estudiante')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'MAINTENANCE', 'es-CR', 'Mantenimiento')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PROGRAM_PLAN_COURSE', 'es-CR', 'Programas, Planes y Cursos')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ENROLLMENT', 'es-CR', 'Matr�cula')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'NOTES_REGISTER', 'es-CR', 'Registro de Notas')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'RECORDS', 'es-CR', 'Registro de Actas')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'CERTIFICATIONS', 'es-CR', 'Certificaciones')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'AUDIT', 'es-CR', 'Auditor�a')
--MAINTENANCE DETAILS
INSERT INTO [dbo].[Resource] VALUES (newid(), 'SCHOOL', 'es-CR', 'Escuelas')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'SCHOOL_DETAIL', 'es-CR', 'Esta opci�n permite listar, agregar, modificar y eliminar una escuela')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'CLASSROOM', 'es-CR', 'Aulas')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'CLASSROOM_DETAIL', 'es-CR', 'Esta opci�n permite listar, agregar, modificar y eliminar un aula o espacio donde se imparte ')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'LOCATION', 'es-CR', 'Lugares F�sicos')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'LOCATION_DETAIL', 'es-CR', 'Esta opci�n permite listar, agregar, modificar y eliminar un lugar f�sico o geogr�fico')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'MODALITY_TYPE', 'es-CR', 'Tipos de Modalidad')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'MODALITY_TYPE_DETAIL', 'es-CR', 'Esta opci�n permite listar, agregar, modificar y eliminar los tipos de modalidades')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'REQUERIMENT', 'es-CR', 'Requisitos')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'REQUERIMENT_DETAIL', 'es-CR', 'Esta opci�n permite listar, agregar, modificar y eliminar requisitos')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'USERS', 'es-CR', 'Usuarios')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'USERS_DETAIL', 'es-CR', 'Esta opci�n permite listar, agregar, modificar y eliminar usuarios del sistema.')
--STUDENT DETAILS
INSERT INTO [dbo].[Resource] VALUES (newid(), 'COURSE_CONSULT', 'es-CR', 'Consulta de Cursos')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'COURSE_CONSULT_DETAILS', 'es-CR', 'Se muestran los cursos que un estudiante esta llevando y la informaci�n asociada al curso')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ACADEMIC_HISTORY', 'es-CR', 'Historial Acad�mico')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ACADEMIC_HISTORY_DETAILS', 'es-CR', 'Esta opci�n permite sacar un historial de cursos y las notas respectivas del estudiante')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'SCORE_CONSULT', 'es-CR', 'Consulta de Notas')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'SCORE_CONSULT_DETAILS', 'es-CR', 'Esta opci�n permite ver las notas de cada curso reportadas por el profesor')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'STUDENT_DETAILS', 'es-CR', 'Esta opci�n permite listar, agregar, modificar y eliminar estudiantes.')
--PROGRAMS, PLANS AND COURSES DETAILS
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PROGRAMS', 'es-CR', 'Programas')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PROGRAMS_DETAIL', 'es-CR', 'Esta opci�n permite listar, agregar, modificar y eliminar un programa')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PLAN', 'es-CR', 'Planes')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PLAN_DETAIL', 'es-CR', 'Esta opci�n permite listar, agregar, modificar y eliminar un plan')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'COURSES', 'es-CR', 'Cursos')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'COURSES_DETAIL', 'es-CR', 'Esta opci�n permite listar, agregar, modificar y eliminar un curso')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'LINK_PLAN_COURSE', 'es-CR', 'Vincular cursos a Planes')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'LINK_PLAN_COURSE_DETAILS', 'es-CR', 'Esta opci�n permite listar, agregar, modificar y eliminar los cursos asociados a los planes')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PLAN_VERSION', 'es-CR', 'Versionamiento de Planes')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PLAN_VERSION_DETAILS', 'es-CR', 'Esta opci�n permite crear una versi�n de un plan de estudio vigente. El Sistema crea una versi�n copia del plan actual y en el nuevo se prodr� hacer los cambios respectivos, quedando el anterior como una versi�n hist�rica')
--ENROLLMENT DETAILS
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ENROLLMENTS', 'es-CR', 'Matr�culas')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ENROLLMENTS_DETAIL', 'es-CR', 'Esta opci�n permite listar, agregar, modificar y eliminar una instancia de matr�cula')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ENROLLMENT_STUDENT', 'es-CR', 'Matr�cula de Estudiantes')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ENROLLMENT_STUDENT_DETAIL', 'es-CR', 'Esta opci�n permite listar, agregar, modificar y eliminar un estudiante en una matr�cula')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'VAL_COURSE', 'es-CR', 'Convalidaci�n de Cursos')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'VAL_COURSE_DETAIL', 'es-CR', 'Esta opci�n permite realizar la convalidaci�n de cursos por estudiante')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'STUDENT_ENROLLMENT_CONSULT', 'es-CR', 'Consulta de Matr�culas por Estudiante')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'STUDENT_ENROLLMENT_CONSULT_DETAIL', 'es-CR', 'Esta opci�n permite verificar si un estudiante puede matricularse en un determinado plan')
--RECORDS DETAILS
INSERT INTO [dbo].[Resource] VALUES (newid(), 'RECORDS_COURSE', 'es-CR', 'Registro de Actas por curso')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'RECORDS_COURSE_DETAIL', 'es-CR', 'Esta opci�n permite hacer el registro definitivo de las notas de los estudiantes en un determinado curso')
--NOTES DETAILS
INSERT INTO [dbo].[Resource] VALUES (newid(), 'NOTES_COURSE_REGISTER', 'es-CR', 'Registro de Notas por Curso')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'NOTES_COURSE_REGISTER_DETAIL', 'es-CR', 'Esta opci�n permite agregar y modificar las notas de los estudiantes matriculados en un determinado curso')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'NOTES_IMPORT', 'es-CR', 'Importar Notas')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'NOTES_IMPORT_DETAIL', 'es-CR', 'Esta opci�n permite importar notas de estudiantes por curso desde un archivo en formato CSV')
--CERTIFICATIONS DETAILS
INSERT INTO [dbo].[Resource] VALUES (newid(), 'TEMPLATES', 'es-CR', 'Plantillas')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'TEMPLATES_DETAIL', 'es-CR', 'Esta opci�n permite listar, agregar, modificar y eliminar plantillas de certificaciones')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PRINT_CERTIFICATION', 'es-CR', 'Imprimir Certificaciones')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PRINT_CERTIFICATION_DETAIL', 'es-CR', 'Esta opci�n permite realizar la impresi�n de las certificaciones de un plan')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'LINK_PLAN_TEMPLATE', 'es-CR', 'Vincular Plantillas por Plan')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'LINK_PLAN_TEMPLATE_DETAIL', 'es-CR', 'Esta opci�n permite vincular una platilla a un determiando plan de estudios')
--AUDITING DETAILS
INSERT INTO [dbo].[Resource] VALUES (newid(), 'RECORDS1', 'es-CR', 'Notas')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'AUDIT_DETAIL', 'es-CR', 'Esta opci�n permite listar o detallar lo referente al historial de este cat�logo')
--FOOTER
INSERT INTO [dbo].[Resource] VALUES (newid(), 'SIGN', 'es-CR', 'B&B Development, Todos los derechos reservados')
--MODALITY VIEW
INSERT INTO [dbo].[Resource] VALUES (newid(), 'MODALITY_MANT', 'es-CR', 'Mantenimiento de Modalidades')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'MODALITY', 'es-CR', 'Modalidades')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'MODALITY_NAME', 'es-CR', 'Modalidad')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PERIOD', 'es-CR', 'Periodo')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ADD_MODALITY', 'es-CR', 'Agregar Modalidad')
--COURSE VIEW
INSERT INTO [dbo].[Resource] VALUES (newid(), 'COURSE_MANT', 'es-CR', 'Mantenimiento de Cursos')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'COURSE_NAME', 'es-CR', 'Nombre del Curso')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'COURSE_CODE', 'es-CR', 'Codigo del Curso')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ADD_COURSE', 'es-CR', 'Agregar Curso')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'COURSE_COST', 'es-CR', 'Costo del Curso')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'TEACHING_HOURS', 'es-CR', 'Horas Lectivas')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'MAX_LENGTH', 'es-CR', '{0} puede tener un maximo de {1} caracteres.')
--SCHEME VIEW
INSERT INTO [dbo].[Resource] VALUES (newid(), 'SCHEME_MANT', 'es-CR', 'Mantenimiento de Programas')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'SCHEME_NAME', 'es-CR', 'Nombre del Programa')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'OWNER', 'es-CR', 'Responsable')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'COORDINATOR', 'es-CR', 'Coordinador')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'VIEW_DETAILS', 'es-CR', 'Ver Detalles')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ADD_SCHEME', 'es-CR', 'Agregar Programa')
--REQUIREMENT VIEW
INSERT INTO [dbo].[Resource] VALUES (newid(), 'REQ', 'es-CR', 'Requisitos')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'TYPE_NAME', 'es-CR', 'Tipo')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ADD_REQ', 'es-CR', 'Agregar Requisito')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'REQ_NAME', 'es-CR', 'Nombre Requisito')
--ROLES
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ROLE_ADMINISTRATOR', 'es-CR', 'Administrador')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ROLE_COORDINATOR', 'es-CR', 'Coordinador')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ROLE_STUDENT', 'es-CR', 'Estudiante')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ROLE_AUDITOR', 'es-CR', 'Auditor')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ROLE_SCHOOL_ADMIN', 'es-CR', 'Admin. Escuela')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ROLE_TEACHER', 'es-CR', 'Profesor')
--TYPES
INSERT INTO [dbo].[Resource] VALUES (newid(), 'MARITAL_STATUS_SINGLE', 'es-CR', 'Soltero')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'MARITAL_STATUS_DIVORCED', 'es-CR', 'Divorciado')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'MARITAL_STATUS_MARRIED', 'es-CR', 'Casado')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'MARITAL_STATUS_COHABIT', 'es-CR', 'Uni�n Libre')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'MARITAL_STATUS_WIDOW', 'es-CR', 'Viudo(a)')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'NATIONAL_ID', 'es-CR', 'C�dula Nacional')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PASSPORT_ID', 'es-CR', 'Pasaporte Extrangero')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'RESIDENT_ID', 'es-CR', 'C�dula Residente')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'GENDER_MALE', 'es-CR', 'Masculino')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'GENDER_FEMALE', 'es-CR', 'Femenino')
--USER MENU OPTIONS & VIEW
INSERT INTO [dbo].[Resource] VALUES (newid(), 'USER_MAINTENANCE', 'es-CR', 'Mantenimiento Usuarios')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PERSONAL_DATA', 'es-CR', 'Informaci�n Personal')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ADD_USERS_TITLE', 'es-CR', 'Agregar Usuarios')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'EDIT_USERS_TITLE', 'es-CR', 'Edici�n de Usuarios')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'IDENTIFICATION_TYPE', 'es-CR', 'Tipo Identificaci�n')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'IDENTIFICATION', 'es-CR', 'Identificaci�n')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'FIRST_NAME', 'es-CR', 'Nombre')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'LAST_NAME', 'es-CR', 'Apellidos')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'DATE_OF_BIRTH', 'es-CR', 'Fecha Nac.')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'GENDER', 'es-CR', 'G�nero')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'MARITAL_STATUS', 'es-CR', 'Estado Civil')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'COUNTRY', 'es-CR', 'Pa�s')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PHONE_MOB', 'es-CR', 'Tel. Celular')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PHONE_HOME', 'es-CR', 'Tel. Casa')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PHONE_OFFICE', 'es-CR', 'Tel. Oficina')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ROLE', 'es-CR', 'Role')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ADD_USER', 'es-CR', 'Agregar Usuario')
--REQUIREMENTS TYPES
INSERT INTO [dbo].[Resource] VALUES (newid(), 'REQ_COURSE', 'es-CR', 'Cursos')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'REQ_PLAN', 'es-CR', 'Plan')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'REQ_PROGRAM', 'es-CR', 'Programa')
--STUDENT MENU OPTIONS & VIEW
INSERT INTO [dbo].[Resource] VALUES (newid(), 'STUDENT_MAINTENANCE', 'es-CR', 'Mantenimiento Estudiantes')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ADITIONAL_DATA', 'es-CR', 'Datos Adicionales')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ADD_STUDENT', 'es-CR', 'Agregar Studiante')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ADD_STUDENT_TITLE', 'es-CR', 'Agregar Estudiantes')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'EDIT_STUDENT_TITLE', 'es-CR', 'Edici�n de Estudiantes')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'STUDENT_PHYSICA_LADDRESS', 'es-CR', 'Direcci�n de Residencia')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'STUDENT_ADDITIONAL_ADDRESS', 'es-CR', 'Domicilio Durante Curso')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'STUDENT_OCUPATION', 'es-CR', 'Ocupaci�n')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'STUDENT_WORKS', 'es-CR', 'Trabaja')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'STUDENT_STUDIES', 'es-CR', 'Estudia')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'STUDENT_RECEIVE_OFFERS', 'es-CR', 'Desea Recibir Ofertas?')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'STUDENT_RECEIVE_NEWS', 'es-CR', 'Desea Recibir Noticias sobre Matr�cula del Programa?')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'STUDENT_WORK_PLACE', 'es-CR', 'Lugar de Trabajo')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'STUDENT_JOB_TITLE', 'es-CR', 'Puesto que Desempe�a')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'STUDENT_WHO_PAYS_YOUR_STUDIES', 'es-CR', 'Quien Paga sus Estudios')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'STUDENT_HOW_YOU_KNOW_ABOUT_US', 'es-CR', 'C�mo Supo de Nosotros')
---ADITIONAL DATA DROPDOWNLIST
INSERT INTO [dbo].[Resource] VALUES (newid(), 'WPS_DADS', 'es-CR', 'Padres de Familia')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'WPS_FAMILY', 'es-CR', 'Familiar')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'WPS_SCHOLARSHIP', 'es-CR', 'Beca')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'WPS_INSTITUTION', 'es-CR', 'Instituci�n')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'WPS_OWN_INCOME', 'es-CR', 'Cuenta Propia')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'WPS_FUNDED', 'es-CR', 'Financiado')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'WPS_OTHER', 'es-CR', 'Otro')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'KAU_TV', 'es-CR', 'Televisi�n')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'KAU_INTERNET', 'es-CR', 'Internet')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'KAU_NEWS', 'es-CR', 'Noticias')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'KAU_OTHER', 'es-CR', 'Otro')
---ACADEMIC_INFORMATION VIEW
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ACADEMIC_INFORMATION', 'es-CR', 'Informaci�n Acad�mica')
---Plan VIEW
INSERT INTO [dbo].[Resource] VALUES (newid(), 'VERSION', 'es-CR', 'Version')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'ADD_PLAN', 'es-CR', 'Agregar Plan')
INSERT INTO [dbo].[Resource] VALUES (newid(), 'PLAN_NAME', 'es-CR', 'Plan')
