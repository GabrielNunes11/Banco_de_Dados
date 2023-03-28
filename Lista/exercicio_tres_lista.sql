CREATE TABLE "Vendedor" (
  "vend_cd_id" serial not null,
  "vend_tx_codigo" char(10),
  "vend_tx_nome" varchar(50) not null,
  "vend_tx_endereco" varchar(80) not null,
  "vend_nm_comis" decimal,
  PRIMARY KEY ("vend_cd_id")
);

CREATE TABLE "cliente" (
  "cli_cd_id" serial not null,
  "cli_tx_codigo" char(10),
  "cli_tx_nome" varchar(50) not null,
  "cli_tx_endereco" varchar(80) not null,
  "cli_nm_fat_acum" decimal not null,
  "cli_nm_limite_cred" decimal not null,
  "fk_vend_cd_id" int4,
  PRIMARY KEY ("cli_cd_id"),
  CONSTRAINT "FK_cliente.fk_vend_cd_id"
    FOREIGN KEY ("fk_vend_cd_id")
      REFERENCES "Vendedor"("vend_cd_id")
);

CREATE TABLE "Pedido" (
  "ped_cd_id" serial not null,
  "ped_int_num" integer,
  "ped_dt_data" date,
  "ped_tx_codigo" char(10),
  "ped_tx_nome" varchar(50),
  "fk_cli_cd_id" int4,
  PRIMARY KEY ("ped_cd_id"),
  CONSTRAINT "FK_Pedido.fk_cli_cd_id"
  FOREIGN KEY ("fk_cli_cd_id")
      REFERENCES "cliente"("cli_cd_id")
);

CREATE TABLE "Item" (
  "item_cd_id" serial not null,
  "item_int_qtd_ped" integer not null,
  "item_nm_preco_ped" decimal,
  "fk_ped_cd_id" int4,
  PRIMARY KEY ("item_cd_id"),
  CONSTRAINT "FK_Item.fk_ped_cd_id"
    FOREIGN KEY ("fk_ped_cd_id")
      REFERENCES "Pedido"("ped_cd_id")
);

CREATE TABLE "Peca" (
  "peca_cd_id" serial not null,
  "peca_tx_cod" char(10),
  "peca_tx_descricao" varchar(100),
  "peca_nm_preco_unt" decimal,
  "peca_int_qtd_estoque" integer not null,
  "fk_item_cd_id" int4,
  PRIMARY KEY ("peca_cd_id"),
  CONSTRAINT "FK_Peca.fk_item_cd_id"
  FOREIGN KEY ("fk_item_cd_id")
      REFERENCES "Item"("item_cd_id")
);

CREATE TABLE "Armazem" (
  "armz_cd_id" serial not null,
  "armz_tx_codigo" char(20),
  "armz_tx_endereco" varchar(80) not null,
  "fk_peca_cd_id" int4,
  PRIMARY KEY ("armz_cd_id"),
  CONSTRAINT "FK_Armazem.fk_peca_cd_id"
  FOREIGN KEY ("fk_peca_cd_id")
      REFERENCES "Peca"("peca_cd_id")
);