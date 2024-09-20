--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Debian 14.13-1.pgdg120+1)
-- Dumped by pg_dump version 14.13 (Debian 14.13-1.pgdg120+1)

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

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: credentials; Type: TABLE; Schema: public; Owner: workspace_service
--

CREATE TABLE public.credentials (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    workspace_id text NOT NULL,
    connector_type text NOT NULL,
    metadata text,
    is_created boolean DEFAULT false,
    connection_count bigint,
    single_connection boolean
);


ALTER TABLE public.credentials OWNER TO workspace_service;

--
-- Name: credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: workspace_service
--

CREATE SEQUENCE public.credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.credentials_id_seq OWNER TO workspace_service;

--
-- Name: credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: workspace_service
--

ALTER SEQUENCE public.credentials_id_seq OWNED BY public.credentials.id;


--
-- Name: master_credentials; Type: TABLE; Schema: public; Owner: workspace_service
--

CREATE TABLE public.master_credentials (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    workspace_id text NOT NULL,
    connector_type text NOT NULL,
    credential text
);


ALTER TABLE public.master_credentials OWNER TO workspace_service;

--
-- Name: master_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: workspace_service
--

CREATE SEQUENCE public.master_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.master_credentials_id_seq OWNER TO workspace_service;

--
-- Name: master_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: workspace_service
--

ALTER SEQUENCE public.master_credentials_id_seq OWNED BY public.master_credentials.id;


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: workspace_service
--

CREATE TABLE public.organizations (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    company_name text,
    url text,
    address text,
    city text,
    state text,
    country text,
    contact_phone text,
    contact_email text,
    contact_name text
);


ALTER TABLE public.organizations OWNER TO workspace_service;

--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: workspace_service
--

CREATE SEQUENCE public.organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organizations_id_seq OWNER TO workspace_service;

--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: workspace_service
--

ALTER SEQUENCE public.organizations_id_seq OWNED BY public.organizations.id;


--
-- Name: workspace_transactions; Type: TABLE; Schema: public; Owner: workspace_service
--

CREATE TABLE public.workspace_transactions (
    workspace_id text NOT NULL,
    transaction_id text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    done boolean
);


ALTER TABLE public.workspace_transactions OWNER TO workspace_service;

--
-- Name: workspaces; Type: TABLE; Schema: public; Owner: workspace_service
--

CREATE TABLE public.workspaces (
    id text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    name text,
    aws_unique_id text,
    aws_user_arn text,
    owner_id text,
    status text,
    size text,
    tier text,
    organization_id bigint,
    is_created boolean,
    is_bootstrap_input_finished boolean,
    analytics_job_id bigint,
    compliance_triggered boolean,
    open_search_endpoint text,
    pipeline_endpoint text,
    vault_key_id text
);


ALTER TABLE public.workspaces OWNER TO workspace_service;

--
-- Name: credentials id; Type: DEFAULT; Schema: public; Owner: workspace_service
--

ALTER TABLE ONLY public.credentials ALTER COLUMN id SET DEFAULT nextval('public.credentials_id_seq'::regclass);


--
-- Name: master_credentials id; Type: DEFAULT; Schema: public; Owner: workspace_service
--

ALTER TABLE ONLY public.master_credentials ALTER COLUMN id SET DEFAULT nextval('public.master_credentials_id_seq'::regclass);


--
-- Name: organizations id; Type: DEFAULT; Schema: public; Owner: workspace_service
--

ALTER TABLE ONLY public.organizations ALTER COLUMN id SET DEFAULT nextval('public.organizations_id_seq'::regclass);


--
-- Data for Name: credentials; Type: TABLE DATA; Schema: public; Owner: workspace_service
--

COPY public.credentials (id, created_at, updated_at, deleted_at, workspace_id, connector_type, metadata, is_created, connection_count, single_connection) FROM stdin;
\.


--
-- Data for Name: master_credentials; Type: TABLE DATA; Schema: public; Owner: workspace_service
--

COPY public.master_credentials (id, created_at, updated_at, deleted_at, workspace_id, connector_type, credential) FROM stdin;
\.


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: workspace_service
--

COPY public.organizations (id, created_at, updated_at, deleted_at, company_name, url, address, city, state, country, contact_phone, contact_email, contact_name) FROM stdin;
\.


--
-- Data for Name: workspace_transactions; Type: TABLE DATA; Schema: public; Owner: workspace_service
--

