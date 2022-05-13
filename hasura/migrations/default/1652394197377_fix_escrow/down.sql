
alter table "sf"."escrow" drop constraint "escrow_escrow_class_id_fkey";

alter table "sf"."escrow" drop column "escrow_class_id" cascade;
DROP TABLE "sf"."escrow_class";

alter table "sf"."escrow" alter column "metadata" drop not null;
alter table "sf"."escrow" add column "metadata" jsonb;

alter table "sf"."escrow" alter column "class_id" drop not null;
alter table "sf"."escrow" add column "class_id" int4;
