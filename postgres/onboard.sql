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
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


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
-- Name: connection_groups; Type: TABLE; Schema: public; Owner: onboard_service
--

CREATE TABLE public.connection_groups (
    name text NOT NULL,
    query text
);


ALTER TABLE public.connection_groups OWNER TO onboard_service;

--
-- Name: connectors; Type: TABLE; Schema: public; Owner: onboard_service
--

CREATE TABLE public.connectors (
    name text NOT NULL,
    label text,
    short_description text,
    description text,
    direction text DEFAULT 'ingress'::text,
    status text DEFAULT 'enabled'::text,
    tier text DEFAULT 'Community'::text,
    logo text DEFAULT ''::text,
    auto_onboard_support boolean DEFAULT false,
    allow_new_connections boolean DEFAULT true,
    max_connection_limit bigint DEFAULT 25,
    tags jsonb DEFAULT '{}'::jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);


ALTER TABLE public.connectors OWNER TO onboard_service;

--
-- Name: credentials; Type: TABLE; Schema: public; Owner: onboard_service
--

CREATE TABLE public.credentials (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name text,
    connector_type text NOT NULL,
    secret text,
    credential_type text,
    enabled boolean DEFAULT true,
    auto_onboard_enabled boolean DEFAULT false,
    last_health_check_time timestamp with time zone DEFAULT now() NOT NULL,
    health_status text DEFAULT 'healthy'::text NOT NULL,
    health_reason text,
    spend_discovery boolean,
    metadata jsonb DEFAULT '{}'::jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    version bigint
);


ALTER TABLE public.credentials OWNER TO onboard_service;

--
-- Name: sources; Type: TABLE; Schema: public; Owner: onboard_service
--

CREATE TABLE public.sources (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    source_id text,
    name text NOT NULL,
    email text,
    type text NOT NULL,
    description text,
    credential_id uuid,
    lifecycle_state text DEFAULT 'enabled'::text NOT NULL,
    asset_discovery_method text DEFAULT 'scheduled'::text NOT NULL,
    health_state text,
    last_health_check_time timestamp with time zone DEFAULT now() NOT NULL,
    health_reason text,
    asset_discovery boolean,
    spend_discovery boolean,
    creation_method text DEFAULT 'manual'::text NOT NULL,
    metadata jsonb DEFAULT '{}'::jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);


ALTER TABLE public.sources OWNER TO onboard_service;

--
-- Data for Name: connection_groups; Type: TABLE DATA; Schema: public; Owner: onboard_service
--

COPY public.connection_groups (name, query) FROM stdin;
\.


--
-- Data for Name: connectors; Type: TABLE DATA; Schema: public; Owner: onboard_service
--

