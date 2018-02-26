--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

-- Started on 2018-02-26 12:19:20 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12469)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2258 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 186 (class 1259 OID 99256)
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: carlos
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO carlos;

--
-- TOC entry 188 (class 1259 OID 99266)
-- Name: leagues; Type: TABLE; Schema: public; Owner: carlos
--

CREATE TABLE leagues (
    id bigint NOT NULL,
    caption character varying,
    year integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    league character varying
);


ALTER TABLE leagues OWNER TO carlos;

--
-- TOC entry 187 (class 1259 OID 99264)
-- Name: leagues_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE leagues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE leagues_id_seq OWNER TO carlos;

--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 187
-- Name: leagues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE leagues_id_seq OWNED BY leagues.id;


--
-- TOC entry 193 (class 1259 OID 99314)
-- Name: leagues_teams; Type: TABLE; Schema: public; Owner: carlos
--

CREATE TABLE leagues_teams (
    league_id bigint NOT NULL,
    team_id bigint NOT NULL
);


ALTER TABLE leagues_teams OWNER TO carlos;

--
-- TOC entry 192 (class 1259 OID 99299)
-- Name: players; Type: TABLE; Schema: public; Owner: carlos
--

CREATE TABLE players (
    id bigint NOT NULL,
    name character varying,
    "position" character varying,
    jersey_number integer,
    date_of_birth date,
    nationality character varying,
    contract_until character varying,
    team_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE players OWNER TO carlos;

--
-- TOC entry 191 (class 1259 OID 99297)
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_id_seq OWNER TO carlos;

--
-- TOC entry 2260 (class 0 OID 0)
-- Dependencies: 191
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE players_id_seq OWNED BY players.id;


--
-- TOC entry 185 (class 1259 OID 99248)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: carlos
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO carlos;

--
-- TOC entry 190 (class 1259 OID 99277)
-- Name: teams; Type: TABLE; Schema: public; Owner: carlos
--

CREATE TABLE teams (
    id bigint NOT NULL,
    name character varying,
    code character varying,
    short_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    fd_id integer
);


ALTER TABLE teams OWNER TO carlos;

--
-- TOC entry 189 (class 1259 OID 99275)
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teams_id_seq OWNER TO carlos;

--
-- TOC entry 2261 (class 0 OID 0)
-- Dependencies: 189
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE teams_id_seq OWNED BY teams.id;


--
-- TOC entry 2110 (class 2604 OID 99269)
-- Name: leagues id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY leagues ALTER COLUMN id SET DEFAULT nextval('leagues_id_seq'::regclass);


--
-- TOC entry 2112 (class 2604 OID 99302)
-- Name: players id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY players ALTER COLUMN id SET DEFAULT nextval('players_id_seq'::regclass);


--
-- TOC entry 2111 (class 2604 OID 99280)
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY teams ALTER COLUMN id SET DEFAULT nextval('teams_id_seq'::regclass);


--
-- TOC entry 2244 (class 0 OID 99256)
-- Dependencies: 186
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2018-02-22 14:33:50.00167	2018-02-22 14:33:50.00167
\.


--
-- TOC entry 2246 (class 0 OID 99266)
-- Dependencies: 188
-- Data for Name: leagues; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY leagues (id, caption, year, created_at, updated_at, league) FROM stdin;
\.


--
-- TOC entry 2262 (class 0 OID 0)
-- Dependencies: 187
-- Name: leagues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('leagues_id_seq', 23, true);


--
-- TOC entry 2251 (class 0 OID 99314)
-- Dependencies: 193
-- Data for Name: leagues_teams; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY leagues_teams (league_id, team_id) FROM stdin;
\.


--
-- TOC entry 2250 (class 0 OID 99299)
-- Dependencies: 192
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY players (id, name, "position", jersey_number, date_of_birth, nationality, contract_until, team_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2263 (class 0 OID 0)
-- Dependencies: 191
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('players_id_seq', 2817, true);


--
-- TOC entry 2243 (class 0 OID 99248)
-- Dependencies: 185
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY schema_migrations (version) FROM stdin;
20180222142725
20180222142919
20180222143024
20180222143121
20180222144019
20180222193657
\.


--
-- TOC entry 2248 (class 0 OID 99277)
-- Dependencies: 190
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY teams (id, name, code, short_name, created_at, updated_at, fd_id) FROM stdin;
\.


--
-- TOC entry 2264 (class 0 OID 0)
-- Dependencies: 189
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('teams_id_seq', 550, true);


--
-- TOC entry 2116 (class 2606 OID 99263)
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- TOC entry 2118 (class 2606 OID 99274)
-- Name: leagues leagues_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY leagues
    ADD CONSTRAINT leagues_pkey PRIMARY KEY (id);


--
-- TOC entry 2123 (class 2606 OID 99307)
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- TOC entry 2114 (class 2606 OID 99255)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2120 (class 2606 OID 99285)
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- TOC entry 2124 (class 1259 OID 99317)
-- Name: index_leagues_teams_on_league_id_and_team_id; Type: INDEX; Schema: public; Owner: carlos
--

CREATE INDEX index_leagues_teams_on_league_id_and_team_id ON leagues_teams USING btree (league_id, team_id);


--
-- TOC entry 2121 (class 1259 OID 99313)
-- Name: index_players_on_team_id; Type: INDEX; Schema: public; Owner: carlos
--

CREATE INDEX index_players_on_team_id ON players USING btree (team_id);


--
-- TOC entry 2125 (class 2606 OID 99308)
-- Name: players fk_rails_8880a915a5; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY players
    ADD CONSTRAINT fk_rails_8880a915a5 FOREIGN KEY (team_id) REFERENCES teams(id);


-- Completed on 2018-02-26 12:19:20 -03

--
-- PostgreSQL database dump complete
--

