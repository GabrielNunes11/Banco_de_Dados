--Criação da tabela Endereço
CREATE TABLE "endereco" (
  "end_cd_id" serial not null,
  "end_tx_rua" varchar(50)not null,
  "end_itx_num" varchar(50)not null,
  "end_tx_est" varchar(50)not null,
  "end_tx_cid" varchar(50)not null,
  "end_int_cep" integer not null,
  PRIMARY KEY ("end_cd_id")
);
--Criação da tabela Telefone
CREATE TABLE "telefone" (
  "tel_cd_id" serial not null,
  "tel_tx_fixo" char(12) ,
  "tel_tx_cel" char(13) not null unique,
  PRIMARY KEY ("tel_cd_id")
);
--Criação da tabela Paciente
CREATE TABLE "paciente" (
  "pac_cd_id" serial not null,
  "pac_tx_nome" varchar(60) not null,
  "pac_dt_nasc" date not null,
  "pac_tx_cpf" char(11) unique not null,
  "fk_end_cd_id" int4 not null,
  "fk_tel_cd_id" int4 not null,
  "fk_atd_cd_id" int4 not null,
  "fk_dnt_cd_id" int4 not null,
  PRIMARY KEY ("pac_cd_id"),
  CONSTRAINT "FK_paciente.fk_end_cd_id"
    FOREIGN KEY ("fk_end_cd_id")
      REFERENCES "endereco"("end_cd_id"),
  CONSTRAINT "FK_paciente.fk_tel_cd_id"
    FOREIGN KEY ("fk_tel_cd_id")
      REFERENCES "telefone"("tel_cd_id")
);
--Criação da tabela Dentista
CREATE TABLE "dentista" (
  "dnt_cd_id" serial not null,
  "dnt_tx_nome" varchar(60) not null,
  "dnt_tx_especialidade" varchar(60) not null,
  "fk_end_cd_id" int4 not null,
  "fk_tel_cd_id" int4 not null,
  PRIMARY KEY ("dnt_cd_id"),
  CONSTRAINT "FK_dentista.fk_end_cd_id"
    FOREIGN KEY ("fk_end_cd_id")
      REFERENCES "endereco"("end_cd_id")
);
--Inserção da FK Telefone em dentista
alter table dentista 
add constraint "FK_dentista.fk_tel_cd_id"
foreign key ("fk_tel_cd_id")
references "telefone"("tel_cd_id")
;
--Criação da tabela Clínica
CREATE TABLE "clinica" (
  "cli_cd_id" serial not null,
  "cli_tx_nome" varchar(9),
  "cli_tx_dentista" varchar(40) not null,
  "fk_end_cd_id" int4 not null,
  "fk_tel_cd_id" int4 not null,
  "fk_atd_cd_id" int4 not null,
  "fk_dnt_cd_id" int4 not null,
  PRIMARY KEY ("cli_cd_id"),
  CONSTRAINT "FK_clinica.fk_end_cd_id"
    FOREIGN KEY ("fk_end_cd_id")
      REFERENCES "endereco"("end_cd_id"),
  CONSTRAINT "FK_clinica.fk_tel_cd_id"
    FOREIGN KEY ("fk_tel_cd_id")
      REFERENCES "telefone"("tel_cd_id"),
  CONSTRAINT "FK_clinica.fk_dnt_cd_id"
    FOREIGN KEY ("fk_dnt_cd_id")
      REFERENCES "dentista"("dnt_cd_id")
);
--Criação da tabela Atendimento
CREATE TABLE "atendimento" (
  "atd_cd_id" serial not null,
  "atd_tx_motivo" varchar(120)not null,
  "atd_tx_diag" varchar(120)not null,
  "atd_tx_receita" varchar(120),
  "atd_tx_retorno" varchar(30),
  "fk_pac_cd_id" int4 not null,
  "fk_dnt_cd_id" int4 not null,
  PRIMARY KEY ("atd_cd_id"),
  CONSTRAINT "FK_atendimento.fk_pac_cd_id"
    FOREIGN KEY ("fk_pac_cd_id")
      REFERENCES "paciente"("pac_cd_id"),
  CONSTRAINT "FK_atendimento.fk_dnt_cd_id"
    FOREIGN KEY ("fk_dnt_cd_id")
      REFERENCES "dentista"("dnt_cd_id")
);
--Inserção de Dados no Endereço
insert into endereco 
values('1', 'Rua X', '1', 'Minas Gerais', 'Y', '30130141'),
		('2', 'Rua João Felipe Klippel', '52', 'Rio de Janeiro', 'Petrópolis', '25640170'),
		('3', 'Rua Tomas Cameron', '492', 'Rio de Janeiro', 'Petrópolis', '25685120'),
		('4', 'Rua Doutor Nélson Sá Earp', '210 APT 201', 'Rio de Janeiro', 'Petrópolis', '25680195'),
		('5', 'Rua da Lapa', '200', 'Rio de Janeiro', 'Rio de Janeiro', '20021170'),
		('6', 'Rua Cristovão Colombo', '835', 'Rio de Janeiro', 'Petrópolis', '25640322'),
		('7', 'Rua Asdrúbal do Nascimento', '108', 'São Paulo', 'São Paulo', '01316030')
;
--Inserção de Dados no Telefone
insert into telefone 
values('1', '2422357898', '5524988252829'),
		('2', '2422367415', '5524988262829'),
		('3', '2422578936', '5524998742564'),
		('4', '2422217589', '5524987890125'),
		('5', '2422657896', '5524989211368'),
		('6', '2124378821', '5521954215785'),
		('7', '1137896589', '5511975412354')
;
--insercao de Dados no Paciente
insert into paciente (pac_cd_id, pac_tx_nome, pac_dt_nasc, pac_tx_cpf, fk_end_cd_id, fk_tel_cd_id)
values('1', 'Gabriel Lagden', '2001/12/11', '18626873985', '2', '2'),
		('2', 'Joaquim dos Santos', '1997/03/22', '03245489671', '3', '3'),
		('3', 'Maria Joaquina', '2007/09/03', '03487536972', '4', '4'),
		('4', 'Carolina Aguiar', '1987/07/01', '16487936547', '5', '5')
;
--insercao de Dados no Dentista
insert into dentista
values('1', 'Ricardo Tesch', 'Ortodontia', '6', '6'),
		('2', 'Ítalo Sena', 'Geral', '7', '7')
;
--Inserção de Dados na Clínica
insert into clinica
values('1', 'Dentibao', 'Especialidades em geral', '1', '1', '1', '1')
;
--Inserção de Dados em Atendimento
insert into atendimento
values('1', 'Dor de dente', '2001/12/11', '18626873985', '2', '2'),
		('2', 'Joaquim dos Santos', '1997/03/22', '03245489671', '3', '3'),
		('3', 'Maria Joaquina', '2007/09/03', '03487536972', '4', '4'),
		('4', 'Carolina Aguiar', '1987/07/01', '16487936547', '5', '5')
;
select * from clinica 