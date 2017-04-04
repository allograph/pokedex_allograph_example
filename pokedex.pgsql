--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: pokemons; Type: TABLE; Schema: public; Owner: rachelminto
--

CREATE TABLE pokemons (
    id character varying(250),
    url character varying(250) NOT NULL,
    name character varying(250) NOT NULL,
    trainer_id character varying(250)
);


ALTER TABLE pokemons OWNER TO rachelminto;

--
-- Name: trainers; Type: TABLE; Schema: public; Owner: rachelminto
--

CREATE TABLE trainers (
    id character varying(250) NOT NULL,
    name character varying(250)
);


ALTER TABLE trainers OWNER TO rachelminto;

--
-- Data for Name: pokemons; Type: TABLE DATA; Schema: public; Owner: rachelminto
--

COPY pokemons (id, url, name, trainer_id) FROM stdin;
3	http://assets.pokemon.com/assets/cms2/img/pokedex/full//001.png	Bulbasaur	1
2	http://vignette3.wikia.nocookie.net/fantendo/images/0/07/20110526012846%21Ash_Pikachu.png/revision/latest/scale-to-width-down/466?cb=20131122162138	Pikachu	1
v3nb2	http://cdn.bulbagarden.net/upload/thumb/9/9a/095Onix.png/250px-095Onix.png	Onix	1
4	http://cdn.bulbagarden.net/media/upload/1/15/007Squirtle_XY_anime.png	Squirtle	1
dhmkl	http://cdn.bulbagarden.net/upload/thumb/9/9a/095Onix.png/250px-095Onix.png	Onix407	1
\.


--
-- Data for Name: trainers; Type: TABLE DATA; Schema: public; Owner: rachelminto
--

COPY trainers (id, name) FROM stdin;
1	Rachel Minto
\.


--
-- Name: trainers trainers_pkey; Type: CONSTRAINT; Schema: public; Owner: rachelminto
--

ALTER TABLE ONLY trainers
    ADD CONSTRAINT trainers_pkey PRIMARY KEY (id);


--
-- Name: pokemons pokemons_trainer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rachelminto
--

ALTER TABLE ONLY pokemons
    ADD CONSTRAINT pokemons_trainer_id_fkey FOREIGN KEY (trainer_id) REFERENCES trainers(id);


--
-- PostgreSQL database dump complete
--

