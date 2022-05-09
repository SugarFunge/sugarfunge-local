
alter table "sf"."escrow_share" drop constraint "escrow_share_owner_fkey";

alter table "sf"."escrow_share" drop constraint "escrow_share_escrow_id_fkey";

alter table "sf"."class_profile" drop constraint "class_profile_creator_id_fkey";

alter table "sf"."class_profile" drop constraint "class_profile_class_id_fkey";

alter table "sf"."class_metadata" drop constraint "class_metadata_class_id_fkey";

alter table "sf"."asset_nft" drop constraint "asset_nft_asset_id_fkey";

alter table "sf"."asset_metadata" drop constraint "asset_metadata_asset_id_fkey";

alter table "sf"."asset_class" drop constraint "asset_class_class_id_fkey";

alter table "sf"."asset_class" drop constraint "asset_class_asset_id_fkey";

alter table "sf"."account_profile" drop constraint "account_profile_account_id_fkey";

alter table "sf"."account_auth" drop constraint "account_auth_account_id_fkey";

alter table "sf"."account_asset" drop constraint "account_asset_asset_id_fkey";

alter table "sf"."account_asset" drop constraint "account_asset_account_id_fkey";