COPY public.connectors (name, label, short_description, description, direction, status, tier, logo, auto_onboard_support, allow_new_connections, max_connection_limit, tags, created_at, updated_at, deleted_at) FROM stdin;
Azure	Microsoft Azure	Inventory 300+ Cloud Assets across assets and Subscriptions	Inventory 300+ Cloud Assets across assets and Subscriptions	ingress	enabled	Community	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/azure.svg	t	t	25	{"usage": ["Public Cloud"]}	2024-09-08 21:12:18.391503+00	2024-09-08 21:12:18.391503+00	\N
EntraID	Microsoft EntraID (previously AzureAD)	Discover Users, Identities, Apps, Service Accounts and 20+ others.	Discover Users, Identities, Apps, Service Accounts and 20+ others.	ingress	enabled	Community	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/entraid.png	t	t	25	{"usage": ["Identity Providers"]}	2024-09-08 21:12:18.392921+00	2024-09-08 21:12:18.392921+00	\N
GCP	Google Cloud (GCP)	Get visibility into 100+ cloud assets across projects.	Get visibility into 100+ cloud assets across projects.	ingress	enabled	Enterprise	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/gcp.svg	t	t	25	{"usage": ["Public Cloud"]}	2024-09-08 21:12:18.39447+00	2024-09-08 21:12:18.39447+00	\N
GitHubCloud	GitHub Cloud	Gain visibility into Repositories, Deployments, PRs and more.	Gain visibility into Repositories, Deployments, PRs and more.	ingress	enabled	Enterprise	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/github.svg	t	t	25	{"usage": ["DevOps", "Code Security"]}	2024-09-08 21:12:18.395828+00	2024-09-08 21:12:18.395828+00	\N
GitLabCloud	Gitlab Cloud	Gain visibility into Projects, MRs, Issues, repositories and 50+ more	Gain visibility into Projects, MRs, Issues, repositories and 50+ more	ingress	enabled	Enterprise	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/gitlab.svg	t	t	25	{"usage": ["DevOps", "Code Security"]}	2024-09-08 21:12:18.397114+00	2024-09-08 21:12:18.397114+00	\N
Gitguardian	Gitguardian	With Gitguardian, you can gain visibility to incidents and repos with secret leaks	With Gitguardian, you can gain visibility to incidents and repos with secret leaks	ingress	enabled	Enterprise	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/gitguardian.png	f	t	25	{"usage": ["Code Security"]}	2024-09-08 21:12:18.39843+00	2024-09-08 21:12:18.39843+00	\N
JIRACloud	JIRA Cloud	Connect to JIRA and gain visibility to tickets, projects, and 10+ more	Connect to JIRA and gain visibility to tickets, projects, and 10+ more	ingress	enabled	Enterprise	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/jira.svg	f	t	25	{"usage": ["General"]}	2024-09-08 21:12:18.399692+00	2024-09-08 21:12:18.399692+00	\N
ServiceNow	ServiceNow	With ServiceNow, connect CMDBs, Incidents, Tickets, and changes	With ServiceNow, connect CMDBs, Incidents, Tickets, and changes	ingress	enabled	Enterprise	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/servicenow.png	t	t	25	{"usage": ["General"]}	2024-09-08 21:12:18.401026+00	2024-09-08 21:12:18.401026+00	\N
Cloudflare	Cloudflare	Gain visibility in to Domains, DNS, WAFs, Firewall Rules, Workers and more.	Gain visibility in to Domains, DNS, WAFs, Firewall Rules, Workers and more.	ingress	enabled	Enterprise	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/cloudflare.svg	t	t	25	{"usage": ["Web Security"]}	2024-09-08 21:12:18.402359+00	2024-09-08 21:12:18.402359+00	\N
DatadogInfraMonitoring	Datadog Infrastructure Monitoring	Discover Hosts, VMs, Networks, Tanzu Kubernetes Grid and More	Discover Hosts, VMs, Networks, Tanzu Kubernetes Grid and More	ingress	enabled	Enterprise	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/datadog.svg	f	t	25	{"usage": ["Monitoring"]}	2024-09-08 21:12:18.403605+00	2024-09-08 21:12:18.403605+00	\N
PrismaCloud	Palo Alto (Prisma) Cloud Security	Track Cloud security issues.	Track Cloud security issues.	ingress	enabled	Enterprise	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/pan.svg	f	t	25	{"usage": ["Cloud Security"]}	2024-09-08 21:12:18.40501+00	2024-09-08 21:12:18.40501+00	\N
AnsibleTower	Ansible Tower	Discover Inventory, Playbooks, Jobs and more.	Discover Inventory, Playbooks, Jobs and more.	ingress	enabled	Enterprise		f	t	25	{"usage": ["General"]}	2024-09-08 21:12:18.406446+00	2024-09-08 21:12:18.406446+00	\N
ChainguardDev	chainguard.dev	Inventory Registries, Vulnerabilities, and reports.	Inventory Registries, Vulnerabilities, and reports.	ingress	enabled	Enterprise	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/chainguard.svg	f	t	25	{"usage": ["Containers"]}	2024-09-08 21:12:18.407819+00	2024-09-08 21:12:18.407819+00	\N
Snyk	Snyk	Gain visibility into Snyk's SAST & SCA capabilities.	Gain visibility into Snyk's SAST & SCA capabilities.	ingress	enabled	Enterprise	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/snyk.svg	t	t	25	{"usage": ["Code Security", "Application Security", "Containers"]}	2024-09-08 21:12:18.409175+00	2024-09-08 21:12:18.409175+00	\N
Okta	Okta	Discover Okta Users & Identities.	Discover Okta Users & Identities.	ingress	enabled	Enterprise	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/okta.svg	t	t	25	{"usage": ["Identity Providers", "Identity Security"]}	2024-09-08 21:12:18.410508+00	2024-09-08 21:12:18.410508+00	\N
SonatypeNexus	Sonatype Nexus Repository	Discover binaries and build artifacts across your software supply chain.	Discover binaries and build artifacts across your software supply chain.	ingress	enabled	Enterprise	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/sonatype-nexus.svg	f	t	25	{"usage": ["Code Security"]}	2024-09-08 21:12:18.411801+00	2024-09-08 21:12:18.411801+00	\N
CustomWebhook	Custom Webhook	Trigger events, flows, based on compliance policies & events.	Trigger events, flows, based on compliance policies & events.	ingress	enabled	Enterprise		f	t	25	{"usage": ["General"]}	2024-09-08 21:12:18.413102+00	2024-09-08 21:12:18.413102+00	\N
Checkmarx	Checkmarx	Track DAST Scan Results, Projects, Risks and more	Track DAST Scan Results, Projects, Risks and more	ingress	enabled	Enterprise		f	t	25	{"usage": ["Application Security"]}	2024-09-08 21:12:18.474159+00	2024-09-08 21:12:18.474159+00	\N
AzureDevOps	Azure DevOps Cloud	Discover Projects, Repositories, Issues, Deployment Artifacts, Merge Requests and more	Discover Projects, Repositories, Issues, Deployment Artifacts, Merge Requests and more	ingress	enabled	Enterprise	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/azure-devops.svg	t	t	25	{"usage": ["DevOps"]}	2024-09-08 21:12:18.475687+00	2024-09-08 21:12:18.475687+00	\N
BlackduckSCA	Blackduck SCA	Track security, quality, and license compliance risks from projects.	Track security, quality, and license compliance risks from projects.	ingress	enabled	Enterprise		f	t	25	{"usage": ["Code Security"]}	2024-09-08 21:12:18.476969+00	2024-09-08 21:12:18.476969+00	\N
CrowdStrikeFalcon	CrowdStrike Falcon	Tracks Hosts, devices, and associated vulnerabilities	Tracks Hosts, devices, and associated vulnerabilities	ingress	enabled	Enterprise	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/crowdstrike-falcon.svg	f	t	25	{"usage": ["Endpoint Security"]}	2024-09-08 21:12:18.478387+00	2024-09-08 21:12:18.478387+00	\N
AWS	Amazon Web Services (AWS)	Get visibility into 500+ cloud assets across regions and accounts.	Get visibility into 500+ cloud assets across regions and accounts.	ingress	enabled	Community	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/aws.svg	t	t	25	{"usage": ["Public Cloud"]}	2024-09-08 21:12:18.38923+00	2024-09-08 21:12:18.38923+00	\N
DefenderEndpoints	Microsoft Defender for Endpoints	Inventory devices, alerts, scores, alerts, and more	Inventory devices, alerts, scores, alerts, and more	ingress	enabled	Enterprise	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/microsoft-defender.svg	f	t	25	{"usage": ["Endpoint Security"]}	2024-09-08 21:12:18.479901+00	2024-09-08 21:12:18.479901+00	\N
MicrosoftIntune	Microsoft Intune (MDM)	Track devices, policies, protection status and more.	Track devices, policies, protection status and more.	ingress	enabled	Enterprise		f	t	25	{"usage": ["Device Management"]}	2024-09-08 21:12:18.481299+00	2024-09-08 21:12:18.481299+00	\N
InvictiEnterprise	invicti Enterprise	Invicti Cloud API integration discovers agents, accounts, issues, scans and vulnerabilities.	Invicti Cloud API integration discovers agents, accounts, issues, scans and vulnerabilities.	ingress	enabled	Enterprise		f	t	25	{"usage": ["Web Security"]}	2024-09-08 21:12:18.482489+00	2024-09-08 21:12:18.482489+00	\N
VMWarePrivateCloud	VMWare Private Cloud (vSphere)	Discover Hosts, VMs, Networks, Tanzu Kubernetes Grid and More	Discover Hosts, VMs, Networks, Tanzu Kubernetes Grid and More	ingress	enabled	Enterprise	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/vmware.svg	f	t	25	{"usage": ["General"]}	2024-09-08 21:12:18.484125+00	2024-09-08 21:12:18.484125+00	\N
Rubrik	Rubrik	Discover protects Hosts, Clusters, and Databases	Discover protects Hosts, Clusters, and Databases	ingress	enabled	Enterprise		f	t	25	{"usage": ["Data Security"]}	2024-09-08 21:12:18.485653+00	2024-09-08 21:12:18.485653+00	\N
CommVault	CommVault	Track Protected/goverances Databases, File Shares, and more.	Track Protected/goverances Databases, File Shares, and more.	ingress	enabled	Enterprise		f	t	25	{"usage": ["Data Security"]}	2024-09-08 21:12:18.487012+00	2024-09-08 21:12:18.487012+00	\N
BitBucketCloud	BitBucket Cloud	Discover Code Repos, Pipelines, Runners, Pull requests and more	Discover Code Repos, Pipelines, Runners, Pull requests and more	ingress	enabled	Enterprise	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/bitbucket.svg	f	t	25	{"usage": ["DevOps", "Other"]}	2024-09-08 21:12:18.488275+00	2024-09-08 21:12:18.488275+00	\N
Veracode	Veracode	Inventory goverend repos, scans, findings and more.	Inventory goverend repos, scans, findings and more.	ingress	enabled	Enterprise		f	t	25	{"usage": ["Code Security"]}	2024-09-08 21:12:18.489607+00	2024-09-08 21:12:18.489607+00	\N
SplunkES	Splunk Enterprise Security	With Splunk Enterprise API, get insights in to workloads, apps, and threats.	With Splunk Enterprise API, get insights in to workloads, apps, and threats.	ingress	enabled	Enterprise		f	t	25	{"usage": ["Cloud Security"]}	2024-09-08 21:12:18.491206+00	2024-09-08 21:12:18.491206+00	\N
MicrosoftSentinel	Microsoft Sentinel	Discover Alert, Incidents, Entities, and more	Discover Alert, Incidents, Entities, and more	ingress	enabled	Enterprise		f	t	25	{"usage": ["SIEM"]}	2024-09-08 21:12:18.492684+00	2024-09-08 21:12:18.492684+00	\N
Godaddy	Godaddy	Discover Certificates, domains, status more	Discover Certificates, domains, status more	ingress	enabled	Enterprise		f	t	25	{"usage": ["General"]}	2024-09-08 21:12:18.493913+00	2024-09-08 21:12:18.493913+00	\N
Rapid7InsightIDR	Rapid7 InsightIDR (SIEM)	Discover assets, alerts, assets, configuration	Discover assets, alerts, assets, configuration	ingress	enabled	Enterprise		f	t	25	{"usage": ["SIEM"]}	2024-09-08 21:12:18.495095+00	2024-09-08 21:12:18.495095+00	\N
DatadogCloudSIEM	Datadog Cloud SIEM	Discover security threats in cloud environments.	Discover security threats in cloud environments.	ingress	enabled	Enterprise	https://raw.githubusercontent.com/kaytu-io/website/main/connectors/icons/datadog.svg	f	t	25	{"usage": ["Cloud Security", "SIEM"]}	2024-09-08 21:12:18.496639+00	2024-09-08 21:12:18.496639+00	\N
GoogleWorkspaces	Google Workspaces	Inventory and govern Identities, Users, and Groups	Inventory and govern Identities, Users, and Groups	ingress	enabled	Enterprise		f	t	25	{"usage": ["Identity Providers", "Identity Security"]}	2024-09-08 21:12:18.4982+00	2024-09-08 21:12:18.4982+00	\N
Wiz	Wiz.io	Cloud Events, Alerts, and others	Cloud Events, Alerts, and others	ingress	enabled	Enterprise		f	t	25	{"usage": ["Cloud Security"]}	2024-09-08 21:12:18.499505+00	2024-09-08 21:12:18.499505+00	\N
Snowflake	Snowflake	Discover Databases, Tables, and more	Discover Databases, Tables, and more	ingress	enabled	Enterprise		f	t	25	{"usage": ["Data Clouds"]}	2024-09-08 21:12:18.500706+00	2024-09-08 21:12:18.500706+00	\N
IntruderIO	intruder.io	Discover Vulnerabilities for network	Discover Vulnerabilities for network	ingress	enabled	Enterprise		f	t	25	{"usage": ["Web Security", "Application Security"]}	2024-09-08 21:12:18.502038+00	2024-09-08 21:12:18.502038+00	\N
CobaltIO	Cobalt.io	See Assets, Findings, Scans, and Events	See Assets, Findings, Scans, and Events	ingress	enabled	Enterprise		f	t	25	{"usage": ["Web Security"]}	2024-09-08 21:12:18.503279+00	2024-09-08 21:12:18.503279+00	\N
AppDynamicsSaaS	Cisco AppDynamics (SaaS)	Inventory, Apps, nodes, Tiers, Health Rules and more	Inventory, Apps, nodes, Tiers, Health Rules and more	ingress	enabled	Enterprise		f	t	25	{"usage": ["Monitoring", "DevOps"]}	2024-09-08 21:12:18.504583+00	2024-09-08 21:12:18.504583+00	\N
CiscoDuo	Cisco Duo	Track MFA, Identities, Policies and more	Track MFA, Identities, Policies and more	ingress	enabled	Enterprise		f	t	25	{"usage": ["Identity Providers", "Identity Security"]}	2024-09-08 21:12:18.505901+00	2024-09-08 21:12:18.505901+00	\N
CiscoMeraki	Cisco Meraki	Inventory Networks, Gateways, Radios, and more	Inventory Networks, Gateways, Radios, and more	ingress	enabled	Enterprise		f	t	25	{"usage": ["Network Management"]}	2024-09-08 21:12:18.507304+00	2024-09-08 21:12:18.507304+00	\N
Jamf	Jamf	See Devices, Configurations, Policies, and more	See Devices, Configurations, Policies, and more	ingress	enabled	Enterprise		f	t	25	{"usage": ["Device Management"]}	2024-09-08 21:12:18.508521+00	2024-09-08 21:12:18.508521+00	\N
CyberArkPAM	CyberArk Privileged Access Manager	Inventory accounts, systems, requests, and sessions.	Inventory accounts, systems, requests, and sessions.	ingress	enabled	Enterprise		f	t	25	{"usage": ["Identity Security"]}	2024-09-08 21:12:18.509758+00	2024-09-08 21:12:18.509758+00	\N
SonarQube	SonarQube	Discover applications, Issuess, code repos	Discover applications, Issuess, code repos	ingress	enabled	Enterprise		f	t	25	{"usage": ["Code Security"]}	2024-09-08 21:12:18.510993+00	2024-09-08 21:12:18.510993+00	\N
CarbonBlackXDR	Carbon Black Cloud EDR	Track Threat Reports, Fees, and Alerts	Track Threat Reports, Fees, and Alerts	ingress	enabled	Enterprise		f	t	25	{"usage": ["Endpoint Security"]}	2024-09-08 21:12:18.512267+00	2024-09-08 21:12:18.512267+00	\N
\.