COPY public.workspace_transactions (workspace_id, transaction_id, created_at, updated_at, done) FROM stdin;
ws-530663329664863214	CreateMasterCredential	2024-09-08 21:06:32.606526+00	2024-09-08 21:06:32.606526+00	t
ws-530663329664863214	CreateServiceAccountRoles	2024-09-08 21:06:32.612772+00	2024-09-08 21:06:32.612772+00	t
ws-530663329664863214	EnsureCredentialOnboarded	2024-09-08 21:06:32.615502+00	2024-09-08 21:06:32.615502+00	t
ws-530663329664863214	EnsureDiscoveryFinished	2024-09-08 21:06:32.618307+00	2024-09-08 21:06:32.618307+00	t
ws-530663329664863214	EnsureJobsRunning	2024-09-08 21:06:32.621097+00	2024-09-08 21:06:32.621097+00	t
ws-530663329664863214	EnsureJobsFinished	2024-09-08 21:06:32.623886+00	2024-09-08 21:06:32.623886+00	t
ws-530663329664863214	CreateRoleBinding	2024-09-08 21:06:32.626618+00	2024-09-08 21:06:32.626619+00	t
ws-530663329664863214	CreateWorkspaceKeyId	2024-09-08 21:07:02.63712+00	2024-09-08 21:07:02.646316+00	t
ws-530663329664863214	CreateHelmRelease	2024-09-08 21:07:32.873482+00	2024-09-09 02:59:39.699195+00	t
\.


--
-- Data for Name: workspaces; Type: TABLE DATA; Schema: public; Owner: workspace_service
--

COPY public.workspaces (id, created_at, updated_at, deleted_at, name, aws_unique_id, aws_user_arn, owner_id, status, size, tier, organization_id, is_created, is_bootstrap_input_finished, analytics_job_id, compliance_triggered, open_search_endpoint, pipeline_endpoint, vault_key_id) FROM stdin;
ws-530663329664863214	2024-09-08 21:06:32.603231+00	2024-09-09 02:59:39.706849+00	\N	main	aws-uid-530663329664928750	\N	kaytu|owner|all	PROVISIONED	xs	FREE	\N	t	f	0	f			client-creds-key-ws-530663329664863214
\.


--
-- Name: credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: workspace_service
--

SELECT pg_catalog.setval('public.credentials_id_seq', 1, false);


--
-- Name: master_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: workspace_service
--

SELECT pg_catalog.setval('public.master_credentials_id_seq', 1, false);


--
-- Name: organizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: workspace_service
--

SELECT pg_catalog.setval('public.organizations_id_seq', 1, false);


--
-- Name: credentials credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: workspace_service
--

ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_pkey PRIMARY KEY (id);


--
-- Name: master_credentials master_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: workspace_service
--

ALTER TABLE ONLY public.master_credentials
    ADD CONSTRAINT master_credentials_pkey PRIMARY KEY (id);


--
-- Name: organizations organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: workspace_service
--

ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: workspace_transactions workspace_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: workspace_service
--

ALTER TABLE ONLY public.workspace_transactions
    ADD CONSTRAINT workspace_transactions_pkey PRIMARY KEY (workspace_id, transaction_id);


--
-- Name: workspaces workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: workspace_service
--

ALTER TABLE ONLY public.workspaces
    ADD CONSTRAINT workspaces_pkey PRIMARY KEY (id);


--
-- Name: idx_credentials_deleted_at; Type: INDEX; Schema: public; Owner: workspace_service
--

CREATE INDEX idx_credentials_deleted_at ON public.credentials USING btree (deleted_at);


--
-- Name: idx_master_credentials_deleted_at; Type: INDEX; Schema: public; Owner: workspace_service
--

CREATE INDEX idx_master_credentials_deleted_at ON public.master_credentials USING btree (deleted_at);


--
-- Name: idx_organizations_deleted_at; Type: INDEX; Schema: public; Owner: workspace_service
--

CREATE INDEX idx_organizations_deleted_at ON public.organizations USING btree (deleted_at);


--
-- Name: idx_workspaces_deleted_at; Type: INDEX; Schema: public; Owner: workspace_service
--

CREATE INDEX idx_workspaces_deleted_at ON public.workspaces USING btree (deleted_at);


--
-- Name: idx_workspaces_name; Type: INDEX; Schema: public; Owner: workspace_service
--

CREATE UNIQUE INDEX idx_workspaces_name ON public.workspaces USING btree (name);


--
-- Name: workspaces fk_workspaces_organization; Type: FK CONSTRAINT; Schema: public; Owner: workspace_service
--

ALTER TABLE ONLY public.workspaces
    ADD CONSTRAINT fk_workspaces_organization FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

