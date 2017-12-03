--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--

DROP DATABASE crookbook;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;






--
-- Database creation
--

CREATE DATABASE crookbook WITH TEMPLATE = template0 OWNER = postgres;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect crookbook

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: cases_binder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cases_binder (
    master_dr character varying(16) NOT NULL,
    check_out_date timestamp with time zone
);


ALTER TABLE cases_binder OWNER TO postgres;

--
-- Name: cases_case; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cases_case (
    dr_nbr character varying(32) NOT NULL,
    date_fully_reviewed timestamp with time zone,
    motive character varying(32) NOT NULL,
    court_case_number character varying(32),
    notes text,
    adjudication character varying(32),
    evidence_destroyed boolean NOT NULL,
    status character varying(2),
    status_date timestamp with time zone,
    district_id integer NOT NULL
);


ALTER TABLE cases_case OWNER TO postgres;

--
-- Name: cases_case_related_cases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cases_case_related_cases (
    id integer NOT NULL,
    from_case_id character varying(32) NOT NULL,
    to_case_id character varying(32) NOT NULL
);


ALTER TABLE cases_case_related_cases OWNER TO postgres;

--
-- Name: cases_case_related_cases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cases_case_related_cases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cases_case_related_cases_id_seq OWNER TO postgres;

--
-- Name: cases_case_related_cases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cases_case_related_cases_id_seq OWNED BY cases_case_related_cases.id;


