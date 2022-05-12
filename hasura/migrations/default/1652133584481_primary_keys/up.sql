
SET check_function_bodies = false;

CREATE SCHEMA sf;

CREATE TABLE sf.account (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL
);

CREATE TABLE sf.account_asset (
    account_id uuid NOT NULL,
    asset_id uuid NOT NULL
);

CREATE TABLE sf.account_auth (
    account_id uuid NOT NULL,
    password text NOT NULL,
    seed text NOT NULL
);

CREATE TABLE sf.account_profile (
    account_id uuid NOT NULL,
    chain_id text NOT NULL,
    name text NOT NULL
);

CREATE TABLE sf.asset (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL
);

CREATE TABLE sf.asset_class (
    asset_id uuid NOT NULL,
    class_id uuid NOT NULL
);

CREATE TABLE sf.asset_metadata (
    asset_id uuid NOT NULL,
    chain_meta jsonb,
    chain_id integer NOT NULL
);

CREATE TABLE sf.asset_nft (
    asset_id uuid NOT NULL,
    name text NOT NULL
);

CREATE TABLE sf.bundle (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    metadata jsonb NOT NULL,
    chain_bundle_id text NOT NULL,
    chain_class_id integer NOT NULL,
    chain_asset_id integer NOT NULL
);

CREATE TABLE sf.class (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    chain_id integer NOT NULL
);

CREATE TABLE sf.class_metadata (
    class_id uuid NOT NULL,
    chain_meta jsonb NOT NULL
);

CREATE TABLE sf.class_profile (
    class_id uuid NOT NULL,
    creator_id uuid NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);

CREATE TABLE sf.currency (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    symbol text NOT NULL,
    total_supply integer NOT NULL,
    chain_class_id integer NOT NULL,
    chain_asset_id integer NOT NULL,
    current_supply integer DEFAULT 0 NOT NULL
);

CREATE TABLE sf.escrow (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    class_id integer NOT NULL,
    metadata jsonb NOT NULL,
    asset_id integer,
    chain_id text
);

CREATE TABLE sf.escrow_share (
    escrow_id uuid NOT NULL,
    owner uuid NOT NULL,
    share integer NOT NULL
);

CREATE TABLE sf.market (
    id uuid PRIMARY KEY DEFAULT public.gen_random_uuid() NOT NULL,
    chain_id integer NOT NULL
);

CREATE TABLE sf.market_rate (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
    market_id uuid NOT NULL,
    chain_id integer NOT NULL
);

alter table "sf"."market_rate"
  add constraint "market_rate_market_id_fkey"
  foreign key ("market_id")
  references "sf"."market"
  ("id") on update cascade on delete cascade;

alter table "sf"."account"
    add constraint "account_pkey"
    primary key ("id");

alter table "sf"."account_asset"
    add constraint "account_asset_pkey"
    primary key ("account_id", "asset_id");

alter table "sf"."account_auth"
    add constraint "account_auth_pkey"
    primary key ("account_id");

alter table "sf"."account_profile"
    add constraint "account_profile_pkey"
    primary key ("account_id");

alter table "sf"."asset"
    add constraint "asset_pkey"
    primary key ("id");

alter table "sf"."asset_class"
    add constraint "asset_class_pkey"
    primary key ("asset_id", "class_id");

alter table "sf"."asset_metadata"
    add constraint "asset_metadata_pkey"
    primary key ("asset_id");

alter table "sf"."asset_nft"
    add constraint "asset_nft_pkey"
    primary key ("asset_id");

alter table "sf"."bundle"
    add constraint "bundle_pkey"
    primary key ("id");

alter table "sf"."class"
    add constraint "class_pkey"
    primary key ("id");

alter table "sf"."class_metadata"
    add constraint "class_metadata_pkey"
    primary key ("class_id");

alter table "sf"."class_profile"
    add constraint "class_profile_pkey"
    primary key ("class_id");

alter table "sf"."currency"
    add constraint "currency_pkey"
    primary key ("id");

alter table "sf"."escrow"
    add constraint "escrow_pkey"
    primary key ("id");

alter table "sf"."escrow_share"
    add constraint "escrow_share_pkey"
    primary key ("escrow_id", "owner");