--
-- Data for Name: credentials; Type: TABLE DATA; Schema: public; Owner: onboard_service
--

COPY public.credentials (id, name, connector_type, secret, credential_type, enabled, auto_onboard_enabled, last_health_check_time, health_status, health_reason, spend_discovery, metadata, created_at, updated_at, deleted_at, version) FROM stdin;
29dd8262-2cfc-4063-aee9-08fa4b71a983	o-cb78sov3h0	AWS	aJWsWjIZqqXuRArJcb+ywYP0yfYIgLlrdRUUtkel2ZOeFo/QDwAlAdjxA/l/A6Cgkd49G8nMwuJaCJ3tYLj1dAvO9LTNMa9pIwUT7V5Xz8+QAqHDBEcnrQ0Mc1FebY0Q+jdEb2wYUiTREOV9L2S7vz3hbC1l+o6SXWeZ66UhR9bZgYojw2TvQHeEboF8LcU8AURSZu8PAzfdm3N9hzlGBOBKlzlddmvrw0UZP2MLyDrb9ADUhS2EAaBrqZSFpAuXopQVthTKk2AB	manual-aws-org	t	t	2024-09-20 10:23:06.222965+00	healthy		t	{"account_id": "061051223057", "iam_user_name": null, "organization_id": "o-cb78sov3h0", "attached_policies": null, "iam_api_key_creation_date": "0001-01-01T00:00:00Z", "organization_master_account_id": "061051223057", "organization_master_account_email": "crito@mit.edu", "organization_discovered_account_count": 7}	2024-09-09 15:17:00.37584+00	2024-09-20 10:23:06.223342+00	\N	2
ff69d6fb-b871-4522-a150-3290e50bf24c	kaytu.io	Azure	wHZJb2EgeOGJMffxyquVe3B0RkAzjF1WPCLtPrbZoLsqxedcmyn5I1tVnXSzE8aNtXf0lejWr5e4eAAMFExp3pEKxU4OqUF42+89Vp7Krluojhs8HvttYeNUZU5jnXKMlCD1wx54Ln7WogIuTR/hjOr10Cz99F2Fa/EoOgTdqM+8DxWm7/4ReoxKPg4udvv7+0cKJmTy8w+Y8NLNlHW7HFyCUNjee/6g9AGxX1h4Gcp+hRbuqHKCyw+RBE/eU+FcN91OrLOR5HTtEZFK5t5hqZfH0movnwhogEi9j21CKF6OQRXOM4S5MkOoU5kh	manual-azure-spn	t	t	2024-09-20 11:23:33.42886+00	healthy		\N	{"spn_name": "Kaytu Demo Onboarding", "client_id": "08618331-3f87-4d97-bbe0-e3c4f06ae3cb", "object_id": "543854df-16cc-446f-93be-ce46ff989db6", "secret_id": "", "tenant_id": "4725ad3d-5ab0-4f42-8a4a-fdee5ef586c5", "default_domain": "kaytu.io", "secret_expiration_date": "0001-01-01T00:00:00Z"}	2024-09-17 01:57:51.497188+00	2024-09-20 11:23:33.429573+00	\N	0
\.


