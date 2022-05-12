
alter table "sf"."escrow_share" drop constraint "escrow_share_pkey";

alter table "sf"."escrow" drop constraint "escrow_pkey";

alter table "sf"."currency" drop constraint "currency_pkey";

alter table "sf"."class_profile" drop constraint "class_profile_pkey";

alter table "sf"."class_metadata" drop constraint "class_metadata_pkey";

alter table "sf"."class" drop constraint "class_pkey";

alter table "sf"."bundle" drop constraint "bundle_pkey";

alter table "sf"."asset_nft" drop constraint "asset_nft_pkey";

alter table "sf"."asset_metadata" drop constraint "asset_metadata_pkey";

alter table "sf"."asset_class" drop constraint "asset_class_pkey";

alter table "sf"."asset" drop constraint "asset_pkey";

alter table "sf"."account_profile" drop constraint "account_profile_pkey";

alter table "sf"."account_auth" drop constraint "account_auth_pkey";

alter table "sf"."account_asset" drop constraint "account_asset_pkey";

alter table "sf"."account" drop constraint "account_pkey";
