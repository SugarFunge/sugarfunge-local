
alter table "sf"."escrow" drop column "class_id" cascade;

alter table "sf"."escrow" drop column "metadata" cascade;

CREATE TABLE "sf"."escrow_class" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "class_id" integer NOT NULL, "metadata" jsonb NOT NULL, PRIMARY KEY ("id") );
CREATE EXTENSION IF NOT EXISTS pgcrypto;

alter table "sf"."escrow" add column "escrow_class_id" uuid
 not null;

alter table "sf"."escrow"
  add constraint "escrow_escrow_class_id_fkey"
  foreign key ("escrow_class_id")
  references "sf"."escrow_class"
  ("id") on update cascade on delete cascade;