--
-- Data for Name: sources; Type: TABLE DATA; Schema: public; Owner: onboard_service
--

COPY public.sources (id, source_id, name, email, type, description, credential_id, lifecycle_state, asset_discovery_method, health_state, last_health_check_time, health_reason, asset_discovery, spend_discovery, creation_method, metadata, created_at, updated_at, deleted_at) FROM stdin;
eac603b7-8645-464d-b370-d82fc169654f	640168436364	account4		AWS	Auto onboarded account 640168436364	29dd8262-2cfc-4063-aee9-08fa4b71a983	ONBOARD	scheduled	healthy	2024-09-20 10:23:00.563546+00		t	t	auto-onboard	{"account_id": "640168436364", "account_name": "account4", "account_type": "organization_member", "account_organization": {"Id": "o-cb78sov3h0", "Arn": "arn:aws:organizations::061051223057:organization/o-cb78sov3h0", "FeatureSet": "ALL", "MasterAccountId": "061051223057", "MasterAccountArn": "arn:aws:organizations::061051223057:account/o-cb78sov3h0/061051223057", "MasterAccountEmail": "crito@mit.edu", "AvailablePolicyTypes": [{"Type": "SERVICE_CONTROL_POLICY", "Status": "ENABLED"}]}, "organization_account": {"Id": "640168436364", "Arn": "arn:aws:organizations::061051223057:account/o-cb78sov3h0/640168436364", "Name": "account4", "Email": "aws.account4@aws.vftable.com", "Status": "ACTIVE", "JoinedMethod": "CREATED", "JoinedTimestamp": "2024-08-27T01:03:18.05Z"}}	2024-09-09 15:17:01.15851+00	2024-09-20 10:23:00.563985+00	\N
be417885-4ab6-4dee-aa24-53084f564280	982534389021	dev-account1		AWS	Auto onboarded account 982534389021	29dd8262-2cfc-4063-aee9-08fa4b71a983	ONBOARD	scheduled	healthy	2024-09-20 10:23:01.167178+00		t	t	auto-onboard	{"account_id": "982534389021", "account_name": "dev-account1", "account_type": "organization_member", "account_organization": {"Id": "o-cb78sov3h0", "Arn": "arn:aws:organizations::061051223057:organization/o-cb78sov3h0", "FeatureSet": "ALL", "MasterAccountId": "061051223057", "MasterAccountArn": "arn:aws:organizations::061051223057:account/o-cb78sov3h0/061051223057", "MasterAccountEmail": "crito@mit.edu", "AvailablePolicyTypes": [{"Type": "SERVICE_CONTROL_POLICY", "Status": "ENABLED"}]}, "organization_account": {"Id": "982534389021", "Arn": "arn:aws:organizations::061051223057:account/o-cb78sov3h0/982534389021", "Name": "dev-account1", "Email": "dev-account1@vftable.com", "Status": "ACTIVE", "JoinedMethod": "CREATED", "JoinedTimestamp": "2024-08-27T01:01:56.575Z"}}	2024-09-09 15:17:01.556109+00	2024-09-20 10:23:01.167632+00	\N
8307d348-3f07-4954-9fbc-2c1fe28f13a6	221082181411	account2		AWS	Auto onboarded account 221082181411	29dd8262-2cfc-4063-aee9-08fa4b71a983	ONBOARD	scheduled	healthy	2024-09-20 10:23:04.490379+00		t	t	auto-onboard	{"account_id": "221082181411", "account_name": "account2", "account_type": "organization_member", "organization_tags": {"env": "unknown"}, "account_organization": {"Id": "o-cb78sov3h0", "Arn": "arn:aws:organizations::061051223057:organization/o-cb78sov3h0", "FeatureSet": "ALL", "MasterAccountId": "061051223057", "MasterAccountArn": "arn:aws:organizations::061051223057:account/o-cb78sov3h0/061051223057", "MasterAccountEmail": "crito@mit.edu", "AvailablePolicyTypes": [{"Type": "SERVICE_CONTROL_POLICY", "Status": "ENABLED"}]}, "organization_account": {"Id": "221082181411", "Arn": "arn:aws:organizations::061051223057:account/o-cb78sov3h0/221082181411", "Name": "account2", "Email": "dev-account@vftable.com", "Status": "ACTIVE", "JoinedMethod": "CREATED", "JoinedTimestamp": "2024-08-27T01:02:14.887Z"}}	2024-09-09 15:17:02.122633+00	2024-09-20 10:23:04.490768+00	\N
19ab1d34-67ba-4f57-bca5-25c0ef7d0ec5	390402535284	account1		AWS	Auto onboarded account 390402535284	29dd8262-2cfc-4063-aee9-08fa4b71a983	ONBOARD	scheduled	healthy	2024-09-20 10:23:05.777872+00		t	t	auto-onboard	{"account_id": "390402535284", "account_name": "account1", "account_type": "organization_member", "organization_tags": {"env": "prod"}, "account_organization": {"Id": "o-cb78sov3h0", "Arn": "arn:aws:organizations::061051223057:organization/o-cb78sov3h0", "FeatureSet": "ALL", "MasterAccountId": "061051223057", "MasterAccountArn": "arn:aws:organizations::061051223057:account/o-cb78sov3h0/061051223057", "MasterAccountEmail": "crito@mit.edu", "AvailablePolicyTypes": [{"Type": "SERVICE_CONTROL_POLICY", "Status": "ENABLED"}]}, "organization_account": {"Id": "390402535284", "Arn": "arn:aws:organizations::061051223057:account/o-cb78sov3h0/390402535284", "Name": "account1", "Email": "aws.account1@vftable.com", "Status": "ACTIVE", "JoinedMethod": "CREATED", "JoinedTimestamp": "2024-08-27T01:03:47.411Z"}}	2024-09-09 15:17:01.938288+00	2024-09-20 10:23:05.778291+00	\N
0d1f8069-9a50-4ba2-aa44-d1c1078b4885	676206912368	account5		AWS	Auto onboarded account 676206912368	29dd8262-2cfc-4063-aee9-08fa4b71a983	ONBOARD	scheduled	healthy	2024-09-20 10:23:03.302069+00		t	t	auto-onboard	{"account_id": "676206912368", "account_name": "account5", "account_type": "organization_member", "account_organization": {"Id": "o-cb78sov3h0", "Arn": "arn:aws:organizations::061051223057:organization/o-cb78sov3h0", "FeatureSet": "ALL", "MasterAccountId": "061051223057", "MasterAccountArn": "arn:aws:organizations::061051223057:account/o-cb78sov3h0/061051223057", "MasterAccountEmail": "crito@mit.edu", "AvailablePolicyTypes": [{"Type": "SERVICE_CONTROL_POLICY", "Status": "ENABLED"}]}, "organization_account": {"Id": "676206912368", "Arn": "arn:aws:organizations::061051223057:account/o-cb78sov3h0/676206912368", "Name": "account5", "Email": "aws.account5@vftable.com", "Status": "ACTIVE", "JoinedMethod": "CREATED", "JoinedTimestamp": "2024-08-27T01:04:08.58Z"}}	2024-09-09 15:17:01.349346+00	2024-09-20 10:23:03.302496+00	\N
9c0f80e4-61da-4c3b-b4ba-95f4eabab3cc	df34e0ad-fb1f-4b54-9686-bbcaba2a82fb	Sample Sub 1		Azure	Auto on-boarded subscription df34e0ad-fb1f-4b54-9686-bbcaba2a82fb	ff69d6fb-b871-4522-a150-3290e50bf24c	ONBOARD	scheduled	unhealthy	2024-09-20 11:23:31.984889+00	Failed to find read permission	f	f	auto-onboard	{"tenant_id": "4725ad3d-5ab0-4f42-8a4a-fdee5ef586c5", "subscription_id": "df34e0ad-fb1f-4b54-9686-bbcaba2a82fb", "subscription_tags": {}, "subscription_model": {"id": "/subscriptions/df34e0ad-fb1f-4b54-9686-bbcaba2a82fb", "state": "Enabled", "displayName": "Sample Sub 1", "subscriptionId": "df34e0ad-fb1f-4b54-9686-bbcaba2a82fb", "authorizationSource": "RoleBased", "subscriptionPolicies": {"quotaId": "PayAsYouGo_2014-09-01", "spendingLimit": "Off", "locationPlacementId": "Public_2014-09-01"}}}	2024-09-17 01:57:53.17874+00	2024-09-20 11:23:31.985351+00	\N
a448e76e-559c-4210-83a3-f94a9702e823	75b0a9a9-3222-4290-bdf9-56127d550563	Policy Testing Subscription		Azure	Auto on-boarded subscription 75b0a9a9-3222-4290-bdf9-56127d550563	ff69d6fb-b871-4522-a150-3290e50bf24c	ONBOARD	scheduled	unhealthy	2024-09-20 11:23:34.057697+00	Failed to find read permission	f	f	auto-onboard	{"tenant_id": "4725ad3d-5ab0-4f42-8a4a-fdee5ef586c5", "subscription_id": "75b0a9a9-3222-4290-bdf9-56127d550563", "subscription_tags": {"env": ["Sandbox", "new"], "test": ["true"], "testkey": ["testvalue"], "environment": ["production"]}, "subscription_model": {"id": "/subscriptions/75b0a9a9-3222-4290-bdf9-56127d550563", "state": "Enabled", "displayName": "Policy Testing Subscription", "subscriptionId": "75b0a9a9-3222-4290-bdf9-56127d550563", "authorizationSource": "RoleBased", "subscriptionPolicies": {"quotaId": "PayAsYouGo_2014-09-01", "spendingLimit": "Off", "locationPlacementId": "Public_2014-09-01"}}}	2024-09-17 01:57:52.903894+00	2024-09-20 11:23:34.058197+00	\N
84d1a055-1f28-4e11-a5c9-89315739c7f8	314146296564	account3		AWS	Auto onboarded account 314146296564	29dd8262-2cfc-4063-aee9-08fa4b71a983	ONBOARD	scheduled	healthy	2024-09-20 10:23:03.909419+00		t	t	auto-onboard	{"account_id": "314146296564", "account_name": "account3", "account_type": "organization_member", "organization_tags": {"env": "staging"}, "account_organization": {"Id": "o-cb78sov3h0", "Arn": "arn:aws:organizations::061051223057:organization/o-cb78sov3h0", "FeatureSet": "ALL", "MasterAccountId": "061051223057", "MasterAccountArn": "arn:aws:organizations::061051223057:account/o-cb78sov3h0/061051223057", "MasterAccountEmail": "crito@mit.edu", "AvailablePolicyTypes": [{"Type": "SERVICE_CONTROL_POLICY", "Status": "ENABLED"}]}, "organization_account": {"Id": "314146296564", "Arn": "arn:aws:organizations::061051223057:account/o-cb78sov3h0/314146296564", "Name": "account3", "Email": "account3@vftable.com", "Status": "ACTIVE", "JoinedMethod": "CREATED", "JoinedTimestamp": "2024-08-27T01:03:02.196Z"}}	2024-09-09 15:17:01.771045+00	2024-09-20 10:23:03.909835+00	\N
cf06b38f-8a62-4e02-873a-c3b68e92c7a8	061051223057	mitsandboxaccount		AWS	Auto onboarded account 061051223057	29dd8262-2cfc-4063-aee9-08fa4b71a983	ONBOARD	scheduled	healthy	2024-09-20 10:23:06.376808+00		t	t	auto-onboard	{"account_id": "061051223057", "account_name": "mitsandboxaccount", "account_type": "organization_manager", "organization_tags": {"new-tag": "saleh"}, "account_organization": {"Id": "o-cb78sov3h0", "Arn": "arn:aws:organizations::061051223057:organization/o-cb78sov3h0", "FeatureSet": "ALL", "MasterAccountId": "061051223057", "MasterAccountArn": "arn:aws:organizations::061051223057:account/o-cb78sov3h0/061051223057", "MasterAccountEmail": "crito@mit.edu", "AvailablePolicyTypes": [{"Type": "SERVICE_CONTROL_POLICY", "Status": "ENABLED"}]}, "organization_account": {"Id": "061051223057", "Arn": "arn:aws:organizations::061051223057:account/o-cb78sov3h0/061051223057", "Name": "mitsandboxaccount", "Email": "crito@mit.edu", "Status": "ACTIVE", "JoinedMethod": "INVITED", "JoinedTimestamp": "2024-08-22T14:19:44.95Z"}}	2024-09-09 15:17:00.963935+00	2024-09-20 10:23:06.377239+00	\N
\.


