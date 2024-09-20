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
-- Name: ingestion_jobs; Type: TABLE; Schema: public; Owner: pennywise_service
--

CREATE TABLE public.ingestion_jobs (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    provider character varying(16) NOT NULL,
    location character varying(100) NOT NULL,
    service character varying(100) NOT NULL,
    status character varying(16) NOT NULL,
    error_msg character varying(500)
);


ALTER TABLE public.ingestion_jobs OWNER TO pennywise_service;

--
-- Name: ingestion_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: pennywise_service
--

CREATE SEQUENCE public.ingestion_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingestion_jobs_id_seq OWNER TO pennywise_service;

--
-- Name: ingestion_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pennywise_service
--

ALTER SEQUENCE public.ingestion_jobs_id_seq OWNED BY public.ingestion_jobs.id;


--
-- Name: pricing_migrations; Type: TABLE; Schema: public; Owner: pennywise_service
--

CREATE TABLE public.pricing_migrations (
    id bigint NOT NULL,
    version character varying(255) NOT NULL
);


ALTER TABLE public.pricing_migrations OWNER TO pennywise_service;

--
-- Name: pricing_product_prices; Type: TABLE; Schema: public; Owner: pennywise_service
--

CREATE TABLE public.pricing_product_prices (
    id integer NOT NULL,
    product_id integer NOT NULL,
    hash character varying(32) NOT NULL,
    currency character varying(16) NOT NULL,
    unit character varying(255) NOT NULL,
    price numeric(24,10) NOT NULL,
    attributes json NOT NULL
);


ALTER TABLE public.pricing_product_prices OWNER TO pennywise_service;

--
-- Name: pricing_product_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: pennywise_service
--

CREATE SEQUENCE public.pricing_product_prices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pricing_product_prices_id_seq OWNER TO pennywise_service;

--
-- Name: pricing_product_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pennywise_service
--

ALTER SEQUENCE public.pricing_product_prices_id_seq OWNED BY public.pricing_product_prices.id;


--
-- Name: pricing_products; Type: TABLE; Schema: public; Owner: pennywise_service
--

CREATE TABLE public.pricing_products (
    id integer NOT NULL,
    provider character varying(16) NOT NULL,
    sku character varying(100) NOT NULL,
    meter_id character varying(100) NOT NULL,
    location character varying(100) NOT NULL,
    service character varying(100) NOT NULL,
    family character varying(100),
    attributes json NOT NULL
);


ALTER TABLE public.pricing_products OWNER TO pennywise_service;

--
-- Name: pricing_products_id_seq; Type: SEQUENCE; Schema: public; Owner: pennywise_service
--

CREATE SEQUENCE public.pricing_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pricing_products_id_seq OWNER TO pennywise_service;

--
-- Name: pricing_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pennywise_service
--

ALTER SEQUENCE public.pricing_products_id_seq OWNED BY public.pricing_products.id;


--
-- Name: ingestion_jobs id; Type: DEFAULT; Schema: public; Owner: pennywise_service
--

ALTER TABLE ONLY public.ingestion_jobs ALTER COLUMN id SET DEFAULT nextval('public.ingestion_jobs_id_seq'::regclass);


--
-- Name: pricing_product_prices id; Type: DEFAULT; Schema: public; Owner: pennywise_service
--

ALTER TABLE ONLY public.pricing_product_prices ALTER COLUMN id SET DEFAULT nextval('public.pricing_product_prices_id_seq'::regclass);


--
-- Name: pricing_products id; Type: DEFAULT; Schema: public; Owner: pennywise_service
--

ALTER TABLE ONLY public.pricing_products ALTER COLUMN id SET DEFAULT nextval('public.pricing_products_id_seq'::regclass);


--
-- Data for Name: ingestion_jobs; Type: TABLE DATA; Schema: public; Owner: pennywise_service
--

COPY public.ingestion_jobs (id, created_at, updated_at, provider, location, service, status, error_msg) FROM stdin;
\.


--
-- Data for Name: pricing_migrations; Type: TABLE DATA; Schema: public; Owner: pennywise_service
--

COPY public.pricing_migrations (id, version) FROM stdin;
0	Initial
1	Name Indexes
2	Extend Price Unit field
3	
\.


--
-- Data for Name: pricing_product_prices; Type: TABLE DATA; Schema: public; Owner: pennywise_service
--

COPY public.pricing_product_prices (id, product_id, hash, currency, unit, price, attributes) FROM stdin;
\.


--
-- Data for Name: pricing_products; Type: TABLE DATA; Schema: public; Owner: pennywise_service
--

COPY public.pricing_products (id, provider, sku, meter_id, location, service, family, attributes) FROM stdin;
\.


--
-- Name: ingestion_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pennywise_service
--

SELECT pg_catalog.setval('public.ingestion_jobs_id_seq', 1, false);


--
-- Name: pricing_product_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pennywise_service
--

SELECT pg_catalog.setval('public.pricing_product_prices_id_seq', 1, false);


--
-- Name: pricing_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pennywise_service
--

SELECT pg_catalog.setval('public.pricing_products_id_seq', 1, false);


--
-- Name: ingestion_jobs ingestion_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: pennywise_service
--

ALTER TABLE ONLY public.ingestion_jobs
    ADD CONSTRAINT ingestion_jobs_pkey PRIMARY KEY (id);


--
-- Name: pricing_migrations pricing_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: pennywise_service
--

ALTER TABLE ONLY public.pricing_migrations
    ADD CONSTRAINT pricing_migrations_pkey PRIMARY KEY (id);


--
-- Name: pricing_product_prices pricing_product_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: pennywise_service
--

ALTER TABLE ONLY public.pricing_product_prices
    ADD CONSTRAINT pricing_product_prices_pkey PRIMARY KEY (id);


--
-- Name: pricing_products pricing_products_pkey; Type: CONSTRAINT; Schema: public; Owner: pennywise_service
--

ALTER TABLE ONLY public.pricing_products
    ADD CONSTRAINT pricing_products_pkey PRIMARY KEY (id);


--
-- Name: idx__provider__location__service__family; Type: INDEX; Schema: public; Owner: pennywise_service
--

CREATE INDEX idx__provider__location__service__family ON public.pricing_products USING btree (provider, location, service, family);


--
-- Name: uq__product_id__hash; Type: INDEX; Schema: public; Owner: pennywise_service
--

CREATE UNIQUE INDEX uq__product_id__hash ON public.pricing_product_prices USING btree (product_id, hash);


--
-- Name: uq__provider__sku__location; Type: INDEX; Schema: public; Owner: pennywise_service
--

CREATE UNIQUE INDEX uq__provider__sku__location ON public.pricing_products USING btree (provider, sku, meter_id, location);


--
-- Name: pricing_product_prices fk__pricing_product_prices__pricing_products; Type: FK CONSTRAINT; Schema: public; Owner: pennywise_service
--

ALTER TABLE ONLY public.pricing_product_prices
    ADD CONSTRAINT fk__pricing_product_prices__pricing_products FOREIGN KEY (product_id) REFERENCES public.pricing_products(id);


--
-- PostgreSQL database dump complete
--

