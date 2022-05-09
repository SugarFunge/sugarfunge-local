
alter table "sf"."account_asset"
  add constraint "account_asset_account_id_fkey"
  foreign key ("account_id")
  references "sf"."account"
  ("id") on update cascade on delete cascade;

alter table "sf"."account_asset"
  add constraint "account_asset_asset_id_fkey"
  foreign key ("asset_id")
  references "sf"."asset"
  ("id") on update cascade on delete cascade;

alter table "sf"."account_auth"
  add constraint "account_auth_account_id_fkey"
  foreign key ("account_id")
  references "sf"."account"
  ("id") on update cascade on delete cascade;

alter table "sf"."account_profile"
  add constraint "account_profile_account_id_fkey"
  foreign key ("account_id")
  references "sf"."account"
  ("id") on update cascade on delete cascade;

alter table "sf"."asset_class"
  add constraint "asset_class_asset_id_fkey"
  foreign key ("asset_id")
  references "sf"."asset"
  ("id") on update cascade on delete cascade;

alter table "sf"."asset_class"
  add constraint "asset_class_class_id_fkey"
  foreign key ("class_id")
  references "sf"."class"
  ("id") on update cascade on delete cascade;

alter table "sf"."asset_metadata"
  add constraint "asset_metadata_asset_id_fkey"
  foreign key ("asset_id")
  references "sf"."asset"
  ("id") on update cascade on delete cascade;

alter table "sf"."asset_nft"
  add constraint "asset_nft_asset_id_fkey"
  foreign key ("asset_id")
  references "sf"."asset"
  ("id") on update cascade on delete cascade;

alter table "sf"."class_metadata"
  add constraint "class_metadata_class_id_fkey"
  foreign key ("class_id")
  references "sf"."class"
  ("id") on update cascade on delete cascade;

alter table "sf"."class_profile"
  add constraint "class_profile_class_id_fkey"
  foreign key ("class_id")
  references "sf"."class"
  ("id") on update cascade on delete cascade;

alter table "sf"."class_profile"
  add constraint "class_profile_creator_id_fkey"
  foreign key ("creator_id")
  references "sf"."account"
  ("id") on update cascade on delete cascade;

alter table "sf"."escrow_share"
  add constraint "escrow_share_escrow_id_fkey"
  foreign key ("escrow_id")
  references "sf"."escrow"
  ("id") on update cascade on delete cascade;

alter table "sf"."escrow_share"
  add constraint "escrow_share_owner_fkey"
  foreign key ("owner")
  references "sf"."account"
  ("id") on update cascade on delete cascade;
