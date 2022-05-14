--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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

DROP DATABASE "AditivLEDSystem";
--
-- Name: AditivLEDSystem; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "AditivLEDSystem" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_South Africa.1252';


ALTER DATABASE "AditivLEDSystem" OWNER TO postgres;

\connect "AditivLEDSystem"

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
-- Name: led_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.led_info (
    id integer NOT NULL,
    create_date timestamp without time zone DEFAULT now() NOT NULL,
    status text DEFAULT 'off'::text NOT NULL
);


ALTER TABLE public.led_info OWNER TO postgres;

--
-- Name: led_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.led_id_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 999999
    CACHE 1;


ALTER TABLE public.led_id_seq OWNER TO postgres;

--
-- Name: led_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.led_id_seq OWNED BY public.led_info.id;


--
-- Name: led_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.led_info ALTER COLUMN id SET DEFAULT nextval('public.led_id_seq'::regclass);


--
-- Data for Name: led_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.led_info (id, create_date, status) FROM stdin;
\.
COPY public.led_info (id, create_date, status) FROM 'Z:\Apps\Projects\light-app\3308.dat';

--
-- Name: led_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.led_id_seq', 3, true);


--
-- Name: led_info led_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.led_info
    ADD CONSTRAINT led_info_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

