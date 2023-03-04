--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12
-- Dumped by pg_dump version 12.12

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
-- Name: address; Type: TABLE; Schema: public; Owner: $POSTGRESQL_USER
--

CREATE TABLE public.address (
    cust_id bigint NOT NULL,
    address1 character varying(255),
    address2 character varying(255),
    city character varying(255),
    zip character varying(10),
    state character varying(10),
    country character varying(30)
);


ALTER TABLE public.address OWNER TO $POSTGRESQL_USER;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: $POSTGRESQL_USER
--

CREATE TABLE public.customer (
    id bigint NOT NULL,
    user_id character varying(20),
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255),
    phone character varying(20)
);


ALTER TABLE public.customer OWNER TO $POSTGRESQL_USER;

--
-- Name: payment; Type: TABLE; Schema: public; Owner: $POSTGRESQL_USER
--

CREATE SEQUENCE public.customer_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO $POSTGRESQL_USER;

--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (cust_id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: address fkfl3q6evy823xno4batlhd8jne; Type: FK CONSTRAINT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT fkfl3q6evy823xno4batlhd8jne FOREIGN KEY (cust_id) REFERENCES public.customer(id);


--
-- Name: customer customer_email; Type: CONSTRAINT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_email UNIQUE (email);


--
-- Name: customer customer_email; Type: CONSTRAINT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_user_id UNIQUE (user_id);


--
-- PostgreSQL database dump complete
--