--
-- Name: connection_groups connection_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: onboard_service
--

ALTER TABLE ONLY public.connection_groups
    ADD CONSTRAINT connection_groups_pkey PRIMARY KEY (name);


--
-- Name: connectors connectors_pkey; Type: CONSTRAINT; Schema: public; Owner: onboard_service
--

ALTER TABLE ONLY public.connectors
    ADD CONSTRAINT connectors_pkey PRIMARY KEY (name);


--
-- Name: credentials credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: onboard_service
--

ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_pkey PRIMARY KEY (id);


--
-- Name: sources idx_sources_source_id; Type: CONSTRAINT; Schema: public; Owner: onboard_service
--

ALTER TABLE ONLY public.sources
    ADD CONSTRAINT idx_sources_source_id UNIQUE (source_id);


--
-- Name: sources sources_pkey; Type: CONSTRAINT; Schema: public; Owner: onboard_service
--

ALTER TABLE ONLY public.sources
    ADD CONSTRAINT sources_pkey PRIMARY KEY (id);


--
-- Name: idx_connectors_deleted_at; Type: INDEX; Schema: public; Owner: onboard_service
--

CREATE INDEX idx_connectors_deleted_at ON public.connectors USING btree (deleted_at);


--
-- Name: idx_credentials_deleted_at; Type: INDEX; Schema: public; Owner: onboard_service
--

CREATE INDEX idx_credentials_deleted_at ON public.credentials USING btree (deleted_at);


--
-- Name: idx_source_id; Type: INDEX; Schema: public; Owner: onboard_service
--

CREATE UNIQUE INDEX idx_source_id ON public.sources USING btree (source_id);


--
-- Name: idx_sources_deleted_at; Type: INDEX; Schema: public; Owner: onboard_service
--

CREATE INDEX idx_sources_deleted_at ON public.sources USING btree (deleted_at);


--
-- Name: sources fk_sources_connector; Type: FK CONSTRAINT; Schema: public; Owner: onboard_service
--

ALTER TABLE ONLY public.sources
    ADD CONSTRAINT fk_sources_connector FOREIGN KEY (type) REFERENCES public.connectors(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: sources fk_sources_credential; Type: FK CONSTRAINT; Schema: public; Owner: onboard_service
--

ALTER TABLE ONLY public.sources
    ADD CONSTRAINT fk_sources_credential FOREIGN KEY (credential_id) REFERENCES public.credentials(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