--
-- Name: cases_case_suspects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cases_case_suspects (
    id integer NOT NULL,
    case_id character varying(32) NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE cases_case_suspects OWNER TO postgres;

--
-- Name: cases_case_suspects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cases_case_suspects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cases_case_suspects_id_seq OWNER TO postgres;

--
-- Name: cases_case_suspects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cases_case_suspects_id_seq OWNED BY cases_case_suspects.id;


--
-- Name: cases_case_victims; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cases_case_victims (
    id integer NOT NULL,
    case_id character varying(32) NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE cases_case_victims OWNER TO postgres;

--
-- Name: cases_case_victims_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cases_case_victims_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cases_case_victims_id_seq OWNER TO postgres;

--
-- Name: cases_case_victims_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cases_case_victims_id_seq OWNED BY cases_case_victims.id;


--
-- Name: cases_district; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cases_district (
    id integer NOT NULL,
    bureau character varying(32) NOT NULL,
    division character varying(32) NOT NULL,
    reporting_district character varying(32) NOT NULL
);


ALTER TABLE cases_district OWNER TO postgres;

--
-- Name: cases_district_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cases_district_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cases_district_id_seq OWNER TO postgres;

--
-- Name: cases_district_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cases_district_id_seq OWNED BY cases_district.id;


--
-- Name: cases_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cases_event (
    id integer NOT NULL,
    date_occurred timestamp with time zone NOT NULL,
    date_reported timestamp with time zone NOT NULL,
    address character varying(50) NOT NULL,
    weapon character varying(32),
    case_id character varying(32) NOT NULL,
    coroner_case_number character varying(32),
    crime_committed character varying(1) NOT NULL
);


ALTER TABLE cases_event OWNER TO postgres;

--
-- Name: cases_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cases_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cases_event_id_seq OWNER TO postgres;

--
-- Name: cases_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cases_event_id_seq OWNED BY cases_event.id;


--
-- Name: cases_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cases_history (
    id integer NOT NULL,
    date_edited timestamp with time zone NOT NULL,
    edited_by character varying(32) NOT NULL,
    case_id character varying(32) NOT NULL
);


ALTER TABLE cases_history OWNER TO postgres;

--
-- Name: cases_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cases_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cases_history_id_seq OWNER TO postgres;

--
-- Name: cases_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cases_history_id_seq OWNED BY cases_history.id;


--
-- Name: cases_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cases_person (
    id integer NOT NULL,
    first_name character varying(32),
    last_name character varying(32),
    age integer,
    sex character varying(32),
    description character varying(64),
    ethnicity character varying(2)
);


ALTER TABLE cases_person OWNER TO postgres;

--
-- Name: cases_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cases_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cases_person_id_seq OWNER TO postgres;

--
-- Name: cases_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cases_person_id_seq OWNED BY cases_person.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: cases_case_related_cases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_case_related_cases ALTER COLUMN id SET DEFAULT nextval('cases_case_related_cases_id_seq'::regclass);


--
-- Name: cases_case_suspects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_case_suspects ALTER COLUMN id SET DEFAULT nextval('cases_case_suspects_id_seq'::regclass);


--
-- Name: cases_case_victims id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_case_victims ALTER COLUMN id SET DEFAULT nextval('cases_case_victims_id_seq'::regclass);


--
-- Name: cases_district id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_district ALTER COLUMN id SET DEFAULT nextval('cases_district_id_seq'::regclass);


--
-- Name: cases_event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_event ALTER COLUMN id SET DEFAULT nextval('cases_event_id_seq'::regclass);


--
-- Name: cases_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_history ALTER COLUMN id SET DEFAULT nextval('cases_history_id_seq'::regclass);


--
-- Name: cases_person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_person ALTER COLUMN id SET DEFAULT nextval('cases_person_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add case	1	add_case
2	Can change case	1	change_case
3	Can delete case	1	delete_case
4	Can add event	2	add_event
5	Can change event	2	change_event
6	Can delete event	2	delete_event
7	Can add history	3	add_history
8	Can change history	3	change_history
9	Can delete history	3	delete_history
10	Can add person	4	add_person
11	Can change person	4	change_person
12	Can delete person	4	delete_person
13	Can add binder	5	add_binder
14	Can change binder	5	change_binder
15	Can delete binder	5	delete_binder
16	Can add district	6	add_district
17	Can change district	6	change_district
18	Can delete district	6	delete_district
19	Can add log entry	7	add_logentry
20	Can change log entry	7	change_logentry
21	Can delete log entry	7	delete_logentry
22	Can add permission	8	add_permission
23	Can change permission	8	change_permission
24	Can delete permission	8	delete_permission
25	Can add group	9	add_group
26	Can change group	9	change_group
27	Can delete group	9	delete_group
28	Can add user	10	add_user
29	Can change user	10	change_user
30	Can delete user	10	delete_user
31	Can add content type	11	add_contenttype
32	Can change content type	11	change_contenttype
33	Can delete content type	11	delete_contenttype
34	Can add session	12	add_session
35	Can change session	12	change_session
36	Can delete session	12	delete_session
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 36, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$36000$mxi9kLyxIf84$pUeNgq9mZGjOR6m6gigz4Xhv+5d05cz3Vz/ZM0/tEv4=	2017-11-28 07:38:46.454821+00	t	sportserh			sportserh@aol.com	t	t	2017-11-28 07:38:37.213534+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: cases_binder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cases_binder (master_dr, check_out_date) FROM stdin;
134124123123	2017-11-27 00:00:00+00
71421671	1997-07-16 01:00:00+00
79749983	1997-07-16 01:00:00+00
79758608	1997-07-16 01:00:00+00
79757989	1997-07-16 01:00:00+00
80621127	1997-07-16 01:00:00+00
80629593	1997-07-16 01:00:00+00
80636123	1997-07-16 01:00:00+00
80643281	1997-07-16 01:00:00+00
80637820	1997-07-16 01:00:00+00
\.


--
-- Data for Name: cases_case; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cases_case (dr_nbr, date_fully_reviewed, motive, court_case_number, notes, adjudication, evidence_destroyed, status, status_date, district_id) FROM stdin;
1901329009	2017-11-27 00:00:00+00	Murder	132213123	lsadjfksdjflkadsjfjsdf	dslfjlkfjda	f	JA	2017-11-08 00:00:00+00	1
80637820	1997-07-16 01:00:00+00	Murder	5902930423		Murder	t	AA	1997-07-16 01:00:00+00	1
80056410	1997-07-16 01:00:00+00	Unknown	2409093432		Murder	f	JO	1997-07-16 01:00:00+00	2
80640284	1997-07-16 01:00:00+00	Unknown	109409103123		None	f	AO	1997-07-16 01:00:00+00	1
80756887	1997-07-16 01:00:00+00	Unknown	0239013123		None	f	AA	1997-07-16 01:00:00+00	3
80736623	1997-07-16 01:00:00+00	Unknown	1203919021		None	f	JO	1997-07-16 01:00:00+00	4
80761903	1997-07-16 01:00:00+00	Unknown	1230912093		None	t	AA	1995-07-16 01:00:00+00	3
80769152	1997-07-14 01:00:00+00	None	1092309120		Unknown	f	JO	1997-07-13 04:00:00+00	4
\.


--
-- Data for Name: cases_case_related_cases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cases_case_related_cases (id, from_case_id, to_case_id) FROM stdin;
1	80637820	1901329009
2	1901329009	80637820
3	80056410	1901329009
4	1901329009	80056410
5	80640284	1901329009
6	1901329009	80640284
7	80756887	80640284
8	80640284	80756887
9	80736623	1901329009
10	1901329009	80736623
11	80761903	1901329009
12	1901329009	80761903
13	80769152	80637820
14	80637820	80769152
\.


--
-- Name: cases_case_related_cases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cases_case_related_cases_id_seq', 14, true);


--
-- Data for Name: cases_case_suspects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cases_case_suspects (id, case_id, person_id) FROM stdin;
1	1901329009	2
2	80637820	2
3	80056410	5
4	80640284	6
5	80756887	8
6	80736623	10
7	80761903	12
8	80769152	15
\.


--
-- Name: cases_case_suspects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cases_case_suspects_id_seq', 8, true);


--
-- Data for Name: cases_case_victims; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cases_case_victims (id, case_id, person_id) FROM stdin;
1	1901329009	1
2	80637820	1
3	80056410	3
4	80640284	5
5	80756887	7
6	80736623	10
7	80761903	11
8	80769152	13
\.


--
-- Name: cases_case_victims_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cases_case_victims_id_seq', 8, true);


--
-- Data for Name: cases_district; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cases_district (id, bureau, division, reporting_district) FROM stdin;
1	sadlfkjlksdjf	Southwest1	sdfljkdsfa
2	Southwest	OSB	398
3	Southwest	OSB	391
4	Southwest	OSB	392
\.


--
-- Name: cases_district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cases_district_id_seq', 4, true);


--
-- Data for Name: cases_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cases_event (id, date_occurred, date_reported, address, weapon, case_id, coroner_case_number, crime_committed) FROM stdin;
1	2017-11-29 00:00:00+00	2017-11-30 00:00:00+00	1 LMU Dr., MSB 2863	knife	1901329009	10239	M
2	1989-02-05 01:00:00+00	1931-03-04 01:00:00+00	1 LMU Dr.	knife	1901329009	1203092190	M
3	1957-01-03 01:00:00+00	1957-01-03 01:00:00+00	423 W. Maple	knife	80637820	10941039	M
4	2014-05-13 00:00:00+00	2014-05-13 00:00:00+00	4123 W. Scholl	Gun	80056410	09410920312093	M
5	1994-05-07 02:00:00+00	1994-05-07 02:00:00+00	5902 E. Fios	Car	80640284	103901293	M
6	1957-01-02 01:00:00+00	1957-01-02 01:00:00+00	2049 N. Sky Dr.	Knife	80756887	1039901	M
7	2012-11-30 01:00:00+00	2012-11-30 01:00:00+00	1031 W. 95th	gun	80736623	1092390123	M
8	2003-12-11 02:00:00+00	2003-12-13 01:00:00+00	2034 N 20th st.	gun	80761903	12093902	M
9	1989-01-08 01:00:00+00	1989-01-08 01:00:00+00	4112 S. 43rd St.	knife	80769152	4092042903	M
\.


--
-- Name: cases_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cases_event_id_seq', 39, true);


--
-- Data for Name: cases_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cases_history (id, date_edited, edited_by, case_id) FROM stdin;
\.


--
-- Name: cases_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cases_history_id_seq', 1, false);


--
-- Data for Name: cases_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cases_person (id, first_name, last_name, age, sex, description, ethnicity) FROM stdin;
1	john	Does	123	M	afsdjflksdjflksdjfkl	AI
2	Jane	Doe	134	M	falsdfjksdfjlksjdf	B
3	George	Gordon	34	M	\N	W
4	John	David	19	M	\N	W
5	Joshua	Crawford	45	M	\N	W
6	Rogers	Warren	34	M	\N	AI
7	Albert	Banks	40	M	\N	B
8	Edward	Slocum	49	M	\N	W
9	George	Morrison	21	M	\N	H
10	Meeks	Gilmore	39	M	\N	B
11	Andrew	Rodriguez	29	M	\N	H
12	Richard	Cooper	68	M	\N	W
13	Tony	Harris	20	M	\N	W
14	John	Hollins	29	M	\N	B
15	Shermon	Hubbard	19	M	\N	A
\.


--
-- Name: cases_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cases_person_id_seq', 15, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-11-28 07:40:09.054949+00	2	District object	1	[{"added": {}}]	6	1
2	2017-11-28 07:40:17.748431+00	3	District object	1	[{"added": {}}]	6	1
3	2017-11-28 07:40:25.188718+00	4	District object	1	[{"added": {}}]	6	1
4	2017-11-28 07:41:01.080518+00	3	Person object	1	[{"added": {}}]	4	1
5	2017-11-28 07:41:18.902694+00	4	Person object	1	[{"added": {}}]	4	1
6	2017-11-28 07:41:33.588995+00	5	Person object	1	[{"added": {}}]	4	1
7	2017-11-28 07:41:45.536697+00	6	Person object	1	[{"added": {}}]	4	1
8	2017-11-28 07:41:58.74049+00	7	Person object	1	[{"added": {}}]	4	1
9	2017-11-28 07:42:19.801183+00	8	Person object	1	[{"added": {}}]	4	1
10	2017-11-28 07:42:36.793669+00	9	Person object	1	[{"added": {}}]	4	1
11	2017-11-28 07:42:52.499881+00	10	Person object	1	[{"added": {}}]	4	1
12	2017-11-28 07:43:09.691049+00	11	Person object	1	[{"added": {}}]	4	1
13	2017-11-28 07:43:22.25515+00	12	Person object	1	[{"added": {}}]	4	1
14	2017-11-28 07:43:52.552103+00	13	Person object	1	[{"added": {}}]	4	1
15	2017-11-28 07:44:17.841934+00	14	Person object	1	[{"added": {}}]	4	1
16	2017-11-28 07:44:35.765326+00	15	Person object	1	[{"added": {}}]	4	1
17	2017-11-28 07:45:29.756234+00	71421671	Binder object	1	[{"added": {}}]	5	1
18	2017-11-28 07:45:43.509559+00	79749983	Binder object	1	[{"added": {}}]	5	1
19	2017-11-28 07:45:53.012926+00	79758608	Binder object	1	[{"added": {}}]	5	1
20	2017-11-28 07:46:02.062522+00	79757989	Binder object	1	[{"added": {}}]	5	1
21	2017-11-28 07:46:11.433498+00	80621127	Binder object	1	[{"added": {}}]	5	1
22	2017-11-28 07:46:23.222663+00	80629593	Binder object	1	[{"added": {}}]	5	1
23	2017-11-28 07:46:34.098602+00	80636123	Binder object	1	[{"added": {}}]	5	1
24	2017-11-28 07:46:44.433233+00	80643281	Binder object	1	[{"added": {}}]	5	1
25	2017-11-28 07:46:52.325029+00	80637820	Binder object	1	[{"added": {}}]	5	1
26	2017-11-28 07:49:31.867553+00	80637820	Case object	1	[{"added": {}}]	1	1
27	2017-11-28 07:50:53.126325+00	80056410	Case object	1	[{"added": {}}]	1	1
28	2017-11-28 07:51:42.968341+00	80640284	Case object	1	[{"added": {}}]	1	1
29	2017-11-28 07:52:40.700886+00	80756887	Case object	1	[{"added": {}}]	1	1
30	2017-11-28 07:53:24.17875+00	80736623	Case object	1	[{"added": {}}]	1	1
31	2017-11-28 07:54:16.936231+00	80761903	Case object	1	[{"added": {}}]	1	1
32	2017-11-28 07:55:07.714597+00	80769152	Case object	1	[{"added": {}}]	1	1
33	2017-11-28 07:55:39.102368+00	2	Event object	1	[{"added": {}}]	2	1
34	2017-11-28 07:56:16.021266+00	3	Event object	1	[{"added": {}}]	2	1
35	2017-11-28 07:57:06.852984+00	4	Event object	1	[{"added": {}}]	2	1
36	2017-11-28 07:57:39.920444+00	5	Event object	1	[{"added": {}}]	2	1
37	2017-11-28 07:58:09.038682+00	6	Event object	1	[{"added": {}}]	2	1
38	2017-11-28 07:58:36.861276+00	7	Event object	1	[{"added": {}}]	2	1
39	2017-11-28 07:59:02.156905+00	8	Event object	1	[{"added": {}}]	2	1
40	2017-11-28 07:59:33.85352+00	9	Event object	1	[{"added": {}}]	2	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 70, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	cases	case
2	cases	event
3	cases	history
4	cases	person
5	cases	binder
6	cases	district
7	admin	logentry
8	auth	permission
9	auth	group
10	auth	user
11	contenttypes	contenttype
12	sessions	session
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 12, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-11-27 21:09:25.308954+00
2	auth	0001_initial	2017-11-27 21:09:25.379468+00
3	admin	0001_initial	2017-11-27 21:09:25.417361+00
4	admin	0002_logentry_remove_auto_add	2017-11-27 21:09:25.429422+00
5	contenttypes	0002_remove_content_type_name	2017-11-27 21:09:25.451388+00
6	auth	0002_alter_permission_name_max_length	2017-11-27 21:09:25.4601+00
7	auth	0003_alter_user_email_max_length	2017-11-27 21:09:25.474199+00
8	auth	0004_alter_user_username_opts	2017-11-27 21:09:25.48407+00
9	auth	0005_alter_user_last_login_null	2017-11-27 21:09:25.498032+00
10	auth	0006_require_contenttypes_0002	2017-11-27 21:09:25.501173+00
11	auth	0007_alter_validators_add_error_messages	2017-11-27 21:09:25.5127+00
12	auth	0008_alter_user_username_max_length	2017-11-27 21:09:25.52701+00
13	cases	0001_initial	2017-11-27 21:09:25.594941+00
14	cases	0002_auto_20171023_0744	2017-11-27 21:09:25.632636+00
15	cases	0003_auto_20171025_2216	2017-11-27 21:09:25.784462+00
16	cases	0004_auto_20171025_2344	2017-11-27 21:09:25.803637+00
17	cases	0005_auto_20171126_2131	2017-11-27 21:09:25.8403+00
18	cases	0006_person_victim	2017-11-27 21:09:25.858304+00
19	cases	0007_auto_20171127_0001	2017-11-27 21:09:25.897811+00
20	cases	0008_auto_20171127_0023	2017-11-27 21:09:25.942433+00
21	cases	0009_auto_20171127_0351	2017-11-27 21:09:25.988884+00
22	cases	0010_auto_20171127_0358	2017-11-27 21:09:25.996991+00
23	cases	0011_auto_20171127_0507	2017-11-27 21:09:26.019303+00
24	cases	0012_auto_20171127_0509	2017-11-27 21:09:26.043281+00
25	cases	0013_auto_20171127_0518	2017-11-27 21:09:26.105525+00
26	cases	0014_auto_20171127_0518	2017-11-27 21:09:26.140234+00
27	sessions	0001_initial	2017-11-27 21:09:26.152945+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 27, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
xepr08nfrutb6b4l3491zh9fvpud5xdq	MjI1OTQ4ZjZhNTJlZjJlY2U2Yzk0NTY4MTE4MWQzNDI3ZGRmNjgxNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMThjMWIzMjBkZmY1NjRlMzNkNjM5NGEwMzFlYzQ2ZmZhMWFkMGRjIn0=	2017-12-12 07:38:46.463102+00
\.


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: cases_binder cases_binder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_binder
    ADD CONSTRAINT cases_binder_pkey PRIMARY KEY (master_dr);


--
-- Name: cases_case cases_case_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_case
    ADD CONSTRAINT cases_case_pkey PRIMARY KEY (dr_nbr);


--
-- Name: cases_case_related_cases cases_case_related_cases_from_case_id_to_case_id_45182771_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_case_related_cases
    ADD CONSTRAINT cases_case_related_cases_from_case_id_to_case_id_45182771_uniq UNIQUE (from_case_id, to_case_id);


--
-- Name: cases_case_related_cases cases_case_related_cases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_case_related_cases
    ADD CONSTRAINT cases_case_related_cases_pkey PRIMARY KEY (id);


--
-- Name: cases_case_suspects cases_case_suspects_case_id_person_id_0b94de54_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_case_suspects
    ADD CONSTRAINT cases_case_suspects_case_id_person_id_0b94de54_uniq UNIQUE (case_id, person_id);


--
-- Name: cases_case_suspects cases_case_suspects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_case_suspects
    ADD CONSTRAINT cases_case_suspects_pkey PRIMARY KEY (id);


--
-- Name: cases_case_victims cases_case_victims_case_id_person_id_36cd333a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_case_victims
    ADD CONSTRAINT cases_case_victims_case_id_person_id_36cd333a_uniq UNIQUE (case_id, person_id);


--
-- Name: cases_case_victims cases_case_victims_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_case_victims
    ADD CONSTRAINT cases_case_victims_pkey PRIMARY KEY (id);


--
-- Name: cases_district cases_district_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_district
    ADD CONSTRAINT cases_district_pkey PRIMARY KEY (id);


--
-- Name: cases_event cases_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_event
    ADD CONSTRAINT cases_event_pkey PRIMARY KEY (id);


--
-- Name: cases_history cases_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_history
    ADD CONSTRAINT cases_history_pkey PRIMARY KEY (id);


--
-- Name: cases_person cases_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_person
    ADD CONSTRAINT cases_person_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: cases_binder_master_dr_017172c2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_binder_master_dr_017172c2_like ON cases_binder USING btree (master_dr varchar_pattern_ops);


--
-- Name: cases_case_district_id_60fa1ba0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_case_district_id_60fa1ba0 ON cases_case USING btree (district_id);


--
-- Name: cases_case_dr_nbr_ea1fa861_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_case_dr_nbr_ea1fa861_like ON cases_case USING btree (dr_nbr varchar_pattern_ops);


--
-- Name: cases_case_related_cases_from_case_id_5671010c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_case_related_cases_from_case_id_5671010c ON cases_case_related_cases USING btree (from_case_id);


--
-- Name: cases_case_related_cases_from_case_id_5671010c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_case_related_cases_from_case_id_5671010c_like ON cases_case_related_cases USING btree (from_case_id varchar_pattern_ops);


--
-- Name: cases_case_related_cases_to_case_id_6833c730; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_case_related_cases_to_case_id_6833c730 ON cases_case_related_cases USING btree (to_case_id);


--
-- Name: cases_case_related_cases_to_case_id_6833c730_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_case_related_cases_to_case_id_6833c730_like ON cases_case_related_cases USING btree (to_case_id varchar_pattern_ops);


--
-- Name: cases_case_suspects_case_id_c162a479; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_case_suspects_case_id_c162a479 ON cases_case_suspects USING btree (case_id);


--
-- Name: cases_case_suspects_case_id_c162a479_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_case_suspects_case_id_c162a479_like ON cases_case_suspects USING btree (case_id varchar_pattern_ops);


--
-- Name: cases_case_suspects_person_id_efc149be; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_case_suspects_person_id_efc149be ON cases_case_suspects USING btree (person_id);


--
-- Name: cases_case_victims_case_id_845133c0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_case_victims_case_id_845133c0 ON cases_case_victims USING btree (case_id);


--
-- Name: cases_case_victims_case_id_845133c0_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_case_victims_case_id_845133c0_like ON cases_case_victims USING btree (case_id varchar_pattern_ops);


--
-- Name: cases_case_victims_person_id_c96db86f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_case_victims_person_id_c96db86f ON cases_case_victims USING btree (person_id);


--
-- Name: cases_event_case_id_59b954a1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_event_case_id_59b954a1 ON cases_event USING btree (case_id);


--
-- Name: cases_event_case_id_59b954a1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_event_case_id_59b954a1_like ON cases_event USING btree (case_id varchar_pattern_ops);


--
-- Name: cases_history_case_id_3e94cf08; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_history_case_id_3e94cf08 ON cases_history USING btree (case_id);


--
-- Name: cases_history_case_id_3e94cf08_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_history_case_id_3e94cf08_like ON cases_history USING btree (case_id varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_case cases_case_district_id_60fa1ba0_fk_cases_district_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_case
    ADD CONSTRAINT cases_case_district_id_60fa1ba0_fk_cases_district_id FOREIGN KEY (district_id) REFERENCES cases_district(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_case_related_cases cases_case_related_c_from_case_id_5671010c_fk_cases_cas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_case_related_cases
    ADD CONSTRAINT cases_case_related_c_from_case_id_5671010c_fk_cases_cas FOREIGN KEY (from_case_id) REFERENCES cases_case(dr_nbr) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_case_related_cases cases_case_related_c_to_case_id_6833c730_fk_cases_cas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_case_related_cases
    ADD CONSTRAINT cases_case_related_c_to_case_id_6833c730_fk_cases_cas FOREIGN KEY (to_case_id) REFERENCES cases_case(dr_nbr) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_case_suspects cases_case_suspects_case_id_c162a479_fk_cases_case_dr_nbr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_case_suspects
    ADD CONSTRAINT cases_case_suspects_case_id_c162a479_fk_cases_case_dr_nbr FOREIGN KEY (case_id) REFERENCES cases_case(dr_nbr) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_case_suspects cases_case_suspects_person_id_efc149be_fk_cases_person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_case_suspects
    ADD CONSTRAINT cases_case_suspects_person_id_efc149be_fk_cases_person_id FOREIGN KEY (person_id) REFERENCES cases_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_case_victims cases_case_victims_case_id_845133c0_fk_cases_case_dr_nbr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_case_victims
    ADD CONSTRAINT cases_case_victims_case_id_845133c0_fk_cases_case_dr_nbr FOREIGN KEY (case_id) REFERENCES cases_case(dr_nbr) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_case_victims cases_case_victims_person_id_c96db86f_fk_cases_person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_case_victims
    ADD CONSTRAINT cases_case_victims_person_id_c96db86f_fk_cases_person_id FOREIGN KEY (person_id) REFERENCES cases_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_event cases_event_case_id_59b954a1_fk_cases_case_dr_nbr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_event
    ADD CONSTRAINT cases_event_case_id_59b954a1_fk_cases_case_dr_nbr FOREIGN KEY (case_id) REFERENCES cases_case(dr_nbr) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_history cases_history_case_id_3e94cf08_fk_cases_case_dr_nbr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cases_history
    ADD CONSTRAINT cases_history_case_id_3e94cf08_fk_cases_case_dr_nbr FOREIGN KEY (case_id) REFERENCES cases_case(dr_nbr) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

