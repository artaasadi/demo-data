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
-- Name: migrations; Type: TABLE; Schema: public; Owner: migrator_worker
--

CREATE TABLE public.migrations (
    id text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    additional_info text
);


ALTER TABLE public.migrations OWNER TO migrator_worker;

--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: migrator_worker
--

COPY public.migrations (id, created_at, updated_at, additional_info) FROM stdin;
inventory	2024-09-08 21:12:18.980859+00	2024-09-08 21:12:19.720347+00	pKYG2NqIfFWyQq+2sFSUdHcOgBKguGRs5qRuMlQ/xnI=
elasticsearch	2024-09-08 21:12:19.785705+00	2024-09-08 21:12:23.373832+00	GPdBafQlZ4Ax68GVunMBIx9iFSn3i1S8MWMK8WPrM90=
workspace	2024-09-08 21:12:18.377147+00	2024-09-09 12:30:06.488803+00	cu5fX3qzoPy2YAYawTVBQLeICY0ISOmDCl2HkGBg4b0=
onboard	2024-09-08 21:12:18.935176+00	2024-09-17 19:51:16.919107+00	["a0dfa856ad67d385a387ab6ecfd892057053535e","ca9d86fee68bd0b62e73da3fa6c8ea0a685bf623"]
resource_collection	2024-09-08 21:12:19.722289+00	2024-09-17 19:51:16.986606+00	["a0dfa856ad67d385a387ab6ecfd892057053535e","ca9d86fee68bd0b62e73da3fa6c8ea0a685bf623"]
compliance	2024-09-08 21:12:23.375848+00	2024-09-17 19:52:12.981464+00	["a0dfa856ad67d385a387ab6ecfd892057053535e","ca9d86fee68bd0b62e73da3fa6c8ea0a685bf623"]
analytics	2024-09-08 21:12:49.48365+00	2024-09-17 19:52:48.888619+00	["a0dfa856ad67d385a387ab6ecfd892057053535e","ca9d86fee68bd0b62e73da3fa6c8ea0a685bf623"]
\.


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: migrator_worker
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

