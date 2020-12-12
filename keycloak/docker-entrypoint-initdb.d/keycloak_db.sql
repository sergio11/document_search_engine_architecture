--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1 (Debian 13.1-1.pgdg100+1)
-- Dumped by pg_dump version 13.1 (Debian 13.1-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- Name: client_default_roles; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_default_roles (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_default_roles OWNER TO keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO keycloak;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO keycloak;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO keycloak;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO keycloak;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO keycloak;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- Name: realm_default_roles; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_roles (
    realm_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_roles OWNER TO keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO keycloak;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO keycloak;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
e7e37d0d-ab13-4b5b-b4ba-5ef5130d3ce1	\N	auth-cookie	master	97ee83de-9240-40e7-bf2d-56eb6d4e5862	2	10	f	\N	\N
1a7f46f5-e544-42de-bc2b-7a9c8fcd5e01	\N	auth-spnego	master	97ee83de-9240-40e7-bf2d-56eb6d4e5862	3	20	f	\N	\N
0d25cf4a-d132-42ef-86ec-251be9527c18	\N	identity-provider-redirector	master	97ee83de-9240-40e7-bf2d-56eb6d4e5862	2	25	f	\N	\N
4ad48bb8-4274-4951-a32c-2afeaaf8a348	\N	\N	master	97ee83de-9240-40e7-bf2d-56eb6d4e5862	2	30	t	4639b2ac-9d35-4fc8-b9b0-5ddd4d5354c3	\N
6da4f038-624a-47cf-9ed3-e39802c1a215	\N	auth-username-password-form	master	4639b2ac-9d35-4fc8-b9b0-5ddd4d5354c3	0	10	f	\N	\N
0f568b43-0bb2-4db8-9de1-faddae00f378	\N	\N	master	4639b2ac-9d35-4fc8-b9b0-5ddd4d5354c3	1	20	t	bbabe3b9-f2e0-47c7-8558-60238d9bc15f	\N
ae19a320-3fb0-4379-b7c6-2c38110b81f5	\N	conditional-user-configured	master	bbabe3b9-f2e0-47c7-8558-60238d9bc15f	0	10	f	\N	\N
09832ae4-6c50-40bc-8a35-6b8af305b257	\N	auth-otp-form	master	bbabe3b9-f2e0-47c7-8558-60238d9bc15f	0	20	f	\N	\N
c80ec399-d33a-40a6-be56-df3daabcaa9c	\N	direct-grant-validate-username	master	2e1af94c-4a76-4912-bd7a-fbbdad4fc93e	0	10	f	\N	\N
b9817368-6090-4902-bd64-7dafac6863d3	\N	direct-grant-validate-password	master	2e1af94c-4a76-4912-bd7a-fbbdad4fc93e	0	20	f	\N	\N
bffdc95e-1be9-4355-9f98-8f6d7ac8d85a	\N	\N	master	2e1af94c-4a76-4912-bd7a-fbbdad4fc93e	1	30	t	0963baf5-02ab-403e-87ac-51f91a22f3d4	\N
9ed208ff-c570-4257-a332-95ed30a9af52	\N	conditional-user-configured	master	0963baf5-02ab-403e-87ac-51f91a22f3d4	0	10	f	\N	\N
ced08cf3-9f06-4d01-97ba-f88339bb7178	\N	direct-grant-validate-otp	master	0963baf5-02ab-403e-87ac-51f91a22f3d4	0	20	f	\N	\N
73344fb4-4d3a-44c2-8e5d-d87999faec3d	\N	registration-page-form	master	e689a2c0-eccd-4678-87a3-59c68ff73f54	0	10	t	02a107b1-9bfe-4d0d-988c-1d160b4e089d	\N
f62d2ea9-f77c-4380-85d0-1a1487273e66	\N	registration-user-creation	master	02a107b1-9bfe-4d0d-988c-1d160b4e089d	0	20	f	\N	\N
50d25420-7314-441f-b95e-9a59e4935bc6	\N	registration-profile-action	master	02a107b1-9bfe-4d0d-988c-1d160b4e089d	0	40	f	\N	\N
ff4ad9dc-02c1-43d0-b9a6-d99c9576586d	\N	registration-password-action	master	02a107b1-9bfe-4d0d-988c-1d160b4e089d	0	50	f	\N	\N
430ce118-3d99-4710-9e95-03d700596ba7	\N	registration-recaptcha-action	master	02a107b1-9bfe-4d0d-988c-1d160b4e089d	3	60	f	\N	\N
ec255654-0e06-4da7-9831-1bcfeb61b845	\N	reset-credentials-choose-user	master	881618ac-55dc-440d-83a2-cadc4968c7fd	0	10	f	\N	\N
a9488907-4d83-431c-a921-a017226271e1	\N	reset-credential-email	master	881618ac-55dc-440d-83a2-cadc4968c7fd	0	20	f	\N	\N
3ab41b2e-0623-4ae0-92ce-0e40b1d7db8b	\N	reset-password	master	881618ac-55dc-440d-83a2-cadc4968c7fd	0	30	f	\N	\N
7872fec6-9757-49cf-8d61-6130aa1d60bd	\N	\N	master	881618ac-55dc-440d-83a2-cadc4968c7fd	1	40	t	ec3ebbb7-e615-4cc3-890e-505aa296d767	\N
a9e4c934-9e91-443d-afeb-81d810bcfd32	\N	conditional-user-configured	master	ec3ebbb7-e615-4cc3-890e-505aa296d767	0	10	f	\N	\N
39c9ba4f-7823-45f4-8ee0-07b2171afcce	\N	reset-otp	master	ec3ebbb7-e615-4cc3-890e-505aa296d767	0	20	f	\N	\N
885c79a8-5c81-4705-8ae2-060c960ef963	\N	client-secret	master	e59efb75-4679-4fab-8648-113da0183ee6	2	10	f	\N	\N
30d3944c-c493-420b-8dce-048c8fc66cad	\N	client-jwt	master	e59efb75-4679-4fab-8648-113da0183ee6	2	20	f	\N	\N
f005da6e-278a-4b26-847d-4d7e4c94ea08	\N	client-secret-jwt	master	e59efb75-4679-4fab-8648-113da0183ee6	2	30	f	\N	\N
2f6e6ade-a57c-4bf3-896d-54819ad46d2f	\N	client-x509	master	e59efb75-4679-4fab-8648-113da0183ee6	2	40	f	\N	\N
fc446f36-eef2-4cc9-9c2f-47b23cc71a9f	\N	idp-review-profile	master	c5d3c696-12fe-42a6-8d7b-41b98f67f6af	0	10	f	\N	31a0be6a-77b8-45fb-9a36-0cf070f376f8
95bb35aa-bec3-44b5-ad23-d073b927d443	\N	\N	master	c5d3c696-12fe-42a6-8d7b-41b98f67f6af	0	20	t	6d1d99bd-951d-41b8-80a1-73b32609850b	\N
b2d59a9f-0321-4bf5-951b-a70b1b0707ad	\N	idp-create-user-if-unique	master	6d1d99bd-951d-41b8-80a1-73b32609850b	2	10	f	\N	e215c738-0a05-41ee-be47-9cda2d853d0a
b51f04ee-e624-439a-a78b-e99a67ce7989	\N	\N	master	6d1d99bd-951d-41b8-80a1-73b32609850b	2	20	t	4881a5d9-9395-412c-990e-238a4514b0ca	\N
9489b021-dc8e-49d0-8f6a-2da4087bdc0a	\N	idp-confirm-link	master	4881a5d9-9395-412c-990e-238a4514b0ca	0	10	f	\N	\N
239c662c-d561-4fd6-a7d6-c6714eb84f5b	\N	\N	master	4881a5d9-9395-412c-990e-238a4514b0ca	0	20	t	450c6325-885b-43d3-8a5c-cb6b0fdbfbc9	\N
4469042e-0207-4045-aca2-4b7ad00ce52e	\N	idp-email-verification	master	450c6325-885b-43d3-8a5c-cb6b0fdbfbc9	2	10	f	\N	\N
7f7db0e2-cf5d-47f3-b526-50564b310b45	\N	\N	master	450c6325-885b-43d3-8a5c-cb6b0fdbfbc9	2	20	t	45b3a92c-9932-49da-af97-84321da0393d	\N
fd2410cb-1f5f-4bbe-8127-028dbd6aee02	\N	idp-username-password-form	master	45b3a92c-9932-49da-af97-84321da0393d	0	10	f	\N	\N
53424dac-93fc-4889-935f-37439f643177	\N	\N	master	45b3a92c-9932-49da-af97-84321da0393d	1	20	t	6e3bf487-b57c-466a-a665-f42fc02d6fda	\N
6dc7c7c8-b250-453b-b6ba-5c3450d08871	\N	conditional-user-configured	master	6e3bf487-b57c-466a-a665-f42fc02d6fda	0	10	f	\N	\N
c4d82086-9975-4686-ba11-dd929c118c98	\N	auth-otp-form	master	6e3bf487-b57c-466a-a665-f42fc02d6fda	0	20	f	\N	\N
3bc06ac5-1662-4a1e-ba5c-661bac9f7886	\N	http-basic-authenticator	master	5a9ed2fd-abea-42ee-b6bd-66dfec0c52a0	0	10	f	\N	\N
f42165be-25b9-4ecb-bede-9af10dfa8b52	\N	docker-http-basic-authenticator	master	5e7d7917-c231-48f8-9596-3aefcf3a0f95	0	10	f	\N	\N
fd0cbd4c-559b-4ac7-93e5-3471ea3e8e49	\N	no-cookie-redirect	master	2474c298-abf9-4152-a390-0878f44b771c	0	10	f	\N	\N
5c0b5d01-ae1e-46ff-8439-4d8060e5adc2	\N	\N	master	2474c298-abf9-4152-a390-0878f44b771c	0	20	t	c9298de2-36c6-4883-a91b-e957dc56663f	\N
9caef384-ed15-49e7-ae15-407a31805c36	\N	basic-auth	master	c9298de2-36c6-4883-a91b-e957dc56663f	0	10	f	\N	\N
c2f2baf3-c41e-4091-98fc-2d71a449bc01	\N	basic-auth-otp	master	c9298de2-36c6-4883-a91b-e957dc56663f	3	20	f	\N	\N
1282b391-c44c-43b0-b268-0bcb60c6619c	\N	auth-spnego	master	c9298de2-36c6-4883-a91b-e957dc56663f	3	30	f	\N	\N
8287f605-54db-4b2a-b5f5-44f61a9cdc63	\N	auth-cookie	document_search_engine	2bc2aa2d-44ef-4b60-bb5c-46fe3dbab076	2	10	f	\N	\N
794de225-cd63-4ea9-8ce1-e8fcc43f3717	\N	auth-spnego	document_search_engine	2bc2aa2d-44ef-4b60-bb5c-46fe3dbab076	3	20	f	\N	\N
2cab16b8-c371-478d-b274-043d09a64b61	\N	identity-provider-redirector	document_search_engine	2bc2aa2d-44ef-4b60-bb5c-46fe3dbab076	2	25	f	\N	\N
8e43bc0d-b255-4820-b6da-5a5321e56119	\N	\N	document_search_engine	2bc2aa2d-44ef-4b60-bb5c-46fe3dbab076	2	30	t	fc9ba5da-4e40-49c9-b8c6-8c3b8462d20b	\N
3b7529e3-79bc-41ab-ab4c-c833dbd3cedb	\N	auth-username-password-form	document_search_engine	fc9ba5da-4e40-49c9-b8c6-8c3b8462d20b	0	10	f	\N	\N
816b3019-d0d3-4faf-ac8d-250606466369	\N	\N	document_search_engine	fc9ba5da-4e40-49c9-b8c6-8c3b8462d20b	1	20	t	e6f8baf1-7d6d-43a2-82b3-51992ed234b7	\N
75eaba5a-6087-4ea5-a18a-10ecc207314e	\N	conditional-user-configured	document_search_engine	e6f8baf1-7d6d-43a2-82b3-51992ed234b7	0	10	f	\N	\N
4040d061-7921-428a-8a53-089358b9c829	\N	auth-otp-form	document_search_engine	e6f8baf1-7d6d-43a2-82b3-51992ed234b7	0	20	f	\N	\N
fd5a2a33-99fd-4056-9019-5859874721a3	\N	direct-grant-validate-username	document_search_engine	7edd2b4b-ddc0-498e-b225-4d0bd52a41c0	0	10	f	\N	\N
95646ca3-55f4-4d37-93d7-d96b768736e1	\N	direct-grant-validate-password	document_search_engine	7edd2b4b-ddc0-498e-b225-4d0bd52a41c0	0	20	f	\N	\N
6fa130ce-c9ca-4af4-83d6-c9e2ac19ce8a	\N	\N	document_search_engine	7edd2b4b-ddc0-498e-b225-4d0bd52a41c0	1	30	t	7197d02d-8ab2-470e-bddd-a5a49835d2ca	\N
0455675a-b2fa-4b31-b367-b077bfcbe168	\N	conditional-user-configured	document_search_engine	7197d02d-8ab2-470e-bddd-a5a49835d2ca	0	10	f	\N	\N
8355d2ba-3f91-4f5b-b8be-f5dfe38e662c	\N	direct-grant-validate-otp	document_search_engine	7197d02d-8ab2-470e-bddd-a5a49835d2ca	0	20	f	\N	\N
dcb35a2d-2fb3-433e-8f92-09f4c1c4658b	\N	registration-page-form	document_search_engine	e700b60d-0630-466e-a3b7-2a6df900f4b0	0	10	t	24531562-dd7e-405f-903a-a5f349b1ca08	\N
52d381e5-9ebf-471e-8376-6d89915c2958	\N	registration-user-creation	document_search_engine	24531562-dd7e-405f-903a-a5f349b1ca08	0	20	f	\N	\N
e8e9ab1e-6d15-4712-9834-d953ec41f4b8	\N	registration-profile-action	document_search_engine	24531562-dd7e-405f-903a-a5f349b1ca08	0	40	f	\N	\N
0ae38383-afab-46d5-ae99-0ebfbab39028	\N	registration-password-action	document_search_engine	24531562-dd7e-405f-903a-a5f349b1ca08	0	50	f	\N	\N
76ed628f-1a11-4173-b16f-7e607d506e3d	\N	registration-recaptcha-action	document_search_engine	24531562-dd7e-405f-903a-a5f349b1ca08	3	60	f	\N	\N
0b60dbbd-bdec-4970-a2ea-f6ea6451fcb8	\N	reset-credentials-choose-user	document_search_engine	508570db-b020-4b5f-8eba-e2e0d4a99cbb	0	10	f	\N	\N
fec724b7-37e8-4be5-b366-6db8afee01f4	\N	reset-credential-email	document_search_engine	508570db-b020-4b5f-8eba-e2e0d4a99cbb	0	20	f	\N	\N
52ec9ba4-dc75-4540-9e68-51bd94e7ab58	\N	reset-password	document_search_engine	508570db-b020-4b5f-8eba-e2e0d4a99cbb	0	30	f	\N	\N
5bd06419-47fa-41c8-832a-bd6fb4350ff6	\N	\N	document_search_engine	508570db-b020-4b5f-8eba-e2e0d4a99cbb	1	40	t	919ee8bb-b9bf-47f1-97bf-0ec2e8702f34	\N
0ea081d2-7c90-4d25-81c8-461acb0f0461	\N	conditional-user-configured	document_search_engine	919ee8bb-b9bf-47f1-97bf-0ec2e8702f34	0	10	f	\N	\N
3f4807c8-7dcc-43cb-a8e7-957553907bb3	\N	reset-otp	document_search_engine	919ee8bb-b9bf-47f1-97bf-0ec2e8702f34	0	20	f	\N	\N
605b4dab-d8ad-4efe-a5c9-db0cd46fa446	\N	client-secret	document_search_engine	95b17b14-b451-4257-b34b-6786d4f8ec08	2	10	f	\N	\N
2ed6e46e-e23f-4256-b45f-49a1c0da52b0	\N	client-jwt	document_search_engine	95b17b14-b451-4257-b34b-6786d4f8ec08	2	20	f	\N	\N
096ad9a7-52e3-4f0a-b939-7cbc2c85559f	\N	client-secret-jwt	document_search_engine	95b17b14-b451-4257-b34b-6786d4f8ec08	2	30	f	\N	\N
106f8ac1-addd-4a03-9ec6-84d86f9e558e	\N	client-x509	document_search_engine	95b17b14-b451-4257-b34b-6786d4f8ec08	2	40	f	\N	\N
60f7b6dd-318f-4e11-9292-c96c1409bc75	\N	idp-review-profile	document_search_engine	fa287267-e9db-4fda-94e7-40c1413d38e6	0	10	f	\N	5e13166b-6477-45b4-ba95-290df41f0ce3
fb9013b2-2fe4-4cb2-aa4f-1b6d0d35cbd3	\N	\N	document_search_engine	fa287267-e9db-4fda-94e7-40c1413d38e6	0	20	t	c5e0a2d4-cf2f-4cd6-b709-4aab289d628d	\N
a3220aa2-7823-462f-b7bf-8fe068813905	\N	idp-create-user-if-unique	document_search_engine	c5e0a2d4-cf2f-4cd6-b709-4aab289d628d	2	10	f	\N	f0f2a70c-afb3-416f-860c-22c58e0779c3
60a8c281-fd20-4a6e-9005-c0c22157a065	\N	\N	document_search_engine	c5e0a2d4-cf2f-4cd6-b709-4aab289d628d	2	20	t	2ac4d159-d36d-4f2b-b082-2d9d3cc847a9	\N
8305e229-f7ba-4c59-829c-515a6f4d9eeb	\N	idp-confirm-link	document_search_engine	2ac4d159-d36d-4f2b-b082-2d9d3cc847a9	0	10	f	\N	\N
c264fb51-4465-4535-a0b3-cf16debb4733	\N	\N	document_search_engine	2ac4d159-d36d-4f2b-b082-2d9d3cc847a9	0	20	t	a64ea934-e5f1-405b-b872-d6c8a0fef3e5	\N
504bc755-9400-45db-a2cd-1b4b8d060896	\N	idp-email-verification	document_search_engine	a64ea934-e5f1-405b-b872-d6c8a0fef3e5	2	10	f	\N	\N
1da62801-fb7a-4b27-9ee5-57ff327ec31e	\N	\N	document_search_engine	a64ea934-e5f1-405b-b872-d6c8a0fef3e5	2	20	t	22db63c5-1f5c-4d72-9cb2-36c5a9e637ca	\N
8bc676f8-6f05-47ce-97de-afc955b2590d	\N	idp-username-password-form	document_search_engine	22db63c5-1f5c-4d72-9cb2-36c5a9e637ca	0	10	f	\N	\N
19601ddb-6309-4283-b8e2-6a30f32e2e11	\N	\N	document_search_engine	22db63c5-1f5c-4d72-9cb2-36c5a9e637ca	1	20	t	8e5cb1b6-cca3-4354-9ece-106aafa3ca42	\N
641b35bb-4d80-4a0c-bd5d-2116978b641e	\N	conditional-user-configured	document_search_engine	8e5cb1b6-cca3-4354-9ece-106aafa3ca42	0	10	f	\N	\N
51ae3fe7-2a8e-4635-9e6c-bef9593769d3	\N	auth-otp-form	document_search_engine	8e5cb1b6-cca3-4354-9ece-106aafa3ca42	0	20	f	\N	\N
fdc65152-e224-4cf1-b1e2-cf1f9883541b	\N	http-basic-authenticator	document_search_engine	65623b71-aba1-453e-a6fc-595932e3e660	0	10	f	\N	\N
60f791ad-6ffa-49c7-bf0f-7b9e80bf1ce0	\N	docker-http-basic-authenticator	document_search_engine	1900d81e-5731-4b5c-bf32-32c0793c200b	0	10	f	\N	\N
332daed7-fd9b-42d3-b994-f0e158e2b276	\N	no-cookie-redirect	document_search_engine	5c969b8b-fb8d-46d9-a6ff-95c2ccbf6fe0	0	10	f	\N	\N
a937a143-1054-4995-8d0e-29114698d824	\N	\N	document_search_engine	5c969b8b-fb8d-46d9-a6ff-95c2ccbf6fe0	0	20	t	92756931-3bb5-41d6-8289-3520b8bd9dd5	\N
638b2297-8c79-4e39-8bbb-759d58120c32	\N	basic-auth	document_search_engine	92756931-3bb5-41d6-8289-3520b8bd9dd5	0	10	f	\N	\N
fe32c8d3-7bc2-4e96-816a-8dfa4cf22e9a	\N	basic-auth-otp	document_search_engine	92756931-3bb5-41d6-8289-3520b8bd9dd5	3	20	f	\N	\N
8182a681-24db-49c7-b800-1e8df273ca39	\N	auth-spnego	document_search_engine	92756931-3bb5-41d6-8289-3520b8bd9dd5	3	30	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
97ee83de-9240-40e7-bf2d-56eb6d4e5862	browser	browser based authentication	master	basic-flow	t	t
4639b2ac-9d35-4fc8-b9b0-5ddd4d5354c3	forms	Username, password, otp and other auth forms.	master	basic-flow	f	t
bbabe3b9-f2e0-47c7-8558-60238d9bc15f	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
2e1af94c-4a76-4912-bd7a-fbbdad4fc93e	direct grant	OpenID Connect Resource Owner Grant	master	basic-flow	t	t
0963baf5-02ab-403e-87ac-51f91a22f3d4	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
e689a2c0-eccd-4678-87a3-59c68ff73f54	registration	registration flow	master	basic-flow	t	t
02a107b1-9bfe-4d0d-988c-1d160b4e089d	registration form	registration form	master	form-flow	f	t
881618ac-55dc-440d-83a2-cadc4968c7fd	reset credentials	Reset credentials for a user if they forgot their password or something	master	basic-flow	t	t
ec3ebbb7-e615-4cc3-890e-505aa296d767	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	master	basic-flow	f	t
e59efb75-4679-4fab-8648-113da0183ee6	clients	Base authentication for clients	master	client-flow	t	t
c5d3c696-12fe-42a6-8d7b-41b98f67f6af	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	master	basic-flow	t	t
6d1d99bd-951d-41b8-80a1-73b32609850b	User creation or linking	Flow for the existing/non-existing user alternatives	master	basic-flow	f	t
4881a5d9-9395-412c-990e-238a4514b0ca	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	master	basic-flow	f	t
450c6325-885b-43d3-8a5c-cb6b0fdbfbc9	Account verification options	Method with which to verity the existing account	master	basic-flow	f	t
45b3a92c-9932-49da-af97-84321da0393d	Verify Existing Account by Re-authentication	Reauthentication of existing account	master	basic-flow	f	t
6e3bf487-b57c-466a-a665-f42fc02d6fda	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
5a9ed2fd-abea-42ee-b6bd-66dfec0c52a0	saml ecp	SAML ECP Profile Authentication Flow	master	basic-flow	t	t
5e7d7917-c231-48f8-9596-3aefcf3a0f95	docker auth	Used by Docker clients to authenticate against the IDP	master	basic-flow	t	t
2474c298-abf9-4152-a390-0878f44b771c	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	master	basic-flow	t	t
c9298de2-36c6-4883-a91b-e957dc56663f	Authentication Options	Authentication options.	master	basic-flow	f	t
2bc2aa2d-44ef-4b60-bb5c-46fe3dbab076	browser	browser based authentication	document_search_engine	basic-flow	t	t
fc9ba5da-4e40-49c9-b8c6-8c3b8462d20b	forms	Username, password, otp and other auth forms.	document_search_engine	basic-flow	f	t
e6f8baf1-7d6d-43a2-82b3-51992ed234b7	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	document_search_engine	basic-flow	f	t
7edd2b4b-ddc0-498e-b225-4d0bd52a41c0	direct grant	OpenID Connect Resource Owner Grant	document_search_engine	basic-flow	t	t
7197d02d-8ab2-470e-bddd-a5a49835d2ca	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	document_search_engine	basic-flow	f	t
e700b60d-0630-466e-a3b7-2a6df900f4b0	registration	registration flow	document_search_engine	basic-flow	t	t
24531562-dd7e-405f-903a-a5f349b1ca08	registration form	registration form	document_search_engine	form-flow	f	t
508570db-b020-4b5f-8eba-e2e0d4a99cbb	reset credentials	Reset credentials for a user if they forgot their password or something	document_search_engine	basic-flow	t	t
919ee8bb-b9bf-47f1-97bf-0ec2e8702f34	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	document_search_engine	basic-flow	f	t
95b17b14-b451-4257-b34b-6786d4f8ec08	clients	Base authentication for clients	document_search_engine	client-flow	t	t
fa287267-e9db-4fda-94e7-40c1413d38e6	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	document_search_engine	basic-flow	t	t
c5e0a2d4-cf2f-4cd6-b709-4aab289d628d	User creation or linking	Flow for the existing/non-existing user alternatives	document_search_engine	basic-flow	f	t
2ac4d159-d36d-4f2b-b082-2d9d3cc847a9	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	document_search_engine	basic-flow	f	t
a64ea934-e5f1-405b-b872-d6c8a0fef3e5	Account verification options	Method with which to verity the existing account	document_search_engine	basic-flow	f	t
22db63c5-1f5c-4d72-9cb2-36c5a9e637ca	Verify Existing Account by Re-authentication	Reauthentication of existing account	document_search_engine	basic-flow	f	t
8e5cb1b6-cca3-4354-9ece-106aafa3ca42	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	document_search_engine	basic-flow	f	t
65623b71-aba1-453e-a6fc-595932e3e660	saml ecp	SAML ECP Profile Authentication Flow	document_search_engine	basic-flow	t	t
1900d81e-5731-4b5c-bf32-32c0793c200b	docker auth	Used by Docker clients to authenticate against the IDP	document_search_engine	basic-flow	t	t
5c969b8b-fb8d-46d9-a6ff-95c2ccbf6fe0	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	document_search_engine	basic-flow	t	t
92756931-3bb5-41d6-8289-3520b8bd9dd5	Authentication Options	Authentication options.	document_search_engine	basic-flow	f	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
31a0be6a-77b8-45fb-9a36-0cf070f376f8	review profile config	master
e215c738-0a05-41ee-be47-9cda2d853d0a	create unique user config	master
5e13166b-6477-45b4-ba95-290df41f0ce3	review profile config	document_search_engine
f0f2a70c-afb3-416f-860c-22c58e0779c3	create unique user config	document_search_engine
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
31a0be6a-77b8-45fb-9a36-0cf070f376f8	missing	update.profile.on.first.login
e215c738-0a05-41ee-be47-9cda2d853d0a	false	require.password.update.after.registration
5e13166b-6477-45b4-ba95-290df41f0ce3	missing	update.profile.on.first.login
f0f2a70c-afb3-416f-860c-22c58e0779c3	false	require.password.update.after.registration
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
9cb9bb23-ee52-4842-9be2-9fb67204986d	t	t	master-realm	0	f	eb576ef8-e664-4edf-a68a-e9ac5fe50bd4	\N	t	\N	f	master	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
c19be915-a5ec-4202-a9f5-0ce9474bed1c	t	f	account	0	f	20b7a1bc-5803-4fb1-8421-da03668dcf05	/realms/master/account/	f	\N	f	master	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
5e7449ef-c6be-41eb-aa6a-614183502daa	t	f	account-console	0	t	5c80dc3d-ec41-4926-8b6b-1ba7f61e6e3b	/realms/master/account/	f	\N	f	master	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
45a84ed2-c14c-466f-8b5e-83c511c51149	t	f	broker	0	f	7bccab83-5d2e-4886-908e-9d7f74dfbfa1	\N	f	\N	f	master	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
04f1c18a-ebde-41ae-b71e-e014448a058a	t	f	security-admin-console	0	t	5c9e244c-dcc6-4938-9ed7-4c5834afc6e8	/admin/master/console/	f	\N	f	master	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
61bc4c32-9b71-4a5e-b850-60e3793c80bc	t	f	admin-cli	0	t	deb6199f-0092-439e-b595-88e38cd0d00a	\N	f	\N	f	master	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
a9c8d6da-e662-45da-a4ab-6d1f80d48033	t	t	document_search_engine-realm	0	f	6314dc4b-9e26-4ea6-8775-508d8c654611	\N	t	\N	f	master	\N	0	f	f	document_search_engine Realm	f	client-secret	\N	\N	\N	t	f	f	f
40d3dfa1-acfe-43e1-920a-71e8d0aa1493	t	f	realm-management	0	f	f99e0ac9-00f4-423b-b172-dbe2509872a9	\N	t	\N	f	document_search_engine	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
0c410aa2-eceb-43f0-8ef4-e17c5ef04885	t	f	account	0	f	befbddfa-92c1-4f06-b0aa-f239ea4e64c8	/realms/document_search_engine/account/	f	\N	f	document_search_engine	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
1e3b778d-499d-479b-9c76-fcfb2113ecfa	t	f	account-console	0	t	00a9773f-e0e4-4c41-88cd-be1e18eea7bd	/realms/document_search_engine/account/	f	\N	f	document_search_engine	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
23cede30-02a2-4c88-8d13-a20977f0f27b	t	f	broker	0	f	42add717-edf8-4a02-b91c-5dafbd755ed5	\N	f	\N	f	document_search_engine	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
0b7676ee-20e0-4fbb-b758-774e8f149862	t	f	security-admin-console	0	t	99a89067-d525-490d-be8c-2f0c5510a97b	/admin/document_search_engine/console/	f	\N	f	document_search_engine	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
7b70e66c-1240-42b7-93b3-fc8732ff4251	t	f	admin-cli	0	t	48a01a6a-5062-4979-ad55-d5318f1c88ac	\N	f	\N	f	document_search_engine	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
049f4477-caa6-4519-b6cd-6529c8ad9664	t	t	files-viewing-client	0	f	8d238a8c-6f0c-4935-b394-da4b4901aec1	\N	f	\N	f	document_search_engine	openid-connect	-1	f	f	Files Viewing Client	f	client-secret	\N	Client used to query the metadata and content of the processed files.	\N	t	f	t	f
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	t	t	files-management-client	0	f	23c6be5d-0aed-421b-a245-9f13ee5412c9	\N	f	\N	f	document_search_engine	openid-connect	-1	f	f	Files Management Client	f	client-secret	\N	Client to perform advanced operations on processed files	\N	t	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, value, name) FROM stdin;
5e7449ef-c6be-41eb-aa6a-614183502daa	S256	pkce.code.challenge.method
04f1c18a-ebde-41ae-b71e-e014448a058a	S256	pkce.code.challenge.method
1e3b778d-499d-479b-9c76-fcfb2113ecfa	S256	pkce.code.challenge.method
0b7676ee-20e0-4fbb-b758-774e8f149862	S256	pkce.code.challenge.method
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	keycloak	login_theme
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	false	saml.server.signature
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	false	saml.server.signature.keyinfo.ext
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	false	saml.assertion.signature
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	false	saml.client.signature
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	false	saml.encrypt
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	false	saml.authnstatement
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	false	saml.onetimeuse.condition
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	false	saml_force_name_id_format
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	false	saml.multivalued.roles
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	false	saml.force.post.binding
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	false	exclude.session.state.from.auth.response
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	false	tls.client.certificate.bound.access.tokens
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	false	display.on.consent.screen
049f4477-caa6-4519-b6cd-6529c8ad9664	keycloak	login_theme
049f4477-caa6-4519-b6cd-6529c8ad9664	false	saml.server.signature
049f4477-caa6-4519-b6cd-6529c8ad9664	false	saml.server.signature.keyinfo.ext
049f4477-caa6-4519-b6cd-6529c8ad9664	false	saml.assertion.signature
049f4477-caa6-4519-b6cd-6529c8ad9664	false	saml.client.signature
049f4477-caa6-4519-b6cd-6529c8ad9664	false	saml.encrypt
049f4477-caa6-4519-b6cd-6529c8ad9664	false	saml.authnstatement
049f4477-caa6-4519-b6cd-6529c8ad9664	false	saml.onetimeuse.condition
049f4477-caa6-4519-b6cd-6529c8ad9664	false	saml_force_name_id_format
049f4477-caa6-4519-b6cd-6529c8ad9664	false	saml.multivalued.roles
049f4477-caa6-4519-b6cd-6529c8ad9664	false	saml.force.post.binding
049f4477-caa6-4519-b6cd-6529c8ad9664	false	exclude.session.state.from.auth.response
049f4477-caa6-4519-b6cd-6529c8ad9664	false	tls.client.certificate.bound.access.tokens
049f4477-caa6-4519-b6cd-6529c8ad9664	false	display.on.consent.screen
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_default_roles; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_default_roles (client_id, role_id) FROM stdin;
c19be915-a5ec-4202-a9f5-0ce9474bed1c	649a34ce-4528-4640-9234-8b9ec6177506
c19be915-a5ec-4202-a9f5-0ce9474bed1c	4ffd4aa4-69e1-4166-a5a6-0f6a78602f80
0c410aa2-eceb-43f0-8ef4-e17c5ef04885	eeaa9bd7-2b94-4c09-b88b-b70a786ce5d2
0c410aa2-eceb-43f0-8ef4-e17c5ef04885	f7dfd151-e810-4242-add9-4cc040ebf3c5
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
56897ba4-c541-4d03-9f7a-6e53a79b3c43	offline_access	master	OpenID Connect built-in scope: offline_access	openid-connect
226d8b11-c999-4e6a-b155-89e2f81bde90	role_list	master	SAML role list	saml
e2efea9e-dbbc-46e1-a23c-56b95356e57c	profile	master	OpenID Connect built-in scope: profile	openid-connect
62d03df6-99d2-4e76-9b29-d21e82f1b836	email	master	OpenID Connect built-in scope: email	openid-connect
fc87dea4-2c84-415a-9930-edae22ba052a	address	master	OpenID Connect built-in scope: address	openid-connect
b7cecef1-bf09-4162-9c8f-f022e9deb64a	phone	master	OpenID Connect built-in scope: phone	openid-connect
298c28aa-cb99-4123-a123-55f00e25321b	roles	master	OpenID Connect scope for add user roles to the access token	openid-connect
1e474be2-6338-4830-9356-60ab538f1720	web-origins	master	OpenID Connect scope for add allowed web origins to the access token	openid-connect
1f6b34c5-78c6-4ffb-bd3d-a318cf70b22e	microprofile-jwt	master	Microprofile - JWT built-in scope	openid-connect
46725dd6-61d9-465a-b50f-ca2caeb1b18c	offline_access	document_search_engine	OpenID Connect built-in scope: offline_access	openid-connect
aaba4cc5-5700-4860-9ae3-f6bbeb6bc757	role_list	document_search_engine	SAML role list	saml
496ce993-b454-4d34-b56b-6f77619efc3e	profile	document_search_engine	OpenID Connect built-in scope: profile	openid-connect
01e68a46-fa2b-4042-a36d-11f5c98591d9	email	document_search_engine	OpenID Connect built-in scope: email	openid-connect
da50ba5e-ea87-45e6-aee8-d21b01591cf6	address	document_search_engine	OpenID Connect built-in scope: address	openid-connect
c04648e8-2272-41bd-ac73-2dd6478fde45	phone	document_search_engine	OpenID Connect built-in scope: phone	openid-connect
f2d06444-3aad-408e-9ccf-b92e6548dc63	roles	document_search_engine	OpenID Connect scope for add user roles to the access token	openid-connect
15108269-16c6-482c-b52f-8162264fa070	web-origins	document_search_engine	OpenID Connect scope for add allowed web origins to the access token	openid-connect
f2b62026-11d4-450b-a9a3-5a427d8a54c6	microprofile-jwt	document_search_engine	Microprofile - JWT built-in scope	openid-connect
40c4abe6-f3ca-4767-9b88-00efd1bdefdf	SCOPE_FILES_MANAGEMENT	document_search_engine	Files Management Scope	openid-connect
7c9dd720-083a-4b4f-af2a-165aba376c1f	SCOPE_FILES_METADATA	document_search_engine	Files Metadata Scope	openid-connect
5d6c196d-dc8d-4ae1-b8bb-543f89dc0d6c	SCOPE_FILES_SEARCH	document_search_engine	Files Search Scope	openid-connect
ba9f7ed9-82c5-4706-a82e-47985694aefc	SCOPE_FILES_NOTIFICATIONS	document_search_engine	Files Notifications Scope	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
56897ba4-c541-4d03-9f7a-6e53a79b3c43	true	display.on.consent.screen
56897ba4-c541-4d03-9f7a-6e53a79b3c43	${offlineAccessScopeConsentText}	consent.screen.text
226d8b11-c999-4e6a-b155-89e2f81bde90	true	display.on.consent.screen
226d8b11-c999-4e6a-b155-89e2f81bde90	${samlRoleListScopeConsentText}	consent.screen.text
e2efea9e-dbbc-46e1-a23c-56b95356e57c	true	display.on.consent.screen
e2efea9e-dbbc-46e1-a23c-56b95356e57c	${profileScopeConsentText}	consent.screen.text
e2efea9e-dbbc-46e1-a23c-56b95356e57c	true	include.in.token.scope
62d03df6-99d2-4e76-9b29-d21e82f1b836	true	display.on.consent.screen
62d03df6-99d2-4e76-9b29-d21e82f1b836	${emailScopeConsentText}	consent.screen.text
62d03df6-99d2-4e76-9b29-d21e82f1b836	true	include.in.token.scope
fc87dea4-2c84-415a-9930-edae22ba052a	true	display.on.consent.screen
fc87dea4-2c84-415a-9930-edae22ba052a	${addressScopeConsentText}	consent.screen.text
fc87dea4-2c84-415a-9930-edae22ba052a	true	include.in.token.scope
b7cecef1-bf09-4162-9c8f-f022e9deb64a	true	display.on.consent.screen
b7cecef1-bf09-4162-9c8f-f022e9deb64a	${phoneScopeConsentText}	consent.screen.text
b7cecef1-bf09-4162-9c8f-f022e9deb64a	true	include.in.token.scope
298c28aa-cb99-4123-a123-55f00e25321b	true	display.on.consent.screen
298c28aa-cb99-4123-a123-55f00e25321b	${rolesScopeConsentText}	consent.screen.text
298c28aa-cb99-4123-a123-55f00e25321b	false	include.in.token.scope
1e474be2-6338-4830-9356-60ab538f1720	false	display.on.consent.screen
1e474be2-6338-4830-9356-60ab538f1720		consent.screen.text
1e474be2-6338-4830-9356-60ab538f1720	false	include.in.token.scope
1f6b34c5-78c6-4ffb-bd3d-a318cf70b22e	false	display.on.consent.screen
1f6b34c5-78c6-4ffb-bd3d-a318cf70b22e	true	include.in.token.scope
46725dd6-61d9-465a-b50f-ca2caeb1b18c	true	display.on.consent.screen
46725dd6-61d9-465a-b50f-ca2caeb1b18c	${offlineAccessScopeConsentText}	consent.screen.text
aaba4cc5-5700-4860-9ae3-f6bbeb6bc757	true	display.on.consent.screen
aaba4cc5-5700-4860-9ae3-f6bbeb6bc757	${samlRoleListScopeConsentText}	consent.screen.text
496ce993-b454-4d34-b56b-6f77619efc3e	true	display.on.consent.screen
496ce993-b454-4d34-b56b-6f77619efc3e	${profileScopeConsentText}	consent.screen.text
496ce993-b454-4d34-b56b-6f77619efc3e	true	include.in.token.scope
01e68a46-fa2b-4042-a36d-11f5c98591d9	true	display.on.consent.screen
01e68a46-fa2b-4042-a36d-11f5c98591d9	${emailScopeConsentText}	consent.screen.text
01e68a46-fa2b-4042-a36d-11f5c98591d9	true	include.in.token.scope
da50ba5e-ea87-45e6-aee8-d21b01591cf6	true	display.on.consent.screen
da50ba5e-ea87-45e6-aee8-d21b01591cf6	${addressScopeConsentText}	consent.screen.text
da50ba5e-ea87-45e6-aee8-d21b01591cf6	true	include.in.token.scope
c04648e8-2272-41bd-ac73-2dd6478fde45	true	display.on.consent.screen
c04648e8-2272-41bd-ac73-2dd6478fde45	${phoneScopeConsentText}	consent.screen.text
c04648e8-2272-41bd-ac73-2dd6478fde45	true	include.in.token.scope
f2d06444-3aad-408e-9ccf-b92e6548dc63	true	display.on.consent.screen
f2d06444-3aad-408e-9ccf-b92e6548dc63	${rolesScopeConsentText}	consent.screen.text
f2d06444-3aad-408e-9ccf-b92e6548dc63	false	include.in.token.scope
15108269-16c6-482c-b52f-8162264fa070	false	display.on.consent.screen
15108269-16c6-482c-b52f-8162264fa070		consent.screen.text
15108269-16c6-482c-b52f-8162264fa070	false	include.in.token.scope
f2b62026-11d4-450b-a9a3-5a427d8a54c6	false	display.on.consent.screen
f2b62026-11d4-450b-a9a3-5a427d8a54c6	true	include.in.token.scope
40c4abe6-f3ca-4767-9b88-00efd1bdefdf	Files Management Scope	consent.screen.text
40c4abe6-f3ca-4767-9b88-00efd1bdefdf	true	display.on.consent.screen
40c4abe6-f3ca-4767-9b88-00efd1bdefdf	true	include.in.token.scope
7c9dd720-083a-4b4f-af2a-165aba376c1f	Files Metadata Scope	consent.screen.text
7c9dd720-083a-4b4f-af2a-165aba376c1f	true	display.on.consent.screen
7c9dd720-083a-4b4f-af2a-165aba376c1f	true	include.in.token.scope
5d6c196d-dc8d-4ae1-b8bb-543f89dc0d6c	Files Search Scope	consent.screen.text
5d6c196d-dc8d-4ae1-b8bb-543f89dc0d6c	true	display.on.consent.screen
5d6c196d-dc8d-4ae1-b8bb-543f89dc0d6c	true	include.in.token.scope
ba9f7ed9-82c5-4706-a82e-47985694aefc	Files Notifications Scope	consent.screen.text
ba9f7ed9-82c5-4706-a82e-47985694aefc	true	display.on.consent.screen
ba9f7ed9-82c5-4706-a82e-47985694aefc	true	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
c19be915-a5ec-4202-a9f5-0ce9474bed1c	226d8b11-c999-4e6a-b155-89e2f81bde90	t
5e7449ef-c6be-41eb-aa6a-614183502daa	226d8b11-c999-4e6a-b155-89e2f81bde90	t
61bc4c32-9b71-4a5e-b850-60e3793c80bc	226d8b11-c999-4e6a-b155-89e2f81bde90	t
45a84ed2-c14c-466f-8b5e-83c511c51149	226d8b11-c999-4e6a-b155-89e2f81bde90	t
9cb9bb23-ee52-4842-9be2-9fb67204986d	226d8b11-c999-4e6a-b155-89e2f81bde90	t
04f1c18a-ebde-41ae-b71e-e014448a058a	226d8b11-c999-4e6a-b155-89e2f81bde90	t
c19be915-a5ec-4202-a9f5-0ce9474bed1c	298c28aa-cb99-4123-a123-55f00e25321b	t
c19be915-a5ec-4202-a9f5-0ce9474bed1c	1e474be2-6338-4830-9356-60ab538f1720	t
c19be915-a5ec-4202-a9f5-0ce9474bed1c	62d03df6-99d2-4e76-9b29-d21e82f1b836	t
c19be915-a5ec-4202-a9f5-0ce9474bed1c	e2efea9e-dbbc-46e1-a23c-56b95356e57c	t
5e7449ef-c6be-41eb-aa6a-614183502daa	298c28aa-cb99-4123-a123-55f00e25321b	t
5e7449ef-c6be-41eb-aa6a-614183502daa	1e474be2-6338-4830-9356-60ab538f1720	t
5e7449ef-c6be-41eb-aa6a-614183502daa	62d03df6-99d2-4e76-9b29-d21e82f1b836	t
5e7449ef-c6be-41eb-aa6a-614183502daa	e2efea9e-dbbc-46e1-a23c-56b95356e57c	t
61bc4c32-9b71-4a5e-b850-60e3793c80bc	298c28aa-cb99-4123-a123-55f00e25321b	t
61bc4c32-9b71-4a5e-b850-60e3793c80bc	1e474be2-6338-4830-9356-60ab538f1720	t
61bc4c32-9b71-4a5e-b850-60e3793c80bc	62d03df6-99d2-4e76-9b29-d21e82f1b836	t
61bc4c32-9b71-4a5e-b850-60e3793c80bc	e2efea9e-dbbc-46e1-a23c-56b95356e57c	t
45a84ed2-c14c-466f-8b5e-83c511c51149	298c28aa-cb99-4123-a123-55f00e25321b	t
45a84ed2-c14c-466f-8b5e-83c511c51149	1e474be2-6338-4830-9356-60ab538f1720	t
45a84ed2-c14c-466f-8b5e-83c511c51149	62d03df6-99d2-4e76-9b29-d21e82f1b836	t
45a84ed2-c14c-466f-8b5e-83c511c51149	e2efea9e-dbbc-46e1-a23c-56b95356e57c	t
9cb9bb23-ee52-4842-9be2-9fb67204986d	298c28aa-cb99-4123-a123-55f00e25321b	t
9cb9bb23-ee52-4842-9be2-9fb67204986d	1e474be2-6338-4830-9356-60ab538f1720	t
9cb9bb23-ee52-4842-9be2-9fb67204986d	62d03df6-99d2-4e76-9b29-d21e82f1b836	t
9cb9bb23-ee52-4842-9be2-9fb67204986d	e2efea9e-dbbc-46e1-a23c-56b95356e57c	t
04f1c18a-ebde-41ae-b71e-e014448a058a	298c28aa-cb99-4123-a123-55f00e25321b	t
04f1c18a-ebde-41ae-b71e-e014448a058a	1e474be2-6338-4830-9356-60ab538f1720	t
04f1c18a-ebde-41ae-b71e-e014448a058a	62d03df6-99d2-4e76-9b29-d21e82f1b836	t
04f1c18a-ebde-41ae-b71e-e014448a058a	e2efea9e-dbbc-46e1-a23c-56b95356e57c	t
c19be915-a5ec-4202-a9f5-0ce9474bed1c	56897ba4-c541-4d03-9f7a-6e53a79b3c43	f
c19be915-a5ec-4202-a9f5-0ce9474bed1c	b7cecef1-bf09-4162-9c8f-f022e9deb64a	f
c19be915-a5ec-4202-a9f5-0ce9474bed1c	fc87dea4-2c84-415a-9930-edae22ba052a	f
c19be915-a5ec-4202-a9f5-0ce9474bed1c	1f6b34c5-78c6-4ffb-bd3d-a318cf70b22e	f
5e7449ef-c6be-41eb-aa6a-614183502daa	56897ba4-c541-4d03-9f7a-6e53a79b3c43	f
5e7449ef-c6be-41eb-aa6a-614183502daa	b7cecef1-bf09-4162-9c8f-f022e9deb64a	f
5e7449ef-c6be-41eb-aa6a-614183502daa	fc87dea4-2c84-415a-9930-edae22ba052a	f
5e7449ef-c6be-41eb-aa6a-614183502daa	1f6b34c5-78c6-4ffb-bd3d-a318cf70b22e	f
61bc4c32-9b71-4a5e-b850-60e3793c80bc	56897ba4-c541-4d03-9f7a-6e53a79b3c43	f
61bc4c32-9b71-4a5e-b850-60e3793c80bc	b7cecef1-bf09-4162-9c8f-f022e9deb64a	f
61bc4c32-9b71-4a5e-b850-60e3793c80bc	fc87dea4-2c84-415a-9930-edae22ba052a	f
61bc4c32-9b71-4a5e-b850-60e3793c80bc	1f6b34c5-78c6-4ffb-bd3d-a318cf70b22e	f
45a84ed2-c14c-466f-8b5e-83c511c51149	56897ba4-c541-4d03-9f7a-6e53a79b3c43	f
45a84ed2-c14c-466f-8b5e-83c511c51149	b7cecef1-bf09-4162-9c8f-f022e9deb64a	f
45a84ed2-c14c-466f-8b5e-83c511c51149	fc87dea4-2c84-415a-9930-edae22ba052a	f
45a84ed2-c14c-466f-8b5e-83c511c51149	1f6b34c5-78c6-4ffb-bd3d-a318cf70b22e	f
9cb9bb23-ee52-4842-9be2-9fb67204986d	56897ba4-c541-4d03-9f7a-6e53a79b3c43	f
9cb9bb23-ee52-4842-9be2-9fb67204986d	b7cecef1-bf09-4162-9c8f-f022e9deb64a	f
9cb9bb23-ee52-4842-9be2-9fb67204986d	fc87dea4-2c84-415a-9930-edae22ba052a	f
9cb9bb23-ee52-4842-9be2-9fb67204986d	1f6b34c5-78c6-4ffb-bd3d-a318cf70b22e	f
04f1c18a-ebde-41ae-b71e-e014448a058a	56897ba4-c541-4d03-9f7a-6e53a79b3c43	f
04f1c18a-ebde-41ae-b71e-e014448a058a	b7cecef1-bf09-4162-9c8f-f022e9deb64a	f
04f1c18a-ebde-41ae-b71e-e014448a058a	fc87dea4-2c84-415a-9930-edae22ba052a	f
04f1c18a-ebde-41ae-b71e-e014448a058a	1f6b34c5-78c6-4ffb-bd3d-a318cf70b22e	f
a9c8d6da-e662-45da-a4ab-6d1f80d48033	226d8b11-c999-4e6a-b155-89e2f81bde90	t
a9c8d6da-e662-45da-a4ab-6d1f80d48033	298c28aa-cb99-4123-a123-55f00e25321b	t
a9c8d6da-e662-45da-a4ab-6d1f80d48033	1e474be2-6338-4830-9356-60ab538f1720	t
a9c8d6da-e662-45da-a4ab-6d1f80d48033	62d03df6-99d2-4e76-9b29-d21e82f1b836	t
a9c8d6da-e662-45da-a4ab-6d1f80d48033	e2efea9e-dbbc-46e1-a23c-56b95356e57c	t
a9c8d6da-e662-45da-a4ab-6d1f80d48033	56897ba4-c541-4d03-9f7a-6e53a79b3c43	f
a9c8d6da-e662-45da-a4ab-6d1f80d48033	b7cecef1-bf09-4162-9c8f-f022e9deb64a	f
a9c8d6da-e662-45da-a4ab-6d1f80d48033	fc87dea4-2c84-415a-9930-edae22ba052a	f
a9c8d6da-e662-45da-a4ab-6d1f80d48033	1f6b34c5-78c6-4ffb-bd3d-a318cf70b22e	f
0c410aa2-eceb-43f0-8ef4-e17c5ef04885	aaba4cc5-5700-4860-9ae3-f6bbeb6bc757	t
1e3b778d-499d-479b-9c76-fcfb2113ecfa	aaba4cc5-5700-4860-9ae3-f6bbeb6bc757	t
7b70e66c-1240-42b7-93b3-fc8732ff4251	aaba4cc5-5700-4860-9ae3-f6bbeb6bc757	t
23cede30-02a2-4c88-8d13-a20977f0f27b	aaba4cc5-5700-4860-9ae3-f6bbeb6bc757	t
40d3dfa1-acfe-43e1-920a-71e8d0aa1493	aaba4cc5-5700-4860-9ae3-f6bbeb6bc757	t
0b7676ee-20e0-4fbb-b758-774e8f149862	aaba4cc5-5700-4860-9ae3-f6bbeb6bc757	t
0c410aa2-eceb-43f0-8ef4-e17c5ef04885	f2d06444-3aad-408e-9ccf-b92e6548dc63	t
0c410aa2-eceb-43f0-8ef4-e17c5ef04885	15108269-16c6-482c-b52f-8162264fa070	t
0c410aa2-eceb-43f0-8ef4-e17c5ef04885	496ce993-b454-4d34-b56b-6f77619efc3e	t
0c410aa2-eceb-43f0-8ef4-e17c5ef04885	01e68a46-fa2b-4042-a36d-11f5c98591d9	t
1e3b778d-499d-479b-9c76-fcfb2113ecfa	f2d06444-3aad-408e-9ccf-b92e6548dc63	t
1e3b778d-499d-479b-9c76-fcfb2113ecfa	15108269-16c6-482c-b52f-8162264fa070	t
1e3b778d-499d-479b-9c76-fcfb2113ecfa	496ce993-b454-4d34-b56b-6f77619efc3e	t
1e3b778d-499d-479b-9c76-fcfb2113ecfa	01e68a46-fa2b-4042-a36d-11f5c98591d9	t
7b70e66c-1240-42b7-93b3-fc8732ff4251	f2d06444-3aad-408e-9ccf-b92e6548dc63	t
7b70e66c-1240-42b7-93b3-fc8732ff4251	15108269-16c6-482c-b52f-8162264fa070	t
7b70e66c-1240-42b7-93b3-fc8732ff4251	496ce993-b454-4d34-b56b-6f77619efc3e	t
7b70e66c-1240-42b7-93b3-fc8732ff4251	01e68a46-fa2b-4042-a36d-11f5c98591d9	t
23cede30-02a2-4c88-8d13-a20977f0f27b	f2d06444-3aad-408e-9ccf-b92e6548dc63	t
23cede30-02a2-4c88-8d13-a20977f0f27b	15108269-16c6-482c-b52f-8162264fa070	t
23cede30-02a2-4c88-8d13-a20977f0f27b	496ce993-b454-4d34-b56b-6f77619efc3e	t
23cede30-02a2-4c88-8d13-a20977f0f27b	01e68a46-fa2b-4042-a36d-11f5c98591d9	t
40d3dfa1-acfe-43e1-920a-71e8d0aa1493	f2d06444-3aad-408e-9ccf-b92e6548dc63	t
40d3dfa1-acfe-43e1-920a-71e8d0aa1493	15108269-16c6-482c-b52f-8162264fa070	t
40d3dfa1-acfe-43e1-920a-71e8d0aa1493	496ce993-b454-4d34-b56b-6f77619efc3e	t
40d3dfa1-acfe-43e1-920a-71e8d0aa1493	01e68a46-fa2b-4042-a36d-11f5c98591d9	t
0b7676ee-20e0-4fbb-b758-774e8f149862	f2d06444-3aad-408e-9ccf-b92e6548dc63	t
0b7676ee-20e0-4fbb-b758-774e8f149862	15108269-16c6-482c-b52f-8162264fa070	t
0b7676ee-20e0-4fbb-b758-774e8f149862	496ce993-b454-4d34-b56b-6f77619efc3e	t
0b7676ee-20e0-4fbb-b758-774e8f149862	01e68a46-fa2b-4042-a36d-11f5c98591d9	t
0c410aa2-eceb-43f0-8ef4-e17c5ef04885	da50ba5e-ea87-45e6-aee8-d21b01591cf6	f
0c410aa2-eceb-43f0-8ef4-e17c5ef04885	f2b62026-11d4-450b-a9a3-5a427d8a54c6	f
0c410aa2-eceb-43f0-8ef4-e17c5ef04885	c04648e8-2272-41bd-ac73-2dd6478fde45	f
0c410aa2-eceb-43f0-8ef4-e17c5ef04885	46725dd6-61d9-465a-b50f-ca2caeb1b18c	f
1e3b778d-499d-479b-9c76-fcfb2113ecfa	da50ba5e-ea87-45e6-aee8-d21b01591cf6	f
1e3b778d-499d-479b-9c76-fcfb2113ecfa	f2b62026-11d4-450b-a9a3-5a427d8a54c6	f
1e3b778d-499d-479b-9c76-fcfb2113ecfa	c04648e8-2272-41bd-ac73-2dd6478fde45	f
1e3b778d-499d-479b-9c76-fcfb2113ecfa	46725dd6-61d9-465a-b50f-ca2caeb1b18c	f
7b70e66c-1240-42b7-93b3-fc8732ff4251	da50ba5e-ea87-45e6-aee8-d21b01591cf6	f
7b70e66c-1240-42b7-93b3-fc8732ff4251	f2b62026-11d4-450b-a9a3-5a427d8a54c6	f
7b70e66c-1240-42b7-93b3-fc8732ff4251	c04648e8-2272-41bd-ac73-2dd6478fde45	f
7b70e66c-1240-42b7-93b3-fc8732ff4251	46725dd6-61d9-465a-b50f-ca2caeb1b18c	f
23cede30-02a2-4c88-8d13-a20977f0f27b	da50ba5e-ea87-45e6-aee8-d21b01591cf6	f
23cede30-02a2-4c88-8d13-a20977f0f27b	f2b62026-11d4-450b-a9a3-5a427d8a54c6	f
23cede30-02a2-4c88-8d13-a20977f0f27b	c04648e8-2272-41bd-ac73-2dd6478fde45	f
23cede30-02a2-4c88-8d13-a20977f0f27b	46725dd6-61d9-465a-b50f-ca2caeb1b18c	f
40d3dfa1-acfe-43e1-920a-71e8d0aa1493	da50ba5e-ea87-45e6-aee8-d21b01591cf6	f
40d3dfa1-acfe-43e1-920a-71e8d0aa1493	f2b62026-11d4-450b-a9a3-5a427d8a54c6	f
40d3dfa1-acfe-43e1-920a-71e8d0aa1493	c04648e8-2272-41bd-ac73-2dd6478fde45	f
40d3dfa1-acfe-43e1-920a-71e8d0aa1493	46725dd6-61d9-465a-b50f-ca2caeb1b18c	f
0b7676ee-20e0-4fbb-b758-774e8f149862	da50ba5e-ea87-45e6-aee8-d21b01591cf6	f
0b7676ee-20e0-4fbb-b758-774e8f149862	f2b62026-11d4-450b-a9a3-5a427d8a54c6	f
0b7676ee-20e0-4fbb-b758-774e8f149862	c04648e8-2272-41bd-ac73-2dd6478fde45	f
0b7676ee-20e0-4fbb-b758-774e8f149862	46725dd6-61d9-465a-b50f-ca2caeb1b18c	f
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	aaba4cc5-5700-4860-9ae3-f6bbeb6bc757	t
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	f2d06444-3aad-408e-9ccf-b92e6548dc63	t
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	15108269-16c6-482c-b52f-8162264fa070	t
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	496ce993-b454-4d34-b56b-6f77619efc3e	t
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	01e68a46-fa2b-4042-a36d-11f5c98591d9	t
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	da50ba5e-ea87-45e6-aee8-d21b01591cf6	f
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	f2b62026-11d4-450b-a9a3-5a427d8a54c6	f
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	c04648e8-2272-41bd-ac73-2dd6478fde45	f
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	46725dd6-61d9-465a-b50f-ca2caeb1b18c	f
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	ba9f7ed9-82c5-4706-a82e-47985694aefc	t
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	40c4abe6-f3ca-4767-9b88-00efd1bdefdf	t
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	5d6c196d-dc8d-4ae1-b8bb-543f89dc0d6c	t
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	7c9dd720-083a-4b4f-af2a-165aba376c1f	t
049f4477-caa6-4519-b6cd-6529c8ad9664	aaba4cc5-5700-4860-9ae3-f6bbeb6bc757	t
049f4477-caa6-4519-b6cd-6529c8ad9664	f2d06444-3aad-408e-9ccf-b92e6548dc63	t
049f4477-caa6-4519-b6cd-6529c8ad9664	15108269-16c6-482c-b52f-8162264fa070	t
049f4477-caa6-4519-b6cd-6529c8ad9664	496ce993-b454-4d34-b56b-6f77619efc3e	t
049f4477-caa6-4519-b6cd-6529c8ad9664	01e68a46-fa2b-4042-a36d-11f5c98591d9	t
049f4477-caa6-4519-b6cd-6529c8ad9664	da50ba5e-ea87-45e6-aee8-d21b01591cf6	f
049f4477-caa6-4519-b6cd-6529c8ad9664	f2b62026-11d4-450b-a9a3-5a427d8a54c6	f
049f4477-caa6-4519-b6cd-6529c8ad9664	c04648e8-2272-41bd-ac73-2dd6478fde45	f
049f4477-caa6-4519-b6cd-6529c8ad9664	46725dd6-61d9-465a-b50f-ca2caeb1b18c	f
049f4477-caa6-4519-b6cd-6529c8ad9664	5d6c196d-dc8d-4ae1-b8bb-543f89dc0d6c	t
049f4477-caa6-4519-b6cd-6529c8ad9664	7c9dd720-083a-4b4f-af2a-165aba376c1f	t
049f4477-caa6-4519-b6cd-6529c8ad9664	ba9f7ed9-82c5-4706-a82e-47985694aefc	t
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
56897ba4-c541-4d03-9f7a-6e53a79b3c43	b4c4d9bf-88cd-4b42-b55f-2ed20d5932f2
46725dd6-61d9-465a-b50f-ca2caeb1b18c	d9f842ac-678e-4e6a-bf34-bc83b9b7f837
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
30e7d599-c167-4d72-8ab1-d979b17088a1	Trusted Hosts	master	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
1ae1b04c-7325-46e9-be15-6b95b0aed411	Consent Required	master	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
31855384-f39c-4232-b1ab-814f0c1d4476	Full Scope Disabled	master	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
0d3f289f-7713-49c3-90a4-64134bb057a7	Max Clients Limit	master	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
2381f1d6-4a8a-4375-837c-462e282dd0f1	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
8450fbed-d20c-4498-a944-d25d6a85dc61	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
42b6731f-f989-4061-88e7-259b9e97115b	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
625777fd-d8d0-4211-bce2-5a1d157d6520	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
e981abfc-c5a4-4c6b-b054-3232abd1e569	fallback-HS256	master	hmac-generated	org.keycloak.keys.KeyProvider	master	\N
adce715f-429b-4fd5-a830-8e685250c7aa	fallback-RS256	master	rsa-generated	org.keycloak.keys.KeyProvider	master	\N
a01a9be9-b42f-4af1-ba5d-4d17b413eb6d	rsa-generated	document_search_engine	rsa-generated	org.keycloak.keys.KeyProvider	document_search_engine	\N
6d87829e-a494-43c7-b5d4-eb1542f9bcf0	hmac-generated	document_search_engine	hmac-generated	org.keycloak.keys.KeyProvider	document_search_engine	\N
9ddb3839-760f-41c5-bf5b-e08caaebbfed	aes-generated	document_search_engine	aes-generated	org.keycloak.keys.KeyProvider	document_search_engine	\N
d44772ad-afd0-414d-b75c-2cb18d7ed732	Trusted Hosts	document_search_engine	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	document_search_engine	anonymous
57d1b4cc-3e97-4f1c-a654-35a411f8997d	Consent Required	document_search_engine	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	document_search_engine	anonymous
ef43bd0e-b191-46e5-9549-7a9275a0c002	Full Scope Disabled	document_search_engine	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	document_search_engine	anonymous
38b5f1ff-4d4c-4292-8305-14e792d8fb1a	Max Clients Limit	document_search_engine	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	document_search_engine	anonymous
329d27e1-0eb6-437c-ac89-56cd5eda6de7	Allowed Protocol Mapper Types	document_search_engine	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	document_search_engine	anonymous
1c5d967d-0a73-4c7e-8d95-d9e6be36ce97	Allowed Client Scopes	document_search_engine	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	document_search_engine	anonymous
fc58f3f9-68a4-476f-b68d-7f14dc1cff8c	Allowed Protocol Mapper Types	document_search_engine	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	document_search_engine	authenticated
4bfbaf45-4904-452f-a46e-f172230929c7	Allowed Client Scopes	document_search_engine	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	document_search_engine	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
0b5c3dc1-5765-49ba-ba54-71446c37ac23	42b6731f-f989-4061-88e7-259b9e97115b	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
08f037a6-efdc-4e17-b764-3b5742ebe8a3	42b6731f-f989-4061-88e7-259b9e97115b	allowed-protocol-mapper-types	oidc-address-mapper
2fb869c1-6d88-4eb0-ae20-b98f97825e78	42b6731f-f989-4061-88e7-259b9e97115b	allowed-protocol-mapper-types	saml-user-attribute-mapper
37da9386-48c1-4e41-a740-ed26c9f67f97	42b6731f-f989-4061-88e7-259b9e97115b	allowed-protocol-mapper-types	oidc-full-name-mapper
d5eb1658-fffd-4462-ae8e-15a970e30cdc	42b6731f-f989-4061-88e7-259b9e97115b	allowed-protocol-mapper-types	saml-user-property-mapper
83bb7530-0250-41a6-aa9a-bc1833df3dc7	42b6731f-f989-4061-88e7-259b9e97115b	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
285b0c88-7ae1-43a0-bc61-80c6d40e01b2	42b6731f-f989-4061-88e7-259b9e97115b	allowed-protocol-mapper-types	saml-role-list-mapper
45c9117c-9a59-4e82-8f2b-0dcbdb0cad92	42b6731f-f989-4061-88e7-259b9e97115b	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
460c3815-cec3-4e6a-bb53-00057cc1ff7c	2381f1d6-4a8a-4375-837c-462e282dd0f1	allowed-protocol-mapper-types	saml-role-list-mapper
a8be323b-0372-48d2-bdda-7fee62d33b18	2381f1d6-4a8a-4375-837c-462e282dd0f1	allowed-protocol-mapper-types	oidc-full-name-mapper
f7095e44-46a3-4fb4-8b40-d4d74576a20f	2381f1d6-4a8a-4375-837c-462e282dd0f1	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
be057293-c821-4ca0-8594-d782a6e64f61	2381f1d6-4a8a-4375-837c-462e282dd0f1	allowed-protocol-mapper-types	oidc-address-mapper
21d031b2-5be5-4045-a877-6b3f2af7f10c	2381f1d6-4a8a-4375-837c-462e282dd0f1	allowed-protocol-mapper-types	saml-user-property-mapper
563683d2-83f1-4446-ad94-83f5534bd790	2381f1d6-4a8a-4375-837c-462e282dd0f1	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
1bd60629-ec50-4b30-80dc-bc6ae47b966e	2381f1d6-4a8a-4375-837c-462e282dd0f1	allowed-protocol-mapper-types	saml-user-attribute-mapper
da04a36c-df06-49d4-b431-330bdbce84ba	2381f1d6-4a8a-4375-837c-462e282dd0f1	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
1d7d56ab-731a-4573-a7a5-becc154b6bac	30e7d599-c167-4d72-8ab1-d979b17088a1	host-sending-registration-request-must-match	true
1f40e3f2-5d64-496a-abbd-70cc68406731	30e7d599-c167-4d72-8ab1-d979b17088a1	client-uris-must-match	true
44cddcf6-c4e9-475f-91fd-44c8179e7d8b	625777fd-d8d0-4211-bce2-5a1d157d6520	allow-default-scopes	true
13b16fae-4e5c-43f6-951d-d6d120fa3585	0d3f289f-7713-49c3-90a4-64134bb057a7	max-clients	200
f9285abc-f145-4338-a753-d74e00bd3374	8450fbed-d20c-4498-a944-d25d6a85dc61	allow-default-scopes	true
df610c55-61a0-46ef-808c-a79f3983a206	e981abfc-c5a4-4c6b-b054-3232abd1e569	algorithm	HS256
34aef44b-6103-4e49-866f-bd422e958df7	e981abfc-c5a4-4c6b-b054-3232abd1e569	kid	12aed109-7d72-48d4-9d6b-c72f16f544fe
6f115ca9-1ff4-41e2-afea-967d0f908774	e981abfc-c5a4-4c6b-b054-3232abd1e569	secret	h8fXf0Ucbj2QMora0M4s8qd1ql015Jt3yLnn8IToDxvmoEQK_cRQf_jSWNpIrOqt9IdaWXtUAJibMQgQW-oFog
8fb635e8-ad79-4b07-9f4c-ada580460227	e981abfc-c5a4-4c6b-b054-3232abd1e569	priority	-100
ce079ba3-06dd-4468-a572-144e0b7b615a	adce715f-429b-4fd5-a830-8e685250c7aa	certificate	MIICmzCCAYMCBgF2WDMZuDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjAxMjEyMTgyMzMyWhcNMzAxMjEyMTgyNTEyWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCKRh1LuZ5HTqIATjVVgClowc/2cWNvCbnQkdA9RrtQchomxDFZ876BjH1bkwQ3BKJ+xuLauKeYtxfsL/CXmTzVkJbZufrO7CKSFOK7RmuSi4w7oDbbo4u85/Re4aEVtrQ4Ow9xTyRvvBYQTcT0qC16u620gyNJ3Dz1Jj1muAXLK2Zy9KJ2N649EkdtVGABM8U1OsdFeqaxcw2in0OKxDDQn5pXKCu8hXhV5ljANQ8cyVxJbVMxxKsna9QMEJ9cAlY+abmiCH+wpdiaWqAKl/PxifboCmRAhhlKqxpgt8zJbheILhpHdPns2FotnSqYASG2aZwUBYtiCi0WnG1l8dw1AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAEEEGNeYF7caPdqqzExu+DfJaJX51VfUmwiXi1/QjSFeCEe67yTzp8Px4aOk3YAEAp2G8IG3OcaYfKOpxagU9fbfnT64O5Lz5FXUC5gWfX+Gjg/SimEnVKcy8J1GuTv0NNd4bCqtsPmb4RkwHbcGfVbi5/jbBeyV/YJFyZdaJSWhw5eRSk032Wl73xWNBSOP/tLHU2IvjiN37sKhzynRHriRjlXYDf1/HVTEdf3oD/f1E92cNkww22RU7et9U4mL32knNqHG6Ijva8a+gIzE0k+1zjtUPmAXflsc5ycqT38fjGDsNapj3rkp0ooHPG6ExYU1kK7cX7JspRY/PDyITYM=
a50caaee-28b1-496a-a657-03ce4b3fd1aa	adce715f-429b-4fd5-a830-8e685250c7aa	priority	-100
ee8d0182-c9b9-4042-9860-86c01380ec21	adce715f-429b-4fd5-a830-8e685250c7aa	privateKey	MIIEogIBAAKCAQEAikYdS7meR06iAE41VYApaMHP9nFjbwm50JHQPUa7UHIaJsQxWfO+gYx9W5MENwSifsbi2rinmLcX7C/wl5k81ZCW2bn6zuwikhTiu0ZrkouMO6A226OLvOf0XuGhFba0ODsPcU8kb7wWEE3E9KgteruttIMjSdw89SY9ZrgFyytmcvSidjeuPRJHbVRgATPFNTrHRXqmsXMNop9DisQw0J+aVygrvIV4VeZYwDUPHMlcSW1TMcSrJ2vUDBCfXAJWPmm5ogh/sKXYmlqgCpfz8Yn26ApkQIYZSqsaYLfMyW4XiC4aR3T57NhaLZ0qmAEhtmmcFAWLYgotFpxtZfHcNQIDAQABAoIBADj4bnWWwsnqcgDiOENEDMumnwKQ8UD8ptxyV3QHwoGAoZm7WAIR1ToXIkcqqZ/pfvHxC+LGFfdr6KVdkylC77emXSDT6ax7yjqZ9FjoyMWWTW77sd6I4bgxcZPuLqp9nn9UhiZPT1niCs0o3a9X43UgAo/PQCjcXxk6ai36QBjW6S8gllWS75nk774+SKG2CCUcL3SXrqKpSYVa7pbyRLCfLMk2hOpvOi0PaEWEB+ekISqd8CKWUMDAZUc3y5ia29jUk4npNG6QwKVQd6JptYEEK2pwNv8boQ3oUmesDQbeqeeUxyBu6nOAiAZ1EslACC3MYK3a/SjmRzMzXT8QHQECgYEA4junEc3wtvIwQaDXvl+MKtwg5esFKmocfHRXxX0cqeLasy7QlK6LfVQnAmPcLzCjpiOD6bgZaMZRO6wtKoWVPpbHZG5obpgqowxf1gqPClViOHLpjd8VOLTVId0BleLwRLWG7OLHZesAy1+l7LXZKrsOuECCn7GObfyGGTP6NhUCgYEAnHet/VzHee4F5r9dfPqT/39EgCFMShCxEaOloxYfQPidz1G5DR6CdcLf9SLVegHWyS2s77yxnh/KFYshMADbmJirX71a32//IdpYo8jEofw8j0aBW2vdJXBpX/zfLwqimgL/oFOmcLJiP0U5PDFZzRjuBvDZHDtmrePGpe81taECgYBToL13hWswFYLlH7Hgu60ywsCefSwhq6vwDYnMhR0tZ6B0kB+mdoc1wv/QkF16TD6SUZqXsOgjpPuuVU005MBwrIf0hiOwjitkrlRW6PxLU5jFSSUwvoA3wBDxPaMyZvtuSrQfqQ0QjbhzdV3+jJJEi3U7gw1GPvppiemAM4iQqQKBgD9RazaBijO8b+TuAg4mdSfKv9S+JNpAIPfLaqcxt5oaQfp4ztMRSqgPIYRZAVyrS9kDw90MVjBwGt5W/Cop3rPE7G0E+rY641s2ufIlt/T5VyR/2q89WjPhZrMyaLrnqd97YSjnUQ6AEaQbBktmiTmnYgOrCaEUJLwv1d6mi+yhAoGABsIQ2F2bA5i9CxWGgiuSund2a098MzhAIQV8BmRc7xEJRvYNo5OJ1RXqXKaTLg9ubGOUi0saHk0/ImGOVXO8y5OL04lAawg0c8I2+B+eIdEbCJrt+G38vOQMYNokhFjKONRuGjuSw+7dG1mnxB8UcHblGCUyvdEC3XfoLyW4YKw=
98405fc4-9058-44f7-87c1-35cc2481a6ac	adce715f-429b-4fd5-a830-8e685250c7aa	algorithm	RS256
9a816cd5-a966-4187-8cf6-3a8ae2bd3660	a01a9be9-b42f-4af1-ba5d-4d17b413eb6d	certificate	MIICuzCCAaMCBgF2WDWaxDANBgkqhkiG9w0BAQsFADAhMR8wHQYDVQQDDBZkb2N1bWVudF9zZWFyY2hfZW5naW5lMB4XDTIwMTIxMjE4MjYxNloXDTMwMTIxMjE4Mjc1NlowITEfMB0GA1UEAwwWZG9jdW1lbnRfc2VhcmNoX2VuZ2luZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKetu2j1+dY9blnbUYDchoBTYO2+EtzylSyBbAO/X/7sAbybkHc6dN5qSUJcWmKXYDrOp/eRDxMwDNllV/sOE9FLKRxqBsoq/4wMrglDl+bgNOi6YOFfQqxU+zbpXV155B/xAbqPRPxU3ymHwr8VbDaD1z3LnvE0vkz7tSoMieUFSQiBimH3/H01nun+9XFgG+2k3k13R+5a1vFf1tbg4Pg7CTwTE5LMgci0C5StYQxN6Ay5Vd5PQJx3rAMDkKauoNSu2QoWg8KOdMqb9ml5/4XDEsRmiVTzNuCEFAzW5WvMPQfLYqG5+ottyu+YosJvag11qZNzvLeHZc1s8kFNhwMCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAmiZEUtj8aW4Py+C2wAe//YrcQLVlUHU9FJK0/62NIxbVNVgHiBnYaN3GF28at061y/jNQbBBIPFViQKIIdaXHZFkFnHMsHZdv6kvFZCGngceUQG9KzR02sGbBrqd7wXPY4lk4MsN7tHJXRXrpAbwv2YdwTKql4o54eZgSt6BrZwhziWZoh7c4UwjLavYEKYqNfLY8b6f15XUzgIsgaauLtOWx7YFidKim00g7DLFttWiJ2KuywxVYPGVTIAEhILkRJo/1iJhMVmlHussBm9tQDh1NqLtOqJ9stcvShVw5CZg0qc01nKqmcZzBtovsnU4k0EiLCK9/slOTPYoOGf+HQ==
1a0d6363-72ab-4860-b396-103f92a935f7	a01a9be9-b42f-4af1-ba5d-4d17b413eb6d	privateKey	MIIEoQIBAAKCAQEAp627aPX51j1uWdtRgNyGgFNg7b4S3PKVLIFsA79f/uwBvJuQdzp03mpJQlxaYpdgOs6n95EPEzAM2WVX+w4T0UspHGoGyir/jAyuCUOX5uA06Lpg4V9CrFT7NuldXXnkH/EBuo9E/FTfKYfCvxVsNoPXPcue8TS+TPu1KgyJ5QVJCIGKYff8fTWe6f71cWAb7aTeTXdH7lrW8V/W1uDg+DsJPBMTksyByLQLlK1hDE3oDLlV3k9AnHesAwOQpq6g1K7ZChaDwo50ypv2aXn/hcMSxGaJVPM24IQUDNbla8w9B8tiobn6i23K75iiwm9qDXWpk3O8t4dlzWzyQU2HAwIDAQABAoIBAC1+8Bi8lPtSU7zBy02BiGUNOoGHTyrwDxWyUBJ8PJm4g4gfVYVkMQ2gHRyKXmPd2thZ9i0wCL0WDoZ1/vc5jJr/H7p78jesjwX68sXEt1SHhROYbmz4IekMbdUqYJDaX9Fi3Ss3cGpexOZJ1cdvEpuADkjQFOIxg2jz6uXr3QZshUiGOeOZm2su6driSAUsh/bUleRpIIRal8hLj5QHc02f0ALUbGcrlZJzlIuyWg95lJsJXzfBpFEvtwYr+B37s/V8e1rwX6ZknEqEUUvkvYZ5TuPLr+NX6ZnWsfXYYU2lOYX9dmw3py8/Oa0opbtMhjcAjqrS7Sj+I9cEzsSgAwECgYEA7G9cej1vGuzR83NR8vgah8rXjPruvRHspRJrEmxUhfp9BIJJw7kAMN9rUMzvlEManw8RQWB6kDMdzIAEX4VLVgY99XwxqvumyvhWeyiIFHhTpaoXcPDRbuHQljPIL3oKZMNGg79Ij1zuL5ZeWpLfn1ZXivCbcliwZvJdcLeVDEMCgYEAtY3WDHWuWupzFoT76zAZtdVIbUQmod/P41bU3cKVO7wxZd1W9N7HjfPG6mofNfDpSRjdze6Z69Qk+h5Dma3X7yQCBemwwGDM9lZdnOGNfvlpeaQEssPmoGEN568LGFSJ+B/LJhg6QnSEfQYY3nyjJdo79ELw0pAzjbXv1itTTkECf2aD4pUeDg6eoGnulpnC+b3nNY7rPpi8LN9mHQbf8cYl1g8ebt1uWabXOLDQKxEeB2zwG4s9Sec8Qq9o0nyYTxH9ot/N+bspYiifhN/hsx8tDRfHqGJQCH8LamW2DhaH0/ncsbZuOgfvQ1de24pqJIvx5ANaUAxEaDg63kkBUJ8CgYAbXJ320MGPOChSK4agAmbNjbBVr2C3Irj9BTgdl9bP4uP6+ynAy9Z9YVEIQSglBALUnmfHQn92GEneXDNJ9PZHN0EKzRZzV+Nr+MYw/5lImqQ3ze1bV8TpRNdIpIvihdMpTvlZ62rUWyUghou29EfOS56fiHss8MikQdg8idkLQQKBgQDAupGkqwtyxgAToA81K0qk0wr5UlE4wlA6Il/SKikcmVrb1tLLvHeS8N4c+vgUrB9YrMUClBfiMKwODSuZcMg2ksjFUe4ef5r14Rjs0j0dSAlUBSOmDR3NaUjJg15f9TjJOh8DZdKOauI5t3VFHIfNN89lazCFUbfmwEkqJSulrQ==
c4c2b375-a37c-4140-bc34-4810ef390395	a01a9be9-b42f-4af1-ba5d-4d17b413eb6d	priority	100
b0554d33-1f29-4006-9c15-bc171a186844	6d87829e-a494-43c7-b5d4-eb1542f9bcf0	kid	5ebe0940-6f96-4eab-96d9-03c4953a3819
e205e6c8-7559-4fab-952f-503b540921e0	6d87829e-a494-43c7-b5d4-eb1542f9bcf0	secret	UhwsFwkluHcfnbQoios55Zk7L61KLX3P1arQM_tAL86pN6JyEHOW9YbY4qSWodq-m3jFBqHbdnGoH_ugAZu0dA
447008c2-bbf3-4d9c-b393-e33086c60bd2	6d87829e-a494-43c7-b5d4-eb1542f9bcf0	priority	100
691d919c-769a-4cdc-b399-6626a745c5c3	6d87829e-a494-43c7-b5d4-eb1542f9bcf0	algorithm	HS256
c9bf63a1-fdf1-4bd2-9fae-f0963bb89e13	9ddb3839-760f-41c5-bf5b-e08caaebbfed	secret	Dy7aRHraiKGvZ_qUw1CuVw
646633d3-9225-4e4c-bf8b-5aa041c59f81	9ddb3839-760f-41c5-bf5b-e08caaebbfed	kid	16c11029-e63b-46f6-a7b4-a41369757bc5
a8b98d95-b71b-47ad-b1c8-92f520d3b8cd	9ddb3839-760f-41c5-bf5b-e08caaebbfed	priority	100
bd0b389a-3afa-4d63-8968-3449e303dddf	329d27e1-0eb6-437c-ac89-56cd5eda6de7	allowed-protocol-mapper-types	saml-user-property-mapper
226008c1-eeba-4fec-a564-46e7f97e3701	329d27e1-0eb6-437c-ac89-56cd5eda6de7	allowed-protocol-mapper-types	oidc-full-name-mapper
2cdcc0bd-5339-4891-a4b9-e9d5cfb714f3	329d27e1-0eb6-437c-ac89-56cd5eda6de7	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
232e0971-c57a-4e45-8885-63e6b995da6c	329d27e1-0eb6-437c-ac89-56cd5eda6de7	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
0495bae7-363b-4d71-a49c-e16ed2fee461	329d27e1-0eb6-437c-ac89-56cd5eda6de7	allowed-protocol-mapper-types	saml-user-attribute-mapper
f1121046-bef0-4bc5-a8b3-64754d99ba1d	329d27e1-0eb6-437c-ac89-56cd5eda6de7	allowed-protocol-mapper-types	oidc-address-mapper
f7c814f6-e2d3-42f0-9314-7ac0141d7f8e	329d27e1-0eb6-437c-ac89-56cd5eda6de7	allowed-protocol-mapper-types	saml-role-list-mapper
e09440a7-618a-4df0-b003-ba730d0a1930	329d27e1-0eb6-437c-ac89-56cd5eda6de7	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
9f55fbe8-1822-46a4-9f78-bad399e7ce3c	38b5f1ff-4d4c-4292-8305-14e792d8fb1a	max-clients	200
5c672a24-e81e-45c7-8b0b-dd819631d7c8	fc58f3f9-68a4-476f-b68d-7f14dc1cff8c	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
55f16c3a-9c25-467c-b8ab-1b7bf5660dc9	fc58f3f9-68a4-476f-b68d-7f14dc1cff8c	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
0961590d-16d3-4253-a2f5-b952cc59ff2d	fc58f3f9-68a4-476f-b68d-7f14dc1cff8c	allowed-protocol-mapper-types	oidc-full-name-mapper
5250b4b9-0ead-4d89-a701-c0c17aff8211	fc58f3f9-68a4-476f-b68d-7f14dc1cff8c	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
9cd6b393-0cab-4937-84fa-28c535c50fdc	fc58f3f9-68a4-476f-b68d-7f14dc1cff8c	allowed-protocol-mapper-types	oidc-address-mapper
764e5b09-6cb3-4bf6-a625-704edfabc91d	fc58f3f9-68a4-476f-b68d-7f14dc1cff8c	allowed-protocol-mapper-types	saml-user-property-mapper
b024a11a-69f9-490e-871e-8967762a44b5	fc58f3f9-68a4-476f-b68d-7f14dc1cff8c	allowed-protocol-mapper-types	saml-role-list-mapper
3d3aa149-6fa0-4973-9fff-b64237cb5feb	fc58f3f9-68a4-476f-b68d-7f14dc1cff8c	allowed-protocol-mapper-types	saml-user-attribute-mapper
4190e872-a1f1-4abc-80ab-e851b5e10fdd	1c5d967d-0a73-4c7e-8d95-d9e6be36ce97	allow-default-scopes	true
2d13328a-9a81-4406-ae61-6033ccc850a8	4bfbaf45-4904-452f-a46e-f172230929c7	allow-default-scopes	true
bb27b25c-568e-4131-b11d-690f4358780c	d44772ad-afd0-414d-b75c-2cb18d7ed732	host-sending-registration-request-must-match	true
1b35f593-bbdd-46df-81a2-dbc23f6c80e0	d44772ad-afd0-414d-b75c-2cb18d7ed732	client-uris-must-match	true
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
2a9dd4cb-7a80-4020-99bb-a2b932714786	ca95708f-1f54-4b0e-a935-854225828fa0
2a9dd4cb-7a80-4020-99bb-a2b932714786	5b108578-e944-411a-b52c-c7282ce8db85
2a9dd4cb-7a80-4020-99bb-a2b932714786	85c991d3-3bee-48ae-a9f8-78f33bcef699
2a9dd4cb-7a80-4020-99bb-a2b932714786	9f4344b4-927d-47fb-a6ff-c697776f7f90
2a9dd4cb-7a80-4020-99bb-a2b932714786	118c9dd9-8a7d-4ba2-83ae-b70d8fdd4c27
2a9dd4cb-7a80-4020-99bb-a2b932714786	1bfb30ea-7560-404f-866b-779683f2873d
2a9dd4cb-7a80-4020-99bb-a2b932714786	dd6d0a2e-a699-48ae-9cb2-b24affd4de72
2a9dd4cb-7a80-4020-99bb-a2b932714786	e0d2e487-76cc-4992-b08f-e0c3339bd25a
2a9dd4cb-7a80-4020-99bb-a2b932714786	154d6010-a516-468a-b359-7a603fd310bc
2a9dd4cb-7a80-4020-99bb-a2b932714786	a60d2363-ac48-4de2-9a12-23b9e6cf9f4b
2a9dd4cb-7a80-4020-99bb-a2b932714786	70b1fd50-415b-4fa1-8984-597f1c41a6fa
2a9dd4cb-7a80-4020-99bb-a2b932714786	a57757cf-d6c8-42ad-8d9b-5bde03971ba0
2a9dd4cb-7a80-4020-99bb-a2b932714786	c6eb99b0-3d6a-4072-af84-2997db903668
2a9dd4cb-7a80-4020-99bb-a2b932714786	c9d8a4cf-be8f-403f-bd65-542259cde55f
2a9dd4cb-7a80-4020-99bb-a2b932714786	111f867b-aa53-4f50-8575-b8e107111a95
2a9dd4cb-7a80-4020-99bb-a2b932714786	4eb31a4f-9cce-4784-9545-3dd1173b4052
2a9dd4cb-7a80-4020-99bb-a2b932714786	ee21d4ca-1d60-464c-b5f2-1af50d82515e
2a9dd4cb-7a80-4020-99bb-a2b932714786	12d5eea9-96df-41da-b722-87bf3bdb737a
118c9dd9-8a7d-4ba2-83ae-b70d8fdd4c27	4eb31a4f-9cce-4784-9545-3dd1173b4052
9f4344b4-927d-47fb-a6ff-c697776f7f90	111f867b-aa53-4f50-8575-b8e107111a95
9f4344b4-927d-47fb-a6ff-c697776f7f90	12d5eea9-96df-41da-b722-87bf3bdb737a
4ffd4aa4-69e1-4166-a5a6-0f6a78602f80	abc05036-4fe9-4506-98e0-0a78a39397e3
8ffddbaf-7d5f-44ac-9ea1-7bb07f2ee247	e51f7959-6364-4781-8de5-8fb4dc62b4ae
2a9dd4cb-7a80-4020-99bb-a2b932714786	1b1d71dc-2aa4-4e36-8a8c-75302108d2e0
2a9dd4cb-7a80-4020-99bb-a2b932714786	1921a04b-acb2-4366-9a2a-41b300e1e3d9
2a9dd4cb-7a80-4020-99bb-a2b932714786	75f7aa34-a62b-43a3-ab97-3fd5c9355478
2a9dd4cb-7a80-4020-99bb-a2b932714786	648f87c7-707c-4ac1-818f-b8f52450f094
2a9dd4cb-7a80-4020-99bb-a2b932714786	e171deef-45c7-4560-aa55-554499782e3d
2a9dd4cb-7a80-4020-99bb-a2b932714786	dee883c0-60e8-46a0-a90f-db0a6fc8003f
2a9dd4cb-7a80-4020-99bb-a2b932714786	f9df3e92-8fe0-4fc1-8676-f3731508d995
2a9dd4cb-7a80-4020-99bb-a2b932714786	d96cb959-4c8d-4708-9a43-9de371e501bc
2a9dd4cb-7a80-4020-99bb-a2b932714786	e50669af-7e6d-479f-9437-e149850689ea
2a9dd4cb-7a80-4020-99bb-a2b932714786	2fdc27be-916d-46e0-b6ff-93181ff9532c
2a9dd4cb-7a80-4020-99bb-a2b932714786	26a06977-4573-4098-afcb-583ae3c49db3
2a9dd4cb-7a80-4020-99bb-a2b932714786	c0b5f389-feb5-4101-bbf1-b99067f3b0d3
2a9dd4cb-7a80-4020-99bb-a2b932714786	3230b373-51b4-4310-bb9e-87338493a356
2a9dd4cb-7a80-4020-99bb-a2b932714786	2f316470-f9a5-4de6-8583-d7f27066acee
2a9dd4cb-7a80-4020-99bb-a2b932714786	459c67b8-6199-406c-b4e1-3d41ab049250
2a9dd4cb-7a80-4020-99bb-a2b932714786	1c7a08d8-60a7-4092-bd54-5e3717f3bee0
2a9dd4cb-7a80-4020-99bb-a2b932714786	1166037a-548d-4894-b70b-c588d2e71f66
2a9dd4cb-7a80-4020-99bb-a2b932714786	4f77ef2b-7a2a-429f-8b83-88e7d65ecb5b
e171deef-45c7-4560-aa55-554499782e3d	1c7a08d8-60a7-4092-bd54-5e3717f3bee0
648f87c7-707c-4ac1-818f-b8f52450f094	459c67b8-6199-406c-b4e1-3d41ab049250
648f87c7-707c-4ac1-818f-b8f52450f094	4f77ef2b-7a2a-429f-8b83-88e7d65ecb5b
2e126f9c-8cab-4fea-9c17-1558c5aeddac	ed5099dc-14a3-45c6-b382-c1aad48b210f
2e126f9c-8cab-4fea-9c17-1558c5aeddac	4fe0940a-b8f4-4f9f-b0ec-739e0c623943
2e126f9c-8cab-4fea-9c17-1558c5aeddac	4b7e0a21-596f-4429-a532-90d07f4fa522
2e126f9c-8cab-4fea-9c17-1558c5aeddac	8eb7705b-80e6-42c3-ac14-f32937742d24
2e126f9c-8cab-4fea-9c17-1558c5aeddac	a03646d2-0482-41b9-8840-3c3e61b1090f
2e126f9c-8cab-4fea-9c17-1558c5aeddac	dd5b92ad-e646-4886-892f-8d07e8c6ce37
2e126f9c-8cab-4fea-9c17-1558c5aeddac	eecf3277-49da-44fc-b995-3ddbf2f388c4
2e126f9c-8cab-4fea-9c17-1558c5aeddac	ed46fb61-5d70-4d3f-b3c3-19d22c7ae39b
2e126f9c-8cab-4fea-9c17-1558c5aeddac	2d9734af-fb44-4347-bac1-f3ea89b5a20f
2e126f9c-8cab-4fea-9c17-1558c5aeddac	fa67c3a4-b229-43cf-9c5e-312b02b70e4b
2e126f9c-8cab-4fea-9c17-1558c5aeddac	5442458d-33b9-46a3-991b-81fe39437485
2e126f9c-8cab-4fea-9c17-1558c5aeddac	4ac4a0c1-6354-435c-a7f4-3f25fc55af28
2e126f9c-8cab-4fea-9c17-1558c5aeddac	28c286d5-cbfd-4d9a-8dc3-05e0d68084d9
2e126f9c-8cab-4fea-9c17-1558c5aeddac	94aa6a01-ae17-4fd6-98fa-c2a565341df0
2e126f9c-8cab-4fea-9c17-1558c5aeddac	1882df10-9f96-4dda-a339-a6b2726812d2
2e126f9c-8cab-4fea-9c17-1558c5aeddac	1d0dbc32-b3b1-451b-a386-b78de561401e
2e126f9c-8cab-4fea-9c17-1558c5aeddac	3f206777-334b-46ad-bd76-9ee1de1a39bd
8eb7705b-80e6-42c3-ac14-f32937742d24	1882df10-9f96-4dda-a339-a6b2726812d2
4b7e0a21-596f-4429-a532-90d07f4fa522	3f206777-334b-46ad-bd76-9ee1de1a39bd
4b7e0a21-596f-4429-a532-90d07f4fa522	94aa6a01-ae17-4fd6-98fa-c2a565341df0
f7dfd151-e810-4242-add9-4cc040ebf3c5	04073114-12b8-4965-b1ab-fd5badf2dfc6
ab129089-5c9f-4f21-ae3b-3c0ad12552a7	7f3d74ea-af3b-4130-8f4f-c40d48bde416
2a9dd4cb-7a80-4020-99bb-a2b932714786	fb7631d0-77cf-4f3a-89f7-5b343b928a0e
2e126f9c-8cab-4fea-9c17-1558c5aeddac	2a18eb09-46e9-4e91-a985-3addbd56433c
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
1b91937d-bb08-4d3b-9e1b-2d64000c15f0	\N	password	4427c855-7118-4863-bbfb-90dbd82f7bda	1607797170510	\N	{"value":"uMDa2tnqdg0dZ2FI9s7Og25geuKTorRPGqDMI4vgI4edYng9iQAD4Op9oIarfyCGd7ItNXp9Q1fZcRpW4EHx2w==","salt":"ZNF83lFCHFi4Babzif/Y3w=="}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2020-12-12 18:19:21.650045	1	EXECUTED	7:4e70412f24a3f382c82183742ec79317	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	7797160899
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2020-12-12 18:19:21.674384	2	MARK_RAN	7:cb16724583e9675711801c6875114f28	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	7797160899
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2020-12-12 18:19:21.756199	3	EXECUTED	7:0310eb8ba07cec616460794d42ade0fa	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	3.5.4	\N	\N	7797160899
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2020-12-12 18:19:21.76761	4	EXECUTED	7:5d25857e708c3233ef4439df1f93f012	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	7797160899
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2020-12-12 18:19:21.964836	5	EXECUTED	7:c7a54a1041d58eb3817a4a883b4d4e84	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	7797160899
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2020-12-12 18:19:21.973344	6	MARK_RAN	7:2e01012df20974c1c2a605ef8afe25b7	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	7797160899
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2020-12-12 18:19:22.183157	7	EXECUTED	7:0f08df48468428e0f30ee59a8ec01a41	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	7797160899
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2020-12-12 18:19:22.191847	8	MARK_RAN	7:a77ea2ad226b345e7d689d366f185c8c	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	7797160899
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2020-12-12 18:19:22.204663	9	EXECUTED	7:a3377a2059aefbf3b90ebb4c4cc8e2ab	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	3.5.4	\N	\N	7797160899
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2020-12-12 18:19:22.428996	10	EXECUTED	7:04c1dbedc2aa3e9756d1a1668e003451	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	3.5.4	\N	\N	7797160899
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2020-12-12 18:19:22.552214	11	EXECUTED	7:36ef39ed560ad07062d956db861042ba	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	7797160899
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2020-12-12 18:19:22.558412	12	MARK_RAN	7:d909180b2530479a716d3f9c9eaea3d7	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	7797160899
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2020-12-12 18:19:22.589256	13	EXECUTED	7:cf12b04b79bea5152f165eb41f3955f6	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	7797160899
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2020-12-12 18:19:22.649125	14	EXECUTED	7:7e32c8f05c755e8675764e7d5f514509	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	3.5.4	\N	\N	7797160899
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2020-12-12 18:19:22.672748	15	MARK_RAN	7:980ba23cc0ec39cab731ce903dd01291	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	7797160899
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2020-12-12 18:19:22.68875	16	MARK_RAN	7:2fa220758991285312eb84f3b4ff5336	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	3.5.4	\N	\N	7797160899
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2020-12-12 18:19:22.698481	17	EXECUTED	7:d41d8cd98f00b204e9800998ecf8427e	empty		\N	3.5.4	\N	\N	7797160899
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2020-12-12 18:19:22.820464	18	EXECUTED	7:91ace540896df890cc00a0490ee52bbc	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	3.5.4	\N	\N	7797160899
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2020-12-12 18:19:22.909596	19	EXECUTED	7:c31d1646dfa2618a9335c00e07f89f24	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	7797160899
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2020-12-12 18:19:22.921953	20	EXECUTED	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	7797160899
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2020-12-12 18:19:24.187314	45	EXECUTED	7:6a48ce645a3525488a90fbf76adf3bb3	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	7797160899
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2020-12-12 18:19:22.927686	21	MARK_RAN	7:f987971fe6b37d963bc95fee2b27f8df	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	7797160899
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2020-12-12 18:19:22.935145	22	MARK_RAN	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	7797160899
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2020-12-12 18:19:22.978818	23	EXECUTED	7:ed2dc7f799d19ac452cbcda56c929e47	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	3.5.4	\N	\N	7797160899
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2020-12-12 18:19:22.989856	24	EXECUTED	7:80b5db88a5dda36ece5f235be8757615	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	7797160899
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2020-12-12 18:19:22.994688	25	MARK_RAN	7:1437310ed1305a9b93f8848f301726ce	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	7797160899
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2020-12-12 18:19:23.104369	26	EXECUTED	7:b82ffb34850fa0836be16deefc6a87c4	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	3.5.4	\N	\N	7797160899
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2020-12-12 18:19:23.292917	27	EXECUTED	7:9cc98082921330d8d9266decdd4bd658	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	3.5.4	\N	\N	7797160899
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2020-12-12 18:19:23.300395	28	EXECUTED	7:03d64aeed9cb52b969bd30a7ac0db57e	update tableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	7797160899
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2020-12-12 18:19:23.51445	29	EXECUTED	7:f1f9fd8710399d725b780f463c6b21cd	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	3.5.4	\N	\N	7797160899
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2020-12-12 18:19:23.551338	30	EXECUTED	7:53188c3eb1107546e6f765835705b6c1	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	3.5.4	\N	\N	7797160899
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2020-12-12 18:19:23.592749	31	EXECUTED	7:d6e6f3bc57a0c5586737d1351725d4d4	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	3.5.4	\N	\N	7797160899
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2020-12-12 18:19:23.604944	32	EXECUTED	7:454d604fbd755d9df3fd9c6329043aa5	customChange		\N	3.5.4	\N	\N	7797160899
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2020-12-12 18:19:23.61706	33	EXECUTED	7:57e98a3077e29caf562f7dbf80c72600	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	7797160899
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2020-12-12 18:19:23.623634	34	MARK_RAN	7:e4c7e8f2256210aee71ddc42f538b57a	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	7797160899
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2020-12-12 18:19:23.681018	35	EXECUTED	7:09a43c97e49bc626460480aa1379b522	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	7797160899
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2020-12-12 18:19:23.695937	36	EXECUTED	7:26bfc7c74fefa9126f2ce702fb775553	addColumn tableName=REALM		\N	3.5.4	\N	\N	7797160899
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2020-12-12 18:19:23.715927	37	EXECUTED	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7797160899
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2020-12-12 18:19:23.726513	38	EXECUTED	7:37fc1781855ac5388c494f1442b3f717	addColumn tableName=FED_USER_CONSENT		\N	3.5.4	\N	\N	7797160899
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2020-12-12 18:19:23.737273	39	EXECUTED	7:13a27db0dae6049541136adad7261d27	addColumn tableName=IDENTITY_PROVIDER		\N	3.5.4	\N	\N	7797160899
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2020-12-12 18:19:23.74258	40	MARK_RAN	7:550300617e3b59e8af3a6294df8248a3	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	7797160899
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2020-12-12 18:19:23.755287	41	MARK_RAN	7:e3a9482b8931481dc2772a5c07c44f17	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	7797160899
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2020-12-12 18:19:23.765793	42	EXECUTED	7:72b07d85a2677cb257edb02b408f332d	customChange		\N	3.5.4	\N	\N	7797160899
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2020-12-12 18:19:24.164763	43	EXECUTED	7:a72a7858967bd414835d19e04d880312	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	3.5.4	\N	\N	7797160899
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2020-12-12 18:19:24.175732	44	EXECUTED	7:94edff7cf9ce179e7e85f0cd78a3cf2c	addColumn tableName=USER_ENTITY		\N	3.5.4	\N	\N	7797160899
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2020-12-12 18:19:24.195916	46	EXECUTED	7:e64b5dcea7db06077c6e57d3b9e5ca14	customChange		\N	3.5.4	\N	\N	7797160899
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2020-12-12 18:19:24.201015	47	MARK_RAN	7:fd8cf02498f8b1e72496a20afc75178c	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	7797160899
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2020-12-12 18:19:24.272923	48	EXECUTED	7:542794f25aa2b1fbabb7e577d6646319	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	3.5.4	\N	\N	7797160899
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2020-12-12 18:19:24.284176	49	EXECUTED	7:edad604c882df12f74941dac3cc6d650	addColumn tableName=REALM		\N	3.5.4	\N	\N	7797160899
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2020-12-12 18:19:24.414694	50	EXECUTED	7:0f88b78b7b46480eb92690cbf5e44900	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	3.5.4	\N	\N	7797160899
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2020-12-12 18:19:24.507658	51	EXECUTED	7:d560e43982611d936457c327f872dd59	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	3.5.4	\N	\N	7797160899
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2020-12-12 18:19:24.516039	52	EXECUTED	7:c155566c42b4d14ef07059ec3b3bbd8e	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	7797160899
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2020-12-12 18:19:24.521312	53	EXECUTED	7:b40376581f12d70f3c89ba8ddf5b7dea	update tableName=REALM		\N	3.5.4	\N	\N	7797160899
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2020-12-12 18:19:24.527565	54	EXECUTED	7:a1132cc395f7b95b3646146c2e38f168	update tableName=CLIENT		\N	3.5.4	\N	\N	7797160899
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2020-12-12 18:19:24.544019	55	EXECUTED	7:d8dc5d89c789105cfa7ca0e82cba60af	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	3.5.4	\N	\N	7797160899
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2020-12-12 18:19:24.554071	56	EXECUTED	7:7822e0165097182e8f653c35517656a3	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	3.5.4	\N	\N	7797160899
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2020-12-12 18:19:24.606236	57	EXECUTED	7:c6538c29b9c9a08f9e9ea2de5c2b6375	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	3.5.4	\N	\N	7797160899
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2020-12-12 18:19:24.784283	58	EXECUTED	7:6d4893e36de22369cf73bcb051ded875	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	3.5.4	\N	\N	7797160899
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2020-12-12 18:19:24.847104	59	EXECUTED	7:57960fc0b0f0dd0563ea6f8b2e4a1707	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	3.5.4	\N	\N	7797160899
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2020-12-12 18:19:24.858948	60	EXECUTED	7:2b4b8bff39944c7097977cc18dbceb3b	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	7797160899
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2020-12-12 18:19:24.871933	61	EXECUTED	7:2aa42a964c59cd5b8ca9822340ba33a8	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	3.5.4	\N	\N	7797160899
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2020-12-12 18:19:24.890378	62	EXECUTED	7:9ac9e58545479929ba23f4a3087a0346	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	3.5.4	\N	\N	7797160899
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2020-12-12 18:19:24.899373	63	EXECUTED	7:14d407c35bc4fe1976867756bcea0c36	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	7797160899
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2020-12-12 18:19:24.906413	64	EXECUTED	7:241a8030c748c8548e346adee548fa93	update tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	7797160899
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2020-12-12 18:19:24.913176	65	EXECUTED	7:7d3182f65a34fcc61e8d23def037dc3f	update tableName=RESOURCE_SERVER_RESOURCE		\N	3.5.4	\N	\N	7797160899
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2020-12-12 18:19:24.954093	66	EXECUTED	7:b30039e00a0b9715d430d1b0636728fa	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	3.5.4	\N	\N	7797160899
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2020-12-12 18:19:24.96982	67	EXECUTED	7:3797315ca61d531780f8e6f82f258159	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	3.5.4	\N	\N	7797160899
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2020-12-12 18:19:24.979983	68	EXECUTED	7:c7aa4c8d9573500c2d347c1941ff0301	addColumn tableName=REALM		\N	3.5.4	\N	\N	7797160899
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2020-12-12 18:19:24.999353	69	EXECUTED	7:b207faee394fc074a442ecd42185a5dd	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	3.5.4	\N	\N	7797160899
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2020-12-12 18:19:24.516039	52	EXECUTED	7:c155566c42b4d14ef07059ec3b3bbd8e	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	7797160899
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2020-12-12 18:19:25.01341	70	EXECUTED	7:ab9a9762faaba4ddfa35514b212c4922	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	3.5.4	\N	\N	7797160899
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2020-12-12 18:19:25.023187	71	EXECUTED	7:b9710f74515a6ccb51b72dc0d19df8c4	addColumn tableName=RESOURCE_SERVER		\N	3.5.4	\N	\N	7797160899
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2020-12-12 18:19:25.03521	72	EXECUTED	7:ec9707ae4d4f0b7452fee20128083879	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	7797160899
8.0.0-updating-credential-data-not-oracle	keycloak	META-INF/jpa-changelog-8.0.0.xml	2020-12-12 18:19:25.04405	73	EXECUTED	7:03b3f4b264c3c68ba082250a80b74216	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	7797160899
8.0.0-updating-credential-data-oracle	keycloak	META-INF/jpa-changelog-8.0.0.xml	2020-12-12 18:19:25.049152	74	MARK_RAN	7:64c5728f5ca1f5aa4392217701c4fe23	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	7797160899
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2020-12-12 18:19:25.074303	75	EXECUTED	7:b48da8c11a3d83ddd6b7d0c8c2219345	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	3.5.4	\N	\N	7797160899
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2020-12-12 18:19:25.093285	76	EXECUTED	7:a73379915c23bfad3e8f5c6d5c0aa4bd	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	3.5.4	\N	\N	7797160899
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2020-12-12 18:19:25.103521	77	EXECUTED	7:39e0073779aba192646291aa2332493d	addColumn tableName=CLIENT		\N	3.5.4	\N	\N	7797160899
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2020-12-12 18:19:25.108884	78	MARK_RAN	7:81f87368f00450799b4bf42ea0b3ec34	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	3.5.4	\N	\N	7797160899
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2020-12-12 18:19:25.142054	79	EXECUTED	7:20b37422abb9fb6571c618148f013a15	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	3.5.4	\N	\N	7797160899
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2020-12-12 18:19:25.147354	80	MARK_RAN	7:1970bb6cfb5ee800736b95ad3fb3c78a	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	3.5.4	\N	\N	7797160899
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2020-12-12 18:19:25.164616	81	EXECUTED	7:45d9b25fc3b455d522d8dcc10a0f4c80	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	3.5.4	\N	\N	7797160899
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2020-12-12 18:19:25.169248	82	MARK_RAN	7:890ae73712bc187a66c2813a724d037f	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7797160899
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2020-12-12 18:19:25.179616	83	EXECUTED	7:0a211980d27fafe3ff50d19a3a29b538	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7797160899
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2020-12-12 18:19:25.184144	84	MARK_RAN	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7797160899
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2020-12-12 18:19:25.199069	85	EXECUTED	7:01c49302201bdf815b0a18d1f98a55dc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	7797160899
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2020-12-12 18:19:25.209115	86	EXECUTED	7:3dace6b144c11f53f1ad2c0361279b86	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	3.5.4	\N	\N	7797160899
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2020-12-12 18:19:21.650045	1	EXECUTED	7:4e70412f24a3f382c82183742ec79317	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	7797160899
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2020-12-12 18:19:21.674384	2	MARK_RAN	7:cb16724583e9675711801c6875114f28	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	7797160899
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2020-12-12 18:19:21.756199	3	EXECUTED	7:0310eb8ba07cec616460794d42ade0fa	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	3.5.4	\N	\N	7797160899
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2020-12-12 18:19:21.76761	4	EXECUTED	7:5d25857e708c3233ef4439df1f93f012	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	7797160899
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2020-12-12 18:19:21.964836	5	EXECUTED	7:c7a54a1041d58eb3817a4a883b4d4e84	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	7797160899
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2020-12-12 18:19:21.973344	6	MARK_RAN	7:2e01012df20974c1c2a605ef8afe25b7	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	7797160899
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2020-12-12 18:19:22.183157	7	EXECUTED	7:0f08df48468428e0f30ee59a8ec01a41	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	7797160899
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2020-12-12 18:19:22.191847	8	MARK_RAN	7:a77ea2ad226b345e7d689d366f185c8c	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	7797160899
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2020-12-12 18:19:22.204663	9	EXECUTED	7:a3377a2059aefbf3b90ebb4c4cc8e2ab	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	3.5.4	\N	\N	7797160899
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2020-12-12 18:19:22.428996	10	EXECUTED	7:04c1dbedc2aa3e9756d1a1668e003451	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	3.5.4	\N	\N	7797160899
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2020-12-12 18:19:22.552214	11	EXECUTED	7:36ef39ed560ad07062d956db861042ba	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	7797160899
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2020-12-12 18:19:22.558412	12	MARK_RAN	7:d909180b2530479a716d3f9c9eaea3d7	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	7797160899
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2020-12-12 18:19:22.589256	13	EXECUTED	7:cf12b04b79bea5152f165eb41f3955f6	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	7797160899
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2020-12-12 18:19:22.649125	14	EXECUTED	7:7e32c8f05c755e8675764e7d5f514509	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	3.5.4	\N	\N	7797160899
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2020-12-12 18:19:22.672748	15	MARK_RAN	7:980ba23cc0ec39cab731ce903dd01291	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	7797160899
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2020-12-12 18:19:22.68875	16	MARK_RAN	7:2fa220758991285312eb84f3b4ff5336	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	3.5.4	\N	\N	7797160899
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2020-12-12 18:19:22.698481	17	EXECUTED	7:d41d8cd98f00b204e9800998ecf8427e	empty		\N	3.5.4	\N	\N	7797160899
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2020-12-12 18:19:22.820464	18	EXECUTED	7:91ace540896df890cc00a0490ee52bbc	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	3.5.4	\N	\N	7797160899
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2020-12-12 18:19:22.909596	19	EXECUTED	7:c31d1646dfa2618a9335c00e07f89f24	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	7797160899
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2020-12-12 18:19:22.921953	20	EXECUTED	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	7797160899
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2020-12-12 18:19:24.187314	45	EXECUTED	7:6a48ce645a3525488a90fbf76adf3bb3	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	7797160899
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2020-12-12 18:19:22.927686	21	MARK_RAN	7:f987971fe6b37d963bc95fee2b27f8df	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	7797160899
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2020-12-12 18:19:22.935145	22	MARK_RAN	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	7797160899
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2020-12-12 18:19:22.978818	23	EXECUTED	7:ed2dc7f799d19ac452cbcda56c929e47	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	3.5.4	\N	\N	7797160899
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2020-12-12 18:19:22.989856	24	EXECUTED	7:80b5db88a5dda36ece5f235be8757615	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	7797160899
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2020-12-12 18:19:22.994688	25	MARK_RAN	7:1437310ed1305a9b93f8848f301726ce	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	7797160899
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2020-12-12 18:19:23.104369	26	EXECUTED	7:b82ffb34850fa0836be16deefc6a87c4	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	3.5.4	\N	\N	7797160899
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2020-12-12 18:19:24.521312	53	EXECUTED	7:b40376581f12d70f3c89ba8ddf5b7dea	update tableName=REALM		\N	3.5.4	\N	\N	7797160899
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2020-12-12 18:19:23.292917	27	EXECUTED	7:9cc98082921330d8d9266decdd4bd658	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	3.5.4	\N	\N	7797160899
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2020-12-12 18:19:23.300395	28	EXECUTED	7:03d64aeed9cb52b969bd30a7ac0db57e	update tableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	7797160899
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2020-12-12 18:19:23.51445	29	EXECUTED	7:f1f9fd8710399d725b780f463c6b21cd	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	3.5.4	\N	\N	7797160899
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2020-12-12 18:19:23.551338	30	EXECUTED	7:53188c3eb1107546e6f765835705b6c1	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	3.5.4	\N	\N	7797160899
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2020-12-12 18:19:23.592749	31	EXECUTED	7:d6e6f3bc57a0c5586737d1351725d4d4	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	3.5.4	\N	\N	7797160899
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2020-12-12 18:19:23.604944	32	EXECUTED	7:454d604fbd755d9df3fd9c6329043aa5	customChange		\N	3.5.4	\N	\N	7797160899
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2020-12-12 18:19:23.61706	33	EXECUTED	7:57e98a3077e29caf562f7dbf80c72600	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	7797160899
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2020-12-12 18:19:23.623634	34	MARK_RAN	7:e4c7e8f2256210aee71ddc42f538b57a	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	7797160899
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2020-12-12 18:19:23.681018	35	EXECUTED	7:09a43c97e49bc626460480aa1379b522	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	7797160899
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2020-12-12 18:19:23.695937	36	EXECUTED	7:26bfc7c74fefa9126f2ce702fb775553	addColumn tableName=REALM		\N	3.5.4	\N	\N	7797160899
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2020-12-12 18:19:23.715927	37	EXECUTED	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7797160899
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2020-12-12 18:19:23.726513	38	EXECUTED	7:37fc1781855ac5388c494f1442b3f717	addColumn tableName=FED_USER_CONSENT		\N	3.5.4	\N	\N	7797160899
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2020-12-12 18:19:23.737273	39	EXECUTED	7:13a27db0dae6049541136adad7261d27	addColumn tableName=IDENTITY_PROVIDER		\N	3.5.4	\N	\N	7797160899
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2020-12-12 18:19:23.74258	40	MARK_RAN	7:550300617e3b59e8af3a6294df8248a3	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	7797160899
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2020-12-12 18:19:23.755287	41	MARK_RAN	7:e3a9482b8931481dc2772a5c07c44f17	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	7797160899
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2020-12-12 18:19:23.765793	42	EXECUTED	7:72b07d85a2677cb257edb02b408f332d	customChange		\N	3.5.4	\N	\N	7797160899
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2020-12-12 18:19:24.164763	43	EXECUTED	7:a72a7858967bd414835d19e04d880312	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	3.5.4	\N	\N	7797160899
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2020-12-12 18:19:24.175732	44	EXECUTED	7:94edff7cf9ce179e7e85f0cd78a3cf2c	addColumn tableName=USER_ENTITY		\N	3.5.4	\N	\N	7797160899
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2020-12-12 18:19:24.195916	46	EXECUTED	7:e64b5dcea7db06077c6e57d3b9e5ca14	customChange		\N	3.5.4	\N	\N	7797160899
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2020-12-12 18:19:24.201015	47	MARK_RAN	7:fd8cf02498f8b1e72496a20afc75178c	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	7797160899
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2020-12-12 18:19:24.272923	48	EXECUTED	7:542794f25aa2b1fbabb7e577d6646319	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	3.5.4	\N	\N	7797160899
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2020-12-12 18:19:24.284176	49	EXECUTED	7:edad604c882df12f74941dac3cc6d650	addColumn tableName=REALM		\N	3.5.4	\N	\N	7797160899
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2020-12-12 18:19:24.414694	50	EXECUTED	7:0f88b78b7b46480eb92690cbf5e44900	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	3.5.4	\N	\N	7797160899
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2020-12-12 18:19:24.507658	51	EXECUTED	7:d560e43982611d936457c327f872dd59	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	3.5.4	\N	\N	7797160899
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2020-12-12 18:19:24.527565	54	EXECUTED	7:a1132cc395f7b95b3646146c2e38f168	update tableName=CLIENT		\N	3.5.4	\N	\N	7797160899
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2020-12-12 18:19:24.544019	55	EXECUTED	7:d8dc5d89c789105cfa7ca0e82cba60af	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	3.5.4	\N	\N	7797160899
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2020-12-12 18:19:24.554071	56	EXECUTED	7:7822e0165097182e8f653c35517656a3	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	3.5.4	\N	\N	7797160899
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2020-12-12 18:19:24.606236	57	EXECUTED	7:c6538c29b9c9a08f9e9ea2de5c2b6375	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	3.5.4	\N	\N	7797160899
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2020-12-12 18:19:24.784283	58	EXECUTED	7:6d4893e36de22369cf73bcb051ded875	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	3.5.4	\N	\N	7797160899
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2020-12-12 18:19:24.847104	59	EXECUTED	7:57960fc0b0f0dd0563ea6f8b2e4a1707	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	3.5.4	\N	\N	7797160899
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2020-12-12 18:19:24.858948	60	EXECUTED	7:2b4b8bff39944c7097977cc18dbceb3b	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	7797160899
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2020-12-12 18:19:24.871933	61	EXECUTED	7:2aa42a964c59cd5b8ca9822340ba33a8	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	3.5.4	\N	\N	7797160899
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2020-12-12 18:19:24.890378	62	EXECUTED	7:9ac9e58545479929ba23f4a3087a0346	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	3.5.4	\N	\N	7797160899
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2020-12-12 18:19:24.899373	63	EXECUTED	7:14d407c35bc4fe1976867756bcea0c36	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	7797160899
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2020-12-12 18:19:24.906413	64	EXECUTED	7:241a8030c748c8548e346adee548fa93	update tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	7797160899
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2020-12-12 18:19:24.913176	65	EXECUTED	7:7d3182f65a34fcc61e8d23def037dc3f	update tableName=RESOURCE_SERVER_RESOURCE		\N	3.5.4	\N	\N	7797160899
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2020-12-12 18:19:24.954093	66	EXECUTED	7:b30039e00a0b9715d430d1b0636728fa	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	3.5.4	\N	\N	7797160899
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2020-12-12 18:19:24.96982	67	EXECUTED	7:3797315ca61d531780f8e6f82f258159	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	3.5.4	\N	\N	7797160899
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2020-12-12 18:19:24.979983	68	EXECUTED	7:c7aa4c8d9573500c2d347c1941ff0301	addColumn tableName=REALM		\N	3.5.4	\N	\N	7797160899
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2020-12-12 18:19:24.999353	69	EXECUTED	7:b207faee394fc074a442ecd42185a5dd	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	3.5.4	\N	\N	7797160899
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2020-12-12 18:19:25.01341	70	EXECUTED	7:ab9a9762faaba4ddfa35514b212c4922	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	3.5.4	\N	\N	7797160899
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2020-12-12 18:19:25.023187	71	EXECUTED	7:b9710f74515a6ccb51b72dc0d19df8c4	addColumn tableName=RESOURCE_SERVER		\N	3.5.4	\N	\N	7797160899
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2020-12-12 18:19:25.03521	72	EXECUTED	7:ec9707ae4d4f0b7452fee20128083879	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	7797160899
8.0.0-updating-credential-data-not-oracle	keycloak	META-INF/jpa-changelog-8.0.0.xml	2020-12-12 18:19:25.04405	73	EXECUTED	7:03b3f4b264c3c68ba082250a80b74216	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	7797160899
8.0.0-updating-credential-data-oracle	keycloak	META-INF/jpa-changelog-8.0.0.xml	2020-12-12 18:19:25.049152	74	MARK_RAN	7:64c5728f5ca1f5aa4392217701c4fe23	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	7797160899
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2020-12-12 18:19:25.074303	75	EXECUTED	7:b48da8c11a3d83ddd6b7d0c8c2219345	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	3.5.4	\N	\N	7797160899
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2020-12-12 18:19:25.093285	76	EXECUTED	7:a73379915c23bfad3e8f5c6d5c0aa4bd	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	3.5.4	\N	\N	7797160899
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2020-12-12 18:19:25.103521	77	EXECUTED	7:39e0073779aba192646291aa2332493d	addColumn tableName=CLIENT		\N	3.5.4	\N	\N	7797160899
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2020-12-12 18:19:25.108884	78	MARK_RAN	7:81f87368f00450799b4bf42ea0b3ec34	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	3.5.4	\N	\N	7797160899
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2020-12-12 18:19:25.142054	79	EXECUTED	7:20b37422abb9fb6571c618148f013a15	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	3.5.4	\N	\N	7797160899
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2020-12-12 18:19:25.147354	80	MARK_RAN	7:1970bb6cfb5ee800736b95ad3fb3c78a	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	3.5.4	\N	\N	7797160899
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2020-12-12 18:19:25.164616	81	EXECUTED	7:45d9b25fc3b455d522d8dcc10a0f4c80	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	3.5.4	\N	\N	7797160899
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2020-12-12 18:19:25.169248	82	MARK_RAN	7:890ae73712bc187a66c2813a724d037f	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7797160899
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2020-12-12 18:19:25.179616	83	EXECUTED	7:0a211980d27fafe3ff50d19a3a29b538	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7797160899
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2020-12-12 18:19:25.184144	84	MARK_RAN	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7797160899
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2020-12-12 18:19:25.199069	85	EXECUTED	7:01c49302201bdf815b0a18d1f98a55dc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	7797160899
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2020-12-12 18:19:25.209115	86	EXECUTED	7:3dace6b144c11f53f1ad2c0361279b86	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	3.5.4	\N	\N	7797160899
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
master	56897ba4-c541-4d03-9f7a-6e53a79b3c43	f
master	226d8b11-c999-4e6a-b155-89e2f81bde90	t
master	e2efea9e-dbbc-46e1-a23c-56b95356e57c	t
master	62d03df6-99d2-4e76-9b29-d21e82f1b836	t
master	fc87dea4-2c84-415a-9930-edae22ba052a	f
master	b7cecef1-bf09-4162-9c8f-f022e9deb64a	f
master	298c28aa-cb99-4123-a123-55f00e25321b	t
master	1e474be2-6338-4830-9356-60ab538f1720	t
master	1f6b34c5-78c6-4ffb-bd3d-a318cf70b22e	f
document_search_engine	46725dd6-61d9-465a-b50f-ca2caeb1b18c	f
document_search_engine	aaba4cc5-5700-4860-9ae3-f6bbeb6bc757	t
document_search_engine	496ce993-b454-4d34-b56b-6f77619efc3e	t
document_search_engine	01e68a46-fa2b-4042-a36d-11f5c98591d9	t
document_search_engine	da50ba5e-ea87-45e6-aee8-d21b01591cf6	f
document_search_engine	c04648e8-2272-41bd-ac73-2dd6478fde45	f
document_search_engine	f2d06444-3aad-408e-9ccf-b92e6548dc63	t
document_search_engine	15108269-16c6-482c-b52f-8162264fa070	t
document_search_engine	f2b62026-11d4-450b-a9a3-5a427d8a54c6	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
2a9dd4cb-7a80-4020-99bb-a2b932714786	master	f	${role_admin}	admin	master	\N	master
ca95708f-1f54-4b0e-a935-854225828fa0	master	f	${role_create-realm}	create-realm	master	\N	master
5b108578-e944-411a-b52c-c7282ce8db85	9cb9bb23-ee52-4842-9be2-9fb67204986d	t	${role_create-client}	create-client	master	9cb9bb23-ee52-4842-9be2-9fb67204986d	\N
85c991d3-3bee-48ae-a9f8-78f33bcef699	9cb9bb23-ee52-4842-9be2-9fb67204986d	t	${role_view-realm}	view-realm	master	9cb9bb23-ee52-4842-9be2-9fb67204986d	\N
9f4344b4-927d-47fb-a6ff-c697776f7f90	9cb9bb23-ee52-4842-9be2-9fb67204986d	t	${role_view-users}	view-users	master	9cb9bb23-ee52-4842-9be2-9fb67204986d	\N
118c9dd9-8a7d-4ba2-83ae-b70d8fdd4c27	9cb9bb23-ee52-4842-9be2-9fb67204986d	t	${role_view-clients}	view-clients	master	9cb9bb23-ee52-4842-9be2-9fb67204986d	\N
1bfb30ea-7560-404f-866b-779683f2873d	9cb9bb23-ee52-4842-9be2-9fb67204986d	t	${role_view-events}	view-events	master	9cb9bb23-ee52-4842-9be2-9fb67204986d	\N
dd6d0a2e-a699-48ae-9cb2-b24affd4de72	9cb9bb23-ee52-4842-9be2-9fb67204986d	t	${role_view-identity-providers}	view-identity-providers	master	9cb9bb23-ee52-4842-9be2-9fb67204986d	\N
e0d2e487-76cc-4992-b08f-e0c3339bd25a	9cb9bb23-ee52-4842-9be2-9fb67204986d	t	${role_view-authorization}	view-authorization	master	9cb9bb23-ee52-4842-9be2-9fb67204986d	\N
154d6010-a516-468a-b359-7a603fd310bc	9cb9bb23-ee52-4842-9be2-9fb67204986d	t	${role_manage-realm}	manage-realm	master	9cb9bb23-ee52-4842-9be2-9fb67204986d	\N
a60d2363-ac48-4de2-9a12-23b9e6cf9f4b	9cb9bb23-ee52-4842-9be2-9fb67204986d	t	${role_manage-users}	manage-users	master	9cb9bb23-ee52-4842-9be2-9fb67204986d	\N
70b1fd50-415b-4fa1-8984-597f1c41a6fa	9cb9bb23-ee52-4842-9be2-9fb67204986d	t	${role_manage-clients}	manage-clients	master	9cb9bb23-ee52-4842-9be2-9fb67204986d	\N
a57757cf-d6c8-42ad-8d9b-5bde03971ba0	9cb9bb23-ee52-4842-9be2-9fb67204986d	t	${role_manage-events}	manage-events	master	9cb9bb23-ee52-4842-9be2-9fb67204986d	\N
c6eb99b0-3d6a-4072-af84-2997db903668	9cb9bb23-ee52-4842-9be2-9fb67204986d	t	${role_manage-identity-providers}	manage-identity-providers	master	9cb9bb23-ee52-4842-9be2-9fb67204986d	\N
c9d8a4cf-be8f-403f-bd65-542259cde55f	9cb9bb23-ee52-4842-9be2-9fb67204986d	t	${role_manage-authorization}	manage-authorization	master	9cb9bb23-ee52-4842-9be2-9fb67204986d	\N
111f867b-aa53-4f50-8575-b8e107111a95	9cb9bb23-ee52-4842-9be2-9fb67204986d	t	${role_query-users}	query-users	master	9cb9bb23-ee52-4842-9be2-9fb67204986d	\N
4eb31a4f-9cce-4784-9545-3dd1173b4052	9cb9bb23-ee52-4842-9be2-9fb67204986d	t	${role_query-clients}	query-clients	master	9cb9bb23-ee52-4842-9be2-9fb67204986d	\N
ee21d4ca-1d60-464c-b5f2-1af50d82515e	9cb9bb23-ee52-4842-9be2-9fb67204986d	t	${role_query-realms}	query-realms	master	9cb9bb23-ee52-4842-9be2-9fb67204986d	\N
12d5eea9-96df-41da-b722-87bf3bdb737a	9cb9bb23-ee52-4842-9be2-9fb67204986d	t	${role_query-groups}	query-groups	master	9cb9bb23-ee52-4842-9be2-9fb67204986d	\N
649a34ce-4528-4640-9234-8b9ec6177506	c19be915-a5ec-4202-a9f5-0ce9474bed1c	t	${role_view-profile}	view-profile	master	c19be915-a5ec-4202-a9f5-0ce9474bed1c	\N
4ffd4aa4-69e1-4166-a5a6-0f6a78602f80	c19be915-a5ec-4202-a9f5-0ce9474bed1c	t	${role_manage-account}	manage-account	master	c19be915-a5ec-4202-a9f5-0ce9474bed1c	\N
abc05036-4fe9-4506-98e0-0a78a39397e3	c19be915-a5ec-4202-a9f5-0ce9474bed1c	t	${role_manage-account-links}	manage-account-links	master	c19be915-a5ec-4202-a9f5-0ce9474bed1c	\N
8da0dbb2-17de-4bc9-828b-500a9aea524f	c19be915-a5ec-4202-a9f5-0ce9474bed1c	t	${role_view-applications}	view-applications	master	c19be915-a5ec-4202-a9f5-0ce9474bed1c	\N
e51f7959-6364-4781-8de5-8fb4dc62b4ae	c19be915-a5ec-4202-a9f5-0ce9474bed1c	t	${role_view-consent}	view-consent	master	c19be915-a5ec-4202-a9f5-0ce9474bed1c	\N
8ffddbaf-7d5f-44ac-9ea1-7bb07f2ee247	c19be915-a5ec-4202-a9f5-0ce9474bed1c	t	${role_manage-consent}	manage-consent	master	c19be915-a5ec-4202-a9f5-0ce9474bed1c	\N
d336df44-181d-4d13-95f6-f7f074a853f8	45a84ed2-c14c-466f-8b5e-83c511c51149	t	${role_read-token}	read-token	master	45a84ed2-c14c-466f-8b5e-83c511c51149	\N
1b1d71dc-2aa4-4e36-8a8c-75302108d2e0	9cb9bb23-ee52-4842-9be2-9fb67204986d	t	${role_impersonation}	impersonation	master	9cb9bb23-ee52-4842-9be2-9fb67204986d	\N
b4c4d9bf-88cd-4b42-b55f-2ed20d5932f2	master	f	${role_offline-access}	offline_access	master	\N	master
1472ea0f-2bf5-4ec5-84fc-9dd0ecd59274	master	f	${role_uma_authorization}	uma_authorization	master	\N	master
1921a04b-acb2-4366-9a2a-41b300e1e3d9	a9c8d6da-e662-45da-a4ab-6d1f80d48033	t	${role_create-client}	create-client	master	a9c8d6da-e662-45da-a4ab-6d1f80d48033	\N
75f7aa34-a62b-43a3-ab97-3fd5c9355478	a9c8d6da-e662-45da-a4ab-6d1f80d48033	t	${role_view-realm}	view-realm	master	a9c8d6da-e662-45da-a4ab-6d1f80d48033	\N
648f87c7-707c-4ac1-818f-b8f52450f094	a9c8d6da-e662-45da-a4ab-6d1f80d48033	t	${role_view-users}	view-users	master	a9c8d6da-e662-45da-a4ab-6d1f80d48033	\N
e171deef-45c7-4560-aa55-554499782e3d	a9c8d6da-e662-45da-a4ab-6d1f80d48033	t	${role_view-clients}	view-clients	master	a9c8d6da-e662-45da-a4ab-6d1f80d48033	\N
dee883c0-60e8-46a0-a90f-db0a6fc8003f	a9c8d6da-e662-45da-a4ab-6d1f80d48033	t	${role_view-events}	view-events	master	a9c8d6da-e662-45da-a4ab-6d1f80d48033	\N
f9df3e92-8fe0-4fc1-8676-f3731508d995	a9c8d6da-e662-45da-a4ab-6d1f80d48033	t	${role_view-identity-providers}	view-identity-providers	master	a9c8d6da-e662-45da-a4ab-6d1f80d48033	\N
d96cb959-4c8d-4708-9a43-9de371e501bc	a9c8d6da-e662-45da-a4ab-6d1f80d48033	t	${role_view-authorization}	view-authorization	master	a9c8d6da-e662-45da-a4ab-6d1f80d48033	\N
e50669af-7e6d-479f-9437-e149850689ea	a9c8d6da-e662-45da-a4ab-6d1f80d48033	t	${role_manage-realm}	manage-realm	master	a9c8d6da-e662-45da-a4ab-6d1f80d48033	\N
2fdc27be-916d-46e0-b6ff-93181ff9532c	a9c8d6da-e662-45da-a4ab-6d1f80d48033	t	${role_manage-users}	manage-users	master	a9c8d6da-e662-45da-a4ab-6d1f80d48033	\N
26a06977-4573-4098-afcb-583ae3c49db3	a9c8d6da-e662-45da-a4ab-6d1f80d48033	t	${role_manage-clients}	manage-clients	master	a9c8d6da-e662-45da-a4ab-6d1f80d48033	\N
c0b5f389-feb5-4101-bbf1-b99067f3b0d3	a9c8d6da-e662-45da-a4ab-6d1f80d48033	t	${role_manage-events}	manage-events	master	a9c8d6da-e662-45da-a4ab-6d1f80d48033	\N
3230b373-51b4-4310-bb9e-87338493a356	a9c8d6da-e662-45da-a4ab-6d1f80d48033	t	${role_manage-identity-providers}	manage-identity-providers	master	a9c8d6da-e662-45da-a4ab-6d1f80d48033	\N
2f316470-f9a5-4de6-8583-d7f27066acee	a9c8d6da-e662-45da-a4ab-6d1f80d48033	t	${role_manage-authorization}	manage-authorization	master	a9c8d6da-e662-45da-a4ab-6d1f80d48033	\N
459c67b8-6199-406c-b4e1-3d41ab049250	a9c8d6da-e662-45da-a4ab-6d1f80d48033	t	${role_query-users}	query-users	master	a9c8d6da-e662-45da-a4ab-6d1f80d48033	\N
1c7a08d8-60a7-4092-bd54-5e3717f3bee0	a9c8d6da-e662-45da-a4ab-6d1f80d48033	t	${role_query-clients}	query-clients	master	a9c8d6da-e662-45da-a4ab-6d1f80d48033	\N
1166037a-548d-4894-b70b-c588d2e71f66	a9c8d6da-e662-45da-a4ab-6d1f80d48033	t	${role_query-realms}	query-realms	master	a9c8d6da-e662-45da-a4ab-6d1f80d48033	\N
4f77ef2b-7a2a-429f-8b83-88e7d65ecb5b	a9c8d6da-e662-45da-a4ab-6d1f80d48033	t	${role_query-groups}	query-groups	master	a9c8d6da-e662-45da-a4ab-6d1f80d48033	\N
2e126f9c-8cab-4fea-9c17-1558c5aeddac	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	t	${role_realm-admin}	realm-admin	document_search_engine	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	\N
ed5099dc-14a3-45c6-b382-c1aad48b210f	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	t	${role_create-client}	create-client	document_search_engine	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	\N
4fe0940a-b8f4-4f9f-b0ec-739e0c623943	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	t	${role_view-realm}	view-realm	document_search_engine	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	\N
4b7e0a21-596f-4429-a532-90d07f4fa522	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	t	${role_view-users}	view-users	document_search_engine	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	\N
8eb7705b-80e6-42c3-ac14-f32937742d24	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	t	${role_view-clients}	view-clients	document_search_engine	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	\N
a03646d2-0482-41b9-8840-3c3e61b1090f	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	t	${role_view-events}	view-events	document_search_engine	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	\N
dd5b92ad-e646-4886-892f-8d07e8c6ce37	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	t	${role_view-identity-providers}	view-identity-providers	document_search_engine	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	\N
eecf3277-49da-44fc-b995-3ddbf2f388c4	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	t	${role_view-authorization}	view-authorization	document_search_engine	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	\N
ed46fb61-5d70-4d3f-b3c3-19d22c7ae39b	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	t	${role_manage-realm}	manage-realm	document_search_engine	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	\N
2d9734af-fb44-4347-bac1-f3ea89b5a20f	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	t	${role_manage-users}	manage-users	document_search_engine	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	\N
fa67c3a4-b229-43cf-9c5e-312b02b70e4b	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	t	${role_manage-clients}	manage-clients	document_search_engine	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	\N
5442458d-33b9-46a3-991b-81fe39437485	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	t	${role_manage-events}	manage-events	document_search_engine	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	\N
4ac4a0c1-6354-435c-a7f4-3f25fc55af28	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	t	${role_manage-identity-providers}	manage-identity-providers	document_search_engine	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	\N
28c286d5-cbfd-4d9a-8dc3-05e0d68084d9	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	t	${role_manage-authorization}	manage-authorization	document_search_engine	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	\N
94aa6a01-ae17-4fd6-98fa-c2a565341df0	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	t	${role_query-users}	query-users	document_search_engine	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	\N
1882df10-9f96-4dda-a339-a6b2726812d2	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	t	${role_query-clients}	query-clients	document_search_engine	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	\N
1d0dbc32-b3b1-451b-a386-b78de561401e	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	t	${role_query-realms}	query-realms	document_search_engine	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	\N
3f206777-334b-46ad-bd76-9ee1de1a39bd	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	t	${role_query-groups}	query-groups	document_search_engine	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	\N
eeaa9bd7-2b94-4c09-b88b-b70a786ce5d2	0c410aa2-eceb-43f0-8ef4-e17c5ef04885	t	${role_view-profile}	view-profile	document_search_engine	0c410aa2-eceb-43f0-8ef4-e17c5ef04885	\N
f7dfd151-e810-4242-add9-4cc040ebf3c5	0c410aa2-eceb-43f0-8ef4-e17c5ef04885	t	${role_manage-account}	manage-account	document_search_engine	0c410aa2-eceb-43f0-8ef4-e17c5ef04885	\N
04073114-12b8-4965-b1ab-fd5badf2dfc6	0c410aa2-eceb-43f0-8ef4-e17c5ef04885	t	${role_manage-account-links}	manage-account-links	document_search_engine	0c410aa2-eceb-43f0-8ef4-e17c5ef04885	\N
09144af4-fb38-4e07-a8be-a8aa4b109611	0c410aa2-eceb-43f0-8ef4-e17c5ef04885	t	${role_view-applications}	view-applications	document_search_engine	0c410aa2-eceb-43f0-8ef4-e17c5ef04885	\N
7f3d74ea-af3b-4130-8f4f-c40d48bde416	0c410aa2-eceb-43f0-8ef4-e17c5ef04885	t	${role_view-consent}	view-consent	document_search_engine	0c410aa2-eceb-43f0-8ef4-e17c5ef04885	\N
ab129089-5c9f-4f21-ae3b-3c0ad12552a7	0c410aa2-eceb-43f0-8ef4-e17c5ef04885	t	${role_manage-consent}	manage-consent	document_search_engine	0c410aa2-eceb-43f0-8ef4-e17c5ef04885	\N
fb7631d0-77cf-4f3a-89f7-5b343b928a0e	a9c8d6da-e662-45da-a4ab-6d1f80d48033	t	${role_impersonation}	impersonation	master	a9c8d6da-e662-45da-a4ab-6d1f80d48033	\N
2a18eb09-46e9-4e91-a985-3addbd56433c	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	t	${role_impersonation}	impersonation	document_search_engine	40d3dfa1-acfe-43e1-920a-71e8d0aa1493	\N
b9ea9e92-0012-4a0d-b5c3-bec3bf63f5fb	23cede30-02a2-4c88-8d13-a20977f0f27b	t	${role_read-token}	read-token	document_search_engine	23cede30-02a2-4c88-8d13-a20977f0f27b	\N
d9f842ac-678e-4e6a-bf34-bc83b9b7f837	document_search_engine	f	${role_offline-access}	offline_access	document_search_engine	\N	document_search_engine
2d55b1f3-cb68-46b8-a6bb-51931222aea5	document_search_engine	f	${role_uma_authorization}	uma_authorization	document_search_engine	\N	document_search_engine
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
biaqs	11.0.3	1607797168
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
adc4bcb6-84b4-4573-ac81-91429e764252	audience resolve	openid-connect	oidc-audience-resolve-mapper	5e7449ef-c6be-41eb-aa6a-614183502daa	\N
9288b7ed-6488-4a00-9df1-9967755f022c	locale	openid-connect	oidc-usermodel-attribute-mapper	04f1c18a-ebde-41ae-b71e-e014448a058a	\N
4dfe0752-1e9b-4d24-83eb-f49bc3b4eb1d	role list	saml	saml-role-list-mapper	\N	226d8b11-c999-4e6a-b155-89e2f81bde90
5d308a4a-2639-4df1-9281-7f528620bb4e	full name	openid-connect	oidc-full-name-mapper	\N	e2efea9e-dbbc-46e1-a23c-56b95356e57c
ffd9261a-5892-41d0-9da3-b60a46576c98	family name	openid-connect	oidc-usermodel-property-mapper	\N	e2efea9e-dbbc-46e1-a23c-56b95356e57c
a5f713da-7aef-4ebd-83fe-a72e66dde80a	given name	openid-connect	oidc-usermodel-property-mapper	\N	e2efea9e-dbbc-46e1-a23c-56b95356e57c
d927f221-edf3-4ee2-bebd-9ba85b2d5863	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	e2efea9e-dbbc-46e1-a23c-56b95356e57c
388b3bd0-6615-4846-ae8f-83cd3315e54a	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	e2efea9e-dbbc-46e1-a23c-56b95356e57c
efea8f76-cbe7-480d-8e28-730bdf3bfd5f	username	openid-connect	oidc-usermodel-property-mapper	\N	e2efea9e-dbbc-46e1-a23c-56b95356e57c
90c2f24e-8fbb-4099-9a7a-ed34c1144bc0	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	e2efea9e-dbbc-46e1-a23c-56b95356e57c
47d566f3-718b-434b-8ddb-1525d3f19f0b	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	e2efea9e-dbbc-46e1-a23c-56b95356e57c
0961fade-7dfb-4db9-b591-d63cf6ff3037	website	openid-connect	oidc-usermodel-attribute-mapper	\N	e2efea9e-dbbc-46e1-a23c-56b95356e57c
b2d5853c-5633-425e-bcff-5fd0353ea9be	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	e2efea9e-dbbc-46e1-a23c-56b95356e57c
1ca37473-aaee-4054-8a22-006517b65bf9	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	e2efea9e-dbbc-46e1-a23c-56b95356e57c
2bde202d-140c-40b3-a6b8-014b021ac740	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	e2efea9e-dbbc-46e1-a23c-56b95356e57c
73b11b0c-f93f-4063-b475-741cc12619f8	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	e2efea9e-dbbc-46e1-a23c-56b95356e57c
61fdcdb3-d2f6-46d4-b438-e12fc7455340	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	e2efea9e-dbbc-46e1-a23c-56b95356e57c
f9f534fd-12ce-4617-bad5-82236c34a528	email	openid-connect	oidc-usermodel-property-mapper	\N	62d03df6-99d2-4e76-9b29-d21e82f1b836
92d7d88a-0de8-47fa-9eef-76167ef32f95	email verified	openid-connect	oidc-usermodel-property-mapper	\N	62d03df6-99d2-4e76-9b29-d21e82f1b836
c9793ba0-9c63-43e9-b1c2-c0c36948622f	address	openid-connect	oidc-address-mapper	\N	fc87dea4-2c84-415a-9930-edae22ba052a
9355df59-4877-46c5-a735-48e112fa49d7	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	b7cecef1-bf09-4162-9c8f-f022e9deb64a
8de85ab8-7b53-4d3a-bc05-da4f959f2076	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	b7cecef1-bf09-4162-9c8f-f022e9deb64a
11a23ffa-50dc-480e-8cdf-2be1950857dc	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	298c28aa-cb99-4123-a123-55f00e25321b
813db906-3690-4064-93bd-004a42b6d980	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	298c28aa-cb99-4123-a123-55f00e25321b
9da054db-6c76-438a-9d01-ba56d3478177	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	298c28aa-cb99-4123-a123-55f00e25321b
658eb99d-c19d-4e08-b08e-0755fa2f628a	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	1e474be2-6338-4830-9356-60ab538f1720
b1600024-57f6-4509-943e-973e643d0398	upn	openid-connect	oidc-usermodel-property-mapper	\N	1f6b34c5-78c6-4ffb-bd3d-a318cf70b22e
2487fb60-4f2a-4a70-be7b-1b4e651220ea	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	1f6b34c5-78c6-4ffb-bd3d-a318cf70b22e
399731d7-ba69-4e2e-830e-0da495c82446	audience resolve	openid-connect	oidc-audience-resolve-mapper	1e3b778d-499d-479b-9c76-fcfb2113ecfa	\N
b1719862-5f5f-4bab-8c89-5dfe8d1cbeb4	role list	saml	saml-role-list-mapper	\N	aaba4cc5-5700-4860-9ae3-f6bbeb6bc757
143dbe50-9e56-4dba-9e10-3285814bedb4	full name	openid-connect	oidc-full-name-mapper	\N	496ce993-b454-4d34-b56b-6f77619efc3e
f9ddd710-f03c-4fe8-908b-5de105238c08	family name	openid-connect	oidc-usermodel-property-mapper	\N	496ce993-b454-4d34-b56b-6f77619efc3e
991dd87a-ac18-4c9e-bf51-5c428ae0f118	given name	openid-connect	oidc-usermodel-property-mapper	\N	496ce993-b454-4d34-b56b-6f77619efc3e
714e3811-507d-4446-8571-28f08679f6f1	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	496ce993-b454-4d34-b56b-6f77619efc3e
c3e5156c-98a6-4022-a0a4-2faa02bc6707	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	496ce993-b454-4d34-b56b-6f77619efc3e
22762d1f-2fd3-482f-85d6-8c2785dac321	username	openid-connect	oidc-usermodel-property-mapper	\N	496ce993-b454-4d34-b56b-6f77619efc3e
2137d3d0-9c1e-41d1-b2fc-2eca9ffcd799	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	496ce993-b454-4d34-b56b-6f77619efc3e
4557f604-0cd9-4703-bf2b-7e03413b744c	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	496ce993-b454-4d34-b56b-6f77619efc3e
20e3ff75-c55f-4acb-8444-29882ac04fbc	website	openid-connect	oidc-usermodel-attribute-mapper	\N	496ce993-b454-4d34-b56b-6f77619efc3e
e6b7c073-5121-4fb4-b74c-69e95446a57e	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	496ce993-b454-4d34-b56b-6f77619efc3e
77b972df-8c8b-4112-90d2-d82adf04de06	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	496ce993-b454-4d34-b56b-6f77619efc3e
18536220-74b5-49b0-9058-93498fa0a1ee	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	496ce993-b454-4d34-b56b-6f77619efc3e
4b6bd582-6219-45a6-88c2-3b8f71c5f9af	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	496ce993-b454-4d34-b56b-6f77619efc3e
59bd55b0-282f-4122-bae6-17de7e129211	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	496ce993-b454-4d34-b56b-6f77619efc3e
f3507c8d-a885-4a8e-b5b2-fd80915f3f52	email	openid-connect	oidc-usermodel-property-mapper	\N	01e68a46-fa2b-4042-a36d-11f5c98591d9
34e700e5-e08b-4192-a087-3704bd23e67a	email verified	openid-connect	oidc-usermodel-property-mapper	\N	01e68a46-fa2b-4042-a36d-11f5c98591d9
9b7f038b-598e-4ee3-bd7b-bd19d2a92a38	address	openid-connect	oidc-address-mapper	\N	da50ba5e-ea87-45e6-aee8-d21b01591cf6
ec578aea-3153-4149-871d-a3197b8f7569	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	c04648e8-2272-41bd-ac73-2dd6478fde45
39d92e95-8fc6-4d98-a3f5-22ae9f656076	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	c04648e8-2272-41bd-ac73-2dd6478fde45
79520d82-7d9a-49b9-a70d-b78470d12d28	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	f2d06444-3aad-408e-9ccf-b92e6548dc63
623f1b6a-ecd8-4c5e-8443-23c2551754cd	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	f2d06444-3aad-408e-9ccf-b92e6548dc63
6b381502-7ac1-4f6f-90ff-42a6584d3b56	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	f2d06444-3aad-408e-9ccf-b92e6548dc63
d2a5406c-ddc0-46d1-9de1-d043c8613873	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	15108269-16c6-482c-b52f-8162264fa070
78011123-80d2-4243-8487-de3660ec16d2	upn	openid-connect	oidc-usermodel-property-mapper	\N	f2b62026-11d4-450b-a9a3-5a427d8a54c6
aee5282a-e482-415e-9c42-c545423af6af	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	f2b62026-11d4-450b-a9a3-5a427d8a54c6
3a4e50f5-4da5-472d-9912-4181f0a3c17b	locale	openid-connect	oidc-usermodel-attribute-mapper	0b7676ee-20e0-4fbb-b758-774e8f149862	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
9288b7ed-6488-4a00-9df1-9967755f022c	true	userinfo.token.claim
9288b7ed-6488-4a00-9df1-9967755f022c	locale	user.attribute
9288b7ed-6488-4a00-9df1-9967755f022c	true	id.token.claim
9288b7ed-6488-4a00-9df1-9967755f022c	true	access.token.claim
9288b7ed-6488-4a00-9df1-9967755f022c	locale	claim.name
9288b7ed-6488-4a00-9df1-9967755f022c	String	jsonType.label
4dfe0752-1e9b-4d24-83eb-f49bc3b4eb1d	false	single
4dfe0752-1e9b-4d24-83eb-f49bc3b4eb1d	Basic	attribute.nameformat
4dfe0752-1e9b-4d24-83eb-f49bc3b4eb1d	Role	attribute.name
5d308a4a-2639-4df1-9281-7f528620bb4e	true	userinfo.token.claim
5d308a4a-2639-4df1-9281-7f528620bb4e	true	id.token.claim
5d308a4a-2639-4df1-9281-7f528620bb4e	true	access.token.claim
ffd9261a-5892-41d0-9da3-b60a46576c98	true	userinfo.token.claim
ffd9261a-5892-41d0-9da3-b60a46576c98	lastName	user.attribute
ffd9261a-5892-41d0-9da3-b60a46576c98	true	id.token.claim
ffd9261a-5892-41d0-9da3-b60a46576c98	true	access.token.claim
ffd9261a-5892-41d0-9da3-b60a46576c98	family_name	claim.name
ffd9261a-5892-41d0-9da3-b60a46576c98	String	jsonType.label
a5f713da-7aef-4ebd-83fe-a72e66dde80a	true	userinfo.token.claim
a5f713da-7aef-4ebd-83fe-a72e66dde80a	firstName	user.attribute
a5f713da-7aef-4ebd-83fe-a72e66dde80a	true	id.token.claim
a5f713da-7aef-4ebd-83fe-a72e66dde80a	true	access.token.claim
a5f713da-7aef-4ebd-83fe-a72e66dde80a	given_name	claim.name
a5f713da-7aef-4ebd-83fe-a72e66dde80a	String	jsonType.label
d927f221-edf3-4ee2-bebd-9ba85b2d5863	true	userinfo.token.claim
d927f221-edf3-4ee2-bebd-9ba85b2d5863	middleName	user.attribute
d927f221-edf3-4ee2-bebd-9ba85b2d5863	true	id.token.claim
d927f221-edf3-4ee2-bebd-9ba85b2d5863	true	access.token.claim
d927f221-edf3-4ee2-bebd-9ba85b2d5863	middle_name	claim.name
d927f221-edf3-4ee2-bebd-9ba85b2d5863	String	jsonType.label
388b3bd0-6615-4846-ae8f-83cd3315e54a	true	userinfo.token.claim
388b3bd0-6615-4846-ae8f-83cd3315e54a	nickname	user.attribute
388b3bd0-6615-4846-ae8f-83cd3315e54a	true	id.token.claim
388b3bd0-6615-4846-ae8f-83cd3315e54a	true	access.token.claim
388b3bd0-6615-4846-ae8f-83cd3315e54a	nickname	claim.name
388b3bd0-6615-4846-ae8f-83cd3315e54a	String	jsonType.label
efea8f76-cbe7-480d-8e28-730bdf3bfd5f	true	userinfo.token.claim
efea8f76-cbe7-480d-8e28-730bdf3bfd5f	username	user.attribute
efea8f76-cbe7-480d-8e28-730bdf3bfd5f	true	id.token.claim
efea8f76-cbe7-480d-8e28-730bdf3bfd5f	true	access.token.claim
efea8f76-cbe7-480d-8e28-730bdf3bfd5f	preferred_username	claim.name
efea8f76-cbe7-480d-8e28-730bdf3bfd5f	String	jsonType.label
90c2f24e-8fbb-4099-9a7a-ed34c1144bc0	true	userinfo.token.claim
90c2f24e-8fbb-4099-9a7a-ed34c1144bc0	profile	user.attribute
90c2f24e-8fbb-4099-9a7a-ed34c1144bc0	true	id.token.claim
90c2f24e-8fbb-4099-9a7a-ed34c1144bc0	true	access.token.claim
90c2f24e-8fbb-4099-9a7a-ed34c1144bc0	profile	claim.name
90c2f24e-8fbb-4099-9a7a-ed34c1144bc0	String	jsonType.label
47d566f3-718b-434b-8ddb-1525d3f19f0b	true	userinfo.token.claim
47d566f3-718b-434b-8ddb-1525d3f19f0b	picture	user.attribute
47d566f3-718b-434b-8ddb-1525d3f19f0b	true	id.token.claim
47d566f3-718b-434b-8ddb-1525d3f19f0b	true	access.token.claim
47d566f3-718b-434b-8ddb-1525d3f19f0b	picture	claim.name
47d566f3-718b-434b-8ddb-1525d3f19f0b	String	jsonType.label
0961fade-7dfb-4db9-b591-d63cf6ff3037	true	userinfo.token.claim
0961fade-7dfb-4db9-b591-d63cf6ff3037	website	user.attribute
0961fade-7dfb-4db9-b591-d63cf6ff3037	true	id.token.claim
0961fade-7dfb-4db9-b591-d63cf6ff3037	true	access.token.claim
0961fade-7dfb-4db9-b591-d63cf6ff3037	website	claim.name
0961fade-7dfb-4db9-b591-d63cf6ff3037	String	jsonType.label
b2d5853c-5633-425e-bcff-5fd0353ea9be	true	userinfo.token.claim
b2d5853c-5633-425e-bcff-5fd0353ea9be	gender	user.attribute
b2d5853c-5633-425e-bcff-5fd0353ea9be	true	id.token.claim
b2d5853c-5633-425e-bcff-5fd0353ea9be	true	access.token.claim
b2d5853c-5633-425e-bcff-5fd0353ea9be	gender	claim.name
b2d5853c-5633-425e-bcff-5fd0353ea9be	String	jsonType.label
1ca37473-aaee-4054-8a22-006517b65bf9	true	userinfo.token.claim
1ca37473-aaee-4054-8a22-006517b65bf9	birthdate	user.attribute
1ca37473-aaee-4054-8a22-006517b65bf9	true	id.token.claim
1ca37473-aaee-4054-8a22-006517b65bf9	true	access.token.claim
1ca37473-aaee-4054-8a22-006517b65bf9	birthdate	claim.name
1ca37473-aaee-4054-8a22-006517b65bf9	String	jsonType.label
2bde202d-140c-40b3-a6b8-014b021ac740	true	userinfo.token.claim
2bde202d-140c-40b3-a6b8-014b021ac740	zoneinfo	user.attribute
2bde202d-140c-40b3-a6b8-014b021ac740	true	id.token.claim
2bde202d-140c-40b3-a6b8-014b021ac740	true	access.token.claim
2bde202d-140c-40b3-a6b8-014b021ac740	zoneinfo	claim.name
2bde202d-140c-40b3-a6b8-014b021ac740	String	jsonType.label
73b11b0c-f93f-4063-b475-741cc12619f8	true	userinfo.token.claim
73b11b0c-f93f-4063-b475-741cc12619f8	locale	user.attribute
73b11b0c-f93f-4063-b475-741cc12619f8	true	id.token.claim
73b11b0c-f93f-4063-b475-741cc12619f8	true	access.token.claim
73b11b0c-f93f-4063-b475-741cc12619f8	locale	claim.name
73b11b0c-f93f-4063-b475-741cc12619f8	String	jsonType.label
61fdcdb3-d2f6-46d4-b438-e12fc7455340	true	userinfo.token.claim
61fdcdb3-d2f6-46d4-b438-e12fc7455340	updatedAt	user.attribute
61fdcdb3-d2f6-46d4-b438-e12fc7455340	true	id.token.claim
61fdcdb3-d2f6-46d4-b438-e12fc7455340	true	access.token.claim
61fdcdb3-d2f6-46d4-b438-e12fc7455340	updated_at	claim.name
61fdcdb3-d2f6-46d4-b438-e12fc7455340	String	jsonType.label
f9f534fd-12ce-4617-bad5-82236c34a528	true	userinfo.token.claim
f9f534fd-12ce-4617-bad5-82236c34a528	email	user.attribute
f9f534fd-12ce-4617-bad5-82236c34a528	true	id.token.claim
f9f534fd-12ce-4617-bad5-82236c34a528	true	access.token.claim
f9f534fd-12ce-4617-bad5-82236c34a528	email	claim.name
f9f534fd-12ce-4617-bad5-82236c34a528	String	jsonType.label
92d7d88a-0de8-47fa-9eef-76167ef32f95	true	userinfo.token.claim
92d7d88a-0de8-47fa-9eef-76167ef32f95	emailVerified	user.attribute
92d7d88a-0de8-47fa-9eef-76167ef32f95	true	id.token.claim
92d7d88a-0de8-47fa-9eef-76167ef32f95	true	access.token.claim
92d7d88a-0de8-47fa-9eef-76167ef32f95	email_verified	claim.name
92d7d88a-0de8-47fa-9eef-76167ef32f95	boolean	jsonType.label
c9793ba0-9c63-43e9-b1c2-c0c36948622f	formatted	user.attribute.formatted
c9793ba0-9c63-43e9-b1c2-c0c36948622f	country	user.attribute.country
c9793ba0-9c63-43e9-b1c2-c0c36948622f	postal_code	user.attribute.postal_code
c9793ba0-9c63-43e9-b1c2-c0c36948622f	true	userinfo.token.claim
c9793ba0-9c63-43e9-b1c2-c0c36948622f	street	user.attribute.street
c9793ba0-9c63-43e9-b1c2-c0c36948622f	true	id.token.claim
c9793ba0-9c63-43e9-b1c2-c0c36948622f	region	user.attribute.region
c9793ba0-9c63-43e9-b1c2-c0c36948622f	true	access.token.claim
c9793ba0-9c63-43e9-b1c2-c0c36948622f	locality	user.attribute.locality
9355df59-4877-46c5-a735-48e112fa49d7	true	userinfo.token.claim
9355df59-4877-46c5-a735-48e112fa49d7	phoneNumber	user.attribute
9355df59-4877-46c5-a735-48e112fa49d7	true	id.token.claim
9355df59-4877-46c5-a735-48e112fa49d7	true	access.token.claim
9355df59-4877-46c5-a735-48e112fa49d7	phone_number	claim.name
9355df59-4877-46c5-a735-48e112fa49d7	String	jsonType.label
8de85ab8-7b53-4d3a-bc05-da4f959f2076	true	userinfo.token.claim
8de85ab8-7b53-4d3a-bc05-da4f959f2076	phoneNumberVerified	user.attribute
8de85ab8-7b53-4d3a-bc05-da4f959f2076	true	id.token.claim
8de85ab8-7b53-4d3a-bc05-da4f959f2076	true	access.token.claim
8de85ab8-7b53-4d3a-bc05-da4f959f2076	phone_number_verified	claim.name
8de85ab8-7b53-4d3a-bc05-da4f959f2076	boolean	jsonType.label
11a23ffa-50dc-480e-8cdf-2be1950857dc	true	multivalued
11a23ffa-50dc-480e-8cdf-2be1950857dc	foo	user.attribute
11a23ffa-50dc-480e-8cdf-2be1950857dc	true	access.token.claim
11a23ffa-50dc-480e-8cdf-2be1950857dc	realm_access.roles	claim.name
11a23ffa-50dc-480e-8cdf-2be1950857dc	String	jsonType.label
813db906-3690-4064-93bd-004a42b6d980	true	multivalued
813db906-3690-4064-93bd-004a42b6d980	foo	user.attribute
813db906-3690-4064-93bd-004a42b6d980	true	access.token.claim
813db906-3690-4064-93bd-004a42b6d980	resource_access.${client_id}.roles	claim.name
813db906-3690-4064-93bd-004a42b6d980	String	jsonType.label
b1600024-57f6-4509-943e-973e643d0398	true	userinfo.token.claim
b1600024-57f6-4509-943e-973e643d0398	username	user.attribute
b1600024-57f6-4509-943e-973e643d0398	true	id.token.claim
b1600024-57f6-4509-943e-973e643d0398	true	access.token.claim
b1600024-57f6-4509-943e-973e643d0398	upn	claim.name
b1600024-57f6-4509-943e-973e643d0398	String	jsonType.label
2487fb60-4f2a-4a70-be7b-1b4e651220ea	true	multivalued
2487fb60-4f2a-4a70-be7b-1b4e651220ea	foo	user.attribute
2487fb60-4f2a-4a70-be7b-1b4e651220ea	true	id.token.claim
2487fb60-4f2a-4a70-be7b-1b4e651220ea	true	access.token.claim
2487fb60-4f2a-4a70-be7b-1b4e651220ea	groups	claim.name
2487fb60-4f2a-4a70-be7b-1b4e651220ea	String	jsonType.label
b1719862-5f5f-4bab-8c89-5dfe8d1cbeb4	false	single
b1719862-5f5f-4bab-8c89-5dfe8d1cbeb4	Basic	attribute.nameformat
b1719862-5f5f-4bab-8c89-5dfe8d1cbeb4	Role	attribute.name
143dbe50-9e56-4dba-9e10-3285814bedb4	true	userinfo.token.claim
143dbe50-9e56-4dba-9e10-3285814bedb4	true	id.token.claim
143dbe50-9e56-4dba-9e10-3285814bedb4	true	access.token.claim
f9ddd710-f03c-4fe8-908b-5de105238c08	true	userinfo.token.claim
f9ddd710-f03c-4fe8-908b-5de105238c08	lastName	user.attribute
f9ddd710-f03c-4fe8-908b-5de105238c08	true	id.token.claim
f9ddd710-f03c-4fe8-908b-5de105238c08	true	access.token.claim
f9ddd710-f03c-4fe8-908b-5de105238c08	family_name	claim.name
f9ddd710-f03c-4fe8-908b-5de105238c08	String	jsonType.label
991dd87a-ac18-4c9e-bf51-5c428ae0f118	true	userinfo.token.claim
991dd87a-ac18-4c9e-bf51-5c428ae0f118	firstName	user.attribute
991dd87a-ac18-4c9e-bf51-5c428ae0f118	true	id.token.claim
991dd87a-ac18-4c9e-bf51-5c428ae0f118	true	access.token.claim
991dd87a-ac18-4c9e-bf51-5c428ae0f118	given_name	claim.name
991dd87a-ac18-4c9e-bf51-5c428ae0f118	String	jsonType.label
714e3811-507d-4446-8571-28f08679f6f1	true	userinfo.token.claim
714e3811-507d-4446-8571-28f08679f6f1	middleName	user.attribute
714e3811-507d-4446-8571-28f08679f6f1	true	id.token.claim
714e3811-507d-4446-8571-28f08679f6f1	true	access.token.claim
714e3811-507d-4446-8571-28f08679f6f1	middle_name	claim.name
714e3811-507d-4446-8571-28f08679f6f1	String	jsonType.label
c3e5156c-98a6-4022-a0a4-2faa02bc6707	true	userinfo.token.claim
c3e5156c-98a6-4022-a0a4-2faa02bc6707	nickname	user.attribute
c3e5156c-98a6-4022-a0a4-2faa02bc6707	true	id.token.claim
c3e5156c-98a6-4022-a0a4-2faa02bc6707	true	access.token.claim
c3e5156c-98a6-4022-a0a4-2faa02bc6707	nickname	claim.name
c3e5156c-98a6-4022-a0a4-2faa02bc6707	String	jsonType.label
22762d1f-2fd3-482f-85d6-8c2785dac321	true	userinfo.token.claim
22762d1f-2fd3-482f-85d6-8c2785dac321	username	user.attribute
22762d1f-2fd3-482f-85d6-8c2785dac321	true	id.token.claim
22762d1f-2fd3-482f-85d6-8c2785dac321	true	access.token.claim
22762d1f-2fd3-482f-85d6-8c2785dac321	preferred_username	claim.name
22762d1f-2fd3-482f-85d6-8c2785dac321	String	jsonType.label
2137d3d0-9c1e-41d1-b2fc-2eca9ffcd799	true	userinfo.token.claim
2137d3d0-9c1e-41d1-b2fc-2eca9ffcd799	profile	user.attribute
2137d3d0-9c1e-41d1-b2fc-2eca9ffcd799	true	id.token.claim
2137d3d0-9c1e-41d1-b2fc-2eca9ffcd799	true	access.token.claim
2137d3d0-9c1e-41d1-b2fc-2eca9ffcd799	profile	claim.name
2137d3d0-9c1e-41d1-b2fc-2eca9ffcd799	String	jsonType.label
4557f604-0cd9-4703-bf2b-7e03413b744c	true	userinfo.token.claim
4557f604-0cd9-4703-bf2b-7e03413b744c	picture	user.attribute
4557f604-0cd9-4703-bf2b-7e03413b744c	true	id.token.claim
4557f604-0cd9-4703-bf2b-7e03413b744c	true	access.token.claim
4557f604-0cd9-4703-bf2b-7e03413b744c	picture	claim.name
4557f604-0cd9-4703-bf2b-7e03413b744c	String	jsonType.label
20e3ff75-c55f-4acb-8444-29882ac04fbc	true	userinfo.token.claim
20e3ff75-c55f-4acb-8444-29882ac04fbc	website	user.attribute
20e3ff75-c55f-4acb-8444-29882ac04fbc	true	id.token.claim
20e3ff75-c55f-4acb-8444-29882ac04fbc	true	access.token.claim
20e3ff75-c55f-4acb-8444-29882ac04fbc	website	claim.name
20e3ff75-c55f-4acb-8444-29882ac04fbc	String	jsonType.label
e6b7c073-5121-4fb4-b74c-69e95446a57e	true	userinfo.token.claim
e6b7c073-5121-4fb4-b74c-69e95446a57e	gender	user.attribute
e6b7c073-5121-4fb4-b74c-69e95446a57e	true	id.token.claim
e6b7c073-5121-4fb4-b74c-69e95446a57e	true	access.token.claim
e6b7c073-5121-4fb4-b74c-69e95446a57e	gender	claim.name
e6b7c073-5121-4fb4-b74c-69e95446a57e	String	jsonType.label
77b972df-8c8b-4112-90d2-d82adf04de06	true	userinfo.token.claim
77b972df-8c8b-4112-90d2-d82adf04de06	birthdate	user.attribute
77b972df-8c8b-4112-90d2-d82adf04de06	true	id.token.claim
77b972df-8c8b-4112-90d2-d82adf04de06	true	access.token.claim
77b972df-8c8b-4112-90d2-d82adf04de06	birthdate	claim.name
77b972df-8c8b-4112-90d2-d82adf04de06	String	jsonType.label
18536220-74b5-49b0-9058-93498fa0a1ee	true	userinfo.token.claim
18536220-74b5-49b0-9058-93498fa0a1ee	zoneinfo	user.attribute
18536220-74b5-49b0-9058-93498fa0a1ee	true	id.token.claim
18536220-74b5-49b0-9058-93498fa0a1ee	true	access.token.claim
18536220-74b5-49b0-9058-93498fa0a1ee	zoneinfo	claim.name
18536220-74b5-49b0-9058-93498fa0a1ee	String	jsonType.label
4b6bd582-6219-45a6-88c2-3b8f71c5f9af	true	userinfo.token.claim
4b6bd582-6219-45a6-88c2-3b8f71c5f9af	locale	user.attribute
4b6bd582-6219-45a6-88c2-3b8f71c5f9af	true	id.token.claim
4b6bd582-6219-45a6-88c2-3b8f71c5f9af	true	access.token.claim
4b6bd582-6219-45a6-88c2-3b8f71c5f9af	locale	claim.name
4b6bd582-6219-45a6-88c2-3b8f71c5f9af	String	jsonType.label
59bd55b0-282f-4122-bae6-17de7e129211	true	userinfo.token.claim
59bd55b0-282f-4122-bae6-17de7e129211	updatedAt	user.attribute
59bd55b0-282f-4122-bae6-17de7e129211	true	id.token.claim
59bd55b0-282f-4122-bae6-17de7e129211	true	access.token.claim
59bd55b0-282f-4122-bae6-17de7e129211	updated_at	claim.name
59bd55b0-282f-4122-bae6-17de7e129211	String	jsonType.label
f3507c8d-a885-4a8e-b5b2-fd80915f3f52	true	userinfo.token.claim
f3507c8d-a885-4a8e-b5b2-fd80915f3f52	email	user.attribute
f3507c8d-a885-4a8e-b5b2-fd80915f3f52	true	id.token.claim
f3507c8d-a885-4a8e-b5b2-fd80915f3f52	true	access.token.claim
f3507c8d-a885-4a8e-b5b2-fd80915f3f52	email	claim.name
f3507c8d-a885-4a8e-b5b2-fd80915f3f52	String	jsonType.label
34e700e5-e08b-4192-a087-3704bd23e67a	true	userinfo.token.claim
34e700e5-e08b-4192-a087-3704bd23e67a	emailVerified	user.attribute
34e700e5-e08b-4192-a087-3704bd23e67a	true	id.token.claim
34e700e5-e08b-4192-a087-3704bd23e67a	true	access.token.claim
34e700e5-e08b-4192-a087-3704bd23e67a	email_verified	claim.name
34e700e5-e08b-4192-a087-3704bd23e67a	boolean	jsonType.label
9b7f038b-598e-4ee3-bd7b-bd19d2a92a38	formatted	user.attribute.formatted
9b7f038b-598e-4ee3-bd7b-bd19d2a92a38	country	user.attribute.country
9b7f038b-598e-4ee3-bd7b-bd19d2a92a38	postal_code	user.attribute.postal_code
9b7f038b-598e-4ee3-bd7b-bd19d2a92a38	true	userinfo.token.claim
9b7f038b-598e-4ee3-bd7b-bd19d2a92a38	street	user.attribute.street
9b7f038b-598e-4ee3-bd7b-bd19d2a92a38	true	id.token.claim
9b7f038b-598e-4ee3-bd7b-bd19d2a92a38	region	user.attribute.region
9b7f038b-598e-4ee3-bd7b-bd19d2a92a38	true	access.token.claim
9b7f038b-598e-4ee3-bd7b-bd19d2a92a38	locality	user.attribute.locality
ec578aea-3153-4149-871d-a3197b8f7569	true	userinfo.token.claim
ec578aea-3153-4149-871d-a3197b8f7569	phoneNumber	user.attribute
ec578aea-3153-4149-871d-a3197b8f7569	true	id.token.claim
ec578aea-3153-4149-871d-a3197b8f7569	true	access.token.claim
ec578aea-3153-4149-871d-a3197b8f7569	phone_number	claim.name
ec578aea-3153-4149-871d-a3197b8f7569	String	jsonType.label
39d92e95-8fc6-4d98-a3f5-22ae9f656076	true	userinfo.token.claim
39d92e95-8fc6-4d98-a3f5-22ae9f656076	phoneNumberVerified	user.attribute
39d92e95-8fc6-4d98-a3f5-22ae9f656076	true	id.token.claim
39d92e95-8fc6-4d98-a3f5-22ae9f656076	true	access.token.claim
39d92e95-8fc6-4d98-a3f5-22ae9f656076	phone_number_verified	claim.name
39d92e95-8fc6-4d98-a3f5-22ae9f656076	boolean	jsonType.label
79520d82-7d9a-49b9-a70d-b78470d12d28	true	multivalued
79520d82-7d9a-49b9-a70d-b78470d12d28	foo	user.attribute
79520d82-7d9a-49b9-a70d-b78470d12d28	true	access.token.claim
79520d82-7d9a-49b9-a70d-b78470d12d28	realm_access.roles	claim.name
79520d82-7d9a-49b9-a70d-b78470d12d28	String	jsonType.label
623f1b6a-ecd8-4c5e-8443-23c2551754cd	true	multivalued
623f1b6a-ecd8-4c5e-8443-23c2551754cd	foo	user.attribute
623f1b6a-ecd8-4c5e-8443-23c2551754cd	true	access.token.claim
623f1b6a-ecd8-4c5e-8443-23c2551754cd	resource_access.${client_id}.roles	claim.name
623f1b6a-ecd8-4c5e-8443-23c2551754cd	String	jsonType.label
78011123-80d2-4243-8487-de3660ec16d2	true	userinfo.token.claim
78011123-80d2-4243-8487-de3660ec16d2	username	user.attribute
78011123-80d2-4243-8487-de3660ec16d2	true	id.token.claim
78011123-80d2-4243-8487-de3660ec16d2	true	access.token.claim
78011123-80d2-4243-8487-de3660ec16d2	upn	claim.name
78011123-80d2-4243-8487-de3660ec16d2	String	jsonType.label
aee5282a-e482-415e-9c42-c545423af6af	true	multivalued
aee5282a-e482-415e-9c42-c545423af6af	foo	user.attribute
aee5282a-e482-415e-9c42-c545423af6af	true	id.token.claim
aee5282a-e482-415e-9c42-c545423af6af	true	access.token.claim
aee5282a-e482-415e-9c42-c545423af6af	groups	claim.name
aee5282a-e482-415e-9c42-c545423af6af	String	jsonType.label
3a4e50f5-4da5-472d-9912-4181f0a3c17b	true	userinfo.token.claim
3a4e50f5-4da5-472d-9912-4181f0a3c17b	locale	user.attribute
3a4e50f5-4da5-472d-9912-4181f0a3c17b	true	id.token.claim
3a4e50f5-4da5-472d-9912-4181f0a3c17b	true	access.token.claim
3a4e50f5-4da5-472d-9912-4181f0a3c17b	locale	claim.name
3a4e50f5-4da5-472d-9912-4181f0a3c17b	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me) FROM stdin;
master	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	9cb9bb23-ee52-4842-9be2-9fb67204986d	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	97ee83de-9240-40e7-bf2d-56eb6d4e5862	e689a2c0-eccd-4678-87a3-59c68ff73f54	2e1af94c-4a76-4912-bd7a-fbbdad4fc93e	881618ac-55dc-440d-83a2-cadc4968c7fd	e59efb75-4679-4fab-8648-113da0183ee6	2592000	f	900	t	f	5e7d7917-c231-48f8-9596-3aefcf3a0f95	0	f	0	0
document_search_engine	60	300	300	\N	\N	\N	t	f	0	keycloak	document_search_engine	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	a9c8d6da-e662-45da-a4ab-6d1f80d48033	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	2bc2aa2d-44ef-4b60-bb5c-46fe3dbab076	e700b60d-0630-466e-a3b7-2a6df900f4b0	7edd2b4b-ddc0-498e-b225-4d0bd52a41c0	508570db-b020-4b5f-8eba-e2e0d4a99cbb	95b17b14-b451-4257-b34b-6786d4f8ec08	2592000	f	900	t	f	1900d81e-5731-4b5c-bf32-32c0793c200b	0	f	0	0
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, value, realm_id) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly		master
_browser_header.xContentTypeOptions	nosniff	master
_browser_header.xRobotsTag	none	master
_browser_header.xFrameOptions	SAMEORIGIN	master
_browser_header.contentSecurityPolicy	frame-src 'self'; frame-ancestors 'self'; object-src 'none';	master
_browser_header.xXSSProtection	1; mode=block	master
_browser_header.strictTransportSecurity	max-age=31536000; includeSubDomains	master
bruteForceProtected	false	master
permanentLockout	false	master
maxFailureWaitSeconds	900	master
minimumQuickLoginWaitSeconds	60	master
waitIncrementSeconds	60	master
quickLoginCheckMilliSeconds	1000	master
maxDeltaTimeSeconds	43200	master
failureFactor	30	master
displayName	Keycloak	master
displayNameHtml	<div class="kc-logo-text"><span>Keycloak</span></div>	master
offlineSessionMaxLifespanEnabled	false	master
offlineSessionMaxLifespan	5184000	master
clientSessionIdleTimeout	0	document_search_engine
clientSessionMaxLifespan	0	document_search_engine
clientOfflineSessionIdleTimeout	0	document_search_engine
clientOfflineSessionMaxLifespan	0	document_search_engine
displayName	Document Search Engine	document_search_engine
bruteForceProtected	false	document_search_engine
permanentLockout	false	document_search_engine
maxFailureWaitSeconds	900	document_search_engine
minimumQuickLoginWaitSeconds	60	document_search_engine
waitIncrementSeconds	60	document_search_engine
quickLoginCheckMilliSeconds	1000	document_search_engine
maxDeltaTimeSeconds	43200	document_search_engine
failureFactor	30	document_search_engine
actionTokenGeneratedByAdminLifespan	43200	document_search_engine
actionTokenGeneratedByUserLifespan	300	document_search_engine
offlineSessionMaxLifespanEnabled	false	document_search_engine
offlineSessionMaxLifespan	5184000	document_search_engine
webAuthnPolicyRpEntityName	keycloak	document_search_engine
webAuthnPolicySignatureAlgorithms	ES256	document_search_engine
webAuthnPolicyRpId		document_search_engine
webAuthnPolicyAttestationConveyancePreference	not specified	document_search_engine
webAuthnPolicyAuthenticatorAttachment	not specified	document_search_engine
webAuthnPolicyRequireResidentKey	not specified	document_search_engine
webAuthnPolicyUserVerificationRequirement	not specified	document_search_engine
webAuthnPolicyCreateTimeout	0	document_search_engine
webAuthnPolicyAvoidSameAuthenticatorRegister	false	document_search_engine
webAuthnPolicyRpEntityNamePasswordless	keycloak	document_search_engine
webAuthnPolicySignatureAlgorithmsPasswordless	ES256	document_search_engine
webAuthnPolicyRpIdPasswordless		document_search_engine
webAuthnPolicyAttestationConveyancePreferencePasswordless	not specified	document_search_engine
webAuthnPolicyAuthenticatorAttachmentPasswordless	not specified	document_search_engine
webAuthnPolicyRequireResidentKeyPasswordless	not specified	document_search_engine
webAuthnPolicyUserVerificationRequirementPasswordless	not specified	document_search_engine
webAuthnPolicyCreateTimeoutPasswordless	0	document_search_engine
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	false	document_search_engine
_browser_header.contentSecurityPolicyReportOnly		document_search_engine
_browser_header.xContentTypeOptions	nosniff	document_search_engine
_browser_header.xRobotsTag	none	document_search_engine
_browser_header.xFrameOptions	SAMEORIGIN	document_search_engine
_browser_header.contentSecurityPolicy	frame-src 'self'; frame-ancestors 'self'; object-src 'none';	document_search_engine
_browser_header.xXSSProtection	1; mode=block	document_search_engine
_browser_header.strictTransportSecurity	max-age=31536000; includeSubDomains	document_search_engine
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_default_roles; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_roles (realm_id, role_id) FROM stdin;
master	b4c4d9bf-88cd-4b42-b55f-2ed20d5932f2
master	1472ea0f-2bf5-4ec5-84fc-9dd0ecd59274
document_search_engine	d9f842ac-678e-4e6a-bf34-bc83b9b7f837
document_search_engine	2d55b1f3-cb68-46b8-a6bb-51931222aea5
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
master	jboss-logging
document_search_engine	jboss-logging
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	master
password	password	t	t	document_search_engine
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
document_search_engine	
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
c19be915-a5ec-4202-a9f5-0ce9474bed1c	/realms/master/account/*
5e7449ef-c6be-41eb-aa6a-614183502daa	/realms/master/account/*
04f1c18a-ebde-41ae-b71e-e014448a058a	/admin/master/console/*
0c410aa2-eceb-43f0-8ef4-e17c5ef04885	/realms/document_search_engine/account/*
1e3b778d-499d-479b-9c76-fcfb2113ecfa	/realms/document_search_engine/account/*
0b7676ee-20e0-4fbb-b758-774e8f149862	/admin/document_search_engine/console/*
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	*
049f4477-caa6-4519-b6cd-6529c8ad9664	*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
461f638c-757e-4701-a5e5-8da222c5ee0c	VERIFY_EMAIL	Verify Email	master	t	f	VERIFY_EMAIL	50
211ded34-7f1f-4d4e-ba18-2f8cd903e9d1	UPDATE_PROFILE	Update Profile	master	t	f	UPDATE_PROFILE	40
3f872be8-64f5-4df2-8df9-88d5ac99d76b	CONFIGURE_TOTP	Configure OTP	master	t	f	CONFIGURE_TOTP	10
2e43fb7e-20aa-45af-9e44-38dfd7513e4c	UPDATE_PASSWORD	Update Password	master	t	f	UPDATE_PASSWORD	30
25649ca6-594c-49c7-ad5b-c7f204728c39	terms_and_conditions	Terms and Conditions	master	f	f	terms_and_conditions	20
467ec8ff-923a-4a0e-9ba0-30e2f646f316	update_user_locale	Update User Locale	master	t	f	update_user_locale	1000
6ad6a866-a07a-4ca2-b3cd-7e67ce16ae02	VERIFY_EMAIL	Verify Email	document_search_engine	t	f	VERIFY_EMAIL	50
f12c8047-e209-4aa9-9533-1b61a6b46d85	UPDATE_PROFILE	Update Profile	document_search_engine	t	f	UPDATE_PROFILE	40
80e4edb4-2bf7-4a1b-a2e1-44c7f64538a0	CONFIGURE_TOTP	Configure OTP	document_search_engine	t	f	CONFIGURE_TOTP	10
4a71c95f-c15f-4f5d-8f37-4c4cf8f5c607	UPDATE_PASSWORD	Update Password	document_search_engine	t	f	UPDATE_PASSWORD	30
54ebe2c9-91c0-4cb3-91a2-f1676ac932f5	terms_and_conditions	Terms and Conditions	document_search_engine	f	f	terms_and_conditions	20
0fbe93c6-4d9e-452e-a416-2a1358e69d61	update_user_locale	Update User Locale	document_search_engine	t	f	update_user_locale	1000
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
5e7449ef-c6be-41eb-aa6a-614183502daa	4ffd4aa4-69e1-4166-a5a6-0f6a78602f80
1e3b778d-499d-479b-9c76-fcfb2113ecfa	f7dfd151-e810-4242-add9-4cc040ebf3c5
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
4427c855-7118-4863-bbfb-90dbd82f7bda	\N	170677cc-1eaa-4bb1-80e8-3965405c21de	f	t	\N	\N	\N	master	admin	1607797170348	\N	0
de191acd-c156-4c81-900d-16299abe8b42	sss4esob@gmail.com	sss4esob@gmail.com	f	t	\N	Sergio	S├ínchez S├ínchez	document_search_engine	ssanchez	1607797689604	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
b4c4d9bf-88cd-4b42-b55f-2ed20d5932f2	4427c855-7118-4863-bbfb-90dbd82f7bda
4ffd4aa4-69e1-4166-a5a6-0f6a78602f80	4427c855-7118-4863-bbfb-90dbd82f7bda
1472ea0f-2bf5-4ec5-84fc-9dd0ecd59274	4427c855-7118-4863-bbfb-90dbd82f7bda
649a34ce-4528-4640-9234-8b9ec6177506	4427c855-7118-4863-bbfb-90dbd82f7bda
2a9dd4cb-7a80-4020-99bb-a2b932714786	4427c855-7118-4863-bbfb-90dbd82f7bda
2d55b1f3-cb68-46b8-a6bb-51931222aea5	de191acd-c156-4c81-900d-16299abe8b42
eeaa9bd7-2b94-4c09-b88b-b70a786ce5d2	de191acd-c156-4c81-900d-16299abe8b42
d9f842ac-678e-4e6a-bf34-bc83b9b7f837	de191acd-c156-4c81-900d-16299abe8b42
f7dfd151-e810-4242-add9-4cc040ebf3c5	de191acd-c156-4c81-900d-16299abe8b42
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
04f1c18a-ebde-41ae-b71e-e014448a058a	+
0b7676ee-20e0-4fbb-b758-774e8f149862	+
2db1dc7b-0c8d-42b0-85c7-dc97b262d5fe	*
049f4477-caa6-4519-b6cd-6529c8ad9664	*
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: client_default_roles constr_client_default_roles; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT constr_client_default_roles PRIMARY KEY (client_id, role_id);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: realm_default_roles constraint_realm_default_roles; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT constraint_realm_default_roles PRIMARY KEY (realm_id, role_id);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client_default_roles uk_8aelwnibji49avxsrtuf6xjow; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT uk_8aelwnibji49avxsrtuf6xjow UNIQUE (role_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: realm_default_roles uk_h4wpd7w4hsoolni3h0sw7btje; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT uk_h4wpd7w4hsoolni3h0sw7btje UNIQUE (role_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_def_roles_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_def_roles_client ON public.client_default_roles USING btree (client_id);


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_def_roles_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_roles_realm ON public.realm_default_roles USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_default_roles fk_8aelwnibji49avxsrtuf6xjow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT fk_8aelwnibji49avxsrtuf6xjow FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_client fk_c_cli_scope_client; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_client FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_scope_client fk_c_cli_scope_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_role; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_role FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_roles fk_evudb1ppw84oxfax2drs03icc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT fk_evudb1ppw84oxfax2drs03icc FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: keycloak_group fk_group_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT fk_group_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_role; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_role FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_default_roles fk_h4wpd7w4hsoolni3h0sw7btje; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT fk_h4wpd7w4hsoolni3h0sw7btje FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_default_roles fk_nuilts7klwqw2h8m2b5joytky; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT fk_nuilts7klwqw2h8m2b5joytky FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_p3rh9grku11kqfrs4fltt7rnq; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_p3rh9grku11kqfrs4fltt7rnq FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: client fk_p56ctinxxb9gsk57fo49f9tac; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT fk_p56ctinxxb9gsk57fo49f9tac FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope fk_realm_cli_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT fk_realm_cli_scope FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

