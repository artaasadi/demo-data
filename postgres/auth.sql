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


--
-- Name: api_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: auth_service
--

CREATE SEQUENCE public.api_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_keys_id_seq OWNER TO auth_service;

--
-- Name: configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: auth_service
--

CREATE SEQUENCE public.configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.configurations_id_seq OWNER TO auth_service;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: auth_service
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO auth_service;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: workspace_maps; Type: TABLE; Schema: public; Owner: auth_service
--

CREATE TABLE public.workspace_maps (
    id text NOT NULL,
    name text
);


ALTER TABLE public.workspace_maps OWNER TO auth_service;

--
-- Data for Name: workspace_maps; Type: TABLE DATA; Schema: public; Owner: auth_service
--

COPY public.workspace_maps (id, name) FROM stdin;
ws-530663329664863214	main
\.


--
-- Name: api_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auth_service
--

SELECT pg_catalog.setval('public.api_keys_id_seq', 4, true);


--
-- Name: configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auth_service
--

SELECT pg_catalog.setval('public.configurations_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auth_service
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: workspace_maps workspace_maps_pkey; Type: CONSTRAINT; Schema: public; Owner: auth_service
--

ALTER TABLE ONLY public.workspace_maps
    ADD CONSTRAINT workspace_maps_pkey PRIMARY KEY (id);


--
-- Name: idx_workspace_maps_name; Type: INDEX; Schema: public; Owner: auth_service
--

CREATE INDEX idx_workspace_maps_name ON public.workspace_maps USING btree (name);


--
-- PostgreSQL database dump complete
--

