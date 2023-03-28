CREATE TABLE "cliente" (
  "cli_cd_id" serial not null,
  "cli_int_num" integer,
  "cli_tx_nome" varchar(50) not null,
  "cli_tx_endereco" varchar(50) not null,
  PRIMARY KEY ("cli_cd_id")
);

CREATE TABLE "apolice" (
  "apo_cd_id" serial not null,
  "apo_int_num" integer,
  "apo_nm_valor" decimal,
  "fk_cli_cd_id" int4,
  PRIMARY KEY ("apo_cd_id"),
  CONSTRAINT "FK_apolice.fk_cli_cd_id"
    FOREIGN KEY ("fk_cli_cd_id")
      REFERENCES "cliente"("cli_cd_id")
);

CREATE TABLE "carro" (
  "car_cd_id" serial not null,
  "car_tx_registro" char(10),
  "car_tx_marca" varchar(20),
  "fk_apo_cd_id" int4,
  PRIMARY KEY ("car_cd_id"),
  CONSTRAINT "FK_carro.fk_car_cd_id"
    FOREIGN KEY ("fk_apo_cd_id")
	REFERENCES "apolice"("apo_cd_id")
);

CREATE TABLE "acidente" (
  "aci_cd_id" serial not null,
  "aci_dt_data_hora" timestamp,
  "aci_tx_local" varchar(50),
  "fk_car_cd_id" int4,
  PRIMARY KEY ("aci_cd_id"),
  CONSTRAINT "FK_acidente.fk_car_cd_id"
    FOREIGN KEY ("fk_car_cd_id")
      REFERENCES "carro"("car_cd_id")
);

