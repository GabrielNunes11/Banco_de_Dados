CREATE TABLE "Departamento" (
  "dpt_cd_id" serial not null,
  "dpt_int_num" integer not null,
  "dpt_tx_setor" varchar(20),
  PRIMARY KEY ("dpt_cd_id")
);

CREATE TABLE "Funcionario" (
  "func_cd_id" serial not null,
  "func_int_num" integer not null,
  "func_nm_salario" decimal not null,
  "func_int_telefone" varchar(10) not null,
  "fk_dpt_cd_id" int4,
  PRIMARY KEY ("func_cd_id"),
  CONSTRAINT "FK_Funcionario.fk_dpt_cd_id"
    FOREIGN KEY ("fk_dpt_cd_id")
      REFERENCES "Departamento"("dpt_cd_id")
);

CREATE TABLE "Projeto" (
  "pjt_cd_id" serial not null,
  "pjt_int_num" integer not null,
  "pjt_nm_orcamento" decimal not null,
  "pjt_dt_dataehora" timestamp,
  "fk_func_cd_id" int4,
  PRIMARY KEY ("pjt_cd_id"),
  CONSTRAINT "FK_Projeto.fk_func_cd_id"
    FOREIGN KEY ("fk_func_cd_id")
      REFERENCES "Funcionario"("func_cd_id")
);

CREATE TABLE "Fornecedor" (
  "fornecedor_cd_id" serial not null,
  "fornecedor_int_num" integer not null,
  "fornecedor_tx_end" varchar(50) not null,
  "fk_pjt_cd_id" int4,
  "fk_peca_cd_id" int4,
  PRIMARY KEY ("fornecedor_cd_id"),
  CONSTRAINT "FK_Fornecedor.fk_pjt_cd_id"
    FOREIGN KEY ("fk_pjt_cd_id")
      REFERENCES "Projeto"("pjt_cd_id")
);

alter table "Fornecedor" 
add constraint "FK_Fornecedor.fk_peca_cd_id"
foreign key ("fk_peca_cd_id")
references "Peca"("peca_cd_id")

CREATE TABLE "Peca" (
  "peca_cd_id" serial not null,
  "peca_int_num" integer not null,
  "peca_nm_peso" decimal not null,
  "peca_tx_cor" varchar(15),
  "fk_pjt_cd_id" int4,
  "fk_fornecedor_cd_id" int4,
  PRIMARY KEY ("peca_cd_id"),
  CONSTRAINT "FK_Peca.fk_pjt_cd_id"
    FOREIGN KEY ("fk_pjt_cd_id")
      REFERENCES "Projeto"("pjt_cd_id")
);

CREATE TABLE "Deposito" (
  "dpst_cd_id" serial not null,
  "dpst_int_num" integer not null,
  "dpst_tx_end" varchar(50) not null,
  "fk_peca_cd_id" int4,
  PRIMARY KEY ("dpst_cd_id"),
  CONSTRAINT "FK_Deposito.fk_peca_cd_id"
    FOREIGN KEY ("fk_peca_cd_id")
      REFERENCES "Peca"("peca_cd_id")
);

