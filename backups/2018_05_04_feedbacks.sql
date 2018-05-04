--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: recommendations_batch; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE recommendations_batch (
    id integer NOT NULL,
    description text NOT NULL,
    removed_smell_id integer NOT NULL,
    title character varying(100) NOT NULL
);


--
-- Name: recommendations_batch_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE recommendations_batch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recommendations_batch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE recommendations_batch_id_seq OWNED BY recommendations_batch.id;


--
-- Name: recommendations_batchfeedback; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE recommendations_batchfeedback (
    id integer NOT NULL,
    observations text NOT NULL,
    batch_id integer NOT NULL,
    user_id integer NOT NULL,
    perception character varying(1) NOT NULL
);


--
-- Name: recommendations_batchfeedback_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE recommendations_batchfeedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recommendations_batchfeedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE recommendations_batchfeedback_id_seq OWNED BY recommendations_batchfeedback.id;


--
-- Name: recommendations_codesmell; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE recommendations_codesmell (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


--
-- Name: recommendations_codesmell_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE recommendations_codesmell_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recommendations_codesmell_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE recommendations_codesmell_id_seq OWNED BY recommendations_codesmell.id;


--
-- Name: recommendations_refactoring; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE recommendations_refactoring (
    id integer NOT NULL,
    class_name character varying(100) NOT NULL,
    "order" integer NOT NULL,
    batch_id integer NOT NULL,
    type_id integer NOT NULL
);


--
-- Name: recommendations_refactoring_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE recommendations_refactoring_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recommendations_refactoring_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE recommendations_refactoring_id_seq OWNED BY recommendations_refactoring.id;


--
-- Name: recommendations_refactoringtype; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE recommendations_refactoringtype (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


--
-- Name: recommendations_refactoringtype_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE recommendations_refactoringtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recommendations_refactoringtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE recommendations_refactoringtype_id_seq OWNED BY recommendations_refactoringtype.id;


--
-- Name: recommendations_sourcefile; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE recommendations_sourcefile (
    id integer NOT NULL,
    source_code text NOT NULL,
    changes_description text NOT NULL,
    name character varying(50) NOT NULL,
    interesting_lines character varying(50),
    refactoring_id integer
);


--
-- Name: recommendations_sourcefile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE recommendations_sourcefile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recommendations_sourcefile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE recommendations_sourcefile_id_seq OWNED BY recommendations_sourcefile.id;


--
-- Name: recommendations_usersubject; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE recommendations_usersubject (
    id integer NOT NULL,
    on_experiment boolean NOT NULL,
    user_id integer NOT NULL,
    was_welcomed boolean NOT NULL
);


--
-- Name: recommendations_usersubject_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE recommendations_usersubject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recommendations_usersubject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE recommendations_usersubject_id_seq OWNED BY recommendations_usersubject.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY recommendations_batch ALTER COLUMN id SET DEFAULT nextval('recommendations_batch_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY recommendations_batchfeedback ALTER COLUMN id SET DEFAULT nextval('recommendations_batchfeedback_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY recommendations_codesmell ALTER COLUMN id SET DEFAULT nextval('recommendations_codesmell_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY recommendations_refactoring ALTER COLUMN id SET DEFAULT nextval('recommendations_refactoring_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY recommendations_refactoringtype ALTER COLUMN id SET DEFAULT nextval('recommendations_refactoringtype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY recommendations_sourcefile ALTER COLUMN id SET DEFAULT nextval('recommendations_sourcefile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY recommendations_usersubject ALTER COLUMN id SET DEFAULT nextval('recommendations_usersubject_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add permission	4	add_permission
11	Can change permission	4	change_permission
12	Can delete permission	4	delete_permission
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add source file	7	add_sourcefile
20	Can change source file	7	change_sourcefile
21	Can delete source file	7	delete_sourcefile
22	Can add refactoring type	8	add_refactoringtype
23	Can change refactoring type	8	change_refactoringtype
24	Can delete refactoring type	8	delete_refactoringtype
25	Can add batch	9	add_batch
26	Can change batch	9	change_batch
27	Can delete batch	9	delete_batch
28	Can add refactoring	10	add_refactoring
29	Can change refactoring	10	change_refactoring
30	Can delete refactoring	10	delete_refactoring
31	Can add code smell	11	add_codesmell
32	Can change code smell	11	change_codesmell
33	Can delete code smell	11	delete_codesmell
34	Can add batch feedback	12	add_batchfeedback
35	Can change batch feedback	12	change_batchfeedback
36	Can delete batch feedback	12	delete_batchfeedback
37	Can add user subject	13	add_usersubject
38	Can change user subject	13	change_usersubject
39	Can delete user subject	13	delete_usersubject
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_permission_id_seq', 39, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$100000$lrP9dsBYBjHv$lWH8ew5zA26ooD47zV/JHu9uyUj3UiSnOrygFDi3CQY=	2018-04-20 13:38:09.471733-03	f	alessandro	Alessandro	Garcia		f	t	2018-04-16 18:53:19-03
14	pbkdf2_sha256$100000$Lj3ZWwsXVUMy$UN2yfgBWsL+fTHqX1ksFvAlVR4Lp4OSR/AiBei4y+xE=	2018-04-28 16:38:13.588691-03	f	oizumi.willian@gmail.com	Willian	Oizumi		f	t	2018-04-27 16:47:27.991322-03
6	pbkdf2_sha256$100000$aAQ0s7NGL6wl$QVvm1FyS1BLP9cYAyPLMQtgePlgPFzQOaZjGA6hd/eI=	2018-04-28 21:53:31.585065-03	f	annebenedicteagbachi@gmail.com	Benedicte	Agbachi		f	t	2018-04-27 16:47:27.202623-03
11	pbkdf2_sha256$100000$RjUBGuyxUAa1$923oQOxdX3/WpeAAFJ+F+726rwczhgVhp1ldt57GmN4=	2018-04-29 20:55:37.711226-03	f	isabellavieira57@gmail.com	Isabella	Vieira		f	t	2018-04-27 16:47:27.702958-03
20	pbkdf2_sha256$100000$sW9MGh6LZx6t$i6UeZjb6CVoU3yFYszCHwaYVK1Je8VsDtZhFZr9OXNs=	2018-04-30 00:23:24.055557-03	f	nandinho	Fernando	Oliveira		f	t	2018-04-27 17:11:36.759407-03
12	pbkdf2_sha256$100000$4FRJqpjDPaH1$dZ8bAmeIX8/lLlTslgAG88Qao7N9Y4eac3HP4FWdE8k=	2018-04-30 13:30:09.330661-03	f	ssousaleo@gmail.com	Leonardo	Sousa		f	t	2018-04-27 16:47:27.798217-03
13	pbkdf2_sha256$100000$tPZekS7ILl58$6dmdYlHRl+EbbaVXFdE4N3Guq1NXsqv9nZWlYF7pUlE=	2018-04-30 15:47:05.599892-03	f	robertofel.oliveira@gmail.com	RFO	RFO		f	t	2018-04-27 16:47:27.896162-03
5	pbkdf2_sha256$100000$lay8O6oq7aO2$MYQRxv3rfoupT60GztQ61PVqhr5rFHXPBNN+a4j1bTg=	2018-04-30 20:48:33.363922-03	f	ana.carlagb@gmail.com	Ana	Bibiano		f	t	2018-04-27 16:47:27.083189-03
19	pbkdf2_sha256$100000$X1OZySCnI9y6$MXjJYHEW4+0HyL1evUwd3GxUnqVXP9hEjSdFCzXG7k4=	2018-05-01 01:51:50.138986-03	f	normandelins@gmail.com	Bruno	Normande		f	t	2018-04-27 17:11:36.657987-03
4	pbkdf2_sha256$100000$2U99ZGjzLYmB$o/7OrtQErmSn31qR+ohK/jtQMgHJM7cGLZGXb3NGqU8=	2018-05-01 19:13:58.668426-03	f	marcospereira	Marcos	Pereira		f	t	2018-04-27 15:26:09-03
9	pbkdf2_sha256$100000$RQqibLlpAhd7$mjyaoGohD6KhC3fzev2CFbwuy+72WKqWW5zxzhmkXsA=	2018-05-02 08:47:48.288979-03	f	andersonguchoa@gmail.com	Anderson	Uchoa		f	t	2018-04-27 16:47:27.505075-03
7	pbkdf2_sha256$100000$HjEzK1LmEoYv$8sDEjez2LhQ18PuS9zYiAyZWRc7ODJClexuiKEMVFaw=	2018-05-03 01:31:40.732187-03	f	alexchavezlop@gmail.com	Alexander	Chavez		f	t	2018-04-27 16:47:27.30432-03
16	pbkdf2_sha256$100000$Vc4u5MCiz0W9$FSO3JEiqRikchBuWovbQhsJYj3QUrC58YveYz5Kz6sA=	\N	f	luiz@ic.ufal.br	Luiz	Carvalho		f	t	2018-04-27 16:47:28.185577-03
17	pbkdf2_sha256$100000$OABSQkHA8ErE$dWmsRWOnwducqvEGcUH8vmUy26dfgjdctsmHVDEVcQQ=	\N	f	danieltmo3@gmail.com	Daniel	Tenorio		f	t	2018-04-27 16:47:28.281458-03
18	pbkdf2_sha256$100000$0cCYrXXrbuFE$fhPMEumcmEPm7ywj/Y6O7JV4yEye1d3cwBuJIZIJxak=	2018-04-27 17:12:07.081165-03	f	tiagocedrim@gmail.com	Tiago	Cedrim		f	t	2018-04-27 17:11:36.553226-03
10	pbkdf2_sha256$100000$WLIf6WDdPtrx$8AD6IX8stUkH86Y7DIBxez1hHgenGSc+E0vtkJ1Nm4g=	2018-04-27 17:36:19.375416-03	f	eduardomorfernandes@gmail.com	Eduardo	Fernandes		f	t	2018-04-27 16:47:27.604455-03
8	pbkdf2_sha256$100000$zfiTwyPrF9Uk$Q0y+lOIbdx5l0CCITudAKUOnjVOL9ASxr+b5XNVlEvg=	2018-04-27 18:06:46.293807-03	f	anderson.jose.so@gmail.com	Anderson	Oliveira		f	t	2018-04-27 16:47:27.403964-03
15	pbkdf2_sha256$100000$3H5WkEp0nu0j$uCft1WR6PlgnkShC+QrLHoPZd4IeyJpRjKon0ZDkoQM=	2018-04-28 13:01:49.024248-03	f	rafaelmaiani@gmail.com	Rafael	Maiani		f	t	2018-04-27 16:47:28.087361-03
1	pbkdf2_sha256$100000$ZVhnxJCvbsra$2X4zo4l5WIA/hRgQw05nXU7bRVCxw25daa/QSERq61g=	2018-05-04 09:15:01.151629-03	t	diego	Diego	Cedrim	diego.cedrim@gmail.com	t	t	2018-04-13 10:07:22-03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_id_seq', 20, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-04-13 10:08:05.622494-03	1	diego	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	3	1
2	2018-04-13 12:08:15.504618-03	1	CodeSmell object (1)	1	[{"added": {}}]	11	1
3	2018-04-13 12:08:25.385662-03	2	CodeSmell object (2)	1	[{"added": {}}]	11	1
4	2018-04-13 12:08:39.316835-03	3	CodeSmell object (3)	1	[{"added": {}}]	11	1
5	2018-04-13 12:09:33.581543-03	1	RefactoringType object (1)	1	[{"added": {}}]	8	1
6	2018-04-13 12:09:39.069457-03	2	RefactoringType object (2)	1	[{"added": {}}]	8	1
7	2018-04-13 12:17:29.041566-03	1	Batch object (1)	1	[{"added": {}}]	9	1
8	2018-04-13 12:18:38.838325-03	1	Batch object (1)	2	[]	9	1
9	2018-04-13 12:34:14.482652-03	1	Clause_1.java	1	[{"added": {}}]	7	1
10	2018-04-15 11:53:07.005838-03	1	Clause_1.java	2	[]	7	1
11	2018-04-15 11:54:26.874395-03	2	Clause_2.java	1	[{"added": {}}]	7	1
12	2018-04-15 11:54:58.988644-03	1	Refactoring object (1)	1	[{"added": {}}]	10	1
13	2018-04-15 11:57:47.061179-03	2	Removendo Complex Class da ckasse GenericTranspalBean	1	[{"added": {}}]	9	1
14	2018-04-15 11:59:08.458252-03	3	GenericTranspalBean_1.java	1	[{"added": {}}]	7	1
15	2018-04-15 12:00:10.889912-03	4	GenericTranspalBean_2.java	1	[{"added": {}}]	7	1
16	2018-04-15 12:00:44.044777-03	5	GenericTranspalBean_3.java	1	[{"added": {}}]	7	1
17	2018-04-15 12:01:10.78827-03	6	GenericTranspalBean_4.java	1	[{"added": {}}]	7	1
18	2018-04-15 12:01:45.339929-03	7	GenericTranspalBean_5.java	1	[{"added": {}}]	7	1
19	2018-04-15 12:02:21.996696-03	8	GenericTranspalBean_6.java	1	[{"added": {}}]	7	1
20	2018-04-15 12:02:47.816351-03	9	GenericTranspalBean_7.java	1	[{"added": {}}]	7	1
21	2018-04-15 12:03:18.618813-03	2	Extract Method na classe GenericTranspalBean [1]	1	[{"added": {}}]	10	1
22	2018-04-15 12:03:32.287627-03	3	Extract Method na classe GenericTranspalBean [2]	1	[{"added": {}}]	10	1
23	2018-04-15 12:03:49.918445-03	4	Extract Method na classe GenericTranspalBean [3]	1	[{"added": {}}]	10	1
24	2018-04-15 12:04:04.419473-03	5	Extract Method na classe GenericTranspalBean [4]	1	[{"added": {}}]	10	1
25	2018-04-15 12:04:16.380734-03	6	Extract Method na classe GenericTranspalBean [5]	1	[{"added": {}}]	10	1
26	2018-04-15 12:04:26.124054-03	7	Extract Method na classe GenericTranspalBean [6]	1	[{"added": {}}]	10	1
27	2018-04-15 12:55:11.465161-03	1	Extract Method na classe Clause.java [1]	2	[]	10	1
28	2018-04-15 13:31:35.774389-03	3	GenericTranspalBean_1.java	2	[{"changed": {"fields": ["interesting_lines"]}}]	7	1
29	2018-04-15 13:35:47.165535-03	4	GenericTranspalBean_2.java	2	[{"changed": {"fields": ["source_code"]}}]	7	1
30	2018-04-15 13:36:20.666281-03	4	GenericTranspalBean_2.java	2	[{"changed": {"fields": ["interesting_lines"]}}]	7	1
31	2018-04-15 13:37:35.400858-03	4	GenericTranspalBean_2.java	2	[{"changed": {"fields": ["interesting_lines"]}}]	7	1
32	2018-04-15 13:41:37.671505-03	4	GenericTranspalBean_2.java	2	[{"changed": {"fields": ["interesting_lines"]}}]	7	1
33	2018-04-15 13:41:46.07518-03	3	GenericTranspalBean_1.java	2	[{"changed": {"fields": ["interesting_lines"]}}]	7	1
34	2018-04-15 13:41:56.27957-03	4	GenericTranspalBean_2.java	2	[{"changed": {"fields": ["interesting_lines"]}}]	7	1
35	2018-04-15 13:43:28.767059-03	3	GenericTranspalBean_1.java	2	[{"changed": {"fields": ["interesting_lines"]}}]	7	1
36	2018-04-15 13:43:36.303998-03	4	GenericTranspalBean_2.java	2	[{"changed": {"fields": ["interesting_lines"]}}]	7	1
37	2018-04-15 13:58:30.410924-03	5	GenericTranspalBean_3.java	2	[{"changed": {"fields": ["interesting_lines"]}}]	7	1
38	2018-04-15 13:59:33.208599-03	6	GenericTranspalBean_4.java	2	[{"changed": {"fields": ["interesting_lines"]}}]	7	1
39	2018-04-15 14:00:26.242178-03	7	GenericTranspalBean_5.java	2	[{"changed": {"fields": ["interesting_lines"]}}]	7	1
40	2018-04-15 14:01:18.54015-03	8	GenericTranspalBean_6.java	2	[{"changed": {"fields": ["interesting_lines"]}}]	7	1
41	2018-04-15 14:12:40.433397-03	3	Código Original	1	[{"added": {}}]	8	1
42	2018-04-15 14:13:00.9641-03	2	Código Original na classe GenericTranspalBean [0]	2	[{"changed": {"fields": ["type", "file", "order"]}}]	10	1
43	2018-04-15 14:13:12.787765-03	3	Extract Method na classe GenericTranspalBean [1]	2	[{"changed": {"fields": ["file", "order"]}}]	10	1
44	2018-04-15 14:13:19.482279-03	4	Extract Method na classe GenericTranspalBean [2]	2	[{"changed": {"fields": ["file", "order"]}}]	10	1
45	2018-04-15 14:13:25.848222-03	5	Extract Method na classe GenericTranspalBean [3]	2	[{"changed": {"fields": ["file", "order"]}}]	10	1
46	2018-04-15 14:13:33.678597-03	6	Extract Method na classe GenericTranspalBean [4]	2	[{"changed": {"fields": ["file", "order"]}}]	10	1
47	2018-04-15 14:13:44.714064-03	7	Extract Method na classe GenericTranspalBean [5]	2	[{"changed": {"fields": ["file", "order"]}}]	10	1
48	2018-04-15 14:14:11.881729-03	8	Extract Method na classe GenericTranspalBean [6]	1	[{"added": {}}]	10	1
49	2018-04-15 14:16:41.987469-03	9	GenericTranspalBean_7.java	2	[{"changed": {"fields": ["interesting_lines"]}}]	7	1
50	2018-04-15 14:17:44.902728-03	3	Original	2	[{"changed": {"fields": ["name"]}}]	8	1
51	2018-04-15 14:22:36.615655-03	4	GenericTranspalBean_2.java	2	[{"changed": {"fields": ["changes_description"]}}]	7	1
52	2018-04-15 14:22:40.035968-03	5	GenericTranspalBean_3.java	2	[]	7	1
53	2018-04-15 14:22:43.20818-03	5	GenericTranspalBean_3.java	2	[]	7	1
54	2018-04-15 14:22:45.933053-03	6	GenericTranspalBean_4.java	2	[]	7	1
55	2018-04-15 14:22:49.047092-03	7	GenericTranspalBean_5.java	2	[]	7	1
56	2018-04-15 14:22:51.488311-03	8	GenericTranspalBean_6.java	2	[]	7	1
57	2018-04-15 14:22:53.623941-03	9	GenericTranspalBean_7.java	2	[]	7	1
58	2018-04-15 14:32:05.820679-03	1	Original na classe Clause.java [0]	2	[{"changed": {"fields": ["type", "file", "order"]}}]	10	1
59	2018-04-15 14:32:22.164755-03	9	Extract Method na classe Clause.java [1]	1	[{"added": {}}]	10	1
60	2018-04-15 14:33:12.537544-03	2	Clause_2.java	2	[{"changed": {"fields": ["interesting_lines"]}}]	7	1
61	2018-04-15 14:33:36.712156-03	1	Clause_1.java	2	[{"changed": {"fields": ["interesting_lines"]}}]	7	1
62	2018-04-15 21:54:23.990929-03	3	GenericTranspalBean_1.java	2	[{"changed": {"fields": ["changes_description"]}}]	7	1
63	2018-04-15 21:56:22.016946-03	3	GenericTranspalBean_1.java	2	[{"changed": {"fields": ["changes_description"]}}]	7	1
64	2018-04-15 22:05:35.896871-03	2	Removendo Complex Class da classe GenericTranspalBean	2	[{"changed": {"fields": ["title"]}}]	9	1
65	2018-04-15 23:02:05.737057-03	5	Diego sobre 'Removendo Complex Class da classe Clause'	3		12	1
66	2018-04-15 23:02:05.740849-03	1	Diego sobre 'Removendo Complex Class da classe GenericTranspalBean'	3		12	1
67	2018-04-15 23:06:53.771475-03	1	diego	2	[{"added": {"name": "user subject", "object": "diego"}}]	3	1
68	2018-04-15 23:06:58.219639-03	1	diego	2	[{"changed": {"name": "user subject", "fields": ["on_experiment"], "object": "diego"}}]	3	1
69	2018-04-15 23:20:31.736715-03	1	diego	2	[{"changed": {"object": "diego", "name": "user subject", "fields": ["on_experiment"]}}]	3	1
70	2018-04-15 23:20:55.208268-03	1	diego	2	[{"changed": {"object": "diego", "name": "user subject", "fields": ["on_experiment"]}}]	3	1
71	2018-04-15 23:24:32.566299-03	1	diego	2	[{"changed": {"name": "user subject", "fields": ["on_experiment"], "object": "diego"}}]	3	1
72	2018-04-15 23:24:40.694063-03	1	diego	2	[{"changed": {"name": "user subject", "fields": ["on_experiment"], "object": "diego"}}]	3	1
73	2018-04-15 23:25:07.168122-03	1	diego	2	[{"changed": {"name": "user subject", "fields": ["on_experiment"], "object": "diego"}}]	3	1
74	2018-04-15 23:30:44.348969-03	7	Diego sobre 'Removendo Complex Class da classe Clause'	3		12	1
75	2018-04-15 23:30:44.352234-03	6	Diego sobre 'Removendo Complex Class da classe GenericTranspalBean'	3		12	1
76	2018-04-15 23:33:01.430767-03	1	diego	2	[{"changed": {"name": "user subject", "object": "diego", "fields": ["on_experiment"]}}]	3	1
77	2018-04-16 16:49:14.075186-03	3	IngressoUniversidadeService	1	[{"added": {}}]	9	1
78	2018-04-16 16:50:45.989075-03	10	IngressoUniversidadeService_1.java	1	[{"added": {}}]	7	1
79	2018-04-16 16:52:48.852298-03	11	IngressoUniversidadeService_2.java	1	[{"added": {}}]	7	1
80	2018-04-16 16:53:59.963868-03	12	IngressoUniversidadeService_3.java	1	[{"added": {}}]	7	1
81	2018-04-16 16:57:18.980358-03	13	IngressoUniversidadeService_4.java	1	[{"added": {}}]	7	1
82	2018-04-16 16:58:17.03921-03	10	Original na classe IngressoUniversidadeService [1]	1	[{"added": {}}]	10	1
83	2018-04-16 17:00:20.005904-03	10	Original na classe IngressoUniversidadeService [0]	2	[{"changed": {"fields": ["order"]}}]	10	1
84	2018-04-16 17:00:25.502438-03	11	Extract Method na classe IngressoUniversidadeService [1]	1	[{"added": {}}]	10	1
85	2018-04-16 17:00:28.10609-03	11	Extract Method na classe IngressoUniversidadeService [1]	2	[]	10	1
86	2018-04-16 17:00:48.083191-03	12	Extract Method na classe IngressoUniversidadeService [2]	1	[{"added": {}}]	10	1
87	2018-04-16 17:01:01.01072-03	13	Move Method na classe IngressoUniversidadeService [3]	1	[{"added": {}}]	10	1
88	2018-04-16 17:04:03.664322-03	13	IngressoUniversidadeService_4.java	2	[{"changed": {"fields": ["changes_description", "interesting_lines"]}}]	7	1
89	2018-04-16 17:06:52.509692-03	3	Removendo Feature Envy da classe IngressoUniversidadeService	2	[{"changed": {"fields": ["title"]}}]	9	1
90	2018-04-16 17:13:57.187186-03	4	Removendo Feature Envy da classe Media	1	[{"added": {}}]	9	1
91	2018-04-16 17:15:21.226055-03	14	Media_1.java	1	[{"added": {}}]	7	1
92	2018-04-16 17:20:25.296748-03	15	Media_2.java	1	[{"added": {}}]	7	1
93	2018-04-16 17:22:22.432547-03	16	Media_3.java	1	[{"added": {}}]	7	1
94	2018-04-16 17:24:19.816957-03	17	PicturePool_1.java	1	[{"added": {}}]	7	1
95	2018-04-16 17:24:48.421977-03	14	Original na classe Media [0]	1	[{"added": {}}]	10	1
96	2018-04-16 17:25:00.935578-03	15	Extract Method na classe Media [1]	1	[{"added": {}}]	10	1
97	2018-04-16 17:25:19.854179-03	16	Move Method na classe Media [2]	1	[{"added": {}}]	10	1
98	2018-04-16 17:25:48.070806-03	17	Move Method na classe PicturePool [3]	1	[{"added": {}}]	10	1
99	2018-04-16 17:41:22.204234-03	18	MatriculaAcademicaService_1.java	1	[{"added": {}}]	7	1
100	2018-04-16 17:43:45.004042-03	19	MatriculaAcademicaService_2.java	1	[{"added": {}}]	7	1
101	2018-04-16 17:48:16.238278-03	20	MatriculaAcademicaService_3.java	1	[{"added": {}}]	7	1
102	2018-04-16 17:51:55.537687-03	21	MatriculaAcademicaService_4.java	1	[{"added": {}}]	7	1
103	2018-04-16 17:54:11.757455-03	22	MatriculaAcademicaService_5.java	1	[{"added": {}}]	7	1
104	2018-04-16 17:56:14.3554-03	23	MatriculaAcademicaService_6.java	1	[{"added": {}}]	7	1
105	2018-04-16 18:00:38.657374-03	5	Removendo God Class da classe MatriculaAcademicaService	1	[{"added": {}}]	9	1
106	2018-04-16 18:01:30.557341-03	18	Original na classe MatriculaAcademicaService [0]	1	[{"added": {}}]	10	1
107	2018-04-16 18:02:01.713612-03	19	Original na classe MatriculaAcademicaService [1]	1	[{"added": {}}]	10	1
108	2018-04-16 18:02:16.155271-03	20	Move Method na classe MatriculaAcademicaService [2]	1	[{"added": {}}]	10	1
109	2018-04-16 18:02:45.29464-03	21	Move Method na classe MatriculaAcademicaService [3]	1	[{"added": {}}]	10	1
110	2018-04-16 18:03:11.213159-03	22	Move Method na classe MatriculaAcademicaService [4]	1	[{"added": {}}]	10	1
111	2018-04-16 18:03:27.810405-03	23	Move Method na classe MatriculaAcademicaService [5]	1	[{"added": {}}]	10	1
112	2018-04-16 18:04:58.726654-03	19	MatriculaAcademicaService_2.java	2	[{"changed": {"fields": ["changes_description"]}}]	7	1
113	2018-04-16 18:09:39.925303-03	4	Simplificado	1	[{"added": {}}]	8	1
114	2018-04-16 18:10:04.590215-03	19	Simplificado na classe MatriculaAcademicaService [1]	2	[{"changed": {"fields": ["type"]}}]	10	1
115	2018-04-16 18:53:20.079427-03	2	alessandro	1	[{"added": {}}]	3	1
116	2018-04-16 18:53:36.196386-03	2	alessandro	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	3	1
117	2018-04-16 18:54:26.198373-03	2	alessandro	2	[]	3	1
118	2018-04-20 15:18:34.228458-03	24	UserFactory_1.java	1	[{"added": {}}]	7	1
119	2018-04-20 15:20:11.136299-03	25	UserFactory_2.java	1	[{"added": {}}]	7	1
120	2018-04-20 15:21:44.611222-03	26	UserFactory_3.java	1	[{"added": {}}]	7	1
121	2018-04-20 15:24:50.825834-03	27	User_1.java	1	[{"added": {}}]	7	1
122	2018-04-20 15:26:43.519146-03	6	Removendo Feature Envy da classe UserFactory	1	[{"added": {}}]	9	1
123	2018-04-20 15:27:20.584622-03	24	Original na classe UserFactory [0]	1	[{"added": {}}]	10	1
124	2018-04-20 15:27:53.462774-03	25	Extract Method na classe UserFactory [1]	1	[{"added": {}}]	10	1
125	2018-04-20 15:28:19.106863-03	26	Move Method na classe UserFactory [2]	1	[{"added": {}}]	10	1
126	2018-04-20 15:28:35.232243-03	27	Move Method na classe User [3]	1	[{"added": {}}]	10	1
127	2018-04-20 15:31:16.400509-03	25	UserFactory_2.java	2	[{"changed": {"fields": ["changes_description"]}}]	7	1
128	2018-04-20 15:31:46.872079-03	26	UserFactory_3.java	2	[{"changed": {"fields": ["interesting_lines"]}}]	7	1
129	2018-04-20 15:32:31.501474-03	27	User_1.java	2	[{"changed": {"fields": ["changes_description"]}}]	7	1
130	2018-04-20 15:34:06.039764-03	1	Removendo Complex Class da classe Clause	2	[{"changed": {"fields": ["description"]}}]	9	1
131	2018-04-20 15:44:02.202303-03	1	Clause_1.java	2	[{"changed": {"fields": ["source_code"]}}]	7	1
132	2018-04-20 15:45:41.621887-03	2	Clause_2.java	2	[{"changed": {"fields": ["source_code", "changes_description", "interesting_lines"]}}]	7	1
133	2018-04-20 15:46:04.773705-03	2	Clause_2.java	2	[]	7	1
134	2018-04-20 15:47:18.524952-03	28	Clause_3.java	1	[{"added": {}}]	7	1
135	2018-04-20 15:47:44.242547-03	28	Extract Method na classe Clause [2]	1	[{"added": {}}]	10	1
136	2018-04-20 15:48:31.644537-03	1	Clause_1.java	2	[{"changed": {"fields": ["source_code"]}}]	7	1
137	2018-04-20 15:48:43.097866-03	2	Clause_2.java	2	[{"changed": {"fields": ["source_code"]}}]	7	1
138	2018-04-20 15:48:56.124398-03	28	Clause_3.java	2	[]	7	1
139	2018-04-20 15:49:09.988027-03	28	Clause_3.java	2	[{"changed": {"fields": ["interesting_lines"]}}]	7	1
140	2018-04-20 15:49:35.951339-03	2	Clause_2.java	2	[{"changed": {"fields": ["interesting_lines"]}}]	7	1
141	2018-04-20 16:29:32.174128-03	29	DiarioClasseService_1.java	1	[{"added": {}}]	7	1
142	2018-04-20 16:30:24.505959-03	30	DiarioClasseService_2.java	1	[{"added": {}}]	7	1
143	2018-04-20 16:32:52.975539-03	31	DiarioClasseService_3.java	1	[{"added": {}}]	7	1
144	2018-04-20 16:36:03.160012-03	32	DiarioClasseService_4.java	1	[{"added": {}}]	7	1
145	2018-04-20 16:38:19.206003-03	33	DiarioClasse_1.java	1	[{"added": {}}]	7	1
146	2018-04-20 16:39:12.420493-03	34	DiarioClasseService_5.java	1	[{"added": {}}]	7	1
147	2018-04-20 16:40:27.160138-03	7	Removendo Complex Class da classe DiarioClasseService	1	[{"added": {}}]	9	1
148	2018-04-20 16:40:52.788338-03	29	Original na classe DiarioClasseService [0]	1	[{"added": {}}]	10	1
149	2018-04-20 16:41:08.680101-03	30	Extract Method na classe DiarioClasseService [1]	1	[{"added": {}}]	10	1
150	2018-04-20 16:41:33.179883-03	31	Extract Method na classe DiarioClasseService [2]	1	[{"added": {}}]	10	1
151	2018-04-20 16:42:31.671562-03	32	Extract Method na classe DiarioClasseService [4]	1	[{"added": {}}]	10	1
152	2018-04-20 16:43:03.559239-03	33	Move Method na classe DiarioClasse [5]	1	[{"added": {}}]	10	1
153	2018-04-20 16:44:08.397484-03	32	Extract Method na classe DiarioClasseService [3]	2	[{"changed": {"fields": ["file", "order"]}}]	10	1
154	2018-04-20 16:44:14.572297-03	33	Move Method na classe DiarioClasse [4]	2	[{"changed": {"fields": ["order"]}}]	10	1
155	2018-04-20 16:44:34.787719-03	34	Move Method na classe DiarioClasseService [5]	1	[{"added": {}}]	10	1
156	2018-04-20 17:38:01.035911-03	35	LibraryMainControl_1	1	[{"added": {}}]	7	1
157	2018-04-20 17:39:34.049046-03	36	LibraryMainControl_2	1	[{"added": {}}]	7	1
158	2018-04-20 17:40:39.706021-03	37	LibraryMainControl_3	1	[{"added": {}}]	7	1
159	2018-04-20 17:42:01.919087-03	37	LibraryMainControl_3	2	[{"changed": {"fields": ["changes_description"]}}]	7	1
160	2018-04-20 17:42:39.363452-03	38	LibraryMainControl_4	1	[{"added": {}}]	7	1
161	2018-04-20 17:43:59.367994-03	8	Removendo God Class da classe LibraryMainControl	1	[{"added": {}}]	9	1
162	2018-04-20 17:44:19.437027-03	35	Original na classe LibraryMainControl [0]	1	[{"added": {}}]	10	1
163	2018-04-20 17:44:34.212528-03	36	Move Method na classe LibraryMainControl [1]	1	[{"added": {}}]	10	1
164	2018-04-20 17:44:49.472518-03	37	Move Method na classe LibraryMainControl [2]	1	[{"added": {}}]	10	1
165	2018-04-20 17:45:12.740972-03	5	Move Field	1	[{"added": {}}]	8	1
166	2018-04-20 17:45:21.235539-03	38	Move Field na classe LibraryMainControl [3]	1	[{"added": {}}]	10	1
167	2018-04-20 17:51:05.647395-03	6	Move Methods	1	[{"added": {}}]	8	1
168	2018-04-20 17:51:27.692633-03	37	Move Methods na classe LibraryMainControl [2]	2	[{"changed": {"fields": ["type"]}}]	10	1
169	2018-04-20 17:51:33.16312-03	36	Move Methods na classe LibraryMainControl [1]	2	[{"changed": {"fields": ["type"]}}]	10	1
170	2018-04-20 17:51:49.965261-03	23	Move Methods na classe MatriculaAcademicaService [5]	2	[{"changed": {"fields": ["type"]}}]	10	1
171	2018-04-20 17:51:52.678114-03	22	Move Methods na classe MatriculaAcademicaService [4]	2	[{"changed": {"fields": ["type"]}}]	10	1
172	2018-04-20 17:51:57.620836-03	21	Move Methods na classe MatriculaAcademicaService [3]	2	[{"changed": {"fields": ["type"]}}]	10	1
173	2018-04-20 17:52:01.474565-03	20	Move Methods na classe MatriculaAcademicaService [2]	2	[{"changed": {"fields": ["type"]}}]	10	1
174	2018-04-21 13:24:38.863432-03	1	Clause_1.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
175	2018-04-21 13:25:46.532399-03	2	Clause_2.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
176	2018-04-21 13:26:57.981577-03	3	GenericTranspalBean_1.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
177	2018-04-21 13:27:03.731601-03	4	GenericTranspalBean_2.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
178	2018-04-21 13:27:10.851767-03	5	GenericTranspalBean_3.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
179	2018-04-21 13:27:17.726537-03	6	GenericTranspalBean_4.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
180	2018-04-21 13:27:30.428876-03	7	GenericTranspalBean_5.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
181	2018-04-21 13:27:40.045917-03	8	GenericTranspalBean_6.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
182	2018-04-21 13:27:46.718937-03	9	GenericTranspalBean_7.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
183	2018-04-21 13:36:48.304358-03	28	Clause_3.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
184	2018-04-21 13:38:44.491532-03	10	IngressoUniversidadeService_1.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
185	2018-04-21 13:38:55.875967-03	11	IngressoUniversidadeService_2.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
186	2018-04-21 13:39:03.985833-03	12	IngressoUniversidadeService_3.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
187	2018-04-21 13:39:15.316052-03	13	IngressoUniversidadeService_4.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
188	2018-04-21 13:40:26.044023-03	12	IngressoUniversidadeService_3.java	2	[{"changed": {"fields": ["changes_description"]}}]	7	1
189	2018-04-21 18:53:24.203059-03	3	GenericTranspalBean_1.java	2	[{"changed": {"fields": ["source_code", "interesting_lines"]}}]	7	1
190	2018-04-21 18:54:45.656384-03	3	GenericTranspalBean_1.java	2	[{"changed": {"fields": ["source_code", "interesting_lines"]}}]	7	1
191	2018-04-21 18:55:19.281984-03	3	GenericTranspalBean_1.java	2	[{"changed": {"fields": ["source_code", "interesting_lines"]}}]	7	1
192	2018-04-21 19:00:06.716519-03	3	GenericTranspalBean_1.java	2	[{"changed": {"fields": ["source_code", "interesting_lines"]}}]	7	1
193	2018-04-21 19:00:28.915098-03	3	GenericTranspalBean_1.java	2	[{"changed": {"fields": ["interesting_lines"]}}]	7	1
194	2018-04-21 19:08:18.424833-03	10	IngressoUniversidadeService_1.java	2	[{"changed": {"fields": ["source_code", "interesting_lines"]}}]	7	1
195	2018-04-21 19:22:40.827245-03	11	IngressoUniversidadeService_2.java	2	[{"changed": {"fields": ["source_code", "interesting_lines"]}}]	7	1
196	2018-04-21 19:22:58.522158-03	11	IngressoUniversidadeService_2.java	2	[{"changed": {"fields": ["interesting_lines"]}}]	7	1
197	2018-04-21 19:26:16.007907-03	12	IngressoUniversidadeService_3.java	2	[{"changed": {"fields": ["source_code", "interesting_lines"]}}]	7	1
198	2018-04-21 19:28:25.363074-03	13	IngressoUniversidadeService_4.java	2	[{"changed": {"fields": ["source_code", "interesting_lines"]}}]	7	1
199	2018-04-21 19:35:17.637977-03	13	Move Method na classe IngressoUniversidadeService [3]	2	[{"added": {"name": "source file", "object": "MatriculaInstitucional_1.java"}}]	10	1
200	2018-04-21 19:36:05.676511-03	13	Move Method na classe IngressoUniversidadeService [3]	2	[{"changed": {"fields": ["source_code", "interesting_lines"], "name": "source file", "object": "MatriculaInstitucional_1.java"}}]	10	1
201	2018-04-21 19:37:16.607933-03	13	Move Method na classe IngressoUniversidadeService [3]	2	[{"changed": {"fields": ["changes_description"], "name": "source file", "object": "IngressoUniversidadeService_4.java"}}]	10	1
202	2018-04-21 19:38:40.989046-03	10	Original na classe IngressoUniversidadeService [0]	2	[{"changed": {"fields": ["source_code", "interesting_lines"], "name": "source file", "object": "IngressoUniversidadeService_1.java"}}]	10	1
203	2018-04-21 19:39:55.769475-03	11	Extract Method na classe IngressoUniversidadeService [1]	2	[{"changed": {"fields": ["source_code", "interesting_lines"], "name": "source file", "object": "IngressoUniversidadeService_2.java"}}]	10	1
204	2018-04-21 19:40:39.136267-03	12	Extract Method na classe IngressoUniversidadeService [2]	2	[{"changed": {"fields": ["source_code", "interesting_lines"], "name": "source file", "object": "IngressoUniversidadeService_3.java"}}]	10	1
205	2018-04-21 19:43:03.893902-03	13	Move Method na classe IngressoUniversidadeService [3]	2	[{"changed": {"fields": ["source_code", "interesting_lines"], "name": "source file", "object": "MatriculaInstitucional_1.java"}}]	10	1
206	2018-04-21 19:43:54.604245-03	14	Media_1.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
207	2018-04-21 19:44:02.786791-03	15	Media_2.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
208	2018-04-21 19:44:13.017509-03	16	Media_3.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
209	2018-04-21 19:44:26.779694-03	17	PicturePool_1.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
210	2018-04-21 19:46:52.277375-03	18	MatriculaAcademicaService_1.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
211	2018-04-21 19:47:44.660157-03	19	MatriculaAcademicaService_2.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
212	2018-04-21 19:48:55.655099-03	20	MatriculaAcademicaService_3.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
213	2018-04-21 22:18:31.925099-03	19	MatriculaAcademicaService_2.java	2	[{"changed": {"fields": ["interesting_lines"]}}]	7	1
214	2018-04-21 22:20:34.244834-03	19	MatriculaAcademicaService_2.java	2	[{"changed": {"fields": ["changes_description"]}}]	7	1
215	2018-04-21 22:24:37.25343-03	20	Move Methods na classe MatriculaAcademicaService [2]	2	[{"added": {"name": "source file", "object": "AtividadeCurricularService_1.java"}}]	10	1
216	2018-04-21 22:25:33.080341-03	20	Move Methods na classe MatriculaAcademicaService [2]	2	[{"changed": {"fields": ["changes_description"], "name": "source file", "object": "MatriculaAcademicaService_3.java"}}]	10	1
217	2018-04-21 22:27:39.176245-03	21	MatriculaAcademicaService_4.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
218	2018-04-21 22:27:58.908007-03	22	MatriculaAcademicaService_5.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
219	2018-04-21 22:28:11.924318-03	23	MatriculaAcademicaService_6.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
220	2018-04-21 22:32:32.786667-03	20	Move Methods na classe MatriculaAcademicaService [2]	2	[{"changed": {"fields": ["interesting_lines", "changes_description"], "name": "source file", "object": "MatriculaAcademicaService_3.java"}}]	10	1
221	2018-04-21 22:36:25.943757-03	21	Move Methods na classe MatriculaAcademicaService [3]	2	[{"added": {"name": "source file", "object": "TurmaService_1.java"}}, {"changed": {"fields": ["changes_description"], "name": "source file", "object": "MatriculaAcademicaService_4.java"}}]	10	1
222	2018-04-21 22:37:26.901537-03	21	Move Methods na classe MatriculaAcademicaService [3]	2	[{"changed": {"fields": ["interesting_lines"], "name": "source file", "object": "MatriculaAcademicaService_4.java"}}]	10	1
223	2018-04-21 22:43:24.178307-03	22	Move Methods na classe MatriculaAcademicaService [4]	2	[{"added": {"name": "source file", "object": "MatriculaAcademicaService_GodClass_1.java"}}, {"changed": {"fields": ["changes_description"], "name": "source file", "object": "MatriculaAcademicaService_5.java"}}]	10	1
224	2018-04-21 22:44:44.933059-03	22	Move Methods na classe MatriculaAcademicaService [4]	2	[{"changed": {"fields": ["interesting_lines"], "name": "source file", "object": "MatriculaAcademicaService_5.java"}}]	10	1
225	2018-04-21 22:46:43.09068-03	23	Move Methods na classe MatriculaAcademicaService [5]	2	[{"added": {"name": "source file", "object": "ValidacaoMatriculaService_1.java"}}, {"changed": {"fields": ["changes_description"], "name": "source file", "object": "MatriculaAcademicaService_6.java"}}]	10	1
226	2018-04-21 22:47:48.30278-03	24	UserFactory_1.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
227	2018-04-21 22:48:03.209728-03	25	UserFactory_2.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
228	2018-04-21 22:48:15.572478-03	26	UserFactory_3.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
229	2018-04-21 22:49:42.785182-03	27	User_1.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
230	2018-04-21 22:59:55.013413-03	35	LibraryMainControl_1	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
231	2018-04-21 23:00:02.787776-03	36	LibraryMainControl_2	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
232	2018-04-21 23:00:11.304398-03	37	LibraryMainControl_3	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
233	2018-04-21 23:00:21.32858-03	38	LibraryMainControl_4	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
234	2018-04-21 23:04:39.690403-03	29	DiarioClasseService_1.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
235	2018-04-21 23:04:47.126077-03	30	DiarioClasseService_2.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
236	2018-04-21 23:04:53.458939-03	31	DiarioClasseService_3.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
237	2018-04-21 23:05:12.472006-03	32	DiarioClasseService_4.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
238	2018-04-21 23:05:27.018527-03	33	DiarioClasse_1.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
239	2018-04-21 23:05:36.199861-03	34	DiarioClasseService_5.java	2	[{"changed": {"fields": ["refactoring"]}}]	7	1
240	2018-04-21 23:34:37.47412-03	9	Diego sobre 'Removendo Complex Class da classe GenericTranspalBean'	3		12	1
241	2018-04-21 23:34:37.477394-03	8	Diego sobre 'Removendo Complex Class da classe Clause'	3		12	1
242	2018-04-21 23:51:18.918572-03	3	tiago	1	[{"added": {}}]	3	1
243	2018-04-21 23:51:29.362197-03	3	tiago	2	[{"added": {"object": "tiago", "name": "user subject"}}]	3	1
244	2018-04-21 23:51:46.404223-03	3	tiago	2	[{"changed": {"object": "tiago", "fields": ["on_experiment"], "name": "user subject"}}]	3	1
245	2018-04-21 23:51:54.09889-03	3	tiago	2	[{"changed": {"object": "tiago", "fields": ["on_experiment"], "name": "user subject"}}]	3	1
246	2018-04-21 23:56:49.42436-03	8	Removendo God Class da classe LibraryMainControl	3		9	1
247	2018-04-22 00:07:30.544654-03	1	diego	2	[{"changed": {"object": "diego", "fields": ["on_experiment"], "name": "user subject"}}]	3	1
248	2018-04-22 00:07:44.814524-03	16	Diego sobre 'Removendo Complex Class da classe DiarioClasseService'	3		12	1
249	2018-04-22 00:07:44.817107-03	15	Diego sobre 'Removendo Complex Class da classe Clause'	3		12	1
250	2018-04-22 00:07:44.818788-03	14	Diego sobre 'Removendo Feature Envy da classe UserFactory'	3		12	1
251	2018-04-22 00:07:44.820417-03	13	Diego sobre 'Removendo Feature Envy da classe Media'	3		12	1
252	2018-04-22 00:07:44.822402-03	12	Diego sobre 'Removendo God Class da classe MatriculaAcademicaService'	3		12	1
253	2018-04-22 00:07:44.824243-03	11	Diego sobre 'Removendo Feature Envy da classe IngressoUniversidadeService'	3		12	1
254	2018-04-22 00:07:44.826064-03	10	Diego sobre 'Removendo Complex Class da classe GenericTranspalBean'	3		12	1
255	2018-04-25 21:06:27.87583-03	9	Removendo God Class da classe LibraryMainControl	1	[{"added": {}}]	9	1
256	2018-04-25 21:09:01.335733-03	39	Original na classe LibraryMainControl [0]	1	[{"added": {}}, {"added": {"name": "source file", "object": "LibraryMainControl_1.java"}}]	10	1
257	2018-04-25 21:13:49.585923-03	40	Move Methods na classe LibraryMainControl [1]	1	[{"added": {}}, {"added": {"name": "source file", "object": "LibraryMainControl_2.java"}}, {"added": {"name": "source file", "object": "Item_1.java"}}]	10	1
258	2018-04-25 21:16:43.681227-03	41	Move Methods na classe LibraryMainControl [2]	1	[{"added": {}}, {"added": {"name": "source file", "object": "LibraryMainControl_3.java"}}, {"added": {"name": "source file", "object": "Catalog_1.java"}}]	10	1
259	2018-04-25 21:17:08.382148-03	41	Move Methods na classe LibraryMainControl [2]	2	[{"changed": {"name": "source file", "object": "LibraryMainControl_3.java", "fields": ["source_code", "changes_description"]}}]	10	1
260	2018-04-25 22:05:51.888371-03	10	Removendo God Class da classe EmployeeUtils	1	[{"added": {}}]	9	1
261	2018-04-25 22:12:05.680928-03	42	Original na classe EmployeeUtils [0]	1	[{"added": {}}, {"added": {"name": "source file", "object": "EmployeeUtils_1.java"}}]	10	1
262	2018-04-25 22:12:30.504413-03	42	Original na classe EmployeeUtils [0]	2	[{"changed": {"name": "source file", "fields": ["interesting_lines"], "object": "EmployeeUtils_1.java"}}]	10	1
263	2018-04-25 22:13:02.215184-03	7	Move Class	1	[{"added": {}}]	8	1
264	2018-04-25 22:17:07.420466-03	43	Move Class na classe EmployeeUtils [1]	1	[{"added": {}}, {"added": {"name": "source file", "object": "EmployeeUtils_2.java"}}, {"added": {"name": "source file", "object": "Employee_1.java"}}]	10	1
265	2018-04-25 22:17:52.005669-03	43	Move Class na classe EmployeeUtils [1]	2	[{"changed": {"name": "source file", "fields": ["changes_description"], "object": "EmployeeUtils_2.java"}}]	10	1
266	2018-04-25 22:18:36.385014-03	43	Move Class na classe EmployeeUtils [1]	2	[{"changed": {"name": "source file", "fields": ["name"], "object": "zEmployee_1.java"}}]	10	1
267	2018-04-25 22:20:22.24601-03	41	Move Methods na classe LibraryMainControl [2]	2	[{"changed": {"name": "source file", "fields": ["name"], "object": "zCatalog_1.java"}}]	10	1
268	2018-04-25 22:25:19.516238-03	44	Move Methods na classe EmployeeUtils [2]	1	[{"added": {}}, {"added": {"name": "source file", "object": "EmployeeUtils_3.java"}}, {"added": {"name": "source file", "object": "zEmployeeRepository_1.java"}}]	10	1
269	2018-04-25 22:26:42.904304-03	44	Move Methods na classe EmployeeUtils [2]	2	[{"changed": {"name": "source file", "fields": ["changes_description"], "object": "EmployeeUtils_3.java"}}]	10	1
270	2018-04-25 22:27:01.967718-03	44	Move Methods na classe EmployeeUtils [2]	2	[{"changed": {"name": "source file", "fields": ["name"], "object": "zzEmployeeRepository_1.java"}}]	10	1
271	2018-04-25 22:41:54.17524-03	45	Move Methods na classe EmployeeUtils [3]	1	[{"added": {}}, {"added": {"object": "EmployeeUtils_4.java", "name": "source file"}}, {"added": {"object": "EmployeeImportExport_1.java", "name": "source file"}}]	10	1
272	2018-04-25 22:47:39.522804-03	46	Move Method na classe EmployeeUtils [4]	1	[{"added": {}}, {"added": {"object": "EmployeeUtils_5.java", "name": "source file"}}, {"added": {"object": "Employee_2.java", "name": "source file"}}]	10	1
273	2018-04-27 15:26:09.623402-03	4	marcospereira	1	[{"added": {}}]	3	1
274	2018-04-27 15:29:38.468048-03	4	marcospereira	2	[{"changed": {"fields": ["first_name", "last_name"]}}, {"added": {"name": "user subject", "object": "marcospereira"}}]	3	1
275	2018-04-27 15:29:42.719131-03	4	marcospereira	2	[{"changed": {"name": "user subject", "object": "marcospereira", "fields": ["on_experiment"]}}]	3	1
276	2018-04-27 18:01:33.670066-03	3	tiago	3		3	1
277	2018-05-03 16:01:40.418401-03	10	Removendo God Class da classe EmployeeUtils	2	[{"changed": {"fields": ["description"]}}]	9	1
278	2018-05-03 16:03:41.781841-03	10	Removendo God Class da classe EmployeeUtils	2	[{"changed": {"fields": ["description"]}}]	9	1
279	2018-05-03 16:05:44.858572-03	1	Removendo Complex Class da classe Clause	2	[{"changed": {"fields": ["description"]}}]	9	1
280	2018-05-03 16:10:19.505648-03	1	Removendo Complex Class da classe Clause	2	[{"changed": {"fields": ["description"]}}]	9	1
281	2018-05-03 16:17:53.484405-03	13	Move Method na classe IngressoUniversidadeService [3]	2	[{"changed": {"object": "IngressoUniversidadeService_4.java", "fields": ["changes_description"], "name": "source file"}}]	10	1
282	2018-05-03 16:19:32.733291-03	6	Removendo Feature Envy da classe UserFactory	2	[{"changed": {"fields": ["description"]}}]	9	1
283	2018-05-03 16:24:13.668644-03	26	Move Method na classe UserFactory [2]	2	[{"added": {"object": "User_1.1.java", "name": "source file"}}]	10	1
284	2018-05-03 16:24:59.554172-03	27	Move Method na classe User [3]	3		10	1
285	2018-05-03 16:27:57.713565-03	4	Removendo Feature Envy da classe Media	2	[{"changed": {"fields": ["description"]}}]	9	1
286	2018-05-03 16:33:54.141873-03	16	Move Method na classe Media [2]	2	[{"added": {"object": "PicturePool_1.1.java", "name": "source file"}}]	10	1
287	2018-05-03 16:34:21.708129-03	17	Move Method na classe PicturePool [3]	3		10	1
288	2018-05-03 16:37:17.84565-03	2	Removendo Complex Class da classe GenericTranspalBean	2	[{"changed": {"fields": ["description"]}}]	9	1
289	2018-05-03 16:39:32.896991-03	3	Removendo Feature Envy da classe IngressoUniversidadeService	2	[{"changed": {"fields": ["description"]}}]	9	1
290	2018-05-03 16:41:26.056595-03	5	Removendo God Class da classe MatriculaAcademicaService	2	[{"changed": {"fields": ["description"]}}]	9	1
291	2018-05-03 16:41:44.817977-03	5	Removendo God Class da classe MatriculaAcademicaService	2	[{"changed": {"fields": ["description"]}}]	9	1
292	2018-05-03 16:42:04.847684-03	5	Removendo God Class da classe MatriculaAcademicaService	2	[{"changed": {"fields": ["description"]}}]	9	1
293	2018-05-03 16:42:44.070148-03	7	Removendo Complex Class da classe DiarioClasseService	2	[{"changed": {"fields": ["description"]}}]	9	1
294	2018-05-03 16:43:30.597361-03	9	Removendo God Class da classe LibraryMainControl	2	[{"changed": {"fields": ["description"]}}]	9	1
295	2018-05-03 16:43:52.828823-03	9	Removendo God Class da classe LibraryMainControl	2	[{"changed": {"fields": ["description"]}}]	9	1
296	2018-05-03 16:45:34.361404-03	10	Removendo God Class da classe EmployeeUtils	2	[{"changed": {"fields": ["description"]}}]	9	1
297	2018-05-03 16:53:13.65851-03	5	Removendo God Class da classe MatriculaAcademicaService	2	[{"changed": {"fields": ["description"]}}]	9	1
298	2018-05-03 16:53:32.162357-03	5	Removendo God Class da classe MatriculaAcademicaService	2	[]	9	1
299	2018-05-03 16:56:03.824377-03	9	Removendo God Class da classe LibraryMainControl	2	[{"changed": {"fields": ["description"]}}]	9	1
300	2018-05-03 17:03:17.196854-03	2	Removendo Complex Class da classe GenericTranspalBean	2	[{"changed": {"fields": ["description"]}}]	9	1
301	2018-05-03 17:03:42.140254-03	7	Removendo Complex Class da classe DiarioClasseService	2	[{"changed": {"fields": ["description"]}}]	9	1
302	2018-05-03 17:06:27.576098-03	7	Removendo Complex Class da classe DiarioClasseService	2	[{"changed": {"fields": ["description"]}}]	9	1
303	2018-05-03 17:06:45.173679-03	2	Removendo Complex Class da classe GenericTranspalBean	2	[{"changed": {"fields": ["description"]}}]	9	1
304	2018-05-03 17:07:11.596982-03	1	Removendo Complex Class da classe Clause	2	[{"changed": {"fields": ["description"]}}]	9	1
305	2018-05-03 17:15:47.544104-03	1	diego	2	[{"changed": {"object": "diego", "fields": ["on_experiment"], "name": "user subject"}}]	3	1
306	2018-05-03 17:27:09.399099-03	2	Original na classe GenericTranspalBean [0]	2	[{"changed": {"object": "GenericTranspalBean_1.java", "name": "source file", "fields": ["changes_description"]}}]	10	1
307	2018-05-03 17:34:40.583533-03	3	Extract Method na classe GenericTranspalBean [1]	2	[{"changed": {"name": "source file", "object": "GenericTranspalBean_2.java", "fields": ["changes_description"]}}]	10	1
308	2018-05-03 17:35:02.278184-03	4	Extract Method na classe GenericTranspalBean [2]	2	[{"changed": {"name": "source file", "object": "GenericTranspalBean_3.java", "fields": ["changes_description"]}}]	10	1
309	2018-05-03 17:35:10.382135-03	5	Extract Method na classe GenericTranspalBean [3]	2	[{"changed": {"name": "source file", "object": "GenericTranspalBean_4.java", "fields": ["changes_description"]}}]	10	1
310	2018-05-03 17:35:19.997541-03	6	Extract Method na classe GenericTranspalBean [4]	2	[{"changed": {"name": "source file", "object": "GenericTranspalBean_5.java", "fields": ["changes_description"]}}]	10	1
311	2018-05-03 17:35:29.885192-03	7	Extract Method na classe GenericTranspalBean [5]	2	[{"changed": {"name": "source file", "object": "GenericTranspalBean_6.java", "fields": ["changes_description"]}}]	10	1
312	2018-05-03 17:35:39.078441-03	8	Extract Method na classe GenericTranspalBean [6]	2	[{"changed": {"name": "source file", "object": "GenericTranspalBean_7.java", "fields": ["changes_description"]}}]	10	1
313	2018-05-03 17:36:55.619244-03	29	Original na classe DiarioClasseService [0]	2	[{"changed": {"name": "source file", "object": "DiarioClasseService_1.java", "fields": ["changes_description"]}}]	10	1
314	2018-05-03 17:37:06.120987-03	30	Extract Method na classe DiarioClasseService [1]	2	[{"changed": {"name": "source file", "object": "DiarioClasseService_2.java", "fields": ["changes_description"]}}]	10	1
315	2018-05-03 17:37:27.919904-03	31	Extract Method na classe DiarioClasseService [2]	2	[{"changed": {"name": "source file", "object": "DiarioClasseService_3.java", "fields": ["changes_description"]}}]	10	1
316	2018-05-03 17:38:32.797887-03	32	Extract Method na classe DiarioClasseService [3]	2	[{"changed": {"name": "source file", "object": "DiarioClasseService_4.java", "fields": ["changes_description"]}}]	10	1
317	2018-05-03 17:38:57.837636-03	33	Move Method na classe DiarioClasse [4]	2	[{"changed": {"name": "source file", "object": "DiarioClasse_1.java", "fields": ["changes_description"]}}]	10	1
318	2018-05-03 17:39:16.277104-03	34	Move Method na classe DiarioClasseService [5]	2	[{"changed": {"name": "source file", "object": "DiarioClasseService_5.java", "fields": ["changes_description"]}}]	10	1
319	2018-05-03 17:40:23.666221-03	32	Extract Method na classe DiarioClasseService [3]	2	[{"changed": {"name": "source file", "object": "DiarioClasseService_4.java", "fields": ["changes_description"]}}]	10	1
320	2018-05-03 17:42:08.752191-03	34	Move Method na classe DiarioClasseService [5]	2	[{"added": {"name": "source file", "object": "DiarioClasse_1.1.java"}}]	10	1
321	2018-05-03 17:44:06.074282-03	33	Move Method na classe DiarioClasse [4]	2	[{"added": {"name": "source file", "object": "DiarioClasseService_5.1.java"}}]	10	1
322	2018-05-03 17:44:46.166793-03	34	Move Method na classe DiarioClasseService [5]	3		10	1
323	2018-05-03 17:46:11.313114-03	9	Extract Method na classe Clause.java [1]	2	[{"changed": {"name": "source file", "object": "Clause_2.java", "fields": ["changes_description"]}}]	10	1
324	2018-05-03 17:46:34.115226-03	28	Extract Method na classe Clause [2]	2	[{"changed": {"name": "source file", "object": "Clause_3.java", "fields": ["changes_description"]}}]	10	1
325	2018-05-03 17:47:47.429279-03	18	Original na classe MatriculaAcademicaService [0]	2	[{"changed": {"name": "source file", "object": "MatriculaAcademicaService_1.java", "fields": ["changes_description"]}}]	10	1
326	2018-05-03 17:48:30.906616-03	19	Simplificado na classe MatriculaAcademicaService [1]	2	[{"changed": {"name": "source file", "object": "MatriculaAcademicaService_2.java", "fields": ["changes_description"]}}]	10	1
327	2018-05-03 17:50:30.21648-03	20	Move Methods na classe MatriculaAcademicaService [2]	2	[{"changed": {"name": "source file", "object": "MatriculaAcademicaService_3.java", "fields": ["changes_description"]}}, {"changed": {"name": "source file", "object": "AtividadeCurricularService_1.java", "fields": ["changes_description"]}}]	10	1
328	2018-05-03 17:51:48.235596-03	20	Move Methods na classe MatriculaAcademicaService [2]	2	[{"changed": {"name": "source file", "object": "MatriculaAcademicaService_3.java", "fields": ["changes_description"]}}]	10	1
329	2018-05-03 17:52:50.306139-03	20	Move Methods na classe MatriculaAcademicaService [2]	2	[{"changed": {"name": "source file", "object": "MatriculaAcademicaService_3.java", "fields": ["changes_description"]}}]	10	1
330	2018-05-03 17:53:09.202368-03	20	Move Methods na classe MatriculaAcademicaService [2]	2	[{"changed": {"name": "source file", "object": "MatriculaAcademicaService_3.java", "fields": ["changes_description"]}}]	10	1
331	2018-05-03 17:53:34.025168-03	20	Move Methods na classe MatriculaAcademicaService [2]	2	[{"changed": {"name": "source file", "object": "MatriculaAcademicaService_3.java", "fields": ["changes_description"]}}]	10	1
332	2018-05-03 17:56:08.859792-03	21	Move Methods na classe MatriculaAcademicaService [3]	2	[{"changed": {"name": "source file", "object": "MatriculaAcademicaService_4.java", "fields": ["changes_description"]}}, {"changed": {"name": "source file", "object": "TurmaService_1.java", "fields": ["changes_description"]}}]	10	1
333	2018-05-03 18:01:58.950737-03	21	Move Methods na classe MatriculaAcademicaService [3]	2	[{"changed": {"name": "source file", "object": "MatriculaAcademicaService_4.java", "fields": ["interesting_lines"]}}]	10	1
334	2018-05-03 18:02:50.526125-03	21	Move Methods na classe MatriculaAcademicaService [3]	2	[{"changed": {"name": "source file", "object": "MatriculaAcademicaService_4.java", "fields": ["interesting_lines"]}}]	10	1
335	2018-05-03 18:04:07.126969-03	22	Move Methods na classe MatriculaAcademicaService [4]	3		10	1
336	2018-05-03 18:04:16.906116-03	23	Move Methods na classe MatriculaAcademicaService [4]	2	[{"changed": {"fields": ["order"]}}]	10	1
337	2018-05-03 18:07:27.589581-03	20	Move Methods na classe MatriculaAcademicaService [2]	2	[{"changed": {"name": "source file", "object": "MatriculaAcademicaService_3.java", "fields": ["changes_description"]}}]	10	1
338	2018-05-03 18:08:15.728341-03	21	Move Methods na classe MatriculaAcademicaService [3]	2	[{"changed": {"name": "source file", "object": "MatriculaAcademicaService_4.java", "fields": ["changes_description"]}}]	10	1
339	2018-05-03 18:09:56.413242-03	23	Move Methods na classe MatriculaAcademicaService [4]	2	[{"changed": {"name": "source file", "object": "MatriculaAcademicaService_6.java", "fields": ["changes_description"]}}]	10	1
340	2018-05-03 18:10:05.47616-03	23	Move Methods na classe MatriculaAcademicaService [4]	2	[{"changed": {"name": "source file", "object": "ValidacaoMatriculaService_1.java", "fields": ["changes_description"]}}]	10	1
341	2018-05-03 18:12:13.502549-03	42	Original na classe EmployeeUtils [0]	2	[{"changed": {"name": "source file", "object": "EmployeeUtils_1.java", "fields": ["changes_description"]}}]	10	1
342	2018-05-03 18:13:46.60506-03	43	Move Class na classe EmployeeUtils [1]	2	[{"changed": {"name": "source file", "object": "EmployeeUtils_2.java", "fields": ["changes_description"]}}]	10	1
343	2018-05-03 18:14:30.315334-03	44	Move Methods na classe EmployeeUtils [2]	2	[{"changed": {"name": "source file", "object": "EmployeeUtils_3.java", "fields": ["changes_description"]}}]	10	1
344	2018-05-03 18:15:47.530665-03	45	Move Methods na classe EmployeeUtils [3]	2	[{"changed": {"name": "source file", "object": "EmployeeUtils_4.java", "fields": ["changes_description"]}}, {"changed": {"name": "source file", "object": "EmployeeImportExport_1.java", "fields": ["changes_description"]}}]	10	1
345	2018-05-03 18:16:23.848614-03	46	Move Method na classe EmployeeUtils [4]	2	[{"changed": {"name": "source file", "object": "EmployeeUtils_5.java", "fields": ["changes_description"]}}, {"changed": {"name": "source file", "object": "Employee_2.java", "fields": ["changes_description"]}}]	10	1
346	2018-05-03 18:16:55.791716-03	43	Move Class na classe EmployeeUtils [1]	2	[{"changed": {"name": "source file", "object": "zEmployee_1.java", "fields": ["changes_description"]}}]	10	1
347	2018-05-04 07:34:52.438133-03	9	Removendo God Class da classe LibraryMainControl	2	[{"changed": {"fields": ["description"]}}]	9	1
348	2018-05-04 07:35:32.885869-03	39	Original na classe LibraryMainControl [0]	2	[{"changed": {"name": "source file", "object": "LibraryMainControl_1.java", "fields": ["changes_description"]}}]	10	1
349	2018-05-04 07:36:11.11287-03	40	Move Methods na classe LibraryMainControl [1]	2	[{"changed": {"name": "source file", "object": "LibraryMainControl_2.java", "fields": ["changes_description"]}}, {"changed": {"name": "source file", "object": "Item_1.java", "fields": ["changes_description"]}}]	10	1
350	2018-05-04 07:37:03.55231-03	41	Move Methods na classe LibraryMainControl [2]	2	[{"changed": {"name": "source file", "object": "LibraryMainControl_3.java", "fields": ["changes_description"]}}, {"changed": {"name": "source file", "object": "zCatalog_1.java", "fields": ["changes_description"]}}]	10	1
351	2018-05-04 07:37:30.724745-03	40	Move Methods na classe LibraryMainControl [1]	2	[{"changed": {"name": "source file", "object": "LibraryMainControl_2.java", "fields": ["changes_description"]}}]	10	1
352	2018-05-04 07:39:04.760067-03	10	Original na classe IngressoUniversidadeService [0]	2	[{"changed": {"name": "source file", "object": "IngressoUniversidadeService_1.java", "fields": ["changes_description"]}}]	10	1
353	2018-05-04 07:39:22.325257-03	11	Extract Method na classe IngressoUniversidadeService [1]	2	[{"changed": {"name": "source file", "object": "IngressoUniversidadeService_2.java", "fields": ["changes_description"]}}]	10	1
354	2018-05-04 07:39:38.163567-03	12	Extract Method na classe IngressoUniversidadeService [2]	2	[{"changed": {"name": "source file", "object": "IngressoUniversidadeService_3.java", "fields": ["changes_description"]}}]	10	1
355	2018-05-04 07:41:18.133819-03	13	Move Method na classe IngressoUniversidadeService [3]	2	[{"changed": {"name": "source file", "object": "IngressoUniversidadeService_4.java", "fields": ["changes_description"]}}, {"changed": {"name": "source file", "object": "MatriculaInstitucional_1.java", "fields": ["changes_description"]}}]	10	1
356	2018-05-04 07:43:20.003976-03	15	Extract Method na classe Media [1]	2	[{"changed": {"name": "source file", "object": "Media_2.java", "fields": ["changes_description"]}}]	10	1
357	2018-05-04 07:44:00.296541-03	16	Move Method na classe Media [2]	2	[{"changed": {"name": "source file", "object": "Media_3.java", "fields": ["changes_description"]}}, {"changed": {"name": "source file", "object": "PicturePool_1.1.java", "fields": ["changes_description"]}}]	10	1
358	2018-05-04 07:45:22.496907-03	24	Original na classe UserFactory [0]	2	[{"changed": {"name": "source file", "object": "UserFactory_1.java", "fields": ["changes_description"]}}]	10	1
359	2018-05-04 07:45:48.519376-03	25	Extract Method na classe UserFactory [1]	2	[{"changed": {"name": "source file", "object": "UserFactory_2.java", "fields": ["changes_description"]}}]	10	1
360	2018-05-04 07:46:52.475283-03	26	Move Method na classe UserFactory [2]	2	[{"changed": {"name": "source file", "object": "UserFactory_3.java", "fields": ["changes_description"]}}, {"changed": {"name": "source file", "object": "User_1.1.java", "fields": ["changes_description"]}}]	10	1
361	2018-05-04 07:54:56.990343-03	133	Diego sobre 'Removendo Complex Class da classe GenericTranspalBean'	3		12	1
362	2018-05-04 07:54:56.993672-03	132	Diego sobre 'Removendo Complex Class da classe DiarioClasseService'	3		12	1
363	2018-05-04 07:54:56.995212-03	131	Diego sobre 'Removendo Complex Class da classe Clause'	3		12	1
364	2018-05-04 07:54:56.996352-03	130	Diego sobre 'Removendo God Class da classe MatriculaAcademicaService'	3		12	1
365	2018-05-04 07:54:56.997487-03	129	Diego sobre 'Removendo God Class da classe EmployeeUtils'	3		12	1
366	2018-05-04 07:54:56.998671-03	128	Diego sobre 'Removendo God Class da classe LibraryMainControl'	3		12	1
367	2018-05-04 07:54:56.999771-03	127	Diego sobre 'Removendo Feature Envy da classe IngressoUniversidadeService'	3		12	1
368	2018-05-04 07:54:57.000747-03	126	Diego sobre 'Removendo Feature Envy da classe UserFactory'	3		12	1
369	2018-05-04 07:54:57.001865-03	125	Diego sobre 'Removendo Feature Envy da classe Media'	3		12	1
370	2018-05-04 08:21:24.15899-03	134	Diego sobre 'Removendo Feature Envy da classe UserFactory'	3		12	1
371	2018-05-04 09:06:26.632455-03	1	diego	2	[{"changed": {"name": "user subject", "object": "diego", "fields": ["was_welcomed"]}}]	3	1
372	2018-05-04 09:06:46.631178-03	1	diego	2	[{"changed": {"name": "user subject", "object": "diego", "fields": ["was_welcomed"]}}]	3	1
373	2018-05-04 09:17:02.566154-03	10	Original na classe IngressoUniversidadeService [0]	2	[{"changed": {"name": "source file", "object": "IngressoUniversidadeService_1.java", "fields": ["source_code"]}}]	10	1
374	2018-05-04 09:19:29.913219-03	10	Original na classe IngressoUniversidadeService [0]	2	[{"changed": {"name": "source file", "object": "IngressoUniversidadeService_1.java", "fields": ["interesting_lines"]}}]	10	1
375	2018-05-04 09:20:00.616862-03	11	Extract Method na classe IngressoUniversidadeService [1]	2	[{"changed": {"name": "source file", "object": "IngressoUniversidadeService_2.java", "fields": ["source_code", "interesting_lines"]}}]	10	1
376	2018-05-04 09:21:05.319911-03	12	Extract Method na classe IngressoUniversidadeService [2]	2	[{"changed": {"name": "source file", "object": "IngressoUniversidadeService_3.java", "fields": ["source_code", "interesting_lines"]}}]	10	1
377	2018-05-04 09:21:44.195139-03	13	Move Method na classe IngressoUniversidadeService [3]	2	[{"changed": {"name": "source file", "object": "IngressoUniversidadeService_4.java", "fields": ["source_code", "interesting_lines"]}}, {"changed": {"name": "source file", "object": "MatriculaInstitucional_1.java", "fields": ["source_code", "interesting_lines"]}}]	10	1
378	2018-05-04 09:23:41.255316-03	18	Original na classe MatriculaAcademicaService [0]	2	[{"changed": {"name": "source file", "object": "MatriculaAcademicaService_1.java", "fields": ["source_code", "changes_description"]}}]	10	1
379	2018-05-04 09:24:40.36583-03	21	Move Methods na classe MatriculaAcademicaService [3]	2	[{"changed": {"name": "source file", "object": "TurmaService_1.java", "fields": ["source_code", "interesting_lines"]}}]	10	1
380	2018-05-04 09:25:46.649187-03	29	Original na classe DiarioClasseService [0]	2	[{"changed": {"name": "source file", "object": "DiarioClasseService_1.java", "fields": ["source_code"]}}]	10	1
381	2018-05-04 09:26:11.264819-03	29	Original na classe DiarioClasseService [0]	2	[{"changed": {"name": "source file", "object": "DiarioClasseService_1.java", "fields": ["interesting_lines"]}}]	10	1
382	2018-05-04 09:27:19.534263-03	30	Extract Method na classe DiarioClasseService [1]	2	[{"changed": {"name": "source file", "object": "DiarioClasseService_2.java", "fields": ["source_code"]}}]	10	1
383	2018-05-04 09:28:19.078713-03	30	Extract Method na classe DiarioClasseService [1]	2	[{"changed": {"name": "source file", "object": "DiarioClasseService_2.java", "fields": ["interesting_lines"]}}]	10	1
384	2018-05-04 09:29:29.195718-03	31	Extract Method na classe DiarioClasseService [2]	2	[{"changed": {"name": "source file", "object": "DiarioClasseService_3.java", "fields": ["source_code", "interesting_lines"]}}]	10	1
385	2018-05-04 09:30:41.962831-03	32	Extract Method na classe DiarioClasseService [3]	2	[{"changed": {"name": "source file", "object": "DiarioClasseService_4.java", "fields": ["source_code", "interesting_lines"]}}]	10	1
386	2018-05-04 09:34:20.066279-03	33	Move Method na classe DiarioClasse [4]	2	[{"changed": {"name": "source file", "object": "DiarioClasse_1.java", "fields": ["source_code"]}}, {"changed": {"name": "source file", "object": "DiarioClasseService_5.1.java", "fields": ["source_code", "interesting_lines"]}}]	10	1
387	2018-05-04 09:34:53.426726-03	33	Move Method na classe DiarioClasse [4]	2	[{"changed": {"name": "source file", "object": "DiarioClasse_1.java", "fields": ["source_code"]}}]	10	1
388	2018-05-04 09:35:11.601814-03	33	Move Method na classe DiarioClasse [4]	2	[{"changed": {"name": "source file", "object": "DiarioClasse_1.java", "fields": ["interesting_lines"]}}]	10	1
389	2018-05-04 09:37:46.892052-03	2	Original na classe GenericTranspalBean [0]	2	[{"changed": {"name": "source file", "object": "GenericTranspalBean_1.java", "fields": ["source_code", "interesting_lines"]}}]	10	1
390	2018-05-04 09:38:35.7361-03	3	Extract Method na classe GenericTranspalBean [1]	2	[{"changed": {"name": "source file", "object": "GenericTranspalBean_2.java", "fields": ["source_code", "interesting_lines"]}}]	10	1
391	2018-05-04 09:39:09.782709-03	3	Extract Method na classe GenericTranspalBean [1]	2	[{"changed": {"name": "source file", "object": "GenericTranspalBean_2.java", "fields": ["interesting_lines"]}}]	10	1
392	2018-05-04 09:40:33.011784-03	4	Extract Method na classe GenericTranspalBean [2]	2	[{"changed": {"name": "source file", "object": "GenericTranspalBean_3.java", "fields": ["source_code", "interesting_lines"]}}]	10	1
393	2018-05-04 09:41:59.443073-03	5	Extract Method na classe GenericTranspalBean [3]	2	[{"changed": {"name": "source file", "object": "GenericTranspalBean_4.java", "fields": ["source_code", "interesting_lines"]}}]	10	1
394	2018-05-04 09:42:22.378262-03	6	Extract Method na classe GenericTranspalBean [4]	2	[{"changed": {"name": "source file", "object": "GenericTranspalBean_5.java", "fields": ["source_code", "interesting_lines"]}}]	10	1
395	2018-05-04 09:42:59.592954-03	7	Extract Method na classe GenericTranspalBean [5]	2	[{"changed": {"name": "source file", "object": "GenericTranspalBean_6.java", "fields": ["source_code", "interesting_lines"]}}]	10	1
396	2018-05-04 09:43:37.312427-03	8	Extract Method na classe GenericTranspalBean [6]	2	[{"changed": {"name": "source file", "object": "GenericTranspalBean_7.java", "fields": ["source_code", "interesting_lines"]}}]	10	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 396, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	user
4	auth	permission
5	contenttypes	contenttype
6	sessions	session
7	recommendations	sourcefile
8	recommendations	refactoringtype
9	recommendations	batch
10	recommendations	refactoring
11	recommendations	codesmell
12	recommendations	batchfeedback
13	recommendations	usersubject
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_content_type_id_seq', 13, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-04-13 10:03:10.953865-03
2	auth	0001_initial	2018-04-13 10:03:11.021438-03
3	admin	0001_initial	2018-04-13 10:03:11.042425-03
4	admin	0002_logentry_remove_auto_add	2018-04-13 10:03:11.050928-03
5	contenttypes	0002_remove_content_type_name	2018-04-13 10:03:11.072851-03
6	auth	0002_alter_permission_name_max_length	2018-04-13 10:03:11.089999-03
7	auth	0003_alter_user_email_max_length	2018-04-13 10:03:11.098864-03
8	auth	0004_alter_user_username_opts	2018-04-13 10:03:11.1066-03
9	auth	0005_alter_user_last_login_null	2018-04-13 10:03:11.116033-03
10	auth	0006_require_contenttypes_0002	2018-04-13 10:03:11.117783-03
11	auth	0007_alter_validators_add_error_messages	2018-04-13 10:03:11.126726-03
12	auth	0008_alter_user_username_max_length	2018-04-13 10:03:11.149914-03
13	auth	0009_alter_user_last_name_max_length	2018-04-13 10:03:11.160212-03
14	sessions	0001_initial	2018-04-13 10:03:11.169925-03
15	recommendations	0001_initial	2018-04-13 12:07:56.793403-03
16	recommendations	0002_batch_title	2018-04-13 12:20:21.946489-03
17	recommendations	0003_auto_20180413_1530	2018-04-13 12:30:40.757134-03
18	recommendations	0004_auto_20180413_1532	2018-04-13 12:32:51.205503-03
19	recommendations	0005_auto_20180415_1630	2018-04-15 13:30:57.990322-03
20	recommendations	0006_auto_20180415_1635	2018-04-15 13:35:13.351481-03
21	recommendations	0007_auto_20180415_1635	2018-04-15 13:35:42.281392-03
22	recommendations	0008_auto_20180415_1712	2018-04-15 14:12:07.386156-03
23	recommendations	0009_batchfeedback	2018-04-15 22:43:55.209263-03
24	recommendations	0010_auto_20180416_0144	2018-04-15 22:44:41.053547-03
25	recommendations	0011_auto_20180416_0153	2018-04-15 22:53:30.605634-03
26	recommendations	0012_usersubject	2018-04-15 23:05:23.190527-03
27	recommendations	0013_auto_20180421_1611	2018-04-21 13:22:27.084751-03
28	recommendations	0014_batchfeedback_perception	2018-04-21 23:20:26.423074-03
29	recommendations	0015_remove_batchfeedback_is_positive	2018-04-21 23:23:08.334105-03
30	recommendations	0016_auto_20180504_1204	2018-05-04 09:04:42.580129-03
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_migrations_id_seq', 30, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
8d8566gvyuborh92vtx25yqxvkrg8m8u	NGFiNTllZTUyMDRjOTlkODM3MjNhNzBjYWFlZDkwYWQyMWM4Y2FiNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjNWY0N2IzMjE1YTA5ODJjMjAyNGExOTI5MDAxOTIzM2EzMzUxNTFjIn0=	2018-04-27 10:07:51.882936-03
625plvd2npvhbx6tuc5idacq4hhw3hov	ZTFkZjFmMjFiNjIwMzQzMWI4ZGQ4ODJjNjNhOTIwNTNlNGU3MjhhMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImM1ZjQ3YjMyMTVhMDk4MmMyMDI0YTE5MjkwMDE5MjMzYTMzNTE1MWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-04-30 16:41:44.482139-03
0d48zyj0sqlyc32bi20gwz82v870op81	YWY3YjBmMjU1MGM5OWIzMzUxMzM1NDE5NzliY2E5YWQ5YjBiN2Y0Mjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzhkNmQ3MmZlNmY1MTAwMTMzOWVhZGM2M2IyMzM2ZDdiZGFhMTA0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-05-04 13:38:09.474496-03
2srdrwwf7lu3zwc5mb6ijhn6b5kdzbsr	NGVmNjUxOTI1NTRlODQ0OGY1YmUwZWYwZjA2YjM5ZWY4NjM4MzU0MDp7Il9hdXRoX3VzZXJfaGFzaCI6ImM1ZjQ3YjMyMTVhMDk4MmMyMDI0YTE5MjkwMDE5MjMzYTMzNTE1MWMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-05-05 13:22:43.390718-03
0151332siax05mpy4awadzp8ix0b4j0k	ZTFkZjFmMjFiNjIwMzQzMWI4ZGQ4ODJjNjNhOTIwNTNlNGU3MjhhMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImM1ZjQ3YjMyMTVhMDk4MmMyMDI0YTE5MjkwMDE5MjMzYTMzNTE1MWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-05-11 16:59:53.39357-03
mne0bc9epchcyavpw0vbd2la3x814u1d	MDYwYzM2Yjc2NjE4NGU1NjUxZGFjMTljZjBiM2MyZTRmYjI3MWE1Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjczZjJkNmM4YTUxM2ZhZjVjZTQyMmE0OWRkM2RmMDExMDJlYTEyYjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=	2018-05-11 17:02:43.163512-03
slfbpxft3dmfah5pmdtd4f4nculb59yv	ZDFmYzA3OGU5MjU4ODZmNTZkNDQzYjA4MzYxMDU4MzAyNTBhN2ZhNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkyY2E5OTE2YWRmM2JjNTE0ZTU2NjRlZTIwMjQzMTQzZTNhMDA1ZGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxOCJ9	2018-05-11 17:12:07.084129-03
9pmygmebfmige4qaqriscc8a71gjbawj	YmY4Yzg1ODk0MmZlMmYwMTQwMDk1YTQxNWUxNTk2YjhiYjIyNmZmMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjMzOTk4YzBkNTYyNDFlMjIzNmMzODIyNjVkMTZlM2RhZmE0NmM3NDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMCJ9	2018-05-11 17:13:44.281515-03
kav5xhji80j2jhw0zu2cc9t779nwxjxi	NDE1OTU2NWZhZmUyM2Y3YzA2NDhhYTZkNDA4YmQxM2I1YjIxMTNlNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE5YjUxNjAyOTU5ZDQ3YjA2Nzc2ZjQ1YTk2ZDk2Yzc1ODE5YTIxNTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMCJ9	2018-05-11 17:36:19.378397-03
8nd6w6u82r0flplyzzxonsh6a63sztwh	ZWI4ZWM0MzljNDUxZmI2MWRmOGJjZjEwZDdkMzMzNTVlMmNhODc2ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjU5M2E2ZTRiMDkyZmVjNWVjNDE5ZGI2YjMxOTczZWY4ZDkwNDY2MjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4In0=	2018-05-11 18:06:46.297541-03
pt6rmlz9r59itmkrmfy4mwb0o0jiatyt	ZTFkZjFmMjFiNjIwMzQzMWI4ZGQ4ODJjNjNhOTIwNTNlNGU3MjhhMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImM1ZjQ3YjMyMTVhMDk4MmMyMDI0YTE5MjkwMDE5MjMzYTMzNTE1MWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-05-11 21:34:52.030072-03
sg3n9i3bqhej2ti3mqzzs0crmnwunkfz	YzlmOTJlYjU0NTJjMzhkNWU5MjVjMjhlM2UwYmEwYjIwZTNkMmU0ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjE1IiwiX2F1dGhfdXNlcl9oYXNoIjoiYmZlN2E4MzMzZDg5ODQ0Yzk1YjA4MzliYTU4NTcxNDU2MTIyNDU5ZSJ9	2018-05-12 13:01:49.026795-03
if116fztvjutftp77xw6n9wpna46zr9c	ZTk0YzdjZjc0M2MzZWM0ZGQ2YWM5ODdhNWJiMjVmYWRhNTc1ZjI5MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjE0IiwiX2F1dGhfdXNlcl9oYXNoIjoiYzYzMjg0ZDRjMjEzZjY2MzEyYTY2M2IzOTVhMWU1YzYzZWRlZTRjNiJ9	2018-05-12 16:38:13.591151-03
61mm4f3t8zh5lmkyit09wzs6ak6fqxui	OWQxZTQ2YTRmOTM3YmNjNzAzYzY4N2Y3NGMwZjQwMDM1ZDQ2YWI5Yjp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2E3ZWM4ZWNjZmYxOWVlMmNjZmNjYmI3MWRlNDFiNTkwMjIzNTIwMSJ9	2018-05-13 20:55:37.713685-03
nft9sboa5sg1k827gckgjjl95ilnfdfy	NGNjMmZlN2IwZDM1N2Q3ZjlmZGU5MGU5NmY1ZjU3ZTVhNWU0MGY0ZTp7Il9hdXRoX3VzZXJfaWQiOiIyMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzM5OThjMGQ1NjI0MWUyMjM2YzM4MjI2NWQxNmUzZGFmYTQ2Yzc0NCJ9	2018-05-14 00:23:24.059468-03
pq2wrelalqalbmmjr31rbldtljl0oh1c	Njg2NzIwZjc1Y2U1ZGZhYTIwMmM1MjNjN2VlZWVkNjdhNWQxY2RjYTp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTIwNWQ2NWNiNzI3ZThmY2NkNTYxMWIwZjk0OTc2ZjAzMWVkZDgxNCJ9	2018-05-14 13:30:09.333357-03
4z6a55avhf4wbbum9i95na0vnxix7c66	NmIxMWJlYWQwYjdhZDVkNDZlNDA0ZjcxMzc3ZGEyOTI2NTkzNGEzYjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmNkMDQyY2Y1MTlmYjYzMThiM2JiMjJkMGIzMzA1YzAzYjhiNTA0NyJ9	2018-05-14 15:47:05.602521-03
cp5p4swhcxwj1c94ntmtd926mfnf3bw4	MDQzOTdmN2ZkOGQ4MGEwNDliOGRkYzNlZGZmMGVkNzJmY2M3YjAxODp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZWRlOGIxMmY3YWM2ZGEzZTg3NDA4NzQyYWQ1NzVkYWU0NWU5MTA1In0=	2018-05-14 20:48:33.367393-03
x0lfnrp4r08hci4gnurlxlh4yshb3x6b	NTY2OTk0NjkyM2UyMzNkMzUwNDRhMzM5ZDNiZGNlMTY0YzhiMGNlZTp7Il9hdXRoX3VzZXJfaWQiOiIxOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMGQyZGYzNGI2YTI5OGY5ZjljYmQwOTNhMzY0YTBkZDAxNGM0MzkyNCJ9	2018-05-15 01:51:50.142193-03
ldk5k2540bgqq4ul8uf89hxvlvka4unb	ZmMxOGRlNmM2MjAzYzVkYjQwMTdhOTJjYmUzN2M3MTgxMTQ3YWI5Mzp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9oYXNoIjoiNzNmMmQ2YzhhNTEzZmFmNWNlNDIyYTQ5ZGQzZGYwMTEwMmVhMTJiMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-05-15 19:13:58.671063-03
od47pak4drbrtu04w16lmtvq56xslb92	YjU3NTdhMmRhNjU5NDMyYzdmNzk3ZTI3ZWM2OTQ0N2EwMThiZTE5Mjp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzM0N2E3NzQyYzg0ZGM5MGIwOWQyYTQ3MmQ2NTdkMmEyMGYwM2RiIn0=	2018-05-16 08:47:48.291651-03
ciugsqyz60zcrcmuq4zgdeevg2kkuyzz	NDJkNjdmZDliMTFjMjI2YzljNTgyYzNiYzk5Nzg5NGIyYTJkZTdjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzVmNDdiMzIxNWEwOTgyYzIwMjRhMTkyOTAwMTkyMzNhMzM1MTUxYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-05-18 09:15:01.153652-03
\.


--
-- Data for Name: recommendations_batch; Type: TABLE DATA; Schema: public; Owner: -
--

COPY recommendations_batch (id, description, removed_smell_id, title) FROM stdin;
4	Essa sequência de refatorações visa resolver o code smell <em>Feature Envy</em> presente no método <code>Media.replaceImages</code> da classe apresentada abaixo. Esse método foi detectado como <em>Feature Envy</em> por parecer mais interessado na classe <code>PicturePool</code> que na própria classe onde ele foi definido. Assim, as heurísticas recomendaram duas refatorações. Primeiro, devemos remover o trecho do código de <code>replaceImages</code> mais interessado em <code>PicturePool</code>. Esse trecho é agrupado em um novo método. Depois, movemos esse novo método para a classe <code>PicturePool</code>. Assim, o código resultante não é mais uma <em>Feature Envy</em>.	1	Removendo Feature Envy da classe Media
6	A classe <code>UserFactory</code> contém apenas um método que foi marcado como infectado pelo code smell <em>Feature Envy</em>. Esse método parece unicamente interessado na classe <code>User</code>. Dessa forma, as heurísticas propuseram uma sequência de duas refatorações para solucionar o problema.	1	Removendo Feature Envy da classe UserFactory
3	O método <code>matricularReingresso</code> foi considerado como sendo afetado pelo code smell <em>Feature Envy</em>. Isso ocorreu porque muitas chamadas do método parecem mais interessadas em outras classes do que a própria <code>IngressoUniversidadeService</code>. Em particular, o referido método faz muitas chamadas à classe <code>MatriculaInstitucional</code>. Isso é um indício de que parte desse método deveria estar na classe  <code>MatriculaInstitucional</code> e não na classe <code>IngressoUniversidadeService</code>. \r\n\r\nAs refatorações aqui apresentadas para resolver esse code smell se baseiam na simplificação do método <code>matricularReingresso</code> e em mover algumas linhas de código para a classe <code>MatriculaInstitucional</code>.	1	Removendo Feature Envy da classe IngressoUniversidadeService
10	A classe <code>EmployeeUtils</code> implementa diversas responsabilidades. Primeiro, ela fornece um conjunto de métodos responsáveis por operações de persistência, importação e exportação de dados. Segundo, ela provê, internamente, o conceito de <code>Employee</code>.	2	Removendo God Class da classe EmployeeUtils
7	A classe <code>DiarioClasseService</code> foi considerada uma <em>Complex Class</em> por conter um método com alta complexidade. Assim, várias refatorações foram recomendadas.	3	Removendo Complex Class da classe DiarioClasseService
2	O método <code>GenericTranspalBean.processamento</code> apresenta uma alta complexidade. Essa estrutura encadeada de <code>ifs</code> faz com que a classe <code>Clause</code> seja considerada uma <em>Complex Class</em>. Classes com esse problema estrutural são difíceis de manter e de evoluir. Desta forma, é benéfico pro projeto que ela seja refatorada. A seguir apresentamos as refatorações sugeridas e como o código foi transformado.	3	Removendo Complex Class da classe GenericTranspalBean
1	O método <code>Clause.toCriterion()</code> apresenta uma alta complexidade. Essa estrutura encadeada de <code>ifs</code> faz com que a classe <code>Clause</code> seja considerada uma <em>Complex Class</em>. Classes com esse problema estrutural são difíceis de manter e de evoluir. Desta forma, é benéfico pro projeto que ela seja refatorada. A seguir apresentamos as duas refatorações sugeridas e como o código foi transformado.	3	Removendo Complex Class da classe Clause
5	A classe <code>MatriculaAcademicaService</code> tem quase mil linhas de código e implementa diversas funcionalidades diferentes. Essas suas características fazem com que ela seja uma <em>God Class</em>. Assim, uma série de refatorações do tipo <em>Move Method</em> pode remover o code smell.	2	Removendo God Class da classe MatriculaAcademicaService
9	A classe <code>LibraryMainControl</code> contém operações que implementam três funcionalidades distintas. O acúmulo de funções nessa classe faz com que ela seja considerada uma <em>God Class</em> no sistema em que ela foi implementada. As heurísticas recomendaram refatorações do tipo <em>Move Method</em> para tratar o problema.	2	Removendo God Class da classe LibraryMainControl
\.


--
-- Name: recommendations_batch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('recommendations_batch_id_seq', 10, true);


--
-- Data for Name: recommendations_batchfeedback; Type: TABLE DATA; Schema: public; Owner: -
--

COPY recommendations_batchfeedback (id, observations, batch_id, user_id, perception) FROM stdin;
17	Do ponto de vista semântico, entendo que os dois métodos criados deveriam ir para MatriculaInstitucional	3	15	p
18	Realmente não faz sentido uma Factory ficar setando valores básicos dos objetos que cria.	6	15	s
19	Parece perfinente mas não consegui em pouco tempo visualizar a finalidade das classes e de seus métodos. Senti falta de ver como ficou a classe Media	4	15	p
20	Ficou muito confuso (estutura), bem como a descrição também não ajuda. Não vejo necessidade para esta ImportExport e justificativa não e convincente\r\nPoruqe fetch e save estão marcados no 1.MoveClass?\r\n	10	15	n
21	Entendo que era necessário fazer os movimentos\r\n\r\nProblemas no texto:\r\n\r\nNo texto: "ParA corrigir" \r\n"Assim, executamos 6 operações de Move Method da classe MatriculaAcademicaService para a classe MatriculaAcademicaService."?????????	5	15	s
22	Não concordo com as assinaturas dos métodos movidos. Talvez falte a descrição apra entender melhor. Se tenho um objeto Catalogo, por quê preciso passar ele como parametro para ser printado?	9	15	p
23	Muito bom!	7	15	s
24	Nao conferi linha a linha, mas concordo com as refatorações	2	15	s
25	A semantica ainda não ficou boa. Pelo menos para mim não ficou claro o que são estes métodos	1	15	p
26	Acredito que a primeira refatoração não tenha contribuído para remover o Feature Envy. Mas contribuiu para tornar o método menor (o que pode ter removido um Long Method). A combinação das duas últimas refatorações removeu o Feature Envy.	3	14	s
27	Não sei onde a classe UserFactory é utilizada, mas talvez poderia ser removida também.	6	14	s
28	A solução é adequada para remover o smell identificado.	4	14	s
29	Concordo com todas as refatorações. Porém, acredito que a criação da classe EmployeeImportExport ainda não seja o mais adequado.\r\nMinha sugestão seria a criação de 2 métodos, import e export, na classe Employee. Esses métodos receberiam por parâmetro o tipo de importador ou exportador que seria utilizado. Assim, seria possível criar classes para importar e exportar de diferentes maneiras.	10	14	s
30	Eu acho que melhorou a classe IngressoUniversidadeService, mas para instiacao da classe MatriculaInstitucional é preciso de varios parametros. Será que sempre ele vai usar todos esses parametros? eso nao seria a anomalia Long Parameter list ?	3	6	s
31	Estranho uma classe com só um metodo.\r\n\r\nNota: No segundo passo da refactoracao eu senti falta de ver como foi movido o metodo para a classe User.	6	6	s
32	Acredito que sim	4	6	s
33	Concordo com as sequencias de refactoracoes.	10	6	s
34	Concordo. As refactoracoes aplicadas melhoram a classe original	5	6	s
35	Acredito que a classe refactorada  deveria melhorar a estructura de codigo.	9	6	s
36	Certo o metodo gerarDiariosClasse era muito longo. Apos refactoracoes faciltou o entendimento do metodo e da classe.	7	6	s
37	Nao tenho certeza, acredito que sim	2	6	s
38	Nao consegui entender muito as refactoracoes, porem mehorou a estructura do codigo.	1	6	s
39	A sequência de refatorações melhorou tanto a estrutura do código quanto a qualidade interna e externa. O código ficou mais legível e coeso.	3	11	s
40	Acredito que o batch está parcialmente certo, porém pode ter mudado um pouco a semântica e o objetivo do desenvolvedor. Quando o método passou a ser um construtor da classe User, todo usuário será criado a partir do facebook. Não sei qual o objetivo e as funcionalidades desse sistema, mas pode haver outras formas de criar um usuário (email/senha, gmail etc). Além disso, a classe UserFactory se tornou desnecessária, então um batch deveria ser proposto para o resto do sistema que utiliza aquele método.	6	11	p
41	Sim. A sequência de refatorações melhorou a estrutura do código fonte, atribuindo os métodos de acordo com as responsabilidades de cada classe.	4	11	s
42	A sequência de refatorações fez o código ficar mais coeso e manuntenível. Entretanto, o sistema tinha uma God Class e terminou com uma Lazy Class, o que significa que apesar de ter melhorado atributos internos e externos de qualidade, a estrutura do código não melhorou, mantendo-se neutra.	10	11	n
43	A classe MatriculaAcademicaService ainda é uma God Class. Além disso, essa classe ainda possui diversos métodos interessados em outras classes, como a MatriculaAcademica. Logo, acredito que o conjunto de refatorações não foi suficiente para melhorar a qualidade estrutural do sistema.	5	11	n
44	A sequência de refatorações melhorou a estrutura do código colocando cada método na classe responsável. 	9	11	s
45	Acredito que o batch resolveu a complexidade ciclomática e sugeriu as refatorações corretas para mover métodos para as classes responsáveis. Entretanto, há outros smells nessa classe que deveriam ser abordados, como por exemplo, acredito que gerarDiariosClasse é um long method.	7	11	p
46	O método processamento ficou mais legível e melhor estruturado.	2	11	s
47	As duas refatorações não foram suficientes para remover os smells.	1	11	n
48	O método atualizaMatriculaOrigem também poderia ter sido movido para a classe MatriculaInstitucional.	3	20	p
49	Acho que o problema foi resolvido com a extração do método para o construtor da classe User.	6	20	s
50	Acredito que o code smell foi removido.	4	20	s
51	A estrutura do código foi melhorada. Não consegui pensar em novas alterações.	10	20	s
52	Como a pergunta é se "Melhorou", então melhorou parcialmente, mas o code smell não foi removido, ainda há muitas responsabilidades na classe final.	5	20	p
53	Resolvido.	9	20	s
54	Resolvido.	7	20	s
55	Parece resolvido.	2	20	s
56	Parece resolvido.	1	20	s
57	A refatoração auxiliou na separação das responsabilidades de cada Classe, isso deixa o código realmente mais estruturado. \r\nEntretanto, acredito que ao algoritmo deva identificar casos a serem ignorados. Por exemplo, quando usamos os padrões Strategy e Visitor.	3	4	s
58	Sem dúvidas a sequência de refatorações melhorou a estrutura do código. Ressalto apenas para os casos onde chamadas desse tipo podem ser confundidas com "Feature Envy" (ex: padrões Strategy e Visitor).	6	4	s
59	Novamente, houve melhoria significativa. 	4	4	s
60	A sequência de refatorações auxilia na divisão de responsabilidades de cada classe, tornando o código melhor estruturado.	10	4	s
61	Sim, de fato a estrutura do código melhorou ao se remover o feature envy. Entretanto acredito que esse batch pode tá incompleto porque ela aumentou o acoplamento entre as classes envolvidas na refatoração, logo deveria ter uma outra refatoração para diminuir o acoplamento.  Agora matriculainstitucional tem um método com os seguintes parâmetros: matriculaOrigem, cursoDestino, polo, param, periodoLetivoAtual, geradorNumeroMatricula, versaoDestino. Isso aumenta o acoplamento dessa classe com as outras do parâmetro. Infelizmente não sei dizer como reduzir esse acoplamento e nem se é possível reduzir.	3	12	s
62	De fato melhorou o código, mas pode ser que a classe UserFactory tenha agora um outro smell: lazyclass.	6	12	s
63	sim pois removeu o feature envy	4	12	s
64	melhorou a separação de interesse ao tirar responsabilidades de uma classe e redistribui-las para suas classes correspondentes	10	12	s
65	removeu a god class	5	12	s
66	De fato melhorou ao mover as funcionalidades distintas	9	12	s
67	eu acho que melhorou, mas como eu não sei qual a complexidade ciclomática depois da refatoração, eu não tenho certeza 	7	12	s
68	De fato melhorou a legibilidade. 	2	12	s
69	Melhorou um pouco, mas não foi tanto assim. Entendo que o objetivo for remover o smell, mas como esse exemplo tava menos crítico que o anterior, da a impressão que a melhoria não foi tanta	1	12	p
70	Eu creio que a classe melhorou em legibilidade em relação a versão original. Isso pode ser facilmente constatado pelo número de linhas e métodos utilizados internamente em "matricularReingresso". Mesmo após as refatorações eu creio que o método ainda tem interesse em dados (variáveis e métodos) de outras classes.	3	13	p
71	Do ponto de vista técnico eu creio que o "code smell" foi removido. Todavia, não creio que seja interessante manter uma classe apenas com um método como é o caso da "UserFactory".	6	13	s
72	Eu creio que a sequencia de refatorações resolveu o "feature envy" para o código assinalado em vermelho.	4	13	s
73	Eu creio que a quebra da classe "EmployeeUtils" em diversas classes foi desnecessária, tornando a regra de negocio muito espalhada no código. Além disso, após as refatorações a classe "EmployeeUtils" ficou vazia implicando em um novo "code smell" chamado "Lazy Class".	10	13	p
74	O que foi feito com base nos dados de "AtividadeCurricular" deveria ser feito tambem para outros dados (e.g. turmas). Mesmo após as refatorações propostas a classe "MatriculaAcademicaService" ainda continua com muitas responsabilidades.	5	13	p
75	Me pareceu ser interessante a extração de dados da classe "LibraryMainControl" através da criação das classses "Catalog" e "Item". Todavia, a classe "LibraryMainControl " ficou apenas com um método (i.e. doInventory). Não estou certo de que esta classe tenha utilidade com apenas estes dados e um método.	9	13	p
84	Sim.\r\n\r\nA utlização dos Move Methods tornou o código mais légivel.	9	8	s
76	Eu creio que as refatorações melhoraram o código em termos de legibilidade e manutenção. Todavia, eu não tenho certeza de que a "complex Class" foi de fato removida pois não tenho informações a cerca da métrica (e.g. CC) antes e depois das ações de refatoração.	7	13	s
78	Eu creio que as refatorações melhoraram o código em termos de legibilidade e manutenção. Todavia, eu não tenho certeza de que a "complex Class" foi de fato removida pois não tenho informações a cerca da métrica (e.g. CC) antes e depois das ações de refatoração. Adicionalmente, não creio que o uso de if/else ifs aninhados são a forma adequada para solucionar o problema em questão.	1	13	p
77	Eu creio que as refatorações melhoraram o código em termos de legibilidade e manutenção. Todavia, eu não tenho certeza de que a "complex Class" foi de fato removida pois não tenho informações a cerca da métrica (e.g. CC) antes e depois das ações de refatoração.	2	13	s
79	Sim.\r\n\r\nA sequência de extract methods melhorou a legibilidade assim como poderá facilitar o reuso dos trechos de código primeiramente extraídos.\r\n\r\nO método atualizaMatriculaOrigem() poderia ter sido movido para a classe MatriculaInstitucional.	3	8	p
80	Não. \r\n\r\nPor se tratar de uma Factory, a classe poderá ter outros métodos de criações de Usuário de outros tipos (via twitter, github, etc). \r\nO primeiro Extract Method não é necessário. Na verdade deveria haver uma refatoração para o método createUser(), poder aceitar outros tipos de User (do twitter, etc), e não apenas mover o método que só aceitam os parâmetros de usuário do Facebook.\r\n\r\nO Move Method não é necessário também, já que este método deveria estar no Factory, e não no Usuário. O que poderia ser feito seria um método de criação do usuário mais fléxivel.	6	8	n
81	Sim.\r\n\r\nA sequência tornou o código mais reutilizavel e melhorou a legibilidade, facilitando também o reuso do método extraído.	4	8	s
82	Sim.\r\n\r\nA separação dos concerns da classe facilita a legibilidade e modularização do código.	10	8	s
83	Sim.\r\n\r\nA divisão de concerns facilita a leitura e modularização do código.\r\n\r\nPorém no 4. Move Methods, há uma certa confusão em relação ao nome das classes já que os métodos são móvidos da classe MatriculaAcademicaService para outra MatriculaAcademicaService, a diferença é o a herança de cada classe.\r\n\r\nMatriculaAcademicaService extends AbstractService<MatriculaAcademica, Long> implements Serializable \r\nvira\r\nMatriculaAcademicaService implements Serializable\r\n	5	8	p
85	Sim.\r\n\r\nA sequência de refatorações tornou o código bem mais légivel, assim como tornou mais simples a reutilização dos códigos extraídos.	7	8	s
86	Sim.\r\n\r\nA sequência tornou o código mais légivel e fácil de se fazer a manuntenção.	2	8	s
87	Sim.\r\n\r\nAmbas as extrações de método tornaram o método tanto mais légivel como mais fácil de se manter.	1	8	s
88	De fato, removeu o Feature Envy do método matricularReigresso.  Mas, o método atualizaMatriculaOrigem ainda possui Feature Envy. \r\nE também ficou muito confuso passar uma instância de MatriculaInstitucional como parâmetro do construtor da própria classe MatriculaInstitucional. Mas, acho que isso nem foi culpa da refatoração em si, mas foi uma decisão de design. 	3	5	p
89	A sequência de refatorações removeu o Feature Envy, mas acabou adicionando um novo code smell, uma Lazy Class. \r\nMas acredito que esse code smell (Lazy Class) não afeta negativamente a qualidade estrutural do código, uma vez que acredito que futuramente essa classe foi removida. 	6	5	s
90	Essa sequência de refatoramento removeu o Feature Envy.  	4	5	s
124	A proposta é adequada para melhorar a estrutura do código, porem essas alterações melhoraram a qualidade estrutural do código mas percebo que a classe continua de certa forma sendo complexa.	1	7	s
91	A sequência de refatoraçoes removeu o God Class da classe EmployeeUtils, porém adicionou um novo code smell, o Lazy Class. (mas acredito que essa classe será removida futuramente) \r\nA sequência de refatorações também melhorou a modularização do código. 	10	5	s
92	Apesar das 4 operações de refatoramento, a classe ainda precisa de mais refatorações, pois ainda está com muitas responsabilidades. 	5	5	p
93	Sim. A classe ficou mais simples e com mais modularização depois da sequência de refatoramentos. 	9	5	s
94	Apesar das operações de refatoramento, o método ainda continua complexo e grande. Podia ter mais Extract Method's em partes de método relacionado a Calendario (tratamento de datas), por exemplo. Sobre o Move Method aplicado sobre o método criarDiarioClasse: eu particularmente, não gosto muito dessa ideia de Mover um método e transformá-lo em um construtor. Pois, muitas vezes é necessário fazer verificações antes de criar uma instância e essas verificações são forçadas a estar no construtor, deixando o construtor complexo. Eu prefiro deixar no método mesmo e então o método retornaria ou não a instância criada. 	7	5	p
95	A sequência de refatoramentos não foram suficiente para diminuir a complexidade da classe, aliás transformou a classe em uma God Class. Pois, olhando a semântica dos novos métodos criados pelos Extract Method's, esses métodos fazem tratamento de dados (tratamento de string , basicamente). O correto seria aplicar mais uma sequência de Move Method's, onde esses métodos deveriam ser movido para uma classe Utils ou cada método para a sua classe de domínio. Ex: para buildEndereco vai ser movido para a classe Endereco e então o método buildEndereco retorna a StringBuilder já com a String modificada. 	2	5	n
96	Sinceramente, essas operações de refatoramento não ajudaram em nada. O método pode até ter ficado menos complexo, porém a complexidade ciclomática foi espalhada pelos outros métodos criados, ou seja, os outros métodos também tem bastante estruturas condicionais. Para esse tipo de problema, operações de refatoramento não resolvem. O mais adequado nesse caso, seria aplicar um padrão de projeto Strategy, utilizando um hashMap. \r\nOnde a chave seria um ClauseOperator e o valor seria Criterion. Então só precisaria de um if, para verificar se tem a chave que ele procura, se tiver manda o valor da chave no map. Muito mais simples. Eu já apliquei esse padrão em situações semelhantes. 	1	5	n
97	As refatorações melhoraram a estrutura do código. Acredito que seria interessante aplicar o mesmo tipo de refatoração nos atributos (quando necessário). 	5	4	s
98	A refatoração auxiliou na melhoria da estrutura do código. \r\n\r\nSugestão: Aplicar a mesma refatoração nos atributos, quando cabido.	9	4	s
99	A refatorações reduziu a complexidade da classe. 	7	4	s
100	Sim, a refatoração reduziu a complexidade do método GenericTranspalBean.processamento significativamente.	2	4	s
101	A refatoração reduziu a complexidade do método Clause.toCriterion().	1	4	s
102	Elas parecem intuitivas, e realmente melhoraram a manuntenção e compreenção do código. O código ficou mais legível e coeso.	3	9	s
103	A sequência de refatorações foram intuitivas. A primeira refatoração, removeu a smell, mas acabou introduzindo outra, entretando a heuristica aconselhou refatorações que me parecem adequadas para remover a smell.	6	9	s
104	Na mesma classe tinham outras instancias de feature envy, por exemplo, o método  replaceVideos. Embora, tenha removido a feature envy de um método a classe Media ainda permanceu smelly. Se as mesmas recomentações forem aplicadas ao método replaceVideos, acredito que a classe fica com uma melhor estrutura do código de forma geral	4	9	p
105	Concordo totalmente que as refatorações aplicadas melhoraram a estrutura do código.	10	9	s
106	Sim, as sequencias de refatorações são intuitivas e adequadas.	5	9	s
107	Com as sequencias de refatorações indicadas a classe LibraryMainControl passou a ter responsabilidades especificas.	9	9	s
108	As operações de extração sob o método gerarDiariosClasse, realmente foram adequedas e diminuiram a complexidade ciclomatica do método.  Assim como as refatores de Move Method.	7	9	s
109	Com a sequencia de refatorações aplicadas houve uma melhoria significativa na diminuição da complexidade do método GenericTranspalBean.processamento	2	9	s
110	As operações melhoraram a estrutura do código	1	9	s
111	Me parece que a refatoração 4 está com a descrição errada, pois diz que os métodos foram movidos de MatriculaAcademicaService para MatriculaAcademicaService.	5	14	s
112	Concordo com as refatorações apresentadas.	9	14	s
113	O método gerarDiariosClasse era complexo pois possuía a implementação de diversas tarefas. A extração dos métodos resolveu essa anomalia do código.	7	14	s
114	O método processamento não possuía nenhuma lógica muito complexa. Porém, por concentrar muitas tarefas, era muito longo. As refatorações apresentadas são adequadas para remover a anomalia.	2	14	s
115	As refatorações melhoraram um pouco a legibilidade da classe. Porém, eu não vi nenhuma melhoria significativa, que justificaria o esforço. O motivo é que o método original não estava tão ruim, em minha opinião.	1	14	p
116	As refatorações melhoraram a estrutura do código, porem eu faria mais outra mudança para tirar o método "atualizaMatriculaOrigem" que continua chamando a mais a classe "MatriculaInstitucional". No construtor da classe "MatriculaInstitucional" eu colocaria um parâmetro opcional chamado "periodoLetivoAtual", caso ele seja diferente de null, então eu chamaria o método "atualizaMatriculaOrigem" que já estaria na classe "MatriculaInstitucional". Assim o método "atualizaMatriculaOrigem" passa para a classe "MatriculaInstitucional" diminuindo as dependências que podem ter provocado o Feature Envy. 	3	7	s
117	A proposta é adequada para melhorar a estrutura do código.	6	7	s
118	A proposta é adequada para melhorar a estrutura do código. Achei ótima a proposta de mudanças.	4	7	s
119	A proposta é adequada para melhorar a estrutura do código. Achei bem bacana a separação de responsabilidades de acordo com as diferentes semânticas das funcionalidades.	10	7	s
120	A proposta é adequada para melhorar a estrutura do código.	5	7	s
121	A proposta é adequada para melhorar a estrutura do código.	9	7	s
122	A proposta é adequada para melhorar a estrutura do código. Acho que poderia ser criado outro método e separar toda a lógica do cálculo de horários (linha 58 ate linha 82, mais o menos)	7	7	s
123	A proposta é adequada para melhorar a estrutura do código. Além das mudanças propostas, acho que seria bom mover os métodos extraídos para as classes que tem a mesma semântica, por exemplo, "buildDadosCurso()" para o serviço de Curso, "buildPais()" para o serviço de pais ou para EnderecoService. Além disso, acho que essas alterações melhoraram a qualidade estrutural do código mas percebo que a classe continua de certa forma sendo complexa.	2	7	s
\.


--
-- Name: recommendations_batchfeedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('recommendations_batchfeedback_id_seq', 134, true);


--
-- Data for Name: recommendations_codesmell; Type: TABLE DATA; Schema: public; Owner: -
--

COPY recommendations_codesmell (id, name) FROM stdin;
1	Feature Envy
2	God Class
3	Complex Class
\.


--
-- Name: recommendations_codesmell_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('recommendations_codesmell_id_seq', 3, true);


--
-- Data for Name: recommendations_refactoring; Type: TABLE DATA; Schema: public; Owner: -
--

COPY recommendations_refactoring (id, class_name, "order", batch_id, type_id) FROM stdin;
1	Clause.java	0	1	3
14	Media	0	4	3
10	IngressoUniversidadeService	0	3	3
11	IngressoUniversidadeService	1	3	2
12	IngressoUniversidadeService	2	3	2
13	IngressoUniversidadeService	3	3	1
18	MatriculaAcademicaService	0	5	3
21	MatriculaAcademicaService	3	5	6
29	DiarioClasseService	0	7	3
30	DiarioClasseService	1	7	2
31	DiarioClasseService	2	7	2
9	Clause.java	1	1	2
28	Clause	2	1	2
19	MatriculaAcademicaService	1	5	4
32	DiarioClasseService	3	7	2
33	DiarioClasse	4	7	1
2	GenericTranspalBean	0	2	3
3	GenericTranspalBean	1	2	2
4	GenericTranspalBean	2	2	2
20	MatriculaAcademicaService	2	5	6
5	GenericTranspalBean	3	2	2
23	MatriculaAcademicaService	4	5	6
42	EmployeeUtils	0	10	3
6	GenericTranspalBean	4	2	2
44	EmployeeUtils	2	10	6
45	EmployeeUtils	3	10	6
46	EmployeeUtils	4	10	1
43	EmployeeUtils	1	10	7
39	LibraryMainControl	0	9	3
7	GenericTranspalBean	5	2	2
41	LibraryMainControl	2	9	6
40	LibraryMainControl	1	9	6
15	Media	1	4	2
16	Media	2	4	1
24	UserFactory	0	6	3
25	UserFactory	1	6	2
26	UserFactory	2	6	1
8	GenericTranspalBean	6	2	2
\.


--
-- Name: recommendations_refactoring_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('recommendations_refactoring_id_seq', 46, true);


--
-- Data for Name: recommendations_refactoringtype; Type: TABLE DATA; Schema: public; Owner: -
--

COPY recommendations_refactoringtype (id, name) FROM stdin;
1	Move Method
2	Extract Method
3	Original
4	Simplificado
5	Move Field
6	Move Methods
7	Move Class
\.


--
-- Name: recommendations_refactoringtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('recommendations_refactoringtype_id_seq', 7, true);


--
-- Data for Name: recommendations_sourcefile; Type: TABLE DATA; Schema: public; Owner: -
--

COPY recommendations_sourcefile (id, source_code, changes_description, name, interesting_lines, refactoring_id) FROM stdin;
14	package br.les.opus.instagram.domain;\r\n\r\nimport java.util.Date;\r\nimport java.util.List;\r\n\r\nimport javax.persistence.CascadeType;\r\nimport javax.persistence.CollectionTable;\r\nimport javax.persistence.Column;\r\nimport javax.persistence.ElementCollection;\r\nimport javax.persistence.Entity;\r\nimport javax.persistence.FetchType;\r\nimport javax.persistence.Id;\r\nimport javax.persistence.JoinColumn;\r\nimport javax.persistence.ManyToOne;\r\nimport javax.persistence.OneToMany;\r\nimport javax.persistence.OneToOne;\r\nimport javax.persistence.Table;\r\nimport javax.persistence.Transient;\r\n\r\nimport com.fasterxml.jackson.annotation.JsonIgnore;\r\nimport com.google.gson.annotations.SerializedName;\r\n\r\n@Entity\r\n@Table(name = "media", schema = "instagram")\r\npublic class Media {\r\n\r\n\t@Id\r\n\tprivate String id;\r\n\r\n\tprivate String type;\r\n\r\n\tprivate String filter;\r\n\r\n\t@ElementCollection\r\n\t@CollectionTable(name="media_tag", schema = "instagram",  joinColumns = @JoinColumn(name="media_id"))\r\n\t@JsonIgnore\r\n\t@Column(name="tag")\r\n\tprivate List<String> tags;\r\n\r\n\t@OneToOne(cascade = CascadeType.ALL)\r\n\t@JsonIgnore\r\n\t@JoinColumn(name = "comments_envelope_id")\r\n\tprivate CommentsEnvelope comments;\r\n\t\r\n\t@OneToOne(cascade = CascadeType.ALL)\r\n\t@JoinColumn(name = "caption_id")\r\n\tprivate Comment caption;\r\n\t\r\n\t@OneToOne(cascade = CascadeType.ALL)\r\n\t@JsonIgnore\r\n\t@JoinColumn(name = "likes_envelope_id")\r\n\tprivate LikesEnvelope likes;\r\n\t\r\n\tprivate String link;\r\n\t\r\n\t@ManyToOne(cascade = CascadeType.ALL)\r\n\t@JoinColumn(name = "user_id")\r\n\tprivate InstagramUser user;\r\n\t\r\n\t@SerializedName("created_time")\r\n\tprivate Date createdTime;\r\n\t\r\n\t@OneToOne(cascade = CascadeType.ALL)\r\n\t@JoinColumn(name = "picture_pool_id")\r\n\tprivate PicturePool images;\r\n\t\r\n\t@OneToOne(cascade = CascadeType.ALL)\r\n\t@JoinColumn(name = "video_pool_id")\r\n\tprivate VideoPool videos;\r\n\t\r\n\t@ManyToOne(cascade = CascadeType.ALL)\r\n\t@JoinColumn(name = "location_id")\r\n\tprivate Location location;\r\n\t\r\n\t@SerializedName("users_in_photo")\r\n\t@JsonIgnore\r\n\t@OneToMany(mappedBy = "media", cascade = CascadeType.ALL, fetch = FetchType.EAGER)\r\n\tprivate List<UserInPhoto> taggedUsers;\r\n\t\r\n\t@Transient\r\n\tpublic boolean isValid() {\r\n\t\tif (images == null && videos == null) {\r\n\t\t\treturn false;\r\n\t\t}\r\n\t\tif (images != null && !images.isValid()) {\r\n\t\t\treturn false;\r\n\t\t}\r\n\t\tif (videos != null && !videos.isValid()) {\r\n\t\t\treturn false;\r\n\t\t}\r\n\t\treturn true; \r\n\t}\r\n\t\r\n\tpublic void replaceImages(PicturePool oldPool) {\r\n\t\tif (this.images == null) {\r\n\t\t\treturn;\r\n\t\t}\r\n\t\timages.setId(oldPool.getId());\r\n\t\timages.getLowResolution().setId(oldPool.getLowResolution().getId());\r\n\t\timages.getStandardResolution().setId(oldPool.getStandardResolution().getId());\r\n\t\timages.getThumbnail().setId(oldPool.getThumbnail().getId());\r\n\t}\r\n\t\r\n\tpublic void replaceVideos(VideoPool oldVideoPool) {\r\n\t\tif (this.videos == null) {\r\n\t\t\treturn;\r\n\t\t}\r\n\t\tvideos.setId(oldVideoPool.getId());\r\n\t\tvideos.getLowResolution().setId(oldVideoPool.getLowResolution().getId());\r\n\t\tvideos.getStandardResolution().setId(oldVideoPool.getStandardResolution().getId());\r\n\t}\r\n\t\r\n\tpublic List<UserInPhoto> getTaggedUsers() {\r\n\t\treturn taggedUsers;\r\n\t}\r\n\r\n\tpublic void setTaggedUsers(List<UserInPhoto> taggedUsers) {\r\n\t\tthis.taggedUsers = taggedUsers;\r\n\t}\r\n\r\n\tpublic String getId() {\r\n\t\treturn id;\r\n\t}\r\n\r\n\tpublic void setId(String id) {\r\n\t\tthis.id = id;\r\n\t}\r\n\r\n\tpublic String getType() {\r\n\t\treturn type;\r\n\t}\r\n\r\n\tpublic void setType(String type) {\r\n\t\tthis.type = type;\r\n\t}\r\n\r\n\tpublic String getFilter() {\r\n\t\treturn filter;\r\n\t}\r\n\r\n\tpublic void setFilter(String filter) {\r\n\t\tthis.filter = filter;\r\n\t}\r\n\r\n\tpublic List<String> getTags() {\r\n\t\treturn tags;\r\n\t}\r\n\r\n\tpublic void setTags(List<String> tags) {\r\n\t\tthis.tags = tags;\r\n\t}\r\n\r\n\tpublic CommentsEnvelope getComments() {\r\n\t\treturn comments;\r\n\t}\r\n\r\n\tpublic void setComments(CommentsEnvelope comments) {\r\n\t\tthis.comments = comments;\r\n\t}\r\n\r\n\tpublic Comment getCaption() {\r\n\t\treturn caption;\r\n\t}\r\n\r\n\tpublic void setCaption(Comment caption) {\r\n\t\tthis.caption = caption;\r\n\t}\r\n\r\n\tpublic LikesEnvelope getLikes() {\r\n\t\treturn likes;\r\n\t}\r\n\r\n\tpublic void setLikes(LikesEnvelope likes) {\r\n\t\tthis.likes = likes;\r\n\t}\r\n\r\n\tpublic String getLink() {\r\n\t\treturn link;\r\n\t}\r\n\r\n\tpublic void setLink(String link) {\r\n\t\tthis.link = link;\r\n\t}\r\n\r\n\tpublic InstagramUser getUser() {\r\n\t\treturn user;\r\n\t}\r\n\r\n\tpublic void setUser(InstagramUser user) {\r\n\t\tthis.user = user;\r\n\t}\r\n\r\n\tpublic Date getCreatedTime() {\r\n\t\treturn createdTime;\r\n\t}\r\n\r\n\tpublic void setCreatedTime(Date createdTime) {\r\n\t\tthis.createdTime = createdTime;\r\n\t}\r\n\r\n\tpublic PicturePool getImages() {\r\n\t\treturn images;\r\n\t}\r\n\r\n\tpublic void setImages(PicturePool images) {\r\n\t\tthis.images = images;\r\n\t}\r\n\r\n\tpublic VideoPool getVideos() {\r\n\t\treturn videos;\r\n\t}\r\n\r\n\tpublic void setVideos(VideoPool videos) {\r\n\t\tthis.videos = videos;\r\n\t}\r\n\r\n\tpublic Location getLocation() {\r\n\t\treturn location;\r\n\t}\r\n\r\n\tpublic void setLocation(Location location) {\r\n\t\tthis.location = location;\r\n\t}\r\n\t\r\n}	Essa é a versão original da classe. As refatorações recomendadas vão ser aplicadas no método destacado abaixo.	Media_1.java	94-102	14
23	@Service\r\npublic class MatriculaAcademicaService extends AbstractService<MatriculaAcademica, Long> implements Serializable {\r\n\t\r\n\tpublic boolean isMatriculadoEmTurmaSolicitada(SolicitacaoMatriculaVagaRemanescente solicitacao){\r\n\t\t//...\r\n\t}\r\n\t\t\t\r\n\tprivate Usuario getUsuario() {\r\n\t\t//...\r\n\t}\r\n\t\t\r\n\tpublic List<MatriculaAcademica> listarReprovacoesPorMedia(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaAcademica matricular(MatriculaInstitucional matricula, Turma turma){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaAcademica matricularRemanescente(MatriculaInstitucional matricula, Turma turma){\r\n\t\t//...\r\n\t}\t\r\n\t\r\n\tpublic void salvarMatriculaFlexivel(MatriculaInstitucional matriculaInstitucional, MatriculaAcademica matricula, AtividadeCurricular atividade){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void matricularEmIsolada(MatriculaInstitucional matricula, Turma turma){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<RestricaoViolada> desmatricular(Usuario usuario, MatriculaAcademica matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tprivate boolean precisaDeValidacaoAntesDeDeletar( MatriculaAcademica matricula, List<Turma> turmasAposDeletar ){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void trancar(MatriculaAcademica matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void destrancar(MatriculaAcademica matricula){\r\n\t\t//...\r\n \t}\r\n\t\r\n\tpublic void desmatricularIncondicionalmente(MatriculaAcademica matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void removerEntradaHistoricoFlexivel(MatriculaAcademica matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasPeriodoEspecifico(MatriculaInstitucional matricula, PeriodoLetivo periodo) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasIntervaloPeriodoEspecifico(MatriculaInstitucional matricula, PeriodoLetivo periodoInicial\r\n\t\t\t, PeriodoLetivo periodoFinal) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasAtuais(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasTrancadas(MatriculaInstitucional matricula) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void desmatricularMatriculasAtuais(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void desmatricularMatriculas(MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void removerMobilidadeAcademica(MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\t\t\r\n\tpublic MatriculaAcademica consultarPorId(Long id){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic boolean possuiReprovacao(AtividadeCurricular atividade, MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\t\r\n\tpublic void registrarEvento(EventoHistorico evento, MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void registrarEvento(EventoHistorico evento, MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarEventosAtuais(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic boolean temMatriculaVinculoAtual(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic boolean temMatriculaVinculo(MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> getMatriculasAcademicasAtuais(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic boolean existeRegistroTrancamentoPeriodoAtual(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<DisciplinaCurricular> agruparTurmasPorDisciplinas(List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarHistoricoFlexivel(MatriculaInstitucional matricula) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> consultarPorTurma(Turma turma) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> consultarPorTurmaOrdenadoPorNomeAluno(Turma turma){\r\n\t\t//...\r\n\t}\t\r\n\t\r\n\tpublic List<MatriculaAcademica> consultarPorTurmaOrdenadoPorNomeSocialAluno(Turma turma){\r\n\t\t//...\r\n\t}\t\r\n\t\r\n\tpublic boolean cumpriu(DisciplinaCurricular disciplina, MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic int getCargaHorariaFixaObtida(MatriculaInstitucional matricula){\t\t\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic int getCargaHorariaEstagioObtida(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic int getCargaHorariaEletivaObtida(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic int getCargaHorariaFlexivelObtida(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic MatriculaAcademica gerarConceitoForcado(MatriculaAcademica matriculaAcademica) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaInstitucional> listarAlunosPeriodoEncerradoComMatricula(PeriodoLetivo periodo, Curso curso){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasPeriodosAnteriores(MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic boolean temOfertaObrigatoria(List<AtividadeCurricular> atividades, MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic MatriculaAcademica matricularAproveitamentoEstudos(MatriculaAcademica aproveitamentoEstudo) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaAcademica matricularAproveitamentoEstudosRemanescente(MatriculaAcademica aproveitamentoEstudo) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void matricularAproveitamentoEstudosEmBloco(AproveitamentoEstudosBloco aproveitamentoEstudosBloco) {\r\n\t\t//...\r\n\t}\r\n\r\n\tprivate void validarAproveitamentoDeEstudos(MatriculaAcademica aproveitamentoEstudo) {\r\n\t\t//...\r\n\t}\r\n\r\n\tprotected GenericDao<MatriculaAcademica, Long> getDao() {\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic void excluirComOcorrencia(MatriculaAcademica matriculaAcademica,\tString descricaoOcorrencia, boolean decrementarVagas) {\r\n\t\t//...\t\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> consultarPorMes(Turma turma, Mes mes) {\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic List<RestricaoViolada> listarViolacoesMatricula(MatriculaInstitucional matriculaInstitucional, List<Turma> turmas) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> filtrarAlunosComDisciplinaAprovadaNoPeriodo(List<MatriculaInstitucional> matriculas, PeriodoLetivo periodo) {\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic List<MatriculaAcademica> filtrarAlunosComReprovacaoPorNotaNoPeriodo(\r\n\t\t\tList<MatriculaInstitucional> matriculas, PeriodoLetivo periodo) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> filtrarAlunosComMatriculaVinculoEmTCC(\r\n\t\t\tList<MatriculaInstitucional> matriculas, PeriodoLetivo periodo) {\r\n\t\t//...\r\n\t}\r\n\r\n}	Alguns métodos da classe parecem mais interessados na classe <code>ValidacaoMatriculaService</code> por fazerem muitas chamadas a essa classe e por manipularem dados referentes à funcionalidade implementada por <code>ValidacaoMatriculaService</code>. Assim, movemos os seguintes métodos da classe <code>MatriculaAcademicaService</code> para a classe <code>ValidacaoMatriculaService</code>: \r\n\r\n<code>public List&lt;RestricaoViolada&gt; validarMatricula(Usuario usuario,MatriculaInstitucional matricula, List&lt;Turma&gt; turmas);\r\npublic List&lt;RestricaoViolada&gt; validarMatriculaIsolada(Usuario usuario,MatriculaInstitucional matricula, List&lt;Turma&gt; turmas);\r\npublic List&lt;RestricaoViolada&gt; validarMatriculaVagasRemanescentes(Usuario usuario,MatriculaInstitucional matricula, List&lt;Turma&gt; turmas);</code>\r\n\r\nAssim, executamos mais 3 operações de <em>Move Method</em> da classe <code>MatriculaAcademicaService</code> para a classe <code>ValidacaoMatriculaService</code>. O resultado simplificado dessas movimentações pode ser visto abaixo (nenhum dos métodos acima estão mais presentes). Logo abaixo do código da classe <code>MatriculaAcademicaService</code>, podemos ver o código da classe <code>ValidacaoMatriculaService</code> com os novos métodos movidos.	MatriculaAcademicaService_6.java	\N	23
21	@Service\r\npublic class MatriculaAcademicaService extends AbstractService<MatriculaAcademica, Long> implements Serializable {\r\n\t\r\n\tpublic boolean isMatriculadoEmTurmaSolicitada(SolicitacaoMatriculaVagaRemanescente solicitacao){\r\n\t\t//...\r\n\t}\r\n\t\t\r\n\tpublic List<MatriculaAcademica> listarCumpridas(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tprivate Usuario getUsuario() {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarHistorico(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\t\r\n\tpublic List<RestricaoViolada> validarMatricula(Usuario usuario,MatriculaInstitucional matricula, List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<RestricaoViolada> validarMatriculaIsolada(Usuario usuario,MatriculaInstitucional matricula, List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<RestricaoViolada> validarMatriculaVagasRemanescentes(Usuario usuario,MatriculaInstitucional matricula, List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\t\t\r\n\tpublic List<MatriculaAcademica> listarReprovacoesPorMedia(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaAcademica matricular(MatriculaInstitucional matricula, Turma turma){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaAcademica matricularRemanescente(MatriculaInstitucional matricula, Turma turma){\r\n\t\t//...\r\n\t}\t\r\n\t\r\n\tpublic void salvarMatriculaFlexivel(MatriculaInstitucional matriculaInstitucional, MatriculaAcademica matricula, AtividadeCurricular atividade){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void matricularEmIsolada(MatriculaInstitucional matricula, Turma turma){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<RestricaoViolada> desmatricular(Usuario usuario, MatriculaAcademica matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tprivate boolean precisaDeValidacaoAntesDeDeletar( MatriculaAcademica matricula, List<Turma> turmasAposDeletar ){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void trancar(MatriculaAcademica matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void destrancar(MatriculaAcademica matricula){\r\n\t\t//...\r\n \t}\r\n\t\r\n\tpublic void desmatricularIncondicionalmente(MatriculaAcademica matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void removerEntradaHistoricoFlexivel(MatriculaAcademica matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasPeriodoEspecifico(MatriculaInstitucional matricula, PeriodoLetivo periodo) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasIntervaloPeriodoEspecifico(MatriculaInstitucional matricula, PeriodoLetivo periodoInicial\r\n\t\t\t, PeriodoLetivo periodoFinal) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasAtuais(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasTrancadas(MatriculaInstitucional matricula) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void desmatricularMatriculasAtuais(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void desmatricularMatriculas(MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void removerMobilidadeAcademica(MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\t\t\r\n\tpublic MatriculaAcademica consultarPorId(Long id){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic boolean possuiReprovacao(AtividadeCurricular atividade, MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\t\r\n\tpublic void registrarEvento(EventoHistorico evento, MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void registrarEvento(EventoHistorico evento, MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarEventosAtuais(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic boolean temMatriculaVinculoAtual(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic boolean temMatriculaVinculo(MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> getMatriculasAcademicasAtuais(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic boolean existeRegistroTrancamentoPeriodoAtual(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<DisciplinaCurricular> agruparTurmasPorDisciplinas(List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarHistoricoFlexivel(MatriculaInstitucional matricula) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> consultarPorTurma(Turma turma) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> consultarPorTurmaOrdenadoPorNomeAluno(Turma turma){\r\n\t\t//...\r\n\t}\t\r\n\t\r\n\tpublic List<MatriculaAcademica> consultarPorTurmaOrdenadoPorNomeSocialAluno(Turma turma){\r\n\t\t//...\r\n\t}\t\r\n\t\r\n\tpublic boolean cumpriu(DisciplinaCurricular disciplina, MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic int getCargaHorariaFixaObtida(MatriculaInstitucional matricula){\t\t\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic int getCargaHorariaEstagioObtida(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic int getCargaHorariaEletivaObtida(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic int getCargaHorariaFlexivelObtida(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic MatriculaAcademica gerarConceitoForcado(MatriculaAcademica matriculaAcademica) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaInstitucional> listarAlunosPeriodoEncerradoComMatricula(PeriodoLetivo periodo, Curso curso){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasPeriodosAnteriores(MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic boolean temOfertaObrigatoria(List<AtividadeCurricular> atividades, MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic MatriculaAcademica matricularAproveitamentoEstudos(MatriculaAcademica aproveitamentoEstudo) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaAcademica matricularAproveitamentoEstudosRemanescente(MatriculaAcademica aproveitamentoEstudo) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void matricularAproveitamentoEstudosEmBloco(AproveitamentoEstudosBloco aproveitamentoEstudosBloco) {\r\n\t\t//...\r\n\t}\r\n\r\n\tprivate void validarAproveitamentoDeEstudos(MatriculaAcademica aproveitamentoEstudo) {\r\n\t\t//...\r\n\t}\r\n\r\n\tprotected GenericDao<MatriculaAcademica, Long> getDao() {\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic void excluirComOcorrencia(MatriculaAcademica matriculaAcademica,\tString descricaoOcorrencia, boolean decrementarVagas) {\r\n\t\t//...\t\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> consultarPorMes(Turma turma, Mes mes) {\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic List<RestricaoViolada> listarViolacoesMatricula(MatriculaInstitucional matriculaInstitucional, List<Turma> turmas) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> filtrarAlunosComDisciplinaAprovadaNoPeriodo(List<MatriculaInstitucional> matriculas, PeriodoLetivo periodo) {\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic List<MatriculaAcademica> filtrarAlunosComReprovacaoPorNotaNoPeriodo(\r\n\t\t\tList<MatriculaInstitucional> matriculas, PeriodoLetivo periodo) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> filtrarAlunosComMatriculaVinculoEmTCC(\r\n\t\t\tList<MatriculaInstitucional> matriculas, PeriodoLetivo periodo) {\r\n\t\t//...\r\n\t}\r\n\r\n}	Alguns métodos da classe parecem mais interessados na classe <code>TurmaService</code> por fazerem muitas chamadas a essa classe e por manipularem dados referentes à funcionalidade implementada por <code>TurmaService</code>. Assim, movemos os seguintes métodos da classe <code>MatriculaAcademicaService</code> para a classe <code>TurmaService</code>. \r\n\r\n<code>public List&lt;Turma&gt; getTurmas(List&lt;MatriculaAcademica&gt; matriculas);\r\npublic List&lt;Turma&gt; getTurmasOfertadasAluno(MatriculaInstitucional matricula);\r\npublic List&lt;Turma&gt; listarTurmas(MatriculaInstitucional matricula, List&lt;DisciplinaCurricular&gt; disciplinas);\r\npublic List&lt;Turma&gt; listarTurmasPorPeriodo(MatriculaInstitucional matricula, List&lt;DisciplinaCurricular&gt; disciplinas, PeriodoLetivo periodo);\r\npublic List&lt;Turma&gt; listarTurmasRemanescentes(MatriculaInstitucional matricula, List&lt;Turma&gt; turmas);\r\npublic List&lt;Turma&gt; aplicarFiltroMatriculaIsolada(List&lt;Turma&gt; turmas);</code>\r\n\r\nAssim, executamos mais 6 operações de <em>Move Method</em> da classe <code>MatriculaAcademicaService</code> para a classe <code>TurmaService</code>. O resultado simplificado dessas movimentações pode ser visto abaixo (nenhum dos métodos acima estão mais presentes). Logo abaixo do código da classe <code>MatriculaAcademicaService</code>, podemos ver o código da classe <code>TurmaService</code> com os novos métodos movidos. Vale salientar que na classe <code>MatriculaAcademicaService</code> já destacamos os métodos que sofrerão um novo conjunto de refatorações apresentado na próxima aba.	MatriculaAcademicaService_4.java	20-30	21
18	@Service\r\npublic class MatriculaAcademicaService extends AbstractService<MatriculaAcademica, Long> implements Serializable {\r\n\t\r\n\tprivate static final long serialVersionUID = 152715849847923597L;\r\n\r\n\t@Autowired\r\n\tprivate MatriculaAcademicaDao matriculaAcademicaDao;\r\n\t\r\n\t@Autowired\r\n\tprivate DisciplinaCurricularDao disciplinaCurricularDao;\r\n\t\r\n\t@Autowired\r\n\tprivate DisciplinaCurricularService disciplinaService;\r\n\t\r\n\t@Autowired\r\n\tprivate ParametroAcademicoCursoDao parAcadCursoDao;\r\n\t\r\n\t@Autowired\r\n\tprivate AtividadeCurricularDao atividadeCurricularDao;\r\n\t\r\n\t@Autowired\r\n\tprivate ListaDisciplinasFactory listaDisciplinaFactory;\r\n\t\r\n\t@Autowired\r\n\tprivate ValidadorMatriculaFactory validadorFactory;\r\n\t\t\r\n\t@Autowired\r\n\tprivate TurmaDao turmaDao;\r\n\t\r\n\t@Autowired\r\n\tprivate ConceitoDao conceitoDao;\r\n\t\r\n\t@Autowired\r\n\tprivate FiltroTurmaFactory filtroTurmasFactory;\r\n\t\r\n\t@Autowired\r\n\tprivate TipoMatriculaAcademicaDao tipoMatriculaAcadDao;\r\n\t\r\n\t@Autowired\r\n\tprivate UsuarioProvider usuarioProvider;\t\r\n\t\r\n\t@Autowired\r\n\tprivate MatriculaInstitucionalService matInstService;\r\n\t\r\n\t@Autowired\r\n\tprivate NotaService notaService;\r\n\t\r\n\t@Autowired\r\n\tprivate TipoPeriodoDao tipoPeriodoDao;\r\n\r\n\t@Autowired\r\n\tprivate OcorrenciaService ocorrenciaService;\r\n\r\n\t@Autowired\r\n\tprivate UsuarioService usuarioService;\r\n\t\r\n//\t@Autowired\r\n//\tprivate MatriculaAcademicaQueueSender matriculaAcademicaQueueSender;\r\n\t\r\n\tpublic boolean isMatriculadoEmTurmaSolicitada(SolicitacaoMatriculaVagaRemanescente solicitacao){\r\n\t\tTurma turma = solicitacao.getTurma();\r\n\t\tMatriculaInstitucional matricula = solicitacao.getMatriculaInstitucional();\r\n\t\treturn matriculaAcademicaDao.getMatricula(matricula, turma) != null;\r\n\t}\r\n\t\r\n\tpublic List<AtividadeCurricular> getAtividades(List<MatriculaAcademica> matriculas){\r\n\t\tList<AtividadeCurricular> atividades = new ArrayList<AtividadeCurricular>();\r\n\t\tfor(MatriculaAcademica matricula : matriculas){\r\n\t\t\tatividades.add(matricula.getAtividadeCurricular());\r\n\t\t}\r\n\t\treturn atividades;\r\n\t}\r\n\t\r\n\tpublic List<Turma> getTurmas(List<MatriculaAcademica> matriculas){\r\n\t\tList<Turma> turma = new ArrayList<Turma>();\r\n\t\tfor(MatriculaAcademica matricula : matriculas){\r\n\t\t\tturma.add(matricula.getTurma());\r\n\t\t}\r\n\t\treturn turma;\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarCumpridas(MatriculaInstitucional matricula){\r\n\t\treturn matriculaAcademicaDao.listarCumpridas(matricula);\r\n\t}\r\n\t\r\n\tprivate Usuario getUsuario() {\r\n\t\tExternalContext context = FacesContext.getCurrentInstance().getExternalContext();\r\n\t\tHttpServletRequest request = (HttpServletRequest) context.getRequest();\r\n\t\tHttpSession session = request.getSession(false);\t\t\r\n\t\tUsuario usuario = (Usuario)session.getAttribute("usuarioSessao");\r\n\t\t//Usuario usuario = usuarioProvider.getUsuarioAutenticado();\r\n\t\treturn usuarioService.carregar(usuario.getId());\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarHistorico(MatriculaInstitucional matricula){\r\n\t\treturn matriculaAcademicaDao.listarHistorico(matricula);\r\n\t}\r\n\t\t\r\n\tpublic List<RestricaoViolada> validarMatricula(Usuario usuario,MatriculaInstitucional matricula, List<Turma> turmas){\r\n\t\tValidadorMatricula validador = validadorFactory.create(usuario, matricula);\r\n\t\treturn validador.checar(matricula, turmas);\r\n\t}\r\n\t\r\n\tpublic List<RestricaoViolada> validarMatriculaIsolada(Usuario usuario,MatriculaInstitucional matricula, List<Turma> turmas){\r\n\t\tValidadorMatricula validador = validadorFactory.create(usuario, matricula,TipoMatricula.ISOLADA);\r\n\t\treturn validador.checar(matricula, turmas);\r\n\t}\r\n\t\r\n\tpublic List<RestricaoViolada> validarMatriculaVagasRemanescentes(Usuario usuario,MatriculaInstitucional matricula, List<Turma> turmas){\r\n\t\tValidadorMatricula validador = validadorFactory.create(usuario, matricula,TipoMatricula.VAGAS_REMANESCENTES);\r\n\t\treturn validador.checar(matricula, turmas);\r\n\t}\r\n\t\r\n\tpublic List<Turma> getTurmasOfertadasAluno(MatriculaInstitucional matricula){\r\n\t\tList<DisciplinaCurricular> matriculaveis = listarDisciplinasMatriculaveis(getUsuario(),matricula);\r\n\t\tList<Turma> turmasOfertadas = listarTurmas(matricula, matriculaveis);\r\n\t\treturn turmasOfertadas;\r\n\t}\r\n\t\r\n\tpublic List<AtividadeCurricular> getAtividadesMatriculaveis(MatriculaInstitucional matricula){\r\n\t\tList<DisciplinaCurricular> matriculaveis = listarDisciplinasMatriculaveis(getUsuario(),matricula);\r\n\t\tList<AtividadeCurricular> atividadesMatriculaveis = disciplinaService.getAtividadesCurriculares(matriculaveis);\r\n\t\treturn atividadesMatriculaveis;\r\n\t}\r\n\t\r\n\tpublic List<AtividadeCurricular> getAtividadesObrigatoriasNaoCumpridas(MatriculaInstitucional matricula){\r\n\t\tList<MatriculaAcademica> matriculasCumpridas = matriculaAcademicaDao.listarCumpridas(matricula);\r\n\t\tList<DisciplinaCurricular> obrigatoriasCumpridas = disciplinaCurricularDao.listarCumpridas(matriculasCumpridas);\r\n\t\tList<DisciplinaCurricular> obrigatoriasNaoCumpridas = disciplinaCurricularDao.listarObrigatoriasNaoPagas(matricula, obrigatoriasCumpridas);\r\n\t\tList<AtividadeCurricular> atividadesObrigatoriasNaoCumpridas = disciplinaService.getAtividadesCurriculares(obrigatoriasNaoCumpridas);\r\n\t\treturn atividadesObrigatoriasNaoCumpridas;\r\n\t}\r\n\t\r\n\tpublic List<AtividadeCurricular> getAtividadesNaoCumpridasMatriculaveis(Usuario usuarioSessao, MatriculaInstitucional matricula){\r\n\t\tList<DisciplinaCurricular> disciplinas = listarDisciplinasMatriculaveis(usuarioSessao, matricula);\t\t\r\n\t\tCollections.sort(disciplinas, new ComparadorDisciplinaPorCodigo());\r\n\t\treturn disciplinaService.getAtividadesCurriculares(disciplinas);\r\n\t}\r\n\t\r\n\tpublic List<DisciplinaCurricular> listarDisciplinasMatriculaveis(Usuario usuario, MatriculaInstitucional matriculaInstitucional){\r\n\t\tListaDisciplinas lista = listaDisciplinaFactory.create(usuario, matriculaInstitucional);\r\n\t\treturn lista.getLista(matriculaInstitucional);\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarReprovacoesPorMedia(MatriculaInstitucional matricula){\r\n\t\treturn matriculaAcademicaDao.listarReprovacoesPorMedia(matricula);\r\n\t}\r\n\t\r\n\tpublic MatriculaAcademica matricular(MatriculaInstitucional matricula, Turma turma){\r\n\t\tMatriculaAcademica matAcad = this.matriculaAcademicaDao.getMatricula(matricula, turma);\r\n\t\tString nome = matricula.getAluno().getNome();\t\t\r\n\t\tif( matAcad != null ){\r\n\t\t\tString codigo = turma.getAtividadeCurricular().getCodigo();\r\n\t\t\tString disciplina = turma.getAtividadeCurricular().getNome();\r\n\t\t\tthrow new IllegalArgumentException("O aluno "+nome+" de matrícula "+matricula.getMatricula()\r\n\t\t\t\t\t+ " já está matriculado na turma "+codigo+" - "+disciplina);\r\n\t\t}\t\t\r\n\t\tList<AtividadeCurricular> atividades = this.atividadeCurricularDao.listarAtividadesMatriculadas( matricula );\r\n\t\tfor (AtividadeCurricular atividadeCurricular : atividades) {\r\n\t\t\tif( turma.getAtividadeCurricular().getId().longValue() == atividadeCurricular.getId().longValue() ){\r\n\t\t\t\tthrow new IllegalArgumentException("O aluno "+nome+" de matrícula "+matricula.getMatricula()\r\n\t\t\t\t\t\t+ " já está matriculado em outra turma da atividade curricular - id: "+atividadeCurricular.getId() );\r\n\t\t\t}\r\n\t\t}\r\n\t\t\r\n\t\tatividades = this.atividadeCurricularDao.listarAtividadesCumpridas( matricula );\r\n\t\tfor (AtividadeCurricular atividadeCurricular : atividades) {\r\n\t\t\tif( turma.getAtividadeCurricular().getId().longValue() == atividadeCurricular.getId().longValue() ){\r\n\t\t\t\tthrow new IllegalArgumentException("O aluno "+nome+" de matrícula "+matricula.getMatricula()\r\n\t\t\t\t\t\t+ " já cursou a atividade curricular "+atividadeCurricular.getNome()+" - id: "+atividadeCurricular.getId() );\r\n\t\t\t}\r\n\t\t}\r\n\t\t\r\n\t\tConceito conceitoMatriculado = new Conceito(Conceito.MATRICULADO);\r\n\t\tconceitoMatriculado = conceitoDao.carregar(conceitoMatriculado.getOpcaoPk());\r\n\t\tboolean isFera = matInstService.isFera(matricula, turma.getPeriodoLetivo());\r\n\t\t\r\n\t\tTipoMatriculaAcademica tipo = new TipoMatriculaAcademica();\r\n\t\ttipo.setId(TipoMatriculaAcademica.REGULAR);\r\n\t\ttipo = tipoMatriculaAcadDao.carregar(tipo.getOpcaoPk());\r\n\t\t\r\n\t\tMatriculaAcademica academica = new MatriculaAcademica();\r\n\t\tacademica.setTipo(tipo);\r\n\t\tacademica.setMatriculaInstitucional(matricula);\r\n\t\tacademica.setAtividadeCurricular(turma.getAtividadeCurricular());\r\n\t\tacademica.setEstruturaCurricular(turma.getDisciplinaCurricular().getEstruturaCurricular());\r\n\t\tacademica.setTurma(turma);\r\n\t\tacademica.setTipoPeriodo(turma.getTipoPeriodo());\r\n\t\tacademica.setAno(turma.getAno());\r\n\t\tacademica.setCargaHorariaTotal(turma.getDisciplinaCurricular().getAtividadeCurricular().getCargaHorariaTotal());\r\n\t\tacademica.setPeriodo(matricula.getPeriodoAtual());\r\n\t\tacademica.setConceito(conceitoMatriculado);\r\n\t\tmatriculaAcademicaDao.inserir(academica);\r\n\t\t\r\n\t\tturma = turmaDao.carregar(turma.getId());\r\n\t\tturma.incrementarVagasOcupadas(matricula,isFera);\r\n\t\tturmaDao.salvarOuEditar(turma);\r\n\t\t\r\n//\t\tthis.matriculaAcademicaQueueSender.send(Operacao.INSERT, academica);\r\n\t\t\r\n\t\treturn academica;\r\n\t}\r\n\t\r\n\tpublic MatriculaAcademica matricularRemanescente(MatriculaInstitucional matricula, Turma turma){\r\n\t\tConceito conceitoMatriculado = new Conceito(Conceito.MATRICULADO);\r\n\t\tconceitoMatriculado = conceitoDao.carregar(conceitoMatriculado.getOpcaoPk());\r\n\t\t\t\t\r\n\t\tTipoMatriculaAcademica tipo = new TipoMatriculaAcademica();\r\n\t\ttipo.setId(TipoMatriculaAcademica.VAGA_REMANESCENTE);\r\n\t\ttipo = tipoMatriculaAcadDao.carregar(tipo.getOpcaoPk());\r\n\t\t\r\n\t\tMatriculaAcademica academica = new MatriculaAcademica();\r\n\t\tacademica.setTipo(tipo);\r\n\t\tacademica.setMatriculaInstitucional(matricula);\r\n\t\tacademica.setAtividadeCurricular(turma.getAtividadeCurricular());\r\n\t\tacademica.setEstruturaCurricular(turma.getDisciplinaCurricular().getEstruturaCurricular());\r\n\t\tacademica.setTurma(turma);\r\n\t\tacademica.setTipoPeriodo(turma.getTipoPeriodo());\r\n\t\tacademica.setAno(turma.getAno());\r\n\t\tacademica.setCargaHorariaTotal(turma.getDisciplinaCurricular().getAtividadeCurricular().getCargaHorariaTotal());\r\n\t\tacademica.setPeriodo(matricula.getPeriodoAtual());\r\n\t\tacademica.setConceito(conceitoMatriculado);\r\n\t\tmatriculaAcademicaDao.inserir(academica);\r\n\t\tturmaDao.editar(turma);\r\n\t\t\r\n//\t\tthis.matriculaAcademicaQueueSender.send(Operacao.INSERT, academica);\r\n\t\t\r\n\t\treturn academica;\r\n\t}\t\r\n\t\r\n\tpublic void salvarMatriculaFlexivel(MatriculaInstitucional matriculaInstitucional, MatriculaAcademica matricula, AtividadeCurricular atividade){\r\n\t\tEstruturaCurricular estrutura = matriculaInstitucional.getVersaoCurso().getEstruturaAtividadesFlexiveis();\r\n\t\t\r\n\t\tConceito semConceito = new Conceito(Conceito.SEM_CONCEITO);\r\n\t\tsemConceito = conceitoDao.carregar(semConceito.getOpcaoPk());\r\n\t\t\r\n\t\tTipoMatriculaAcademica tipo = new TipoMatriculaAcademica();\r\n\t\ttipo.setId(TipoMatriculaAcademica.FLEXIVEL);\r\n\t\ttipo = tipoMatriculaAcadDao.carregar(tipo.getOpcaoPk());\r\n\t\t\r\n\t\t\r\n\t\tmatricula.setTipo(tipo);\r\n\t\tmatricula.setMatriculaInstitucional(matriculaInstitucional);\t\t\r\n\t\tmatricula.setAtividadeCurricular(atividade);\r\n\t\tmatricula.setEstruturaCurricular(estrutura);\t\r\n\t\tmatricula.setTipoPeriodo(tipoPeriodoDao.carregar(matricula.getTipoPeriodo().getOpcaoPk()));\t\t\r\n\t\tmatricula.setPeriodo(matriculaInstitucional.getPeriodoAtual());\r\n\t\tmatricula.setConceito(semConceito);\t\t\r\n\t\tmatriculaAcademicaDao.inserir(matricula);\r\n\t\t\r\n//\t\tthis.matriculaAcademicaQueueSender.send(Operacao.INSERT, matricula);\r\n\t}\r\n\t\r\n\tpublic void matricularEmIsolada(MatriculaInstitucional matricula, Turma turma){\r\n\t\tConceito conceitoMatriculado = new Conceito(Conceito.MATRICULADO);\r\n\t\tconceitoMatriculado = conceitoDao.carregar(conceitoMatriculado.getOpcaoPk());\r\n\t\t\r\n\t\tTipoMatriculaAcademica tipo = new TipoMatriculaAcademica();\r\n\t\ttipo.setId(TipoMatriculaAcademica.ISOLADA);\r\n\t\ttipo = tipoMatriculaAcadDao.carregar(tipo.getOpcaoPk());\r\n\t\t\r\n\t\tMatriculaAcademica academica = new MatriculaAcademica();\r\n\t\tacademica.setTipo(tipo);\r\n\t\tacademica.setMatriculaInstitucional(matricula);\r\n\t\tacademica.setAtividadeCurricular(turma.getAtividadeCurricular());\r\n\t\tacademica.setEstruturaCurricular(turma.getDisciplinaCurricular().getEstruturaCurricular());\r\n\t\tacademica.setTurma(turma);\r\n\t\tacademica.setTipoPeriodo(turma.getTipoPeriodo());\r\n\t\tacademica.setAno(turma.getAno());\r\n\t\tacademica.setCargaHorariaTotal(turma.getDisciplinaCurricular().getAtividadeCurricular().getCargaHorariaTotal());\r\n\t\tacademica.setPeriodo(matricula.getPeriodoAtual());\r\n\t\tacademica.setConceito(conceitoMatriculado);\r\n\t\tmatriculaAcademicaDao.inserir(academica);\r\n\t\tturma.incrementarVagasOcupadasMesmoTurno();\r\n\t\tturmaDao.editar(turma);\r\n\t\t\r\n//\t\tthis.matriculaAcademicaQueueSender.send(Operacao.INSERT, academica);\r\n\t}\r\n\t\r\n\tpublic List<RestricaoViolada> desmatricular(Usuario usuario, MatriculaAcademica matricula){\r\n\t\tList<RestricaoViolada> violacoes = new ArrayList<RestricaoViolada>();\r\n\t\tboolean isFera = matInstService.isFera(matricula.getMatriculaInstitucional());\r\n\t\t\r\n\t\t/**\r\n\t\t * O DRCA deve ter prerrogativa para desmatricular\r\n\t\t * incondicionalmente\r\n\t\t */\r\n\t\tif(usuario.isDRCA()){\r\n\t\t\tdesmatricularIncondicionalmente(matricula);\r\n\t\t\treturn violacoes;\r\n\t\t}\r\n\t\t\r\n\t\t\r\n\t\tParametroAcademicoCurso atual = parAcadCursoDao.getParametrosAtuais(matricula.getMatriculaInstitucional().getVersaoCurso().getCurso());\r\n\t\tList<MatriculaAcademica> matriculasAtuais = matriculaAcademicaDao.listarMatriculasAtuais(matricula.getMatriculaInstitucional(), atual);\r\n\t\t\r\n\t\t/**\r\n\t\t * remove da lista de matriculas a matricula academica listada para exclusao\r\n\t\t */\r\n\t\tList<Turma> turmas = new ArrayList<Turma>();\r\n\t\tfor(MatriculaAcademica matAtual : matriculasAtuais){\r\n\t\t\tif(matAtual.getId().longValue() != matricula.getId().longValue()){\r\n\t\t\t\tturmas.add(matAtual.getTurma());\r\n\t\t\t}\r\n\t\t}\t\r\n\t\t\r\n\t\tif( this.precisaDeValidacaoAntesDeDeletar(matricula, turmas) ){\r\n\t\t\tviolacoes = validarMatricula(usuario, matricula.getMatriculaInstitucional(), turmas);\r\n\t\t}\r\n\t\t\r\n\t\t\r\n\t\tif(violacoes.size() == 0){\r\n\t\t\tTurma turma = matricula.getTurma();\r\n\t\t\tturma.decrementarVagasOcupadas(matricula.getMatriculaInstitucional(),isFera,matricula);\r\n\t\t\tturmaDao.editar(turma);\r\n\t\t\t\r\n\t\t\tmatriculaAcademicaDao.excluir(matricula);\r\n//\t\t\tthis.matriculaAcademicaQueueSender.send(Operacao.DELETE, matricula);\r\n\t\t}\r\n\t\t\r\n\t\treturn violacoes;\r\n\t}\r\n\t\r\n\t/**     Este método foi criado para driblar a validação das matrículas que é feita antes de deletar uma matrícula.\r\n\t *  Há casos em que o sistema deveria permitir a deleção, mas a validação é tão rígida que não permite deletar\r\n\t *  essas matrículas. Como seria muito complicado alterar o método de validação, é mais fácil adicionar mais\r\n\t *  exceções às regras de validação neste método.*/\r\n\tprivate boolean precisaDeValidacaoAntesDeDeletar( MatriculaAcademica matricula, List<Turma> turmasAposDeletar ){\r\n\t\tMatriculaInstitucional matrInst = matricula.getMatriculaInstitucional();\r\n\t\tDisciplinaCurricular disciplina = matricula.getTurma().getDisciplinaCurricular();\r\n\t\t\r\n\t\t//\t     Não precisa passar por validação se a disciplina deletada é uma eletiva, o aluno não estiver\r\n\t\t// matriculado em outras turmas e estiver com matrícula vínculo para TCC.\r\n\t\tTipoDisciplinaCurricular tipo = matricula.getTurma().getDisciplinaCurricular().getTipo();\r\n\t\tif( tipo.isEletiva() && turmasAposDeletar.size() == 0 && this.temMatriculaVinculoAtual( matricula.getMatriculaInstitucional() )  ){\r\n\t\t\treturn false;\r\n\t\t}\r\n\t\t\r\n\t\t//     Para cada turma que restará após a deleção, verificamos se dentre elas já existe outra turma da mesma disciplina\r\n\t\t// da turma que está sendo deletada. Isso significa que o aluno está matriculado em duas turmas da mesma disciplina,\r\n\t\t// podendo portanto ser removida uma das turmas.\r\n\t\tfor( Turma turma: turmasAposDeletar ){\r\n\t\t\tif( turma.getAtividadeCurricular().getId() == matricula.getAtividadeCurricular().getId()){\r\n\t\t\t\treturn false;\r\n\t\t\t}\r\n\t\t}\r\n\t\t\r\n\t\t//     Se o aluno já cumpriu aquela aquela disciplina, então ela pode ser deletada sem problemas.\r\n\t\tif( this.matriculaAcademicaDao.cumpriu( matrInst, disciplina ) ){\r\n\t\t\treturn false;\r\n\t\t}\r\n\t\t\r\n\t\treturn true;\r\n\t}\r\n\t\r\n\tpublic void trancar(MatriculaAcademica matricula){\r\n\t\tConceito conceitoTrancar = new Conceito();\r\n\t\tconceitoTrancar.setId(Conceito.TRANCADO);\r\n\t\tconceitoTrancar = conceitoDao.carregar(conceitoTrancar.getOpcaoPk());\r\n\t\t\r\n\t\tmatricula.setConceito(conceitoTrancar);\r\n\t\tmatriculaAcademicaDao.editar(matricula);\r\n//\t\tthis.matriculaAcademicaQueueSender.send(Operacao.UPDATE, matricula);\r\n\t\t\r\n\t\tocorrenciaService.inserirTrancamentoDisciplina(matricula.getMatriculaInstitucional(), "Trancamento efetuado na turma "+matricula.getTurma().getAtividadeCurricular().getCodigo()+"-"+matricula.getTurma().getCodigoTurma()+" "+matricula.getAtividadeCurricular().getNome());\r\n\t}\r\n\t\r\n\tpublic void destrancar(MatriculaAcademica matricula){\r\n\t\tConceito conceitoDestrancar = new Conceito(Conceito.MATRICULADO);\r\n\t\tconceitoDestrancar = conceitoDao.carregar(conceitoDestrancar.getOpcaoPk());\r\n\t\t\r\n\t\tmatricula.setConceito(conceitoDestrancar);\r\n\t\tmatriculaAcademicaDao.editar(matricula);\r\n//\t\tthis.matriculaAcademicaQueueSender.send(Operacao.UPDATE, matricula);\r\n\t\t\r\n\t\tocorrenciaService.inserirDestrancamentoDisciplina(matricula.getMatriculaInstitucional(), "Destrancamento efetuado na turma "+matricula.getTurma().getAtividadeCurricular().getCodigo()+"-"+matricula.getTurma().getCodigoTurma()+" "+matricula.getAtividadeCurricular().getNome());\r\n \t}\r\n\t\r\n\t/**\r\n\t * Remove a mattrícula acadêmica sem fazer nenhuma checagem\r\n\t * @param matricula\r\n\t */\r\n\tpublic void desmatricularIncondicionalmente(MatriculaAcademica matricula){\r\n\t\tboolean isFera = matInstService.isFera(matricula.getMatriculaInstitucional());\r\n\t\tmatriculaAcademicaDao.excluir(matricula);\r\n//\t\tthis.matriculaAcademicaQueueSender.send(Operacao.DELETE, matricula);\r\n\t\t\r\n\t\tTurma turma = matricula.getTurma();\r\n\t\t\r\n\t\tif(turma != null){\r\n\t\t\tturma.decrementarVagasOcupadas(matricula.getMatriculaInstitucional(), isFera, matricula);\r\n\t\t\tturmaDao.editar(turma);\r\n\t\t}\r\n\t}\r\n\t\r\n\tpublic void removerEntradaHistoricoFlexivel(MatriculaAcademica matricula){\r\n\t\tmatriculaAcademicaDao.excluir(matricula);\r\n//\t\tthis.matriculaAcademicaQueueSender.send(Operacao.DELETE, matricula);\r\n\t}\r\n\t\r\n\tpublic List<Turma> listarTurmas(MatriculaInstitucional matricula, List<DisciplinaCurricular> disciplinas){\r\n\t\t\r\n\t\tParametroAcademicoCurso parametro = parAcadCursoDao.getParametrosAtuais(matricula.getVersaoCurso().getCurso());\r\n\t\t\r\n\t\tList<Turma> turmas = turmaDao.listarTurmasPeriodoAtualPorDisciplina(matricula, disciplinaService.getAtividadesCurriculares(disciplinas),parametro.getPeriodoLetivoMatricula());\r\n\t\t\r\n\t\tFiltroTurma filtros = filtroTurmasFactory.create(getUsuario());\r\n\t\tturmas = filtros.filtrar(matricula, turmas);\r\n\t\t\r\n\t\treturn turmas;\r\n\t}\r\n\t\r\n\tpublic List<Turma> listarTurmasPorPeriodo(MatriculaInstitucional matricula, List<DisciplinaCurricular> disciplinas, PeriodoLetivo periodo){\r\n\t\t\r\n\t\tList<Turma> turmas = turmaDao.listarTurmasPeriodoAtualPorDisciplina(matricula, disciplinaService.getAtividadesCurriculares(disciplinas),periodo);\r\n\t\t\r\n\t\tFiltroTurma filtros = filtroTurmasFactory.create(getUsuario());\r\n\t\tturmas = filtros.filtrar(matricula, turmas);\r\n\t\t\r\n\t\treturn turmas;\r\n\t}\r\n\t\r\n\t\r\n\tpublic List<Turma> listarTurmasRemanescentes(MatriculaInstitucional matricula, List<Turma> turmas){\r\n\t\tFiltroTurma filtros = filtroTurmasFactory.create(getUsuario(), TipoMatricula.VAGAS_REMANESCENTES);\r\n\t\tturmas = filtros.filtrar(matricula,turmas);\r\n\t\treturn turmas;\r\n\t}\r\n\t\r\n\t\r\n\tpublic List<Turma> aplicarFiltroMatriculaIsolada(List<Turma> turmas){\r\n\t\tUsuario usuario = usuarioProvider.getUsuarioAutenticado();\r\n\t\tusuario = usuarioService.carregar(usuario.getId());\r\n\t\tFiltroTurma filtro = filtroTurmasFactory.create(usuario, TipoMatricula.ISOLADA);\r\n\t\tturmas = filtro.filtrar(turmas);\r\n\t\treturn turmas;\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasPeriodoEspecifico(MatriculaInstitucional matricula, PeriodoLetivo periodo) {\r\n\t\treturn this.matriculaAcademicaDao.listarMatriculasPeriodoEspecifico(matricula, periodo);\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasIntervaloPeriodoEspecifico(MatriculaInstitucional matricula, PeriodoLetivo periodoInicial\r\n\t\t\t, PeriodoLetivo periodoFinal) {\r\n\t\treturn this.matriculaAcademicaDao.listarMatriculasIntervaloPeriodoEspecifico(matricula, periodoInicial, periodoFinal);\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasAtuais(MatriculaInstitucional matricula){\r\n\t\tParametroAcademicoCurso parametro = parAcadCursoDao.getParametrosAtuais(matricula.getVersaoCurso().getCurso());\r\n\t\treturn matriculaAcademicaDao.listarMatriculasAtuais(matricula,parametro);\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasTrancadas(MatriculaInstitucional matricula) {\r\n\t\tParametroAcademicoCurso parametro = parAcadCursoDao.getParametrosAtuais(matricula.getVersaoCurso().getCurso());\r\n\t\treturn matriculaAcademicaDao.listarMatriculasTrancadas(matricula,parametro);\r\n\t}\r\n\r\n\t\r\n\tpublic void desmatricularMatriculasAtuais(MatriculaInstitucional matricula){\r\n\t\tList<MatriculaAcademica> matriculas = listarMatriculasAtuais(matricula);\r\n\t\tfor(MatriculaAcademica matriculaAcademica : matriculas){\r\n\t\t\tdesmatricularIncondicionalmente(matriculaAcademica);\r\n\t\t}\r\n\t}\r\n\t\r\n\tpublic void desmatricularMatriculas(MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\tList<MatriculaAcademica> matriculas = this.listarMatriculasPeriodosAnteriores(matricula, periodo);\r\n\t\tfor(MatriculaAcademica matriculaAcademica : matriculas){\r\n\t\t\tdesmatricularIncondicionalmente(matriculaAcademica);\r\n\t\t}\r\n\t}\r\n\t\r\n\tpublic void removerMobilidadeAcademica(MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\tList<MatriculaAcademica> matriculas = matriculaAcademicaDao.listarMatriculasPeriodoEspecificoIncluindoSemTurma(matricula, periodo);\r\n\t\tfor(MatriculaAcademica matriculaAcademica : matriculas){\r\n\t\t\t\tmatriculaAcademicaDao.excluir(matriculaAcademica);\r\n\t\t}\r\n\t}\r\n\t\t\r\n\tpublic MatriculaAcademica consultarPorId(Long id){\r\n\t\treturn matriculaAcademicaDao.carregar(id);\r\n\t}\r\n\t\r\n\tpublic boolean possuiReprovacao(AtividadeCurricular atividade, MatriculaInstitucional matricula){\r\n\t\treturn matriculaAcademicaDao.possuiReprovacao(atividade, matricula);\r\n\t}\r\n\t\r\n\tpublic Set<AtividadeCurricular> getAtividadesReprovadasMedia(MatriculaInstitucional matricula){\r\n\t\tList<MatriculaAcademica> reprovacoesMedia =  matriculaAcademicaDao.listarReprovacoesPorMedia(matricula);\r\n\t\tSet<AtividadeCurricular> atividadesCurricularesReprovadas = new HashSet<AtividadeCurricular>();\r\n\t\tfor(MatriculaAcademica matAcad : reprovacoesMedia){\r\n\t\t\tatividadesCurricularesReprovadas.add(matAcad.getAtividadeCurricular());\r\n\t\t}\r\n\t\treturn atividadesCurricularesReprovadas;\r\n\t}\r\n\t\r\n\t/**\r\n\t * Registra eventos na matricula do aluno (Matricula vinculo, Trancamento, Bloqueio...)\r\n\t * @param evento\r\n\t * @param matricula\r\n\t */\r\n\tpublic void registrarEvento(EventoHistorico evento, MatriculaInstitucional matricula){\r\n\t\tConceito semConceito = new Conceito();\r\n\t\tsemConceito.setId(Conceito.SEM_CONCEITO);\r\n\t\tsemConceito = conceitoDao.carregar(semConceito.getOpcaoPk());\r\n\t\t\r\n\t\tAtividadeCurricular atividade = atividadeCurricularDao.carregar(evento.getId());\r\n\t\t\t\r\n\t\tTipoMatriculaAcademica tipo = new TipoMatriculaAcademica();\r\n\t\ttipo.setId(TipoMatriculaAcademica.EVENTO);\r\n\t\ttipo = tipoMatriculaAcadDao.carregar(tipo.getOpcaoPk());\r\n\t\t\r\n\t\tParametroAcademicoCurso atual = parAcadCursoDao.getParametrosAtuais(matricula.getVersaoCurso().getCurso());\r\n\t\t\r\n\t\tMatriculaAcademica academica = new MatriculaAcademica();\r\n\t\tacademica.setTipo(tipo);\r\n\t\tacademica.setMatriculaInstitucional(matricula);\r\n\t\tacademica.setAtividadeCurricular(atividade);\r\n\t\tacademica.setTipoPeriodo(atual.getTipoPeriodoMatricula());\r\n\t\tacademica.setAno(atual.getAnoMatricula());\r\n\t\tacademica.setPeriodo(matricula.getPeriodoAtual());\r\n\t\tacademica.setConceito(semConceito);\r\n\t\tmatriculaAcademicaDao.inserir(academica);\r\n\t\t\r\n//\t\tthis.matriculaAcademicaQueueSender.send(Operacao.INSERT, academica);\r\n\t}\r\n\t\r\n\t/**\r\n\t * Registra eventos na matricula do aluno (Matricula vinculo, Trancamento, Bloqueio...)\r\n\t * @param evento\r\n\t * @param matricula\r\n\t */\r\n\tpublic void registrarEvento(EventoHistorico evento, MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\tConceito semConceito = new Conceito();\r\n\t\tsemConceito.setId(Conceito.SEM_CONCEITO);\r\n\t\tsemConceito = conceitoDao.carregar(semConceito.getOpcaoPk());\r\n\t\t\r\n\t\tAtividadeCurricular atividade = atividadeCurricularDao.carregar(evento.getId());\r\n\t\t\t\r\n\t\tTipoMatriculaAcademica tipo = new TipoMatriculaAcademica();\r\n\t\ttipo.setId(TipoMatriculaAcademica.EVENTO);\r\n\t\ttipo = tipoMatriculaAcadDao.carregar(tipo.getOpcaoPk());\r\n\t\t\r\n\t\tMatriculaAcademica academica = new MatriculaAcademica();\r\n\t\tacademica.setTipo(tipo);\r\n\t\tacademica.setMatriculaInstitucional(matricula);\r\n\t\tacademica.setAtividadeCurricular(atividade);\r\n\t\tacademica.setTipoPeriodo( periodo.getTipoPeriodo() );\r\n\t\tacademica.setAno( periodo.getAno() );\r\n\t\tacademica.setPeriodo(matricula.getPeriodoAtual());\r\n\t\tacademica.setConceito(semConceito);\r\n\t\tmatriculaAcademicaDao.inserir(academica);\r\n\t\t\r\n//\t\tthis.matriculaAcademicaQueueSender.send(Operacao.INSERT, academica);\r\n\t}\r\n\t\r\n\t\r\n\t\r\n\tpublic List<MatriculaAcademica> listarEventosAtuais(MatriculaInstitucional matricula){\r\n\t\tParametroAcademicoCurso atual = parAcadCursoDao.getParametrosAtuais(matricula.getVersaoCurso().getCurso());\r\n\t\t\r\n\t\tList<AtividadeCurricular> atividades = new ArrayList<AtividadeCurricular>();\r\n\t\tfor(EventoHistorico evento : EventoHistorico.values()){\r\n\t\t\tAtividadeCurricular atividade = new AtividadeCurricular();\r\n\t\t\tatividade.setId(evento.getId());\r\n\t\t\tatividades.add(atividade);\r\n\t\t}\r\n\t\t\r\n\t\treturn matriculaAcademicaDao.getMatriculas(atual, matricula, atividades);\r\n\t}\r\n\t\r\n\tpublic boolean temMatriculaVinculoAtual(MatriculaInstitucional matricula){\r\n\t\tPeriodoLetivo atual = parAcadCursoDao.getParametrosAtuais(matricula.getVersaoCurso().getCurso()).getPeriodoLetivoMatricula();\r\n\t\tAtividadeCurricular atividade = atividadeCurricularDao.carregar(EventoHistorico.MATRICULA_VINCULO.getId());\t\t\r\n\t\treturn matriculaAcademicaDao.possuiRegistro(atual, atividade, matricula);\r\n\t}\r\n\t\r\n\tpublic boolean temMatriculaVinculo(MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\tAtividadeCurricular atividade = atividadeCurricularDao.carregar(EventoHistorico.MATRICULA_VINCULO.getId());\t\t\r\n\t\treturn matriculaAcademicaDao.possuiRegistro(periodo, atividade, matricula);\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> getMatriculasAcademicasAtuais(MatriculaInstitucional matricula){\r\n\t\tPeriodoLetivo atual = parAcadCursoDao.getParametrosAtuais(matricula.getVersaoCurso().getCurso()).getPeriodoLetivoMatricula();\r\n\t\treturn matriculaAcademicaDao.getMatriculasConceito(matricula, atual, Conceito.MATRICULADO);\r\n\t}\r\n\t\r\n\tpublic boolean existeRegistroTrancamentoPeriodoAtual(MatriculaInstitucional matricula){\r\n\t\tPeriodoLetivo atual = parAcadCursoDao.getParametrosAtuais(matricula.getVersaoCurso().getCurso()).getPeriodoLetivoMatricula();\r\n\t\treturn matriculaAcademicaDao.existeTrancamentoPeriodo(matricula, atual);\r\n\t}\r\n\t\r\n\tpublic List<DisciplinaCurricular> agruparTurmasPorDisciplinas(List<Turma> turmas){\r\n\t\tMap<AtividadeCurricular, List<Turma> > turmasDisciplinas = new HashMap<AtividadeCurricular, List<Turma> >();\r\n\t\t\r\n\t\t\r\n\t\t/**\r\n\t\t * Associa cada turma a uma disciplina curricular\r\n\t\t */\r\n\t\tfor (Turma turma : turmas) {\r\n\t\t\tList<Turma> lista = turmasDisciplinas.get(turma.getDisciplinaCurricular().getAtividadeCurricular());\r\n\t\t\t\r\n\t\t\tif (lista == null) {\r\n\t\t\t\tlista = new LinkedList<Turma>();\r\n\t\t\t\tturmasDisciplinas.put(turma.getDisciplinaCurricular().getAtividadeCurricular(), lista);\r\n\t\t\t}\r\n\t\t\t\r\n\t\t\tlista.add(turma);\r\n\t\t}\r\n\t\t\r\n\t\t/**\r\n\t\t * cria objetos transientes de DisciplinaCurricular para \r\n\t\t * passar para o método que chamou. Assim, podemos fazer o list\r\n\t\t * só das turmas que estamos associando e não de todas as turmas\r\n\t\t * da disciplina\r\n\t\t */\r\n\t\tList<DisciplinaCurricular> disciplinas = new ArrayList<DisciplinaCurricular>();\r\n\t\tlong id = 1;\r\n\t\tfor (AtividadeCurricular atividade : turmasDisciplinas.keySet()) {\r\n\t\t\tDisciplinaCurricular disciplinaTransiente = new DisciplinaCurricular();\r\n\t\t\tdisciplinaTransiente.setAtividadeCurricular(atividade);\r\n\t\t\tdisciplinaTransiente.setTurmas(turmasDisciplinas.get(atividade));\r\n\t\t\t\r\n\t\t\t/**\r\n\t\t\t * seta o id da disciplina transiente para\r\n\t\t\t * possibilitar a seleção de turmas no xhtml\r\n\t\t\t */\r\n\t\t\tdisciplinaTransiente.setId(id++);\r\n\t\t\t\r\n\t\t\t\r\n\t\t\tCollections.sort(disciplinaTransiente.getTurmas(), new ComparadorTurmaPorCodigo());\r\n\t\t\tdisciplinas.add(disciplinaTransiente);\r\n\t\t}\r\n\t\t\r\n\t\tCollections.sort(disciplinas, new ComparadorDisciplinaPorCodigo());\r\n\t\t\r\n\t\treturn disciplinas;\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarHistoricoFlexivel(MatriculaInstitucional matricula) {\r\n\t\treturn matriculaAcademicaDao.listarHistoricoFlexivel(matricula);\r\n\t}\r\n\r\n\t\r\n\tpublic List<MatriculaAcademica> consultarPorTurma(Turma turma) {\r\n\t\treturn this.matriculaAcademicaDao.consultarPorTurma(turma);\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> consultarPorTurmaOrdenadoPorNomeAluno(Turma turma){\r\n\t\treturn this.matriculaAcademicaDao.consultarPorTurmaOrdenadoPorNomeAluno(turma);\r\n\t}\t\r\n\t\r\n\tpublic List<MatriculaAcademica> consultarPorTurmaOrdenadoPorNomeSocialAluno(Turma turma){\r\n\t\treturn this.matriculaAcademicaDao.consultarPorTurmaOrdenadoPorNomeSocialAluno(turma);\r\n\t}\t\r\n\t\r\n\tpublic boolean cumpriu(DisciplinaCurricular disciplina, MatriculaInstitucional matricula){\r\n\t\tList<DisciplinaCurricular> cumpridas = disciplinaCurricularDao.listarCumpridas(listarCumpridas(matricula));\t\t\r\n\t\tSet<AtividadeCurricular> atividadesCumpridas = new HashSet<AtividadeCurricular>();\r\n\t\tatividadesCumpridas.addAll(atividadeCurricularDao.listarAtividades(cumpridas));\t\t\r\n\t\tAtividadeCurricular atividade = disciplinaCurricularDao.carregar(disciplina.getId()).getAtividadeCurricular();\t\t\r\n\t\treturn atividadesCumpridas.contains(atividade);\r\n\t}\r\n\t\r\n\t\r\n\tpublic int getCargaHorariaFixaObtida(MatriculaInstitucional matricula){\t\t\r\n\t\tList<DisciplinaCurricular> discObrigatorais = disciplinaService.listarDisciplinasCHFixaDoCurriculo(matricula.getVersaoCurso());\t\t\r\n\t\tList<DisciplinaCurricular> cumpridas = disciplinaCurricularDao.listarCumpridas(listarCumpridas(matricula));\r\n\t\tList<AtividadeCurricular> atividadesObrigatorias = disciplinaService.getAtividadesCurriculares(discObrigatorais);\r\n\t\tList<AtividadeCurricular> atividadesCumpridas = disciplinaService.getAtividadesCurriculares(cumpridas);\r\n\t\t\r\n\t\tComparator<AtividadeCurricular> comparacaoDisciplinas = new Comparator<AtividadeCurricular>() {\r\n            public int compare(AtividadeCurricular a1, AtividadeCurricular a2)\r\n            {\r\n                return a1.getId() == a2.getId() ? 0 : 1;\r\n            }\r\n\t\t};\r\n\t\tTreeSet<AtividadeCurricular> ativObrigatoriasSemRepeticao = new TreeSet<AtividadeCurricular>(comparacaoDisciplinas);\r\n\t\tativObrigatoriasSemRepeticao.addAll(atividadesObrigatorias);\r\n\t\t\r\n\t\tint somaCH = 0;\r\n\t\tfor(AtividadeCurricular atividadeObrigatoria : ativObrigatoriasSemRepeticao){\r\n\t\t\tif(atividadesCumpridas.contains(atividadeObrigatoria)){\t\t\t\t\r\n\t\t\t\tsomaCH += (atividadeObrigatoria.getCargaHorariaTotal() == null)? 0 : atividadeObrigatoria.getCargaHorariaTotal();\r\n\t\t\t}\r\n\t\t}\r\n\t\treturn somaCH;\r\n\t}\r\n\t\r\n\tpublic int getCargaHorariaEstagioObtida(MatriculaInstitucional matricula){\r\n\t\tList<DisciplinaCurricular> disciplinasEstagio = disciplinaCurricularDao.listarEstagios(matricula);\r\n\t\tList<AtividadeCurricular> atividades = disciplinaService.getAtividadesCurriculares(disciplinasEstagio);\r\n\t\treturn this.matriculaAcademicaDao.getCargaHorariaObtida(matricula,atividades);\r\n\t}\r\n\t\r\n\tpublic int getCargaHorariaEletivaObtida(MatriculaInstitucional matricula){\r\n\t\tList<DisciplinaCurricular> disciplinasEletivas = disciplinaService.listarEletivasNoCurriculo(matricula.getVersaoCurso());\r\n\t\tList<DisciplinaCurricular> cumpridas = \r\n\t\t\t\tdisciplinaCurricularDao.listarDisciplinasPorAtividadeEVersaoDoCurso(\r\n\t\t\t\tlistarCumpridas(matricula), matricula.getVersaoCurso() );\r\n\t\t\r\n\t\tList<AtividadeCurricular> atividadesEletivas = disciplinaService.getAtividadesCurriculares(disciplinasEletivas);\r\n\t\tList<AtividadeCurricular> atividadesCumpridas = disciplinaService.getAtividadesCurriculares(cumpridas);\r\n\t\t\r\n\t\t/**\r\n\t\t * verifica quais eletivas foram cumpridas\r\n\t\t */\r\n\t\tint somaCH = 0;\r\n\t\tfor(AtividadeCurricular atividadeEletiva : atividadesEletivas){\r\n\t\t\tif(atividadesCumpridas.contains(atividadeEletiva)){\r\n\t\t\t\tsomaCH += (atividadeEletiva.getCargaHorariaTotal() == null)? 0 : atividadeEletiva.getCargaHorariaTotal();\r\n\t\t\t}\r\n\t\t}\r\n\t\treturn somaCH;\r\n\t}\r\n\t\r\n\tpublic int getCargaHorariaFlexivelObtida(MatriculaInstitucional matricula){\r\n\t\treturn this.matriculaAcademicaDao.getCargaHorariaFlexivelObtida(matricula);\r\n\t}\r\n\r\n\tpublic MatriculaAcademica gerarConceitoForcado(MatriculaAcademica matriculaAcademica) {\r\n\t\tAlunoNotas alunoNotas = notaService.obterNotas(matriculaAcademica);\r\n\t\tnotaService.criarAvaliacoesFaltando(alunoNotas);\r\n\t\tnotaService.calcularAtualizarMediaFinal(alunoNotas);\r\n\t\t\r\n\t\tConceito conceito = conceitoDao.carregar(alunoNotas.getConceito().getOpcaoPk());\r\n\t\tmatriculaAcademica.setConceito(conceito);\r\n\t\tmatriculaAcademica.setMedia(alunoNotas.getMediaFinal().getNota());\r\n\t\t\r\n\t\treturn matriculaAcademicaDao.editar(matriculaAcademica);\r\n\t}\r\n\t\r\n\tpublic List<MatriculaInstitucional> listarAlunosPeriodoEncerradoComMatricula(PeriodoLetivo periodo, Curso curso){\r\n\t\treturn matriculaAcademicaDao.listarAlunosPeriodoEncerradoComMatricula(periodo, curso);\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasPeriodosAnteriores(MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\treturn matriculaAcademicaDao.listarMatriculasPeriodoEspecifico(matricula, periodo);\r\n\t}\r\n\r\n\t/**\r\n\t * Verifica se existem ofertas de turmas em que o aluno é obrigado a se matricular. Uma oferta obrigatória\r\n\t * é uma de que o aluno não pode ser simplesmente dispensado, diferente de quando uma turma é ofertada\r\n\t * em outro horário ou pólo  \r\n\t */\r\n\tpublic boolean temOfertaObrigatoria(List<AtividadeCurricular> atividades, MatriculaInstitucional matricula){\r\n\t\tParametroAcademicoCurso parametro = parAcadCursoDao.getParametrosAtuais(matricula.getVersaoCurso().getCurso());\t\t\r\n\t\tList<Turma> turmas = turmaDao.listarTurmasPeriodoAtualPorDisciplina(matricula, atividades,parametro.getPeriodoLetivoMatricula());\r\n\t\tList<Turma> excluir = new ArrayList<Turma>();\r\n\t\t\r\n\t\tfor(Turma turma : turmas){\r\n\t\t\tif(!turma.isObrigatoriaAluno(matricula)){\r\n\t\t\t\texcluir.add(turma);\r\n\t\t\t}\r\n\t\t}\r\n\t\t\r\n\t\tturmas.removeAll(excluir);\r\n\t\treturn !turmas.isEmpty();\r\n\t}\r\n\r\n\tpublic MatriculaAcademica matricularAproveitamentoEstudos(MatriculaAcademica aproveitamentoEstudo) {\r\n\t\tvalidarAproveitamentoDeEstudos(aproveitamentoEstudo);\r\n\t\t\r\n\t\tConceito conceitoAproveitamentoEstudos = conceitoDao.carregar(new Conceito(Conceito.APROVEITAMENTO_POR_ESTUDOS).getOpcaoPk());\r\n\t\tTipoMatriculaAcademica tipo = tipoMatriculaAcadDao.carregar(new TipoMatriculaAcademica(TipoMatriculaAcademica.REGULAR).getOpcaoPk());\r\n\t\tTipoPeriodo tipoPeriodo = tipoPeriodoDao.carregar(aproveitamentoEstudo.getTipoPeriodo().getOpcaoPk());\r\n\t\t\r\n\t\taproveitamentoEstudo.setTipoPeriodo(tipoPeriodo);\r\n\t\taproveitamentoEstudo.setTipo(tipo);\r\n\t\taproveitamentoEstudo.setConceito(conceitoAproveitamentoEstudos);\r\n\t\taproveitamentoEstudo.setTurma(null);\r\n\t\tmatriculaAcademicaDao.inserir(aproveitamentoEstudo);\r\n\t\t\r\n//\t\tthis.matriculaAcademicaQueueSender.send(Operacao.INSERT, aproveitamentoEstudo);\r\n\t\t\r\n\t\treturn aproveitamentoEstudo;\r\n\t}\r\n\t\r\n\tpublic MatriculaAcademica matricularAproveitamentoEstudosRemanescente(MatriculaAcademica aproveitamentoEstudo) {\r\n\t\tMatriculaInstitucional matrInst = aproveitamentoEstudo.getMatriculaInstitucional();\r\n\t\tmatrInst = this.matInstService.carregar( matrInst.getId() );\t\t\r\n\t\t\r\n\t\tlong idAtividade = aproveitamentoEstudo.getAtividadeCurricular().getId().longValue();\r\n\t\t\r\n\t\tList<AtividadeCurricular> atividades = this.atividadeCurricularDao.listarAtividadesMatriculadas( matrInst );\r\n\t\tfor (AtividadeCurricular atividadeCurricular : atividades) {\r\n\t\t\tif( idAtividade == atividadeCurricular.getId().longValue() ){\r\n\t\t\t\tthrow new IllegalArgumentException("O aluno de matrícula "+matrInst.getMatricula()\r\n\t\t\t\t\t\t+ " já está matriculado na atividade curricular - id: "+atividadeCurricular.getId() );\r\n\t\t\t}\r\n\t\t}\r\n\t\t\r\n\t\tatividades = this.atividadeCurricularDao.listarAtividadesCumpridas( matrInst );\r\n\t\tfor (AtividadeCurricular atividadeCurricular : atividades) {\r\n\t\t\tif( idAtividade == atividadeCurricular.getId().longValue() ){\r\n\t\t\t\tthrow new IllegalArgumentException("O aluno de matrícula "+matrInst.getMatricula()\r\n\t\t\t\t\t\t+ " já cursou a atividade curricular de id: "+atividadeCurricular.getId() );\r\n\t\t\t}\r\n\t\t}\r\n\t\t\r\n\t\tList<MatriculaAcademica> matriculasAcademicas = this.matriculaAcademicaDao.listarMatriculasPeriodoEspecifico( matrInst, aproveitamentoEstudo.getPeriodoLetivo() );\r\n\t\tfor ( MatriculaAcademica m: matriculasAcademicas ) {\t\t\t\r\n\t\t\tif( idAtividade == m.getAtividadeCurricular().getId().longValue() ){\r\n\t\t\t\tthrow new IllegalArgumentException("O aluno de matrícula "+matrInst.getMatricula()\r\n\t\t\t\t\t\t+ " já possui uma matrícula com status diferente de matriculado na atividade curricular de id: "+idAtividade\r\n\t\t\t\t\t\t+" no período "+aproveitamentoEstudo.getPeriodoLetivo() );\r\n\t\t\t}\r\n\t\t}\r\n\t\t\r\n\t\t\r\n\t\tvalidarAproveitamentoDeEstudos(aproveitamentoEstudo);\r\n\t\t\r\n\t\tConceito conceitoAproveitamentoEstudos = conceitoDao.carregar(new Conceito(Conceito.APROVEITAMENTO_POR_ESTUDOS).getOpcaoPk());\r\n\t\tTipoMatriculaAcademica tipo = tipoMatriculaAcadDao.carregar(new TipoMatriculaAcademica(TipoMatriculaAcademica.REGULAR).getOpcaoPk());\r\n\t\tTipoPeriodo tipoPeriodo = tipoPeriodoDao.carregar(aproveitamentoEstudo.getTipoPeriodo().getOpcaoPk());\r\n\t\t\r\n\t\taproveitamentoEstudo.setTipoPeriodo(tipoPeriodo);\r\n\t\taproveitamentoEstudo.setTipo(tipo);\r\n\t\taproveitamentoEstudo.setConceito(conceitoAproveitamentoEstudos);\r\n\t\taproveitamentoEstudo.setTurma(null);\r\n\t\tmatriculaAcademicaDao.inserir(aproveitamentoEstudo);\r\n//\t\tthis.matriculaAcademicaQueueSender.send(Operacao.INSERT, aproveitamentoEstudo);\r\n\t\treturn aproveitamentoEstudo;\r\n\t}\r\n\t\r\n\tpublic void matricularAproveitamentoEstudosEmBloco(AproveitamentoEstudosBloco aproveitamentoEstudosBloco) {\r\n\t\tConceito conceitoAproveitamentoEstudos = conceitoDao.carregar(new Conceito(Conceito.APROVEITAMENTO_POR_ESTUDOS).getOpcaoPk());\r\n\t\tTipoMatriculaAcademica tipo = tipoMatriculaAcadDao.carregar(new TipoMatriculaAcademica(TipoMatriculaAcademica.REGULAR).getOpcaoPk());\r\n\t\tTipoPeriodo tipoPeriodo = tipoPeriodoDao.carregar(aproveitamentoEstudosBloco.getPeriodo().getOpcaoPk());\r\n\t\t\r\n\t\tList<MatriculaAcademica> aproveitamentos = new ArrayList<MatriculaAcademica>();\r\n\t\t//Valida os aproveitamentos.\r\n\t\tfor (DisciplinaNota disciplinaNota : aproveitamentoEstudosBloco.getDisciplinasNota()) {\r\n\t\t\tif (disciplinaNota.getMediaFinal() == null) {\r\n\t\t\t\tthrow new IllegalArgumentException("Média final do aproveitamento de estudos deve ser informada.");\r\n\t\t\t}\r\n\t\t\tMatriculaAcademica aproveitamentoEstudo = new MatriculaAcademica();\r\n\t\t\taproveitamentoEstudo.setMatriculaInstitucional(aproveitamentoEstudosBloco.getMatriculaInstitucional());\r\n\t\t\taproveitamentoEstudo.setAtividadeCurricular(disciplinaNota.getDisciplinaCurricular().getAtividadeCurricular());\r\n\t\t\taproveitamentoEstudo.setEstruturaCurricular(disciplinaNota.getDisciplinaCurricular().getEstruturaCurricular());\r\n\t\t\taproveitamentoEstudo.setCargaHorariaTotal(disciplinaNota.getDisciplinaCurricular().getAtividadeCurricular().getCargaHorariaTotal());\r\n\t\t\taproveitamentoEstudo.setMedia(disciplinaNota.getMediaFinal());\r\n\t\t\t\r\n\t\t\tvalidarAproveitamentoDeEstudos(aproveitamentoEstudo);\r\n\t\t\taproveitamentos.add(aproveitamentoEstudo);\r\n\t\t}\r\n\t\t//Insere caso todos estejam válidos.\r\n\t\tfor (MatriculaAcademica aproveitamento : aproveitamentos) {\r\n\t\t\taproveitamento.setAno(aproveitamentoEstudosBloco.getAno());\r\n\t\t\taproveitamento.setPeriodo(aproveitamentoEstudosBloco.getMatriculaInstitucional().getPeriodoAtual());\r\n\t\t\taproveitamento.setTipoPeriodo(tipoPeriodo);\r\n\t\t\taproveitamento.setTipo(tipo);\r\n\t\t\taproveitamento.setConceito(conceitoAproveitamentoEstudos);\r\n\t\t\taproveitamento.setTurma(null);\r\n\t\t\t\r\n\t\t \tmatriculaAcademicaDao.inserir(aproveitamento);\r\n//\t\t \tthis.matriculaAcademicaQueueSender.send(Operacao.INSERT, aproveitamento);\r\n\t\t}\r\n\t}\r\n\r\n\tprivate void validarAproveitamentoDeEstudos(MatriculaAcademica aproveitamentoEstudo) {\r\n\t\tList<MatriculaAcademica> matriculas = matriculaAcademicaDao.getMatriculas(aproveitamentoEstudo.getMatriculaInstitucional(), aproveitamentoEstudo.getAtividadeCurricular());\r\n\t\tfor (MatriculaAcademica matriculaAcademica : matriculas) {\r\n\t\t\tif (Conceito.APROVEITAMENTO_POR_ESTUDOS == matriculaAcademica.getConceito().getId().longValue()) {\r\n\t\t\t\tthrow new NegocioException("Já houve aproveitamento de estudos nesta disciplina (" + aproveitamentoEstudo.getAtividadeCurricular().getCodigo() + ")");\r\n\t\t\t}\r\n\t\t\tif (Conceito.APROVADO == matriculaAcademica.getConceito().getId().longValue()) {\r\n\t\t\t\tthrow new NegocioException("Aluno já possui aprovação na disciplina (" + aproveitamentoEstudo.getAtividadeCurricular().getCodigo() + ")");\r\n\t\t\t}\r\n\t\t}\r\n\t}\r\n\r\n\t@Override\r\n\tprotected GenericDao<MatriculaAcademica, Long> getDao() {\r\n\t\treturn this.matriculaAcademicaDao;\r\n\t}\r\n\r\n\tpublic void excluirComOcorrencia(MatriculaAcademica matriculaAcademica,\tString descricaoOcorrencia, boolean decrementarVagas) {\r\n\t\tmatriculaAcademica = matriculaAcademicaDao.carregar(matriculaAcademica.getId());\r\n\t\tboolean isFera = matInstService.isFera(matriculaAcademica.getMatriculaInstitucional());\r\n\r\n\t\tmatriculaAcademicaDao.excluir(matriculaAcademica);\r\n//\t\tthis.matriculaAcademicaQueueSender.send(Operacao.DELETE, matriculaAcademica);\r\n\t\tif (decrementarVagas) {\r\n\t\t\tTurma turma = matriculaAcademica.getTurma();\r\n\t\t\tif(turma != null){\r\n\t\t\t\tturma.decrementarVagasOcupadas(matriculaAcademica.getMatriculaInstitucional(), isFera, matriculaAcademica);\r\n\t\t\t\tturmaDao.editar(turma);\r\n\t\t\t}\r\n\t\t}\r\n\t\t\r\n\t\tString descricaoCompleta = "Exclusão da disciplina " + matriculaAcademica.getAtividadeCurricular().getCodigo() + " (" + matriculaAcademica.getAno() + "/" + matriculaAcademica.getTipoPeriodo().getDescricao() + ") do histórico comum (Processo: " + descricaoOcorrencia + ").";\r\n\t\tocorrenciaService.inserirExclusaoDisciplina(matriculaAcademica.getMatriculaInstitucional(), descricaoCompleta);\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> consultarPorMes(Turma turma, Mes mes) {\r\n\t\treturn this.matriculaAcademicaDao.consultarPorMes(turma, mes); \t\t\r\n\t}\r\n\r\n\tpublic List<RestricaoViolada> listarViolacoesMatricula(MatriculaInstitucional matriculaInstitucional, List<Turma> turmas) {\r\n\t\tValidadorMatricula validador = ((ValidadorMatriculaResolucao69de2010Factory) validadorFactory).getValidadorAluno(matriculaInstitucional);\r\n\t\treturn validador.checar(matriculaInstitucional, turmas);\r\n\t}\r\n\r\n\t\r\n\t/**     Recebe uma lista de matrículas institucionais e devolve uma nova lista excluindo os alunos que possuem ao menos uma aprovação\r\n\t *  em alguma disciplina no período. */\r\n\tpublic List<MatriculaAcademica> filtrarAlunosComDisciplinaAprovadaNoPeriodo(List<MatriculaInstitucional> matriculas, PeriodoLetivo periodo) {\r\n\t\treturn this.matriculaAcademicaDao.filtrarAlunosComDisciplinaAprovadaNoPeriodo( matriculas, periodo );\r\n\t}\r\n\r\n\t/**     Recebe uma lista de matrículas institucionais e retorna uma lista de matrículas acadêmicas desses alunos em que houve reprovação\r\n\t *  por nota no período passado como parâmetro.*/\r\n\tpublic List<MatriculaAcademica> filtrarAlunosComReprovacaoPorNotaNoPeriodo(\r\n\t\t\tList<MatriculaInstitucional> matriculas, PeriodoLetivo periodo) {\r\n\t\treturn this.matriculaAcademicaDao.filtrarAlunosComReprovacaoPorNotaNoPeriodo( matriculas, periodo);\r\n\t}\r\n\t\r\n\t/**     Recebe uma lista de matrículas institucionais e retorna uma lista de matrículas acadêmicas desses alunos que sejam do tipo\r\n\t *  matrícula vínculo para desenvolvimento de TCC no período passado como parâmetro.*/\r\n\tpublic List<MatriculaAcademica> filtrarAlunosComMatriculaVinculoEmTCC(\r\n\t\t\tList<MatriculaInstitucional> matriculas, PeriodoLetivo periodo) {\r\n\t\treturn this.matriculaAcademicaDao.filtrarAlunosComMatriculaVinculoEmTCC( matriculas, periodo);\r\n\t}\r\n\r\n}	Essa é a versão original da classe <code>MatriculaAcademicaService</code>. Como podemos observar, existem muitas linhas de código nessa classe que implementa o serviço de matrícula acadêmica. Antes de apresentar as refatorações propostas, vamos remover o corpo de todos métodos e comentários para facilitar a visualização da classe.	MatriculaAcademicaService_1.java	\N	18
4	public class GenericTranspalBean {\r\n\t\r\n\t@In("#{matriculaInstitucionalService}")\r\n\tprotected MatriculaInstitucionalService matriculaInstitucionalService;\r\n\t\r\n\t@In("#{enderecoService}")\r\n\tprotected EnderecoService enderecoService;\r\n\r\n\t//_____________________________________________________________________________________________\r\n\t/**     Método que retorna true caso o aluno esteja regularmente matriculado e false em caso\r\n\t *  contrário.*/\r\n\tprotected boolean alunoEstaMatriculado( StatusMatricula status ){\r\n\t\tif( \tstatus != StatusMatricula.MATRICULADO && \r\n\t\t\t\tstatus != StatusMatricula.MATRICULADO_TCC && \r\n\t\t\t\tstatus != StatusMatricula.CURSO_INTEGRALIZADO && \r\n\t\t\t\tstatus != StatusMatricula.SEM_MATRICULA_DISCIPLINA ){\r\n\t\t\treturn false;\r\n\t\t}\r\n\t\treturn true;\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprivate StringBuilder processamento( MatriculaInstitucional matriculaInstitucional, Ocorrencia ocorrencia ){\r\n\t\tAluno aluno = matriculaInstitucional.getAluno();\r\n\t\tPessoa pessoa = matriculaInstitucional.getAluno().getPessoa();\r\n\t\tEndereco endereco = this.enderecoService.getEnderecoResidencial(aluno);\r\n\t\t\r\n\t\tStringBuilder dados = new StringBuilder();\r\n\r\n\t\t// Matricula OK\r\n\t\tdados.append(StringUtils.rightPad(matriculaInstitucional.getMatricula().toUpperCase(), 15, " "));\r\n\t\t// Nome OK\r\n\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(aluno.getNome().toUpperCase()).replaceAll("[^a-z^A-Z^0-9 ]", ""), 60, " "));\r\n\t\t// Sexo OK\r\n\t\tdados.append(StringUtils.rightPad(aluno.getSexo().toUpperCase(), 1, " "));\r\n\t\tbuildDataNascimento(aluno, dados);\r\n\t\t// CPF OK\r\n\t\tDocumentoPessoa cpf = pessoa.getCPF();\r\n\t\tif( cpf != null ){\r\n\t\t\tdados.append(StringUtils.rightPad( cpf.getNumeroDocumento().replaceAll("\\\\D", ""), 14, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.rightPad( "", 14, " "));\r\n\t\t}\r\n\t\t// RG OK\r\n\t\tDocumentoPessoa rg = pessoa.getRG();\r\n\t\tif( rg != null ){\r\n\t\t\tdados.append(StringUtils.leftPad( rg.getNumeroDocumento().replaceAll("\\\\D", ""), 14, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.leftPad( "", 14, " "));\r\n\t\t}\r\n\t\tif(endereco != null){\r\n\t\t\t// Telefone OK\r\n\t\t\tdados.append(StringUtils.leftPad(endereco.getFoneCelular() != null ? endereco.getFoneCelular().replaceAll("\\\\D", "") : "", 14, " "));\r\n\t\t\t// Endereço OK\r\n\t\t\tdados.append(StringUtils.rightPad(endereco.getRua() != null ? AcentosUtils.remover(endereco.getRua().replaceAll("[^a-z^A-Z^0-9 ]", "")).toUpperCase() : "", 60, " "));\r\n\t\t\t// Complemento OK\r\n\t\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(endereco.getComplemento() != null ? AcentosUtils.remover(endereco.getComplemento()).replaceAll("[^a-z^A-Z^0-9 ]", "") : "").toUpperCase(), 60, " "));\r\n\t\t\t// Bairro OK\r\n\t\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(endereco.getBairro() != null ? AcentosUtils.remover(endereco.getBairro()).replaceAll("[^a-z^A-Z^0-9 ]", "").toUpperCase() : ""), 30, " "));\r\n\t\t\t// CEP OK\r\n\t\t\tdados.append(StringUtils.rightPad(formataCEP(endereco.getCep()), 9, "0"));\r\n\t\t}else{\r\n\t\t\t// Telefone OK\r\n\t\t\tdados.append(StringUtils.leftPad( "", 14, " "));\r\n\t\t\t// Endereço OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 60, " "));\r\n\t\t\t// Complemento OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 60, " "));\r\n\t\t\t// Bairro OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 30, " "));\r\n\t\t\t// CEP OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 9, "0"));\t\t\t\r\n\t\t}\r\n\t\t// Mãe OK\r\n\t\tString nomeMae = aluno.getNomeMae();\r\n\t\tif( nomeMae != null ){\r\n\t\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(aluno.getNomeMae()).replaceAll("[^a-z^A-Z^0-9 ]", "").toUpperCase(), 60, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.rightPad( "" , 60, " "));\r\n\t\t}\r\n\t\t// CPF Mãe OK\r\n\t\tdados.append(StringUtils.rightPad(" ", 11));\r\n\t\t// Pai OK \r\n\t\tdados.append(StringUtils.rightPad(aluno.getNomePai() != null ? AcentosUtils.remover(aluno.getNomePai()).replaceAll("[^a-z^A-Z^0-9 ]", "").toUpperCase() : "", 60, " "));\r\n\t\t// CPF Pai OK\r\n\t\tdados.append(StringUtils.rightPad(" ", 11));\r\n\t\t// Série (Período) OK\r\n\t\tdados.append(StringUtils.leftPad(matriculaInstitucional.getPeriodoAtual().toString(), 2, " "));\r\n\t\t// Grau OK\r\n\t\tdados.append(StringUtils.rightPad("3", 1, " "));\r\n\t\t// Turno \r\n\t\tdados.append(StringUtils.rightPad(matriculaInstitucional.getVersaoCurso().getCurso().getTurno().getSigla(), 1, " "));\r\n\t\t// Código OK\r\n\t\tString codigoCursoTranspal = matriculaInstitucional.getVersaoCurso().getCurso().getCursoTranspal();\r\n\t\tif( codigoCursoTranspal == null ){\r\n\t\t\tthrow new IllegalArgumentException( "O curso correspondente à matrícula '"\r\n\t\t\t\t\t+matriculaInstitucional.getMatricula().toUpperCase()+"' não possui um código da Transpal." );\r\n\t\t}\r\n\t\tdados.append(StringUtils.rightPad( codigoCursoTranspal , 3, " "));\r\n\t\t// Status OK\r\n\t\tString status = this.retornarStatusAluno( ocorrencia );\r\n\t\tdados.append( StringUtils.rightPad( status, 1, " ") );\r\n\t\t// E-mail OK\r\n\t\tdados.append(StringUtils.rightPad(aluno.getEmail() != null ? aluno.getEmail().toUpperCase() : "", 40, " "));\r\n\t\t\t\r\n\t\treturn dados;\r\n\t}\r\n\tprivate void buildDataNascimento(Aluno aluno, StringBuilder dados) {\r\n\t\t// Nascimento OK\r\n\t\tDate dataNascimento = aluno.getDataNascimento();\r\n\t\tif( dataNascimento != null ){\r\n\t\t\tdados.append(StringUtils.rightPad(new SimpleDateFormat("dd/MM/yyyy").format( dataNascimento ), 10, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.rightPad( "" , 10, " "));\r\n\t\t}\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprivate String retornarStatusAluno( Ocorrencia ocorrencia ){\r\n\t\tif( ocorrencia == null){\r\n\t\t\treturn "A";\r\n\t\t}\r\n\t\tlong idOcorrencia = ocorrencia.getTipoOcorrencia().getId();\r\n\t\tif( idOcorrencia == TipoOcorrencia.FALECIMENTO\r\n\t\t\t\t|| idOcorrencia == TipoOcorrencia.DESISTENCIA\r\n\t\t\t\t|| idOcorrencia == TipoOcorrencia.DESLIGAMENTO ){\r\n\t\t\treturn "D";\r\n\t\t}\r\n\t\tif( idOcorrencia == TipoOcorrencia.FORMATURA ){\r\n\t\t\treturn "C";\r\n\t\t}\r\n\t\tif( idOcorrencia == TipoOcorrencia.SAIDA_TRANSFERENCIA_EXTERNA ){\r\n\t\t\treturn "T";\r\n\t\t}\r\n\t\treturn "I";\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprotected StringBuilder formatarDados(MatriculaInstitucional matriculaInstitucional) throws IOException, Exception {\r\n\t\tStatusMatricula status = this.matriculaInstitucionalService.getStatusMatricula( matriculaInstitucional );\r\n\t\tif( !this.alunoEstaMatriculado( status ) ){\r\n\t\t\tString matricula = matriculaInstitucional.getMatricula();\r\n\t\t\tthrow new IllegalArgumentException( "O aluno de matrícula '"+matricula+"' aparentemente" +\r\n\t\t\t\t\t" não está regurlarmente matriculado" );\r\n\t\t}\r\n\t\t//-----------------------------------------------------------------------------------------\r\n\t\treturn this.processamento( matriculaInstitucional, null );\t\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprotected StringBuilder gerarStringArquivoDosAlunosDesligados( Ocorrencia ocorrencia ){\r\n\t\treturn this.processamento( ocorrencia.getMatricula(), ocorrencia );\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\t\r\n\tprivate String formataCEP(String cep) {\r\n\t\tif (cep == null) {\r\n\t\t\treturn "";\r\n\t\t}\r\n\t\tString cepNumeros = cep.replaceAll("\\\\D", "");\r\n\t\tcepNumeros = StringUtils.rightPad(cepNumeros, 8, "0");\r\n\t\treturn cepNumeros.substring(0, 5) + "-" + cepNumeros.substring(5, 8);\r\n\t\t\r\n\t}\r\n \r\n}	Parte do método <code>processamento</code> responsável por construir a string de data de aniversário foi extraída para <code>buildDataNascimento</code>	GenericTranspalBean_2.java	35,107-115	3
5	public class GenericTranspalBean {\r\n\t\r\n\t@In("#{matriculaInstitucionalService}")\r\n\tprotected MatriculaInstitucionalService matriculaInstitucionalService;\r\n\t\r\n\t@In("#{enderecoService}")\r\n\tprotected EnderecoService enderecoService;\r\n\r\n\t//_____________________________________________________________________________________________\r\n\t/**     Método que retorna true caso o aluno esteja regularmente matriculado e false em caso\r\n\t *  contrário.*/\r\n\tprotected boolean alunoEstaMatriculado( StatusMatricula status ){\r\n\t\tif( \tstatus != StatusMatricula.MATRICULADO && \r\n\t\t\t\tstatus != StatusMatricula.MATRICULADO_TCC && \r\n\t\t\t\tstatus != StatusMatricula.CURSO_INTEGRALIZADO && \r\n\t\t\t\tstatus != StatusMatricula.SEM_MATRICULA_DISCIPLINA ){\r\n\t\t\treturn false;\r\n\t\t}\r\n\t\treturn true;\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprivate StringBuilder processamento( MatriculaInstitucional matriculaInstitucional, Ocorrencia ocorrencia ){\r\n\t\tAluno aluno = matriculaInstitucional.getAluno();\r\n\t\tPessoa pessoa = matriculaInstitucional.getAluno().getPessoa();\r\n\t\tEndereco endereco = this.enderecoService.getEnderecoResidencial(aluno);\r\n\t\t\r\n\t\tStringBuilder dados = new StringBuilder();\r\n\r\n\t\t// Matricula OK\r\n\t\tdados.append(StringUtils.rightPad(matriculaInstitucional.getMatricula().toUpperCase(), 15, " "));\r\n\t\t// Nome OK\r\n\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(aluno.getNome().toUpperCase()).replaceAll("[^a-z^A-Z^0-9 ]", ""), 60, " "));\r\n\t\t// Sexo OK\r\n\t\tdados.append(StringUtils.rightPad(aluno.getSexo().toUpperCase(), 1, " "));\r\n\t\tbuildDataNascimento(aluno, dados);\r\n\t\t// CPF OK\r\n\t\tbuildCPF(pessoa, dados);\r\n\t\t// RG OK\r\n\t\tDocumentoPessoa rg = pessoa.getRG();\r\n\t\tif( rg != null ){\r\n\t\t\tdados.append(StringUtils.leftPad( rg.getNumeroDocumento().replaceAll("\\\\D", ""), 14, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.leftPad( "", 14, " "));\r\n\t\t}\r\n\t\tif(endereco != null){\r\n\t\t\t// Telefone OK\r\n\t\t\tdados.append(StringUtils.leftPad(endereco.getFoneCelular() != null ? endereco.getFoneCelular().replaceAll("\\\\D", "") : "", 14, " "));\r\n\t\t\t// Endereço OK\r\n\t\t\tdados.append(StringUtils.rightPad(endereco.getRua() != null ? AcentosUtils.remover(endereco.getRua().replaceAll("[^a-z^A-Z^0-9 ]", "")).toUpperCase() : "", 60, " "));\r\n\t\t\t// Complemento OK\r\n\t\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(endereco.getComplemento() != null ? AcentosUtils.remover(endereco.getComplemento()).replaceAll("[^a-z^A-Z^0-9 ]", "") : "").toUpperCase(), 60, " "));\r\n\t\t\t// Bairro OK\r\n\t\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(endereco.getBairro() != null ? AcentosUtils.remover(endereco.getBairro()).replaceAll("[^a-z^A-Z^0-9 ]", "").toUpperCase() : ""), 30, " "));\r\n\t\t\t// CEP OK\r\n\t\t\tdados.append(StringUtils.rightPad(formataCEP(endereco.getCep()), 9, "0"));\r\n\t\t}else{\r\n\t\t\t// Telefone OK\r\n\t\t\tdados.append(StringUtils.leftPad( "", 14, " "));\r\n\t\t\t// Endereço OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 60, " "));\r\n\t\t\t// Complemento OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 60, " "));\r\n\t\t\t// Bairro OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 30, " "));\r\n\t\t\t// CEP OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 9, "0"));\t\t\t\r\n\t\t}\r\n\t\t// Mãe OK\r\n\t\tString nomeMae = aluno.getNomeMae();\r\n\t\tif( nomeMae != null ){\r\n\t\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(aluno.getNomeMae()).replaceAll("[^a-z^A-Z^0-9 ]", "").toUpperCase(), 60, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.rightPad( "" , 60, " "));\r\n\t\t}\r\n\t\t// CPF Mãe OK\r\n\t\tdados.append(StringUtils.rightPad(" ", 11));\r\n\t\t// Pai OK \r\n\t\tdados.append(StringUtils.rightPad(aluno.getNomePai() != null ? AcentosUtils.remover(aluno.getNomePai()).replaceAll("[^a-z^A-Z^0-9 ]", "").toUpperCase() : "", 60, " "));\r\n\t\t// CPF Pai OK\r\n\t\tdados.append(StringUtils.rightPad(" ", 11));\r\n\t\t// Série (Período) OK\r\n\t\tdados.append(StringUtils.leftPad(matriculaInstitucional.getPeriodoAtual().toString(), 2, " "));\r\n\t\t// Grau OK\r\n\t\tdados.append(StringUtils.rightPad("3", 1, " "));\r\n\t\t// Turno \r\n\t\tdados.append(StringUtils.rightPad(matriculaInstitucional.getVersaoCurso().getCurso().getTurno().getSigla(), 1, " "));\r\n\t\t// Código OK\r\n\t\tString codigoCursoTranspal = matriculaInstitucional.getVersaoCurso().getCurso().getCursoTranspal();\r\n\t\tif( codigoCursoTranspal == null ){\r\n\t\t\tthrow new IllegalArgumentException( "O curso correspondente à matrícula '"\r\n\t\t\t\t\t+matriculaInstitucional.getMatricula().toUpperCase()+"' não possui um código da Transpal." );\r\n\t\t}\r\n\t\tdados.append(StringUtils.rightPad( codigoCursoTranspal , 3, " "));\r\n\t\t// Status OK\r\n\t\tString status = this.retornarStatusAluno( ocorrencia );\r\n\t\tdados.append( StringUtils.rightPad( status, 1, " ") );\r\n\t\t// E-mail OK\r\n\t\tdados.append(StringUtils.rightPad(aluno.getEmail() != null ? aluno.getEmail().toUpperCase() : "", 40, " "));\r\n\t\t\t\r\n\t\treturn dados;\r\n\t}\r\n\tprivate void buildCPF(Pessoa pessoa, StringBuilder dados) {\r\n\t\tDocumentoPessoa cpf = pessoa.getCPF();\r\n\t\tif( cpf != null ){\r\n\t\t\tdados.append(StringUtils.rightPad( cpf.getNumeroDocumento().replaceAll("\\\\D", ""), 14, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.rightPad( "", 14, " "));\r\n\t\t}\r\n\t}\r\n\tprivate void buildDataNascimento(Aluno aluno, StringBuilder dados) {\r\n\t\t// Nascimento OK\r\n\t\tDate dataNascimento = aluno.getDataNascimento();\r\n\t\tif( dataNascimento != null ){\r\n\t\t\tdados.append(StringUtils.rightPad(new SimpleDateFormat("dd/MM/yyyy").format( dataNascimento ), 10, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.rightPad( "" , 10, " "));\r\n\t\t}\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprivate String retornarStatusAluno( Ocorrencia ocorrencia ){\r\n\t\tif( ocorrencia == null){\r\n\t\t\treturn "A";\r\n\t\t}\r\n\t\tlong idOcorrencia = ocorrencia.getTipoOcorrencia().getId();\r\n\t\tif( idOcorrencia == TipoOcorrencia.FALECIMENTO\r\n\t\t\t\t|| idOcorrencia == TipoOcorrencia.DESISTENCIA\r\n\t\t\t\t|| idOcorrencia == TipoOcorrencia.DESLIGAMENTO ){\r\n\t\t\treturn "D";\r\n\t\t}\r\n\t\tif( idOcorrencia == TipoOcorrencia.FORMATURA ){\r\n\t\t\treturn "C";\r\n\t\t}\r\n\t\tif( idOcorrencia == TipoOcorrencia.SAIDA_TRANSFERENCIA_EXTERNA ){\r\n\t\t\treturn "T";\r\n\t\t}\r\n\t\treturn "I";\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprotected StringBuilder formatarDados(MatriculaInstitucional matriculaInstitucional) throws IOException, Exception {\r\n\t\tStatusMatricula status = this.matriculaInstitucionalService.getStatusMatricula( matriculaInstitucional );\r\n\t\tif( !this.alunoEstaMatriculado( status ) ){\r\n\t\t\tString matricula = matriculaInstitucional.getMatricula();\r\n\t\t\tthrow new IllegalArgumentException( "O aluno de matrícula '"+matricula+"' aparentemente" +\r\n\t\t\t\t\t" não está regurlarmente matriculado" );\r\n\t\t}\r\n\t\t//-----------------------------------------------------------------------------------------\r\n\t\treturn this.processamento( matriculaInstitucional, null );\t\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprotected StringBuilder gerarStringArquivoDosAlunosDesligados( Ocorrencia ocorrencia ){\r\n\t\treturn this.processamento( ocorrencia.getMatricula(), ocorrencia );\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\t\r\n\tprivate String formataCEP(String cep) {\r\n\t\tif (cep == null) {\r\n\t\t\treturn "";\r\n\t\t}\r\n\t\tString cepNumeros = cep.replaceAll("\\\\D", "");\r\n\t\tcepNumeros = StringUtils.rightPad(cepNumeros, 8, "0");\r\n\t\treturn cepNumeros.substring(0, 5) + "-" + cepNumeros.substring(5, 8);\r\n\t\t\r\n\t}\r\n \r\n}	método <code>buildCPF</code> extraído	GenericTranspalBean_3.java	37,102-109	4
6	public class GenericTranspalBean {\r\n\t\r\n\t@In("#{matriculaInstitucionalService}")\r\n\tprotected MatriculaInstitucionalService matriculaInstitucionalService;\r\n\t\r\n\t@In("#{enderecoService}")\r\n\tprotected EnderecoService enderecoService;\r\n\r\n\t//_____________________________________________________________________________________________\r\n\t/**     Método que retorna true caso o aluno esteja regularmente matriculado e false em caso\r\n\t *  contrário.*/\r\n\tprotected boolean alunoEstaMatriculado( StatusMatricula status ){\r\n\t\tif( \tstatus != StatusMatricula.MATRICULADO && \r\n\t\t\t\tstatus != StatusMatricula.MATRICULADO_TCC && \r\n\t\t\t\tstatus != StatusMatricula.CURSO_INTEGRALIZADO && \r\n\t\t\t\tstatus != StatusMatricula.SEM_MATRICULA_DISCIPLINA ){\r\n\t\t\treturn false;\r\n\t\t}\r\n\t\treturn true;\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprivate StringBuilder processamento( MatriculaInstitucional matriculaInstitucional, Ocorrencia ocorrencia ){\r\n\t\tAluno aluno = matriculaInstitucional.getAluno();\r\n\t\tPessoa pessoa = matriculaInstitucional.getAluno().getPessoa();\r\n\t\tEndereco endereco = this.enderecoService.getEnderecoResidencial(aluno);\r\n\t\t\r\n\t\tStringBuilder dados = new StringBuilder();\r\n\r\n\t\t// Matricula OK\r\n\t\tdados.append(StringUtils.rightPad(matriculaInstitucional.getMatricula().toUpperCase(), 15, " "));\r\n\t\t// Nome OK\r\n\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(aluno.getNome().toUpperCase()).replaceAll("[^a-z^A-Z^0-9 ]", ""), 60, " "));\r\n\t\t// Sexo OK\r\n\t\tdados.append(StringUtils.rightPad(aluno.getSexo().toUpperCase(), 1, " "));\r\n\t\tbuildDataNascimento(aluno, dados);\r\n\t\t// CPF OK\r\n\t\tbuildCPF(pessoa, dados);\r\n\t\t// RG OK\r\n\t\tbuildRG(pessoa, dados);\r\n\t\tif(endereco != null){\r\n\t\t\t// Telefone OK\r\n\t\t\tdados.append(StringUtils.leftPad(endereco.getFoneCelular() != null ? endereco.getFoneCelular().replaceAll("\\\\D", "") : "", 14, " "));\r\n\t\t\t// Endereço OK\r\n\t\t\tdados.append(StringUtils.rightPad(endereco.getRua() != null ? AcentosUtils.remover(endereco.getRua().replaceAll("[^a-z^A-Z^0-9 ]", "")).toUpperCase() : "", 60, " "));\r\n\t\t\t// Complemento OK\r\n\t\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(endereco.getComplemento() != null ? AcentosUtils.remover(endereco.getComplemento()).replaceAll("[^a-z^A-Z^0-9 ]", "") : "").toUpperCase(), 60, " "));\r\n\t\t\t// Bairro OK\r\n\t\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(endereco.getBairro() != null ? AcentosUtils.remover(endereco.getBairro()).replaceAll("[^a-z^A-Z^0-9 ]", "").toUpperCase() : ""), 30, " "));\r\n\t\t\t// CEP OK\r\n\t\t\tdados.append(StringUtils.rightPad(formataCEP(endereco.getCep()), 9, "0"));\r\n\t\t}else{\r\n\t\t\t// Telefone OK\r\n\t\t\tdados.append(StringUtils.leftPad( "", 14, " "));\r\n\t\t\t// Endereço OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 60, " "));\r\n\t\t\t// Complemento OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 60, " "));\r\n\t\t\t// Bairro OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 30, " "));\r\n\t\t\t// CEP OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 9, "0"));\t\t\t\r\n\t\t}\r\n\t\t// Mãe OK\r\n\t\tString nomeMae = aluno.getNomeMae();\r\n\t\tif( nomeMae != null ){\r\n\t\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(aluno.getNomeMae()).replaceAll("[^a-z^A-Z^0-9 ]", "").toUpperCase(), 60, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.rightPad( "" , 60, " "));\r\n\t\t}\r\n\t\t// CPF Mãe OK\r\n\t\tdados.append(StringUtils.rightPad(" ", 11));\r\n\t\t// Pai OK \r\n\t\tdados.append(StringUtils.rightPad(aluno.getNomePai() != null ? AcentosUtils.remover(aluno.getNomePai()).replaceAll("[^a-z^A-Z^0-9 ]", "").toUpperCase() : "", 60, " "));\r\n\t\t// CPF Pai OK\r\n\t\tdados.append(StringUtils.rightPad(" ", 11));\r\n\t\t// Série (Período) OK\r\n\t\tdados.append(StringUtils.leftPad(matriculaInstitucional.getPeriodoAtual().toString(), 2, " "));\r\n\t\t// Grau OK\r\n\t\tdados.append(StringUtils.rightPad("3", 1, " "));\r\n\t\t// Turno \r\n\t\tdados.append(StringUtils.rightPad(matriculaInstitucional.getVersaoCurso().getCurso().getTurno().getSigla(), 1, " "));\r\n\t\t// Código OK\r\n\t\tString codigoCursoTranspal = matriculaInstitucional.getVersaoCurso().getCurso().getCursoTranspal();\r\n\t\tif( codigoCursoTranspal == null ){\r\n\t\t\tthrow new IllegalArgumentException( "O curso correspondente à matrícula '"\r\n\t\t\t\t\t+matriculaInstitucional.getMatricula().toUpperCase()+"' não possui um código da Transpal." );\r\n\t\t}\r\n\t\tdados.append(StringUtils.rightPad( codigoCursoTranspal , 3, " "));\r\n\t\t// Status OK\r\n\t\tString status = this.retornarStatusAluno( ocorrencia );\r\n\t\tdados.append( StringUtils.rightPad( status, 1, " ") );\r\n\t\t// E-mail OK\r\n\t\tdados.append(StringUtils.rightPad(aluno.getEmail() != null ? aluno.getEmail().toUpperCase() : "", 40, " "));\r\n\t\t\t\r\n\t\treturn dados;\r\n\t}\r\n\tprivate void buildRG(Pessoa pessoa, StringBuilder dados) {\r\n\t\tDocumentoPessoa rg = pessoa.getRG();\r\n\t\tif( rg != null ){\r\n\t\t\tdados.append(StringUtils.leftPad( rg.getNumeroDocumento().replaceAll("\\\\D", ""), 14, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.leftPad( "", 14, " "));\r\n\t\t}\r\n\t}\r\n\tprivate void buildCPF(Pessoa pessoa, StringBuilder dados) {\r\n\t\tDocumentoPessoa cpf = pessoa.getCPF();\r\n\t\tif( cpf != null ){\r\n\t\t\tdados.append(StringUtils.rightPad( cpf.getNumeroDocumento().replaceAll("\\\\D", ""), 14, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.rightPad( "", 14, " "));\r\n\t\t}\r\n\t}\r\n\tprivate void buildDataNascimento(Aluno aluno, StringBuilder dados) {\r\n\t\t// Nascimento OK\r\n\t\tDate dataNascimento = aluno.getDataNascimento();\r\n\t\tif( dataNascimento != null ){\r\n\t\t\tdados.append(StringUtils.rightPad(new SimpleDateFormat("dd/MM/yyyy").format( dataNascimento ), 10, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.rightPad( "" , 10, " "));\r\n\t\t}\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprivate String retornarStatusAluno( Ocorrencia ocorrencia ){\r\n\t\tif( ocorrencia == null){\r\n\t\t\treturn "A";\r\n\t\t}\r\n\t\tlong idOcorrencia = ocorrencia.getTipoOcorrencia().getId();\r\n\t\tif( idOcorrencia == TipoOcorrencia.FALECIMENTO\r\n\t\t\t\t|| idOcorrencia == TipoOcorrencia.DESISTENCIA\r\n\t\t\t\t|| idOcorrencia == TipoOcorrencia.DESLIGAMENTO ){\r\n\t\t\treturn "D";\r\n\t\t}\r\n\t\tif( idOcorrencia == TipoOcorrencia.FORMATURA ){\r\n\t\t\treturn "C";\r\n\t\t}\r\n\t\tif( idOcorrencia == TipoOcorrencia.SAIDA_TRANSFERENCIA_EXTERNA ){\r\n\t\t\treturn "T";\r\n\t\t}\r\n\t\treturn "I";\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprotected StringBuilder formatarDados(MatriculaInstitucional matriculaInstitucional) throws IOException, Exception {\r\n\t\tStatusMatricula status = this.matriculaInstitucionalService.getStatusMatricula( matriculaInstitucional );\r\n\t\tif( !this.alunoEstaMatriculado( status ) ){\r\n\t\t\tString matricula = matriculaInstitucional.getMatricula();\r\n\t\t\tthrow new IllegalArgumentException( "O aluno de matrícula '"+matricula+"' aparentemente" +\r\n\t\t\t\t\t" não está regurlarmente matriculado" );\r\n\t\t}\r\n\t\t//-----------------------------------------------------------------------------------------\r\n\t\treturn this.processamento( matriculaInstitucional, null );\t\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprotected StringBuilder gerarStringArquivoDosAlunosDesligados( Ocorrencia ocorrencia ){\r\n\t\treturn this.processamento( ocorrencia.getMatricula(), ocorrencia );\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\t\r\n\tprivate String formataCEP(String cep) {\r\n\t\tif (cep == null) {\r\n\t\t\treturn "";\r\n\t\t}\r\n\t\tString cepNumeros = cep.replaceAll("\\\\D", "");\r\n\t\tcepNumeros = StringUtils.rightPad(cepNumeros, 8, "0");\r\n\t\treturn cepNumeros.substring(0, 5) + "-" + cepNumeros.substring(5, 8);\r\n\t\t\r\n\t}\r\n \r\n}	Método <code>buildRG</code> extraído	GenericTranspalBean_4.java	39,97-104	5
7	public class GenericTranspalBean {\r\n\t\r\n\t@In("#{matriculaInstitucionalService}")\r\n\tprotected MatriculaInstitucionalService matriculaInstitucionalService;\r\n\t\r\n\t@In("#{enderecoService}")\r\n\tprotected EnderecoService enderecoService;\r\n\r\n\t//_____________________________________________________________________________________________\r\n\t/**     Método que retorna true caso o aluno esteja regularmente matriculado e false em caso\r\n\t *  contrário.*/\r\n\tprotected boolean alunoEstaMatriculado( StatusMatricula status ){\r\n\t\tif( \tstatus != StatusMatricula.MATRICULADO && \r\n\t\t\t\tstatus != StatusMatricula.MATRICULADO_TCC && \r\n\t\t\t\tstatus != StatusMatricula.CURSO_INTEGRALIZADO && \r\n\t\t\t\tstatus != StatusMatricula.SEM_MATRICULA_DISCIPLINA ){\r\n\t\t\treturn false;\r\n\t\t}\r\n\t\treturn true;\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprivate StringBuilder processamento( MatriculaInstitucional matriculaInstitucional, Ocorrencia ocorrencia ){\r\n\t\tAluno aluno = matriculaInstitucional.getAluno();\r\n\t\tPessoa pessoa = matriculaInstitucional.getAluno().getPessoa();\r\n\t\tEndereco endereco = this.enderecoService.getEnderecoResidencial(aluno);\r\n\t\t\r\n\t\tStringBuilder dados = new StringBuilder();\r\n\r\n\t\t// Matricula OK\r\n\t\tdados.append(StringUtils.rightPad(matriculaInstitucional.getMatricula().toUpperCase(), 15, " "));\r\n\t\t// Nome OK\r\n\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(aluno.getNome().toUpperCase()).replaceAll("[^a-z^A-Z^0-9 ]", ""), 60, " "));\r\n\t\t// Sexo OK\r\n\t\tdados.append(StringUtils.rightPad(aluno.getSexo().toUpperCase(), 1, " "));\r\n\t\tbuildDataNascimento(aluno, dados);\r\n\t\t// CPF OK\r\n\t\tbuildCPF(pessoa, dados);\r\n\t\t// RG OK\r\n\t\tbuildRG(pessoa, dados);\r\n\t\tbuildEndereco(endereco, dados);\r\n\t\t// Mãe OK\r\n\t\tString nomeMae = aluno.getNomeMae();\r\n\t\tif( nomeMae != null ){\r\n\t\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(aluno.getNomeMae()).replaceAll("[^a-z^A-Z^0-9 ]", "").toUpperCase(), 60, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.rightPad( "" , 60, " "));\r\n\t\t}\r\n\t\t// CPF Mãe OK\r\n\t\tdados.append(StringUtils.rightPad(" ", 11));\r\n\t\t// Pai OK \r\n\t\tdados.append(StringUtils.rightPad(aluno.getNomePai() != null ? AcentosUtils.remover(aluno.getNomePai()).replaceAll("[^a-z^A-Z^0-9 ]", "").toUpperCase() : "", 60, " "));\r\n\t\t// CPF Pai OK\r\n\t\tdados.append(StringUtils.rightPad(" ", 11));\r\n\t\t// Série (Período) OK\r\n\t\tdados.append(StringUtils.leftPad(matriculaInstitucional.getPeriodoAtual().toString(), 2, " "));\r\n\t\t// Grau OK\r\n\t\tdados.append(StringUtils.rightPad("3", 1, " "));\r\n\t\t// Turno \r\n\t\tdados.append(StringUtils.rightPad(matriculaInstitucional.getVersaoCurso().getCurso().getTurno().getSigla(), 1, " "));\r\n\t\t// Código OK\r\n\t\tString codigoCursoTranspal = matriculaInstitucional.getVersaoCurso().getCurso().getCursoTranspal();\r\n\t\tif( codigoCursoTranspal == null ){\r\n\t\t\tthrow new IllegalArgumentException( "O curso correspondente à matrícula '"\r\n\t\t\t\t\t+matriculaInstitucional.getMatricula().toUpperCase()+"' não possui um código da Transpal." );\r\n\t\t}\r\n\t\tdados.append(StringUtils.rightPad( codigoCursoTranspal , 3, " "));\r\n\t\t// Status OK\r\n\t\tString status = this.retornarStatusAluno( ocorrencia );\r\n\t\tdados.append( StringUtils.rightPad( status, 1, " ") );\r\n\t\t// E-mail OK\r\n\t\tdados.append(StringUtils.rightPad(aluno.getEmail() != null ? aluno.getEmail().toUpperCase() : "", 40, " "));\r\n\t\t\t\r\n\t\treturn dados;\r\n\t}\r\n\tprivate void buildEndereco(Endereco endereco, StringBuilder dados) {\r\n\t\tif(endereco != null){\r\n\t\t\t// Telefone OK\r\n\t\t\tdados.append(StringUtils.leftPad(endereco.getFoneCelular() != null ? endereco.getFoneCelular().replaceAll("\\\\D", "") : "", 14, " "));\r\n\t\t\t// Endereço OK\r\n\t\t\tdados.append(StringUtils.rightPad(endereco.getRua() != null ? AcentosUtils.remover(endereco.getRua().replaceAll("[^a-z^A-Z^0-9 ]", "")).toUpperCase() : "", 60, " "));\r\n\t\t\t// Complemento OK\r\n\t\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(endereco.getComplemento() != null ? AcentosUtils.remover(endereco.getComplemento()).replaceAll("[^a-z^A-Z^0-9 ]", "") : "").toUpperCase(), 60, " "));\r\n\t\t\t// Bairro OK\r\n\t\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(endereco.getBairro() != null ? AcentosUtils.remover(endereco.getBairro()).replaceAll("[^a-z^A-Z^0-9 ]", "").toUpperCase() : ""), 30, " "));\r\n\t\t\t// CEP OK\r\n\t\t\tdados.append(StringUtils.rightPad(formataCEP(endereco.getCep()), 9, "0"));\r\n\t\t}else{\r\n\t\t\t// Telefone OK\r\n\t\t\tdados.append(StringUtils.leftPad( "", 14, " "));\r\n\t\t\t// Endereço OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 60, " "));\r\n\t\t\t// Complemento OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 60, " "));\r\n\t\t\t// Bairro OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 30, " "));\r\n\t\t\t// CEP OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 9, "0"));\t\t\t\r\n\t\t}\r\n\t}\r\n\tprivate void buildRG(Pessoa pessoa, StringBuilder dados) {\r\n\t\tDocumentoPessoa rg = pessoa.getRG();\r\n\t\tif( rg != null ){\r\n\t\t\tdados.append(StringUtils.leftPad( rg.getNumeroDocumento().replaceAll("\\\\D", ""), 14, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.leftPad( "", 14, " "));\r\n\t\t}\r\n\t}\r\n\tprivate void buildCPF(Pessoa pessoa, StringBuilder dados) {\r\n\t\tDocumentoPessoa cpf = pessoa.getCPF();\r\n\t\tif( cpf != null ){\r\n\t\t\tdados.append(StringUtils.rightPad( cpf.getNumeroDocumento().replaceAll("\\\\D", ""), 14, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.rightPad( "", 14, " "));\r\n\t\t}\r\n\t}\r\n\tprivate void buildDataNascimento(Aluno aluno, StringBuilder dados) {\r\n\t\t// Nascimento OK\r\n\t\tDate dataNascimento = aluno.getDataNascimento();\r\n\t\tif( dataNascimento != null ){\r\n\t\t\tdados.append(StringUtils.rightPad(new SimpleDateFormat("dd/MM/yyyy").format( dataNascimento ), 10, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.rightPad( "" , 10, " "));\r\n\t\t}\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprivate String retornarStatusAluno( Ocorrencia ocorrencia ){\r\n\t\tif( ocorrencia == null){\r\n\t\t\treturn "A";\r\n\t\t}\r\n\t\tlong idOcorrencia = ocorrencia.getTipoOcorrencia().getId();\r\n\t\tif( idOcorrencia == TipoOcorrencia.FALECIMENTO\r\n\t\t\t\t|| idOcorrencia == TipoOcorrencia.DESISTENCIA\r\n\t\t\t\t|| idOcorrencia == TipoOcorrencia.DESLIGAMENTO ){\r\n\t\t\treturn "D";\r\n\t\t}\r\n\t\tif( idOcorrencia == TipoOcorrencia.FORMATURA ){\r\n\t\t\treturn "C";\r\n\t\t}\r\n\t\tif( idOcorrencia == TipoOcorrencia.SAIDA_TRANSFERENCIA_EXTERNA ){\r\n\t\t\treturn "T";\r\n\t\t}\r\n\t\treturn "I";\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprotected StringBuilder formatarDados(MatriculaInstitucional matriculaInstitucional) throws IOException, Exception {\r\n\t\tStatusMatricula status = this.matriculaInstitucionalService.getStatusMatricula( matriculaInstitucional );\r\n\t\tif( !this.alunoEstaMatriculado( status ) ){\r\n\t\t\tString matricula = matriculaInstitucional.getMatricula();\r\n\t\t\tthrow new IllegalArgumentException( "O aluno de matrícula '"+matricula+"' aparentemente" +\r\n\t\t\t\t\t" não está regurlarmente matriculado" );\r\n\t\t}\r\n\t\t//-----------------------------------------------------------------------------------------\r\n\t\treturn this.processamento( matriculaInstitucional, null );\t\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprotected StringBuilder gerarStringArquivoDosAlunosDesligados( Ocorrencia ocorrencia ){\r\n\t\treturn this.processamento( ocorrencia.getMatricula(), ocorrencia );\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\t\r\n\tprivate String formataCEP(String cep) {\r\n\t\tif (cep == null) {\r\n\t\t\treturn "";\r\n\t\t}\r\n\t\tString cepNumeros = cep.replaceAll("\\\\D", "");\r\n\t\tcepNumeros = StringUtils.rightPad(cepNumeros, 8, "0");\r\n\t\treturn cepNumeros.substring(0, 5) + "-" + cepNumeros.substring(5, 8);\r\n\t\t\r\n\t}\r\n \r\n}	Método <code>buildEndereco</code> extraído	GenericTranspalBean_5.java	40,75-99	6
8	public class GenericTranspalBean {\r\n\t\r\n\t@In("#{matriculaInstitucionalService}")\r\n\tprotected MatriculaInstitucionalService matriculaInstitucionalService;\r\n\t\r\n\t@In("#{enderecoService}")\r\n\tprotected EnderecoService enderecoService;\r\n\r\n\t//_____________________________________________________________________________________________\r\n\t/**     Método que retorna true caso o aluno esteja regularmente matriculado e false em caso\r\n\t *  contrário.*/\r\n\tprotected boolean alunoEstaMatriculado( StatusMatricula status ){\r\n\t\tif( \tstatus != StatusMatricula.MATRICULADO && \r\n\t\t\t\tstatus != StatusMatricula.MATRICULADO_TCC && \r\n\t\t\t\tstatus != StatusMatricula.CURSO_INTEGRALIZADO && \r\n\t\t\t\tstatus != StatusMatricula.SEM_MATRICULA_DISCIPLINA ){\r\n\t\t\treturn false;\r\n\t\t}\r\n\t\treturn true;\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprivate StringBuilder processamento( MatriculaInstitucional matriculaInstitucional, Ocorrencia ocorrencia ){\r\n\t\tAluno aluno = matriculaInstitucional.getAluno();\r\n\t\tPessoa pessoa = matriculaInstitucional.getAluno().getPessoa();\r\n\t\tEndereco endereco = this.enderecoService.getEnderecoResidencial(aluno);\r\n\t\t\r\n\t\tStringBuilder dados = new StringBuilder();\r\n\r\n\t\t// Matricula OK\r\n\t\tdados.append(StringUtils.rightPad(matriculaInstitucional.getMatricula().toUpperCase(), 15, " "));\r\n\t\t// Nome OK\r\n\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(aluno.getNome().toUpperCase()).replaceAll("[^a-z^A-Z^0-9 ]", ""), 60, " "));\r\n\t\t// Sexo OK\r\n\t\tdados.append(StringUtils.rightPad(aluno.getSexo().toUpperCase(), 1, " "));\r\n\t\tbuildDataNascimento(aluno, dados);\r\n\t\t// CPF OK\r\n\t\tbuildCPF(pessoa, dados);\r\n\t\t// RG OK\r\n\t\tbuildRG(pessoa, dados);\r\n\t\tbuildEndereco(endereco, dados);\r\n\t\t// Mãe OK\r\n\t\tbuildPais(aluno, dados);\r\n\t\t// Série (Período) OK\r\n\t\tdados.append(StringUtils.leftPad(matriculaInstitucional.getPeriodoAtual().toString(), 2, " "));\r\n\t\t// Grau OK\r\n\t\tdados.append(StringUtils.rightPad("3", 1, " "));\r\n\t\t// Turno \r\n\t\tdados.append(StringUtils.rightPad(matriculaInstitucional.getVersaoCurso().getCurso().getTurno().getSigla(), 1, " "));\r\n\t\t// Código OK\r\n\t\tString codigoCursoTranspal = matriculaInstitucional.getVersaoCurso().getCurso().getCursoTranspal();\r\n\t\tif( codigoCursoTranspal == null ){\r\n\t\t\tthrow new IllegalArgumentException( "O curso correspondente à matrícula '"\r\n\t\t\t\t\t+matriculaInstitucional.getMatricula().toUpperCase()+"' não possui um código da Transpal." );\r\n\t\t}\r\n\t\tdados.append(StringUtils.rightPad( codigoCursoTranspal , 3, " "));\r\n\t\t// Status OK\r\n\t\tString status = this.retornarStatusAluno( ocorrencia );\r\n\t\tdados.append( StringUtils.rightPad( status, 1, " ") );\r\n\t\t// E-mail OK\r\n\t\tdados.append(StringUtils.rightPad(aluno.getEmail() != null ? aluno.getEmail().toUpperCase() : "", 40, " "));\r\n\t\t\t\r\n\t\treturn dados;\r\n\t}\r\n\tprivate void buildPais(Aluno aluno, StringBuilder dados) {\r\n\t\tString nomeMae = aluno.getNomeMae();\r\n\t\tif( nomeMae != null ){\r\n\t\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(aluno.getNomeMae()).replaceAll("[^a-z^A-Z^0-9 ]", "").toUpperCase(), 60, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.rightPad( "" , 60, " "));\r\n\t\t}\r\n\t\t// CPF Mãe OK\r\n\t\tdados.append(StringUtils.rightPad(" ", 11));\r\n\t\t// Pai OK \r\n\t\tdados.append(StringUtils.rightPad(aluno.getNomePai() != null ? AcentosUtils.remover(aluno.getNomePai()).replaceAll("[^a-z^A-Z^0-9 ]", "").toUpperCase() : "", 60, " "));\r\n\t\t// CPF Pai OK\r\n\t\tdados.append(StringUtils.rightPad(" ", 11));\r\n\t}\r\n\tprivate void buildEndereco(Endereco endereco, StringBuilder dados) {\r\n\t\tif(endereco != null){\r\n\t\t\t// Telefone OK\r\n\t\t\tdados.append(StringUtils.leftPad(endereco.getFoneCelular() != null ? endereco.getFoneCelular().replaceAll("\\\\D", "") : "", 14, " "));\r\n\t\t\t// Endereço OK\r\n\t\t\tdados.append(StringUtils.rightPad(endereco.getRua() != null ? AcentosUtils.remover(endereco.getRua().replaceAll("[^a-z^A-Z^0-9 ]", "")).toUpperCase() : "", 60, " "));\r\n\t\t\t// Complemento OK\r\n\t\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(endereco.getComplemento() != null ? AcentosUtils.remover(endereco.getComplemento()).replaceAll("[^a-z^A-Z^0-9 ]", "") : "").toUpperCase(), 60, " "));\r\n\t\t\t// Bairro OK\r\n\t\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(endereco.getBairro() != null ? AcentosUtils.remover(endereco.getBairro()).replaceAll("[^a-z^A-Z^0-9 ]", "").toUpperCase() : ""), 30, " "));\r\n\t\t\t// CEP OK\r\n\t\t\tdados.append(StringUtils.rightPad(formataCEP(endereco.getCep()), 9, "0"));\r\n\t\t}else{\r\n\t\t\t// Telefone OK\r\n\t\t\tdados.append(StringUtils.leftPad( "", 14, " "));\r\n\t\t\t// Endereço OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 60, " "));\r\n\t\t\t// Complemento OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 60, " "));\r\n\t\t\t// Bairro OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 30, " "));\r\n\t\t\t// CEP OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 9, "0"));\t\t\t\r\n\t\t}\r\n\t}\r\n\tprivate void buildRG(Pessoa pessoa, StringBuilder dados) {\r\n\t\tDocumentoPessoa rg = pessoa.getRG();\r\n\t\tif( rg != null ){\r\n\t\t\tdados.append(StringUtils.leftPad( rg.getNumeroDocumento().replaceAll("\\\\D", ""), 14, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.leftPad( "", 14, " "));\r\n\t\t}\r\n\t}\r\n\tprivate void buildCPF(Pessoa pessoa, StringBuilder dados) {\r\n\t\tDocumentoPessoa cpf = pessoa.getCPF();\r\n\t\tif( cpf != null ){\r\n\t\t\tdados.append(StringUtils.rightPad( cpf.getNumeroDocumento().replaceAll("\\\\D", ""), 14, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.rightPad( "", 14, " "));\r\n\t\t}\r\n\t}\r\n\tprivate void buildDataNascimento(Aluno aluno, StringBuilder dados) {\r\n\t\t// Nascimento OK\r\n\t\tDate dataNascimento = aluno.getDataNascimento();\r\n\t\tif( dataNascimento != null ){\r\n\t\t\tdados.append(StringUtils.rightPad(new SimpleDateFormat("dd/MM/yyyy").format( dataNascimento ), 10, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.rightPad( "" , 10, " "));\r\n\t\t}\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprivate String retornarStatusAluno( Ocorrencia ocorrencia ){\r\n\t\tif( ocorrencia == null){\r\n\t\t\treturn "A";\r\n\t\t}\r\n\t\tlong idOcorrencia = ocorrencia.getTipoOcorrencia().getId();\r\n\t\tif( idOcorrencia == TipoOcorrencia.FALECIMENTO\r\n\t\t\t\t|| idOcorrencia == TipoOcorrencia.DESISTENCIA\r\n\t\t\t\t|| idOcorrencia == TipoOcorrencia.DESLIGAMENTO ){\r\n\t\t\treturn "D";\r\n\t\t}\r\n\t\tif( idOcorrencia == TipoOcorrencia.FORMATURA ){\r\n\t\t\treturn "C";\r\n\t\t}\r\n\t\tif( idOcorrencia == TipoOcorrencia.SAIDA_TRANSFERENCIA_EXTERNA ){\r\n\t\t\treturn "T";\r\n\t\t}\r\n\t\treturn "I";\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprotected StringBuilder formatarDados(MatriculaInstitucional matriculaInstitucional) throws IOException, Exception {\r\n\t\tStatusMatricula status = this.matriculaInstitucionalService.getStatusMatricula( matriculaInstitucional );\r\n\t\tif( !this.alunoEstaMatriculado( status ) ){\r\n\t\t\tString matricula = matriculaInstitucional.getMatricula();\r\n\t\t\tthrow new IllegalArgumentException( "O aluno de matrícula '"+matricula+"' aparentemente" +\r\n\t\t\t\t\t" não está regurlarmente matriculado" );\r\n\t\t}\r\n\t\t//-----------------------------------------------------------------------------------------\r\n\t\treturn this.processamento( matriculaInstitucional, null );\t\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprotected StringBuilder gerarStringArquivoDosAlunosDesligados( Ocorrencia ocorrencia ){\r\n\t\treturn this.processamento( ocorrencia.getMatricula(), ocorrencia );\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\t\r\n\tprivate String formataCEP(String cep) {\r\n\t\tif (cep == null) {\r\n\t\t\treturn "";\r\n\t\t}\r\n\t\tString cepNumeros = cep.replaceAll("\\\\D", "");\r\n\t\tcepNumeros = StringUtils.rightPad(cepNumeros, 8, "0");\r\n\t\treturn cepNumeros.substring(0, 5) + "-" + cepNumeros.substring(5, 8);\r\n\t\t\r\n\t}\r\n \r\n}	Método <code>buildPais</code> extraído	GenericTranspalBean_6.java	42,64-77	7
9	public class GenericTranspalBean {\r\n\t\r\n\t@In("#{matriculaInstitucionalService}")\r\n\tprotected MatriculaInstitucionalService matriculaInstitucionalService;\r\n\t\r\n\t@In("#{enderecoService}")\r\n\tprotected EnderecoService enderecoService;\r\n\r\n\t//_____________________________________________________________________________________________\r\n\t/**     Método que retorna true caso o aluno esteja regularmente matriculado e false em caso\r\n\t *  contrário.*/\r\n\tprotected boolean alunoEstaMatriculado( StatusMatricula status ){\r\n\t\tif( \tstatus != StatusMatricula.MATRICULADO && \r\n\t\t\t\tstatus != StatusMatricula.MATRICULADO_TCC && \r\n\t\t\t\tstatus != StatusMatricula.CURSO_INTEGRALIZADO && \r\n\t\t\t\tstatus != StatusMatricula.SEM_MATRICULA_DISCIPLINA ){\r\n\t\t\treturn false;\r\n\t\t}\r\n\t\treturn true;\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprivate StringBuilder processamento( MatriculaInstitucional matriculaInstitucional, Ocorrencia ocorrencia ){\r\n\t\tAluno aluno = matriculaInstitucional.getAluno();\r\n\t\tPessoa pessoa = matriculaInstitucional.getAluno().getPessoa();\r\n\t\tEndereco endereco = this.enderecoService.getEnderecoResidencial(aluno);\r\n\t\t\r\n\t\tStringBuilder dados = new StringBuilder();\r\n\r\n\t\t// Matricula OK\r\n\t\tdados.append(StringUtils.rightPad(matriculaInstitucional.getMatricula().toUpperCase(), 15, " "));\r\n\t\t// Nome OK\r\n\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(aluno.getNome().toUpperCase()).replaceAll("[^a-z^A-Z^0-9 ]", ""), 60, " "));\r\n\t\t// Sexo OK\r\n\t\tdados.append(StringUtils.rightPad(aluno.getSexo().toUpperCase(), 1, " "));\r\n\t\tbuildDataNascimento(aluno, dados);\r\n\t\t// CPF OK\r\n\t\tbuildCPF(pessoa, dados);\r\n\t\t// RG OK\r\n\t\tbuildRG(pessoa, dados);\r\n\t\tbuildEndereco(endereco, dados);\r\n\t\t// Mãe OK\r\n\t\tbuildPais(aluno, dados);\r\n\t\tbuildDadosCurso(matriculaInstitucional, ocorrencia, dados);\r\n\t\t// E-mail OK\r\n\t\tdados.append(StringUtils.rightPad(aluno.getEmail() != null ? aluno.getEmail().toUpperCase() : "", 40, " "));\r\n\t\t\t\r\n\t\treturn dados;\r\n\t}\r\n\tprivate void buildDadosCurso(MatriculaInstitucional matriculaInstitucional, Ocorrencia ocorrencia,\r\n\t\t\tStringBuilder dados) {\r\n\t\t// Série (Período) OK\r\n\t\tdados.append(StringUtils.leftPad(matriculaInstitucional.getPeriodoAtual().toString(), 2, " "));\r\n\t\t// Grau OK\r\n\t\tdados.append(StringUtils.rightPad("3", 1, " "));\r\n\t\t// Turno \r\n\t\tdados.append(StringUtils.rightPad(matriculaInstitucional.getVersaoCurso().getCurso().getTurno().getSigla(), 1, " "));\r\n\t\t// Código OK\r\n\t\tString codigoCursoTranspal = matriculaInstitucional.getVersaoCurso().getCurso().getCursoTranspal();\r\n\t\tif( codigoCursoTranspal == null ){\r\n\t\t\tthrow new IllegalArgumentException( "O curso correspondente à matrícula '"\r\n\t\t\t\t\t+matriculaInstitucional.getMatricula().toUpperCase()+"' não possui um código da Transpal." );\r\n\t\t}\r\n\t\tdados.append(StringUtils.rightPad( codigoCursoTranspal , 3, " "));\r\n\t\t// Status OK\r\n\t\tString status = this.retornarStatusAluno( ocorrencia );\r\n\t\tdados.append( StringUtils.rightPad( status, 1, " ") );\r\n\t}\r\n\tprivate void buildPais(Aluno aluno, StringBuilder dados) {\r\n\t\tString nomeMae = aluno.getNomeMae();\r\n\t\tif( nomeMae != null ){\r\n\t\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(aluno.getNomeMae()).replaceAll("[^a-z^A-Z^0-9 ]", "").toUpperCase(), 60, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.rightPad( "" , 60, " "));\r\n\t\t}\r\n\t\t// CPF Mãe OK\r\n\t\tdados.append(StringUtils.rightPad(" ", 11));\r\n\t\t// Pai OK \r\n\t\tdados.append(StringUtils.rightPad(aluno.getNomePai() != null ? AcentosUtils.remover(aluno.getNomePai()).replaceAll("[^a-z^A-Z^0-9 ]", "").toUpperCase() : "", 60, " "));\r\n\t\t// CPF Pai OK\r\n\t\tdados.append(StringUtils.rightPad(" ", 11));\r\n\t}\r\n\tprivate void buildEndereco(Endereco endereco, StringBuilder dados) {\r\n\t\tif(endereco != null){\r\n\t\t\t// Telefone OK\r\n\t\t\tdados.append(StringUtils.leftPad(endereco.getFoneCelular() != null ? endereco.getFoneCelular().replaceAll("\\\\D", "") : "", 14, " "));\r\n\t\t\t// Endereço OK\r\n\t\t\tdados.append(StringUtils.rightPad(endereco.getRua() != null ? AcentosUtils.remover(endereco.getRua().replaceAll("[^a-z^A-Z^0-9 ]", "")).toUpperCase() : "", 60, " "));\r\n\t\t\t// Complemento OK\r\n\t\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(endereco.getComplemento() != null ? AcentosUtils.remover(endereco.getComplemento()).replaceAll("[^a-z^A-Z^0-9 ]", "") : "").toUpperCase(), 60, " "));\r\n\t\t\t// Bairro OK\r\n\t\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(endereco.getBairro() != null ? AcentosUtils.remover(endereco.getBairro()).replaceAll("[^a-z^A-Z^0-9 ]", "").toUpperCase() : ""), 30, " "));\r\n\t\t\t// CEP OK\r\n\t\t\tdados.append(StringUtils.rightPad(formataCEP(endereco.getCep()), 9, "0"));\r\n\t\t}else{\r\n\t\t\t// Telefone OK\r\n\t\t\tdados.append(StringUtils.leftPad( "", 14, " "));\r\n\t\t\t// Endereço OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 60, " "));\r\n\t\t\t// Complemento OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 60, " "));\r\n\t\t\t// Bairro OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 30, " "));\r\n\t\t\t// CEP OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 9, "0"));\t\t\t\r\n\t\t}\r\n\t}\r\n\tprivate void buildRG(Pessoa pessoa, StringBuilder dados) {\r\n\t\tDocumentoPessoa rg = pessoa.getRG();\r\n\t\tif( rg != null ){\r\n\t\t\tdados.append(StringUtils.leftPad( rg.getNumeroDocumento().replaceAll("\\\\D", ""), 14, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.leftPad( "", 14, " "));\r\n\t\t}\r\n\t}\r\n\tprivate void buildCPF(Pessoa pessoa, StringBuilder dados) {\r\n\t\tDocumentoPessoa cpf = pessoa.getCPF();\r\n\t\tif( cpf != null ){\r\n\t\t\tdados.append(StringUtils.rightPad( cpf.getNumeroDocumento().replaceAll("\\\\D", ""), 14, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.rightPad( "", 14, " "));\r\n\t\t}\r\n\t}\r\n\tprivate void buildDataNascimento(Aluno aluno, StringBuilder dados) {\r\n\t\t// Nascimento OK\r\n\t\tDate dataNascimento = aluno.getDataNascimento();\r\n\t\tif( dataNascimento != null ){\r\n\t\t\tdados.append(StringUtils.rightPad(new SimpleDateFormat("dd/MM/yyyy").format( dataNascimento ), 10, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.rightPad( "" , 10, " "));\r\n\t\t}\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprivate String retornarStatusAluno( Ocorrencia ocorrencia ){\r\n\t\tif( ocorrencia == null){\r\n\t\t\treturn "A";\r\n\t\t}\r\n\t\tlong idOcorrencia = ocorrencia.getTipoOcorrencia().getId();\r\n\t\tif( idOcorrencia == TipoOcorrencia.FALECIMENTO\r\n\t\t\t\t|| idOcorrencia == TipoOcorrencia.DESISTENCIA\r\n\t\t\t\t|| idOcorrencia == TipoOcorrencia.DESLIGAMENTO ){\r\n\t\t\treturn "D";\r\n\t\t}\r\n\t\tif( idOcorrencia == TipoOcorrencia.FORMATURA ){\r\n\t\t\treturn "C";\r\n\t\t}\r\n\t\tif( idOcorrencia == TipoOcorrencia.SAIDA_TRANSFERENCIA_EXTERNA ){\r\n\t\t\treturn "T";\r\n\t\t}\r\n\t\treturn "I";\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprotected StringBuilder formatarDados(MatriculaInstitucional matriculaInstitucional) throws IOException, Exception {\r\n\t\tStatusMatricula status = this.matriculaInstitucionalService.getStatusMatricula( matriculaInstitucional );\r\n\t\tif( !this.alunoEstaMatriculado( status ) ){\r\n\t\t\tString matricula = matriculaInstitucional.getMatricula();\r\n\t\t\tthrow new IllegalArgumentException( "O aluno de matrícula '"+matricula+"' aparentemente" +\r\n\t\t\t\t\t" não está regurlarmente matriculado" );\r\n\t\t}\r\n\t\t//-----------------------------------------------------------------------------------------\r\n\t\treturn this.processamento( matriculaInstitucional, null );\t\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprotected StringBuilder gerarStringArquivoDosAlunosDesligados( Ocorrencia ocorrencia ){\r\n\t\treturn this.processamento( ocorrencia.getMatricula(), ocorrencia );\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\t\r\n\tprivate String formataCEP(String cep) {\r\n\t\tif (cep == null) {\r\n\t\t\treturn "";\r\n\t\t}\r\n\t\tString cepNumeros = cep.replaceAll("\\\\D", "");\r\n\t\tcepNumeros = StringUtils.rightPad(cepNumeros, 8, "0");\r\n\t\treturn cepNumeros.substring(0, 5) + "-" + cepNumeros.substring(5, 8);\r\n\t\t\r\n\t}\r\n \r\n}	Método <code>buildDadosCurso</code> extraído	GenericTranspalBean_7.java	43,49-67	8
29	@Service\r\npublic class DiarioClasseService {\r\n\r\n\t@Autowired private DiarioClasseDao diarioClasseDao;\r\n\t@Autowired private TipoAulaService tipoAulaService;\r\n\t@Autowired private ParametroAcademicoCursoService parametroAcademicoCursoService;\r\n\t\t\r\n\t\r\n\tpublic void gerarDiariosClasse(Turma turma){\r\n\t\t\r\n\t\tif (turma.getDisciplinaCurricular().getTipo().isEstagioCurricular()) {\r\n\t\t\treturn;\r\n\t\t}\r\n\t\t\r\n\t\tList<DiarioClasse> listaDiarios = new ArrayList<DiarioClasse>();\r\n\t\tList<HorarioAula> horariosAulas = turma.getHorariosAula();\r\n\t\t\r\n\t\tCalendar calendarioInicio = Calendar.getInstance();\r\n\t\tCalendar calendarioFim = Calendar.getInstance();\r\n\t\t\r\n\t\tParametroAcademicoCurso pCurso = this.parametroAcademicoCursoService.getParametrosCursoAtuais(turma.getCurso());\r\n\t\t\r\n\t\tDate dataInicioPeriodo;\r\n\t\tDate dataFimPeriodo;\r\n\t\tif (turma.getTipoPeriodo().isPeriodoFerias()) {\r\n\t\t\tdataInicioPeriodo = pCurso.getDataInicioPeriodoFerias();\r\n\t\t\tdataFimPeriodo = pCurso.getDataFimPeriodoFerias();\r\n\t\t} else {\r\n\t\t\tdataInicioPeriodo = pCurso.getDataInicioPeriodo();\r\n\t\t\tdataFimPeriodo = pCurso.getDataFimPeriodo();\r\n\t\t}\r\n\t\t\r\n\t\tcalendarioInicio.setTime(dataInicioPeriodo);\r\n\t\tcalendarioInicio.add(Calendar.DATE, -1); //tentativa de correção de bug na criação do primeiro dia letivo.\r\n\t\tcalendarioFim.setTime(dataFimPeriodo);\r\n\t\t\r\n\t\tlong primeiroDiaLetivoEmMilissegundos = calendarioInicio.getTimeInMillis();\r\n\t\tlong ultimoDiaLetivoEmMilissegundos = calendarioFim.getTimeInMillis();\r\n\t\tint diaSemanaInicioPeriodo = calendarioInicio.get(Calendar.DAY_OF_WEEK);\r\n\t\t\t\t\r\n\t\tfor(HorarioAula horario: horariosAulas){\r\n\t\t\tCalendar calendarioTemp = Calendar.getInstance();\r\n\t\t\t\r\n\t\t\t// Diminui um pois a contagem do dia na semana na Calendar se inicia em Zero\r\n\t\t\tint diaSemanaHorarioAula = horario.getDiaSemana().getOpcaoPk().getCodigoItemTabela().intValue();\r\n\t\t\tint qtdDiasParaAdicionar = 0;\r\n\t\t\tint numeroMilissegundos = 0;\r\n\t\t\t\r\n\t\t\t// Se as aulas são dia de quarta-feira e o período começa na segunda-feira\r\n\t\t\tif (diaSemanaHorarioAula > diaSemanaInicioPeriodo){\r\n\t\t\t\tqtdDiasParaAdicionar = diaSemanaHorarioAula - diaSemanaInicioPeriodo;\r\n\t\t\t} else {\r\n\t\t\t\t// Vê qtos dias faltam para acabar a semana (ultimo dia = 6) e soma o dia da próxima semana\r\n\t\t\t\tqtdDiasParaAdicionar = 7 - diaSemanaInicioPeriodo + diaSemanaHorarioAula;\r\n\t\t\t}\r\n\t\t\t\r\n\t\t\tnumeroMilissegundos = qtdDiasParaAdicionar*(24 * 60 * 60)*1000;\r\n\t\t\tint numeroMilissegundosEmUmaSemana = 7*24*60*60*1000;\r\n\t\t\t\r\n\t\t\t// Encontra o primeiro diario\r\n\t\t\tcalendarioTemp.setTimeInMillis(primeiroDiaLetivoEmMilissegundos + numeroMilissegundos);\r\n\t\t\t\r\n\t\t\twhile (calendarioTemp.getTimeInMillis() < ultimoDiaLetivoEmMilissegundos){\r\n\t\t\t\tDiarioClasse diario = new DiarioClasse();\r\n\t\t\t\t\r\n\t\t\t\tdiario.setData(calendarioTemp.getTime());\r\n\t\t\t\tdiario.setHora(horario.getHoraInicio());\r\n\t\t\t\tdiario.setTurma(turma);\r\n\t\t\t\tif (horario.getTipoAula()!=null){\r\n\t\t\t\t\tdiario.setTipoAula(horario.getTipoAula());\r\n\t\t\t\t} else {\r\n\t\t\t\t\t// Por default, carrega aulas do tipo teórica\r\n\t\t\t\t\tTipoAula tipoAula = tipoAulaService.carregarPorItemTabela(TipoAula.TEORICA);\r\n\t\t\t\t\tdiario.setTipoAula(tipoAula);\r\n\t\t\t\t}\r\n\t\t\t\tdiario.setDataAlteracao(new Date());\r\n\t\t\t\tdiario.setHoraAlteracao(new Date());\r\n\t\t\t\tdiario.setConcorrencia(0L);\r\n\t\t\t\tdiario.setCodOperador(0L);\r\n\t\t\t\t\r\n\t\t\t\tlistaDiarios.add(diario);\r\n\t\t\t\t\r\n\t\t\t\tcalendarioTemp.setTimeInMillis(calendarioTemp.getTimeInMillis()+numeroMilissegundosEmUmaSemana);\r\n\t\t\t}\t\t\t\r\n\t\t}\r\n\t\t\r\n\t\tString listaIds = "";\r\n\t\t\r\n\t\tfor (DiarioClasse d:listaDiarios){\r\n\t\t\tDiarioClasse diario = this.diarioClasseDao.consultarDiarioPorDataHora(d);\r\n\t\t\t\r\n\t\t\tif (diario == null){\r\n\t\t\t\tdiario = this.diarioClasseDao.inserir(d);\r\n\t\t\t} \r\n\t\t\tlistaIds += diario.getId() + ",";\r\n\t\t}\r\n\t\t// Apaga a última vírgula adicionada\r\n\t\tlistaIds = listaIds.substring(0, listaIds.length()-1);\r\n\t\t\t\t\t\t\r\n\t\t// Remove os diarios que não pertencem aos horarios da turma devido a alterações ou exclusoes de horarios\r\n\t\t this.diarioClasseDao.excluirDiariosAlteradosOuRemovidosDaTurma(turma, listaIds);\r\n\t\t\t\t\r\n\t}\r\n}	Esse é o código original da classe <code>DiarioClasseService</code>. Ela é uma <em>Complex Class</em> porque o método  <code>gerarDiariosClasse</code> tem uma alta complexidade. A primeira recomendação gerada foi a extração do trecho em destaque para um novo método.	DiarioClasseService_1.java	87-98	29
31	@Service\r\npublic class DiarioClasseService {\r\n\r\n\t@Autowired private DiarioClasseDao diarioClasseDao;\r\n\t@Autowired private TipoAulaService tipoAulaService;\r\n\t@Autowired private ParametroAcademicoCursoService parametroAcademicoCursoService;\r\n\t\t\r\n\t\r\n\tpublic void gerarDiariosClasse(Turma turma){\r\n\t\t\r\n\t\tif (turma.getDisciplinaCurricular().getTipo().isEstagioCurricular()) {\r\n\t\t\treturn;\r\n\t\t}\r\n\t\t\r\n\t\tList<DiarioClasse> listaDiarios = new ArrayList<DiarioClasse>();\r\n\t\tList<HorarioAula> horariosAulas = turma.getHorariosAula();\r\n\t\t\r\n\t\tCalendar calendarioInicio = Calendar.getInstance();\r\n\t\tCalendar calendarioFim = Calendar.getInstance();\r\n\t\t\r\n\t\tParametroAcademicoCurso pCurso = this.parametroAcademicoCursoService.getParametrosCursoAtuais(turma.getCurso());\r\n\t\t\r\n\t\tDate dataInicioPeriodo;\r\n\t\tDate dataFimPeriodo;\r\n\t\tif (turma.getTipoPeriodo().isPeriodoFerias()) {\r\n\t\t\tdataInicioPeriodo = pCurso.getDataInicioPeriodoFerias();\r\n\t\t\tdataFimPeriodo = pCurso.getDataFimPeriodoFerias();\r\n\t\t} else {\r\n\t\t\tdataInicioPeriodo = pCurso.getDataInicioPeriodo();\r\n\t\t\tdataFimPeriodo = pCurso.getDataFimPeriodo();\r\n\t\t}\r\n\t\t\r\n\t\tcalendarioInicio.setTime(dataInicioPeriodo);\r\n\t\tcalendarioInicio.add(Calendar.DATE, -1); //tentativa de correção de bug na criação do primeiro dia letivo.\r\n\t\tcalendarioFim.setTime(dataFimPeriodo);\r\n\t\t\r\n\t\tlong primeiroDiaLetivoEmMilissegundos = calendarioInicio.getTimeInMillis();\r\n\t\tlong ultimoDiaLetivoEmMilissegundos = calendarioFim.getTimeInMillis();\r\n\t\tint diaSemanaInicioPeriodo = calendarioInicio.get(Calendar.DAY_OF_WEEK);\r\n\t\t\t\t\r\n\t\tfor(HorarioAula horario: horariosAulas){\r\n\t\t\tCalendar calendarioTemp = Calendar.getInstance();\r\n\t\t\t\r\n\t\t\t// Diminui um pois a contagem do dia na semana na Calendar se inicia em Zero\r\n\t\t\tint diaSemanaHorarioAula = horario.getDiaSemana().getOpcaoPk().getCodigoItemTabela().intValue();\r\n\t\t\tint qtdDiasParaAdicionar = 0;\r\n\t\t\tint numeroMilissegundos = 0;\r\n\t\t\t\r\n\t\t\tqtdDiasParaAdicionar = calculaQtdDias(diaSemanaInicioPeriodo, diaSemanaHorarioAula);\r\n\t\t\t\r\n\t\t\tnumeroMilissegundos = qtdDiasParaAdicionar*(24 * 60 * 60)*1000;\r\n\t\t\tint numeroMilissegundosEmUmaSemana = 7*24*60*60*1000;\r\n\t\t\t\r\n\t\t\t// Encontra o primeiro diario\r\n\t\t\tcalendarioTemp.setTimeInMillis(primeiroDiaLetivoEmMilissegundos + numeroMilissegundos);\r\n\t\t\t\r\n\t\t\twhile (calendarioTemp.getTimeInMillis() < ultimoDiaLetivoEmMilissegundos){\r\n\t\t\t\tDiarioClasse diario = new DiarioClasse();\r\n\t\t\t\t\r\n\t\t\t\tdiario.setData(calendarioTemp.getTime());\r\n\t\t\t\tdiario.setHora(horario.getHoraInicio());\r\n\t\t\t\tdiario.setTurma(turma);\r\n\t\t\t\tif (horario.getTipoAula()!=null){\r\n\t\t\t\t\tdiario.setTipoAula(horario.getTipoAula());\r\n\t\t\t\t} else {\r\n\t\t\t\t\t// Por default, carrega aulas do tipo teórica\r\n\t\t\t\t\tTipoAula tipoAula = tipoAulaService.carregarPorItemTabela(TipoAula.TEORICA);\r\n\t\t\t\t\tdiario.setTipoAula(tipoAula);\r\n\t\t\t\t}\r\n\t\t\t\tdiario.setDataAlteracao(new Date());\r\n\t\t\t\tdiario.setHoraAlteracao(new Date());\r\n\t\t\t\tdiario.setConcorrencia(0L);\r\n\t\t\t\tdiario.setCodOperador(0L);\r\n\t\t\t\t\r\n\t\t\t\tlistaDiarios.add(diario);\r\n\t\t\t\t\r\n\t\t\t\tcalendarioTemp.setTimeInMillis(calendarioTemp.getTimeInMillis()+numeroMilissegundosEmUmaSemana);\r\n\t\t\t}\t\t\t\r\n\t\t}\r\n\t\t\r\n\t\tString listaIds = gerarListaIds(listaDiarios);\r\n\t\t\t\t\t\t\r\n\t\t// Remove os diarios que não pertencem aos horarios da turma devido a alterações ou exclusoes de horarios\r\n\t\t this.diarioClasseDao.excluirDiariosAlteradosOuRemovidosDaTurma(turma, listaIds);\r\n\t\t\t\t\r\n\t}\r\n\r\n\r\n\tprivate int calculaQtdDias(int diaSemanaInicioPeriodo, int diaSemanaHorarioAula) {\r\n\t\tint qtdDiasParaAdicionar;\r\n\t\t// Se as aulas são dia de quarta-feira e o período começa na segunda-feira\r\n\t\tif (diaSemanaHorarioAula > diaSemanaInicioPeriodo){\r\n\t\t\tqtdDiasParaAdicionar = diaSemanaHorarioAula - diaSemanaInicioPeriodo;\r\n\t\t} else {\r\n\t\t\t// Vê qtos dias faltam para acabar a semana (ultimo dia = 6) e soma o dia da próxima semana\r\n\t\t\tqtdDiasParaAdicionar = 7 - diaSemanaInicioPeriodo + diaSemanaHorarioAula;\r\n\t\t}\r\n\t\treturn qtdDiasParaAdicionar;\r\n\t}\r\n\r\n\r\n\tprivate String gerarListaIds(List<DiarioClasse> listaDiarios) {\r\n\t\tString listaIds = "";\r\n\t\t\r\n\t\tfor (DiarioClasse d:listaDiarios){\r\n\t\t\tDiarioClasse diario = this.diarioClasseDao.consultarDiarioPorDataHora(d);\r\n\t\t\t\r\n\t\t\tif (diario == null){\r\n\t\t\t\tdiario = this.diarioClasseDao.inserir(d);\r\n\t\t\t} \r\n\t\t\tlistaIds += diario.getId() + ",";\r\n\t\t}\r\n\t\t// Apaga a última vírgula adicionada\r\n\t\tlistaIds = listaIds.substring(0, listaIds.length()-1);\r\n\t\treturn listaIds;\r\n\t}\r\n}	Um novo método foi extraído para diminuir a complexidade. O trecho de código responsável por computar o valor da variável <code>qtdDiasParaAdicionar</code> foi extraído para o método <code>calculaQtdDias</code>	DiarioClasseService_3.java	49,89-99	31
19	@Service\r\npublic class MatriculaAcademicaService extends AbstractService<MatriculaAcademica, Long> implements Serializable {\r\n\t\r\n\tpublic boolean isMatriculadoEmTurmaSolicitada(SolicitacaoMatriculaVagaRemanescente solicitacao){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<AtividadeCurricular> getAtividades(List<MatriculaAcademica> matriculas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<Turma> getTurmas(List<MatriculaAcademica> matriculas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarCumpridas(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tprivate Usuario getUsuario() {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarHistorico(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\t\r\n\tpublic List<RestricaoViolada> validarMatricula(Usuario usuario,MatriculaInstitucional matricula, List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<RestricaoViolada> validarMatriculaIsolada(Usuario usuario,MatriculaInstitucional matricula, List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<RestricaoViolada> validarMatriculaVagasRemanescentes(Usuario usuario,MatriculaInstitucional matricula, List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<Turma> getTurmasOfertadasAluno(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<AtividadeCurricular> getAtividadesMatriculaveis(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<AtividadeCurricular> getAtividadesObrigatoriasNaoCumpridas(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<AtividadeCurricular> getAtividadesNaoCumpridasMatriculaveis(Usuario usuarioSessao, MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<DisciplinaCurricular> listarDisciplinasMatriculaveis(Usuario usuario, MatriculaInstitucional matriculaInstitucional){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarReprovacoesPorMedia(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaAcademica matricular(MatriculaInstitucional matricula, Turma turma){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaAcademica matricularRemanescente(MatriculaInstitucional matricula, Turma turma){\r\n\t\t//...\r\n\t}\t\r\n\t\r\n\tpublic void salvarMatriculaFlexivel(MatriculaInstitucional matriculaInstitucional, MatriculaAcademica matricula, AtividadeCurricular atividade){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void matricularEmIsolada(MatriculaInstitucional matricula, Turma turma){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<RestricaoViolada> desmatricular(Usuario usuario, MatriculaAcademica matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tprivate boolean precisaDeValidacaoAntesDeDeletar( MatriculaAcademica matricula, List<Turma> turmasAposDeletar ){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void trancar(MatriculaAcademica matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void destrancar(MatriculaAcademica matricula){\r\n\t\t//...\r\n \t}\r\n\t\r\n\tpublic void desmatricularIncondicionalmente(MatriculaAcademica matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void removerEntradaHistoricoFlexivel(MatriculaAcademica matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<Turma> listarTurmas(MatriculaInstitucional matricula, List<DisciplinaCurricular> disciplinas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<Turma> listarTurmasPorPeriodo(MatriculaInstitucional matricula, List<DisciplinaCurricular> disciplinas, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<Turma> listarTurmasRemanescentes(MatriculaInstitucional matricula, List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<Turma> aplicarFiltroMatriculaIsolada(List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasPeriodoEspecifico(MatriculaInstitucional matricula, PeriodoLetivo periodo) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasIntervaloPeriodoEspecifico(MatriculaInstitucional matricula, PeriodoLetivo periodoInicial\r\n\t\t\t, PeriodoLetivo periodoFinal) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasAtuais(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasTrancadas(MatriculaInstitucional matricula) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void desmatricularMatriculasAtuais(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void desmatricularMatriculas(MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void removerMobilidadeAcademica(MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\t\t\r\n\tpublic MatriculaAcademica consultarPorId(Long id){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic boolean possuiReprovacao(AtividadeCurricular atividade, MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic Set<AtividadeCurricular> getAtividadesReprovadasMedia(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void registrarEvento(EventoHistorico evento, MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void registrarEvento(EventoHistorico evento, MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarEventosAtuais(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic boolean temMatriculaVinculoAtual(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic boolean temMatriculaVinculo(MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> getMatriculasAcademicasAtuais(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic boolean existeRegistroTrancamentoPeriodoAtual(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<DisciplinaCurricular> agruparTurmasPorDisciplinas(List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarHistoricoFlexivel(MatriculaInstitucional matricula) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> consultarPorTurma(Turma turma) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> consultarPorTurmaOrdenadoPorNomeAluno(Turma turma){\r\n\t\t//...\r\n\t}\t\r\n\t\r\n\tpublic List<MatriculaAcademica> consultarPorTurmaOrdenadoPorNomeSocialAluno(Turma turma){\r\n\t\t//...\r\n\t}\t\r\n\t\r\n\tpublic boolean cumpriu(DisciplinaCurricular disciplina, MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic int getCargaHorariaFixaObtida(MatriculaInstitucional matricula){\t\t\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic int getCargaHorariaEstagioObtida(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic int getCargaHorariaEletivaObtida(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic int getCargaHorariaFlexivelObtida(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic MatriculaAcademica gerarConceitoForcado(MatriculaAcademica matriculaAcademica) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaInstitucional> listarAlunosPeriodoEncerradoComMatricula(PeriodoLetivo periodo, Curso curso){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasPeriodosAnteriores(MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic boolean temOfertaObrigatoria(List<AtividadeCurricular> atividades, MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic MatriculaAcademica matricularAproveitamentoEstudos(MatriculaAcademica aproveitamentoEstudo) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaAcademica matricularAproveitamentoEstudosRemanescente(MatriculaAcademica aproveitamentoEstudo) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void matricularAproveitamentoEstudosEmBloco(AproveitamentoEstudosBloco aproveitamentoEstudosBloco) {\r\n\t\t//...\r\n\t}\r\n\r\n\tprivate void validarAproveitamentoDeEstudos(MatriculaAcademica aproveitamentoEstudo) {\r\n\t\t//...\r\n\t}\r\n\r\n\tprotected GenericDao<MatriculaAcademica, Long> getDao() {\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic void excluirComOcorrencia(MatriculaAcademica matriculaAcademica,\tString descricaoOcorrencia, boolean decrementarVagas) {\r\n\t\t//...\t\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> consultarPorMes(Turma turma, Mes mes) {\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic List<RestricaoViolada> listarViolacoesMatricula(MatriculaInstitucional matriculaInstitucional, List<Turma> turmas) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> filtrarAlunosComDisciplinaAprovadaNoPeriodo(List<MatriculaInstitucional> matriculas, PeriodoLetivo periodo) {\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic List<MatriculaAcademica> filtrarAlunosComReprovacaoPorNotaNoPeriodo(\r\n\t\t\tList<MatriculaInstitucional> matriculas, PeriodoLetivo periodo) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> filtrarAlunosComMatriculaVinculoEmTCC(\r\n\t\t\tList<MatriculaInstitucional> matriculas, PeriodoLetivo periodo) {\r\n\t\t//...\r\n\t}\r\n\r\n}	Essa é a versão simplificada da classe apresentada na aba anterior. Essa é, de fato, a mesma classe. Apenas omitimos o corpo dos métodos e os comentários. Como podemos observar, essa classe contém muitos métodos implementando funcionalidades que poderiam ser distribuídas entre outras classes do sistema. Para remover o code smell <em>God Class</em> presente nessa classe, vamos executar várias refatorações do tipo <em>Move Method</em>. Porém, como serão muitas refatorações desse tipo, vamos apresentá-las em grupos.\r\n\r\nAbaixo podemos ver vários métodos destacados. Esses métodos sofrerão as refatorações na próxima aba.	MatriculaAcademicaService_2.java	8-10,44-46,48-50,52-54,56-58,157-159	19
20	@Service\r\npublic class MatriculaAcademicaService extends AbstractService<MatriculaAcademica, Long> implements Serializable {\r\n\t\r\n\tpublic boolean isMatriculadoEmTurmaSolicitada(SolicitacaoMatriculaVagaRemanescente solicitacao){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<Turma> getTurmas(List<MatriculaAcademica> matriculas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarCumpridas(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tprivate Usuario getUsuario() {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarHistorico(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\t\r\n\tpublic List<RestricaoViolada> validarMatricula(Usuario usuario,MatriculaInstitucional matricula, List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<RestricaoViolada> validarMatriculaIsolada(Usuario usuario,MatriculaInstitucional matricula, List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<RestricaoViolada> validarMatriculaVagasRemanescentes(Usuario usuario,MatriculaInstitucional matricula, List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<Turma> getTurmasOfertadasAluno(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarReprovacoesPorMedia(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaAcademica matricular(MatriculaInstitucional matricula, Turma turma){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaAcademica matricularRemanescente(MatriculaInstitucional matricula, Turma turma){\r\n\t\t//...\r\n\t}\t\r\n\t\r\n\tpublic void salvarMatriculaFlexivel(MatriculaInstitucional matriculaInstitucional, MatriculaAcademica matricula, AtividadeCurricular atividade){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void matricularEmIsolada(MatriculaInstitucional matricula, Turma turma){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<RestricaoViolada> desmatricular(Usuario usuario, MatriculaAcademica matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tprivate boolean precisaDeValidacaoAntesDeDeletar( MatriculaAcademica matricula, List<Turma> turmasAposDeletar ){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void trancar(MatriculaAcademica matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void destrancar(MatriculaAcademica matricula){\r\n\t\t//...\r\n \t}\r\n\t\r\n\tpublic void desmatricularIncondicionalmente(MatriculaAcademica matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void removerEntradaHistoricoFlexivel(MatriculaAcademica matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<Turma> listarTurmas(MatriculaInstitucional matricula, List<DisciplinaCurricular> disciplinas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<Turma> listarTurmasPorPeriodo(MatriculaInstitucional matricula, List<DisciplinaCurricular> disciplinas, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<Turma> listarTurmasRemanescentes(MatriculaInstitucional matricula, List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<Turma> aplicarFiltroMatriculaIsolada(List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasPeriodoEspecifico(MatriculaInstitucional matricula, PeriodoLetivo periodo) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasIntervaloPeriodoEspecifico(MatriculaInstitucional matricula, PeriodoLetivo periodoInicial\r\n\t\t\t, PeriodoLetivo periodoFinal) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasAtuais(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasTrancadas(MatriculaInstitucional matricula) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void desmatricularMatriculasAtuais(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void desmatricularMatriculas(MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void removerMobilidadeAcademica(MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\t\t\r\n\tpublic MatriculaAcademica consultarPorId(Long id){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic boolean possuiReprovacao(AtividadeCurricular atividade, MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\t\r\n\tpublic void registrarEvento(EventoHistorico evento, MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void registrarEvento(EventoHistorico evento, MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarEventosAtuais(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic boolean temMatriculaVinculoAtual(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic boolean temMatriculaVinculo(MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> getMatriculasAcademicasAtuais(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic boolean existeRegistroTrancamentoPeriodoAtual(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<DisciplinaCurricular> agruparTurmasPorDisciplinas(List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarHistoricoFlexivel(MatriculaInstitucional matricula) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> consultarPorTurma(Turma turma) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> consultarPorTurmaOrdenadoPorNomeAluno(Turma turma){\r\n\t\t//...\r\n\t}\t\r\n\t\r\n\tpublic List<MatriculaAcademica> consultarPorTurmaOrdenadoPorNomeSocialAluno(Turma turma){\r\n\t\t//...\r\n\t}\t\r\n\t\r\n\tpublic boolean cumpriu(DisciplinaCurricular disciplina, MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic int getCargaHorariaFixaObtida(MatriculaInstitucional matricula){\t\t\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic int getCargaHorariaEstagioObtida(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic int getCargaHorariaEletivaObtida(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic int getCargaHorariaFlexivelObtida(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic MatriculaAcademica gerarConceitoForcado(MatriculaAcademica matriculaAcademica) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaInstitucional> listarAlunosPeriodoEncerradoComMatricula(PeriodoLetivo periodo, Curso curso){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> listarMatriculasPeriodosAnteriores(MatriculaInstitucional matricula, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic boolean temOfertaObrigatoria(List<AtividadeCurricular> atividades, MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic MatriculaAcademica matricularAproveitamentoEstudos(MatriculaAcademica aproveitamentoEstudo) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaAcademica matricularAproveitamentoEstudosRemanescente(MatriculaAcademica aproveitamentoEstudo) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void matricularAproveitamentoEstudosEmBloco(AproveitamentoEstudosBloco aproveitamentoEstudosBloco) {\r\n\t\t//...\r\n\t}\r\n\r\n\tprivate void validarAproveitamentoDeEstudos(MatriculaAcademica aproveitamentoEstudo) {\r\n\t\t//...\r\n\t}\r\n\r\n\tprotected GenericDao<MatriculaAcademica, Long> getDao() {\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic void excluirComOcorrencia(MatriculaAcademica matriculaAcademica,\tString descricaoOcorrencia, boolean decrementarVagas) {\r\n\t\t//...\t\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> consultarPorMes(Turma turma, Mes mes) {\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic List<RestricaoViolada> listarViolacoesMatricula(MatriculaInstitucional matriculaInstitucional, List<Turma> turmas) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> filtrarAlunosComDisciplinaAprovadaNoPeriodo(List<MatriculaInstitucional> matriculas, PeriodoLetivo periodo) {\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic List<MatriculaAcademica> filtrarAlunosComReprovacaoPorNotaNoPeriodo(\r\n\t\t\tList<MatriculaInstitucional> matriculas, PeriodoLetivo periodo) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<MatriculaAcademica> filtrarAlunosComMatriculaVinculoEmTCC(\r\n\t\t\tList<MatriculaInstitucional> matriculas, PeriodoLetivo periodo) {\r\n\t\t//...\r\n\t}\r\n\r\n}	Alguns métodos da classe parecem mais interessados na classe <code>AtividadeCurricularService</code> por fazerem muitas chamadas a essa classe e por manipularem dados referentes à funcionalidade implementada por <code>AtividadeCurricularService</code>. Assim, movemos os seguintes métodos da classe <code>MatriculaAcademicaService</code> para a classe <code>AtividadeCurricularService</code>. \r\n\r\n<code>public List&lt;AtividadeCurricular&gt; getAtividades(List&lt;MatriculaAcademica&gt; matriculas);\r\npublic List&lt;AtividadeCurricular&gt; getAtividadesMatriculaveis(MatriculaInstitucional matricula);\r\npublic List&lt;AtividadeCurricular&gt; getAtividadesObrigatoriasNaoCumpridas(MatriculaInstitucional matricula);\r\npublic List&lt;AtividadeCurricular&gt; getAtividadesNaoCumpridasMatriculaveis(Usuario usuarioSessao, MatriculaInstitucional matricula);\r\npublic List&lt;DisciplinaCurricular&gt; listarDisciplinasMatriculaveis(Usuario usuario, MatriculaInstitucional matriculaInstitucional);\r\npublic Set&lt;AtividadeCurricular&gt; getAtividadesReprovadasMedia(MatriculaInstitucional matricula);</code>\r\n\r\nAssim, executamos 6 operações de <em>Move Method</em> da classe <code>MatriculaAcademicaService</code> para a classe <code>AtividadeCurricularService</code>. O resultado simplificado dessas movimentações pode ser visto abaixo (nenhum dos métodos acima estão mais presentes). Logo abaixo do código da classe <code>MatriculaAcademicaService</code>, podemos ver o código da classe <code>AtividadeCurricularService</code> com os novos métodos movidos. Vale salientar que na classe <code>MatriculaAcademicaService</code> já destacamos os métodos que sofrerão um novo conjunto de refatorações apresentado na próxima aba.	MatriculaAcademicaService_3.java	8-10,36-38,84-86,88-90,92-94,96-98	20
24	package br.les.opus.auth.core.factories;\r\n\r\nimport java.util.UUID;\r\n\r\nimport org.apache.commons.codec.digest.DigestUtils;\r\nimport org.springframework.stereotype.Component;\r\n\r\nimport br.les.opus.auth.core.domain.User;\r\n\r\n@Component\r\npublic class UserFactory {\r\n\r\n\tpublic User createFromFacebook(facebook4j.User fbUser) {\r\n\t\tUser user = new User();\r\n\t\tuser.setEnabled(true);\r\n\t\tuser.setLocked(false);\r\n\t\tuser.setName(fbUser.getName());\r\n\t\tuser.setUsername(fbUser.getEmail());\r\n\t\tString randomPassword = DigestUtils.md5Hex(UUID.randomUUID().toString()); //generates a random password\r\n\t\tuser.setPassword(randomPassword);\r\n\t\treturn user;\r\n\t}\r\n}	Esse é o código original da classe <code>UserFactory</code>. Essa classe só contém um método que faz muitas chamadas para a classe <code>User</code>. Assim, as heurísticas detectaram que um melhor local para esse método seria a classe <code>User</code>. Porém, para não mudar a assinatura do método <code>createFromFacebook</code>, que é usado por outras partes do sistema, extraímos o corpo do método para um novo chamado <code>createUser</code>	UserFactory_1.java	14-21	24
25	package br.les.opus.auth.core.factories;\r\n\r\nimport java.util.UUID;\r\n\r\nimport org.apache.commons.codec.digest.DigestUtils;\r\nimport org.springframework.stereotype.Component;\r\n\r\nimport br.les.opus.auth.core.domain.User;\r\n\r\n@Component\r\npublic class UserFactory {\r\n\r\n\tpublic User createFromFacebook(facebook4j.User fbUser) {\r\n\t\treturn createUser(fbUser);\r\n\t}\r\n\r\n\tprivate User createUser(facebook4j.User fbUser) {\r\n\t\tUser user = new User();\r\n\t\tuser.setEnabled(true);\r\n\t\tuser.setLocked(false);\r\n\t\tuser.setName(fbUser.getName());\r\n\t\tuser.setUsername(fbUser.getEmail());\r\n\t\tString randomPassword = DigestUtils.md5Hex(UUID.randomUUID().toString()); //generates a random password\r\n\t\tuser.setPassword(randomPassword);\r\n\t\treturn user;\r\n\t}\r\n}	Após extrairmos o corpo do método <code>createFromFacebook</code> para o novo método <code>createUser</code>, a classe ficou no estado abaixo. O problema é que o novo método também é uma <em>Feature Envy</em> e precisa ser movido para a classe <code>User</code>.	UserFactory_2.java	14,17-26	25
26	package br.les.opus.auth.core.factories;\r\n\r\nimport org.springframework.stereotype.Component;\r\n\r\nimport br.les.opus.auth.core.domain.User;\r\n\r\n@Component\r\npublic class UserFactory {\r\n\r\n\tpublic User createFromFacebook(facebook4j.User fbUser) {\r\n\t\treturn new User(fbUser);\r\n\t}\r\n\r\n}	Depois de mover o método <code>createUser</code> para a classe <code>User</code>, o novo corpo do método <code>createFromFacebook</code> ficou como o apresentado abaixo. Observe que, como o método movido se trata basicamente de criar um usuário a partir de um outro objeto, transformamos o método movido em um construtor da classe <code>User</code>.	UserFactory_3.java	11	26
1	package br.les.opus.commons.persistence.filtering;\r\n\r\nimport java.util.StringTokenizer;\r\n\r\nimport org.hibernate.Criteria;\r\nimport org.hibernate.criterion.Criterion;\r\nimport org.hibernate.criterion.Restrictions;\r\n\r\npublic class Clause {\r\n\r\n\tprivate String field;\r\n\t\r\n\tprivate String queryingField;\r\n\t\r\n\tprivate Object value;\r\n\t\r\n\tprivate ClauseOperator operator;\r\n\t\r\n\tpublic void createAliases(Criteria criteria) {\r\n\t\tif (!field.contains(".")) {\r\n\t\t\treturn;\r\n\t\t}\r\n\t\tStringTokenizer tokenizer = new StringTokenizer(field, ".");\r\n\t\tString lastAlias = "";\r\n\t\tString lastToken = null;\r\n\t\tint index = 1;\r\n\t\twhile (tokenizer.hasMoreTokens()) {\r\n\t\t\tString token = tokenizer.nextToken();\r\n\t\t\tif (tokenizer.hasMoreTokens()) {\r\n\t\t\t\tString nextAlias = "alias" + index++;\r\n\t\t\t\tcriteria.createAlias(lastAlias + token, nextAlias);\r\n\t\t\t\tlastAlias = nextAlias + ".";\r\n\t\t\t}\r\n\t\t\tlastToken = token;\r\n\t\t}\r\n\t\tthis.queryingField = lastAlias + lastToken;\r\n\t}\r\n\t\r\n\t\r\n\t/**\r\n\t * Diz se o valor da clausula pode ser usado com um like ou não\r\n\t * @return\r\n\t */\r\n\tpublic boolean isLikeable() {\r\n\t\tif (value instanceof String) {\r\n\t\t\tString stringValue = (String)value;\r\n\t\t\treturn stringValue.contains("*");\r\n\t\t}\r\n\t\treturn false;\r\n\t}\r\n\t\r\n\tpublic Criterion toCriterion() {\r\n\t\tif (operator.equals(ClauseOperator.IS_NULL)) { \r\n\t\t\treturn Restrictions.isNull(queryingField);\r\n\t\t} else if (operator.equals(ClauseOperator.EQUALS) && isLikeable()) { \r\n\t\t\treturn Restrictions.ilike(queryingField, this.getSQLValue());\r\n\t\t} else if (operator.equals(ClauseOperator.EQUALS) && !isLikeable()) {\r\n\t\t\treturn Restrictions.eq(queryingField, this.value);\r\n\t\t} else if (operator.equals(ClauseOperator.IS_NOT_NULL)) {\r\n\t\t\treturn Restrictions.isNotNull(queryingField);\r\n\t\t} else if (operator.equals(ClauseOperator.NOT_EQUALS)) {\r\n\t\t\treturn Restrictions.ne(queryingField, this.value);\r\n\t\t} else if (operator.equals(ClauseOperator.GREATER)) {\r\n\t\t\treturn Restrictions.gt(queryingField, this.value);\r\n\t\t} else if (operator.equals(ClauseOperator.GREATER_EQUAL)) {\r\n\t\t\treturn Restrictions.ge(queryingField, this.value);\r\n\t\t} else if (operator.equals(ClauseOperator.LESSER)) {\r\n\t\t\treturn Restrictions.lt(queryingField, this.value);\r\n\t\t} else if (operator.equals(ClauseOperator.LESSER_EQUAL)) {\r\n\t\t\treturn Restrictions.le(queryingField, this.value);\r\n\t\t} \r\n\t\tthrow new FilteringException("Nenhum Criterion associado ao operador " + this);\r\n\t}\r\n\t\r\n\t/**\r\n\t * Remove os asteriscos da string colocando % no lugar\r\n\t * @param value\r\n\t * @return\r\n\t */\r\n\tprivate String replaceAsterisks(String value) {\r\n\t\tString newValue = value;\r\n\t\tint lastIndex = value.length() - 1;\r\n\t\tif (value.charAt(0) == '*') {\r\n\t\t\tnewValue = "%" + newValue.substring(1, lastIndex + 1);\r\n\t\t}\r\n\t\tif (value.charAt(lastIndex) == '*') {\r\n\t\t\tnewValue = newValue.substring(0, lastIndex) + "%"; \r\n\t\t}\r\n\t\treturn newValue;\r\n\t}\r\n\t\r\n\tpublic String getSQLValue() {\r\n\t\treturn replaceAsterisks((String)this.value);\r\n\t}\r\n\t\r\n\tpublic Clause(String field, Object value, ClauseOperator operator) {\r\n\t\tthis.field = field;\r\n\t\tthis.value = value;\r\n\t\tthis.operator = operator;\r\n\t\tthis.queryingField = field;\r\n\t}\r\n\t\r\n\r\n\tpublic String getField() {\r\n\t\treturn field;\r\n\t}\r\n\r\n\tpublic ClauseOperator getOperator() {\r\n\t\treturn operator;\r\n\t}\r\n\r\n\t@Override\r\n\tpublic String toString() {\r\n\t\treturn "Clause [field=" + field + ", value=" + value + ", operator="\r\n\t\t\t\t+ operator + "]";\r\n\t}\r\n}	Arquivo no estado antes das refatorações serem aplicadas	Clause_1.java	52-73	1
40	@Service\r\npublic class AtividadeCurricularService extends AbstractService<AtividadeCurricular, Long> implements Serializable {\r\n\tprivate static final long serialVersionUID = -8821511877105756926L;\r\n\t@Autowired\r\n\tprivate AtividadeCurricularDao atividadeDao;\r\n\t\r\n\t@Autowired\r\n\tprivate TipoAtividadeCurricularDao tipoAtivDao;\r\n\t\r\n\t@Autowired\r\n\tprivate ModuloDisciplinaDao moduloDao;\r\n\t\r\n\t@Autowired\r\n\tprivate SomaCargaHorariaModulosEloValidacao validadorCHModulos;\r\n\r\n\tpublic List<AtividadeCurricular> getAtividades(List<MatriculaAcademica> matriculas){\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic List<AtividadeCurricular> getAtividadesMatriculaveis(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<AtividadeCurricular> getAtividadesObrigatoriasNaoCumpridas(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<AtividadeCurricular> getAtividadesNaoCumpridasMatriculaveis(Usuario usuarioSessao, MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<DisciplinaCurricular> listarDisciplinasMatriculaveis(Usuario usuario, MatriculaInstitucional matriculaInstitucional){\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic Set<AtividadeCurricular> getAtividadesReprovadasMedia(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<AtividadeCurricular> consultarAtividadesExtraCurriculares(UnidadeOrganizacional unidade){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<AtividadeCurricular> consultarAtividadesFlexiveis(){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<AtividadeCurricular> consultarAtividadesGrade(VersaoCurso versao){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic ModuloDisciplina inserirModulo(ModuloDisciplina modulo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void excluirModulo(ModuloDisciplina modulo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tprivate String getProximoCodigoAtividade(String prefixo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\t@Override\r\n\tpublic void excluir(AtividadeCurricular atividade) throws ValidacaoException {\r\n\t\t//...\r\n\t}\r\n\t\t\r\n\tpublic AtividadeCurricular inserir(Curso curso, AtividadeCurricular atividade) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\t@Override\r\n\tpublic AtividadeCurricular salvarOuEditar(AtividadeCurricular atividade) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<AtividadeCurricular> listarAtividades(Curso curso){\r\n\t\t//...\r\n\t}\r\n\r\n\t@Override\r\n\tprotected GenericDao<AtividadeCurricular, Long> getDao() {\t\t\r\n\t\t//...\r\n\t}\r\n}	Abaixo podemos ver a classe <code>AtividadeCurricularService</code> que recebeu os métodos listados acima.	AtividadeCurricularService_1.java	16-38	20
33	public class DiarioClasse implements Serializable{\r\n\t\t\r\n\tprivate static final long serialVersionUID = -6865054259687997800L;\r\n\tpublic static final int PRESENCIAL = 1;\r\n\tpublic static final int NAO_PRESENCIAL = 0;\r\n\t\r\n\t@Id\r\n\t@SequenceGenerator(name = "sequence-generator", sequenceName = "DBSM.SEQ_DIARIO_CLASSE", allocationSize = 1)\r\n\t@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequence-generator")\r\n\t@Column(name = "ID_DIARIO")\r\n\tprivate Long id;\r\n\t\r\n\t@Temporal(TemporalType.DATE)\r\n\t@Column(name = "DT_INICIO")\r\n\tprivate Date data;\r\n\t\r\n\t@DateTimeFormat(pattern = "HH:mm")\r\n\t@Temporal(TemporalType.TIMESTAMP)\r\n\t@Column(name = "HR_INICIO")\r\n\tprivate Date hora;\t\r\n\t\r\n\t@ManyToOne(fetch = FetchType.LAZY)\r\n\t@JoinColumns ({\r\n\t\t@JoinColumn(name="TIPO_AULA_TAB", referencedColumnName = "COD_TABELA"),\r\n\t\t@JoinColumn(name="TIPO_AULA_ITEM", referencedColumnName = "ITEM_TABELA")\t\t\r\n\t})\r\n\tprivate TipoAula tipoAula;\r\n\t\r\n\t@OneToOne(fetch = FetchType.LAZY)\r\n\t@Cascade({CascadeType.SAVE_UPDATE})\r\n\t@JoinColumn(name = "ID_TURMA")\r\n\tprivate Turma turma;\r\n\t\r\n\t@Temporal(TemporalType.DATE)\r\n\t@Column(name = "DT_ALTERACAO")\r\n\tprivate Date dataAlteracao;\r\n\t\r\n\t@DateTimeFormat(pattern = "HH:mm")\r\n\t@Temporal(TemporalType.TIMESTAMP)\r\n\t@Column(name = "HR_ALTERACAO")\r\n\tprivate Date horaAlteracao;\r\n\t\r\n\t@Column(name = "COD_OPERADOR")\r\n\tprivate Long codOperador;\r\n\t\r\n\t@Column(name = "CONCORRENCIA")\r\n\tprivate Long concorrencia;\r\n\t\r\n\t@Column(name = "TEXTO")\r\n\tprivate String texto;\r\n\t\r\n\t@ManyToOne(fetch = FetchType.LAZY)\r\n\t@JoinColumns ({\r\n\t\t@JoinColumn(table="COMPLEMENTO_DIARIO_CLASSE", name="TIPO_SITUACAO_TAB", referencedColumnName = "COD_TABELA"),\r\n\t\t@JoinColumn(table="COMPLEMENTO_DIARIO_CLASSE", name="TIPO_SITUACAO_ITEM", referencedColumnName = "ITEM_TABELA")\t\t\r\n\t})\r\n\tprivate SituacaoAula situacaoAula;\r\n\t\r\n\t@ManyToOne(fetch = FetchType.LAZY)\r\n\t@JoinColumns ({\r\n\t\t@JoinColumn(table="COMPLEMENTO_DIARIO_CLASSE", name="MES_TAB", referencedColumnName = "COD_TABELA"),\r\n\t\t@JoinColumn(table="COMPLEMENTO_DIARIO_CLASSE", name="MES_ITEM", referencedColumnName = "ITEM_TABELA")\t\t\r\n\t})\r\n\tprivate Mes mes;\r\n\t\r\n\t@Column(table="COMPLEMENTO_DIARIO_CLASSE", name="DSC_JUSTIFICATIVA")\r\n\tprivate String justificativa;\r\n\t\r\n\t@Column(table="COMPLEMENTO_DIARIO_CLASSE", name="PRESENCIAL")\r\n\tprivate Integer presencial;\r\n\t\r\n\t@OneToOne(fetch = FetchType.LAZY)\r\n\t@JoinColumn(table="COMPLEMENTO_DIARIO_CLASSE", name = "ID_DIARIO_JUSTIFICADO")\r\n\tprivate DiarioClasse diarioJustificado;\r\n\t\r\n\t@OneToMany(mappedBy = "diarioClasse")\r\n\t@Cascade(CascadeType.DELETE)\r\n\tprivate List<Presenca> presencas;\r\n\t\r\n\tpublic DiarioClasse() {\r\n\r\n\t}\r\n\t\r\n\tpublic DiarioClasse(Turma turma, HorarioAula horario, Calendar calendarioTemp, TipoAula tipoAula) {\r\n\t\tthis.setData(calendarioTemp.getTime());\r\n\t\tthis.setHora(horario.getHoraInicio());\r\n\t\tthis.setTurma(turma);\r\n\t\tif (horario.getTipoAula()!=null){\r\n\t\t\tthis.setTipoAula(horario.getTipoAula());\r\n\t\t} else {\r\n\t\t\t// Por default, carrega aulas do tipo teórica\r\n\t\t\tthis.setTipoAula(tipoAula);\r\n\t\t}\r\n\t\tthis.setDataAlteracao(new Date());\r\n\t\tthis.setHoraAlteracao(new Date());\r\n\t\tthis.setConcorrencia(0L);\r\n\t\tthis.setCodOperador(0L);\r\n\t}\r\n\r\n\tpublic Date getData() {\r\n\t\treturn data;\r\n\t}\r\n\r\n\tpublic void setData(Date data) {\r\n\t\tthis.data = data;\r\n\t}\r\n\r\n\tpublic Date getHora() {\r\n\t\treturn hora;\r\n\t}\r\n\r\n\tpublic void setHora(Date hora) {\r\n\t\tthis.hora = hora;\r\n\t}\r\n\r\n\tpublic String getJustificativa() {\r\n\t\treturn justificativa;\r\n\t}\r\n\r\n\tpublic void setJustificativa(String justificativa) {\r\n\t\tthis.justificativa = justificativa;\r\n\t}\r\n\r\n\tpublic TipoAula getTipoAula() {\r\n\t\treturn tipoAula;\r\n\t}\r\n\r\n\tpublic void setTipoAula(TipoAula tipoAula) {\r\n\t\tthis.tipoAula = tipoAula;\r\n\t}\r\n\r\n\tpublic SituacaoAula getSituacaoAula() {\r\n\t\treturn situacaoAula;\r\n\t}\r\n\r\n\tpublic void setSituacaoAula(SituacaoAula situacaoAula) {\r\n\t\tthis.situacaoAula = situacaoAula;\r\n\t}\r\n\r\n\tpublic void setId(Long id) {\r\n\t\tthis.id = id;\r\n\t}\r\n\r\n\tpublic Long getId() {\r\n\t\treturn id;\r\n\t}\r\n\r\n\tpublic void setTurma(Turma turma) {\r\n\t\tthis.turma = turma;\r\n\t}\r\n\r\n\tpublic Turma getTurma() {\r\n\t\treturn turma;\r\n\t}\r\n\r\n\tpublic void setDataAlteracao(Date dataAlteracao) {\r\n\t\tthis.dataAlteracao = dataAlteracao;\r\n\t}\r\n\r\n\tpublic Date getDataAlteracao() {\r\n\t\treturn dataAlteracao;\r\n\t}\r\n\r\n\tpublic void setHoraAlteracao(Date horaAlteracao) {\r\n\t\tthis.horaAlteracao = horaAlteracao;\r\n\t}\r\n\r\n\tpublic Date getHoraAlteracao() {\r\n\t\treturn horaAlteracao;\r\n\t}\r\n\r\n\tpublic void setPresencial(Integer presencial) {\r\n\t\tthis.presencial = presencial;\r\n\t}\r\n\r\n\tpublic Integer getPresencial() {\r\n\t\treturn presencial;\r\n\t}\r\n\r\n\tpublic void setCodOperador(Long codOperador) {\r\n\t\tthis.codOperador = codOperador;\r\n\t}\r\n\r\n\tpublic Long getCodOperador() {\r\n\t\treturn codOperador;\r\n\t}\r\n\r\n\tpublic void setConcorrencia(Long concorrencia) {\r\n\t\tthis.concorrencia = concorrencia;\r\n\t}\r\n\r\n\tpublic Long getConcorrencia() {\r\n\t\treturn concorrencia;\r\n\t}\r\n\r\n\tpublic void setTexto(String texto) {\r\n\t\tthis.texto = texto;\r\n\t}\r\n\r\n\tpublic String getTexto() {\r\n\t\treturn texto;\r\n\t}\r\n\r\n\tpublic Mes getMes() {\r\n\t\treturn mes;\r\n\t}\r\n\r\n\tpublic void setMes(Mes mes) {\r\n\t\tthis.mes = mes;\r\n\t}\r\n\t\r\n\tpublic boolean validarAulaPresencial(){\r\n\t\treturn (this.presencial == DiarioClasse.PRESENCIAL);\r\n\t}\r\n\r\n\tpublic List<Presenca> getPresencas() {\r\n\t\treturn presencas;\r\n\t}\r\n\r\n\tpublic void setPresencas(List<Presenca> presencas) {\r\n\t\tthis.presencas = presencas;\r\n\t}\r\n\r\n\tpublic DiarioClasse getDiarioJustificado() {\r\n\t\treturn diarioJustificado;\r\n\t}\r\n\r\n\tpublic void setDiarioJustificado(DiarioClasse diarioJustificado) {\r\n\t\tthis.diarioJustificado = diarioJustificado;\r\n\t}\r\n\r\n}	O método <code>DiarioClasseService.criarDiario</code> foi movido para a classe <code>DiarioClasse</code>. Como ele é simplesmente uma maneira de criar um objeto do tipo <code>DiarioClasse</code>, o transformamos em um construtor. Apresentamos abaixo o resultado das alterações na classe <code>DiarioClasse</code>, que recebeu o novo método.	DiarioClasse_1.java	84-98	33
3	public class GenericTranspalBean {\r\n\t\r\n\t@In("#{matriculaInstitucionalService}")\r\n\tprotected MatriculaInstitucionalService matriculaInstitucionalService;\r\n\t\r\n\t@In("#{enderecoService}")\r\n\tprotected EnderecoService enderecoService;\r\n\r\n\t//_____________________________________________________________________________________________\r\n\t/**     Método que retorna true caso o aluno esteja regularmente matriculado e false em caso\r\n\t *  contrário.*/\r\n\tprotected boolean alunoEstaMatriculado( StatusMatricula status ){\r\n\t\tif( \tstatus != StatusMatricula.MATRICULADO && \r\n\t\t\t\tstatus != StatusMatricula.MATRICULADO_TCC && \r\n\t\t\t\tstatus != StatusMatricula.CURSO_INTEGRALIZADO && \r\n\t\t\t\tstatus != StatusMatricula.SEM_MATRICULA_DISCIPLINA ){\r\n\t\t\treturn false;\r\n\t\t}\r\n\t\treturn true;\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprivate StringBuilder processamento( MatriculaInstitucional matriculaInstitucional, Ocorrencia ocorrencia ){\r\n\t\tAluno aluno = matriculaInstitucional.getAluno();\r\n\t\tPessoa pessoa = matriculaInstitucional.getAluno().getPessoa();\r\n\t\tEndereco endereco = this.enderecoService.getEnderecoResidencial(aluno);\r\n\t\t\r\n\t\tStringBuilder dados = new StringBuilder();\r\n\r\n\t\t// Matricula OK\r\n\t\tdados.append(StringUtils.rightPad(matriculaInstitucional.getMatricula().toUpperCase(), 15, " "));\r\n\t\t// Nome OK\r\n\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(aluno.getNome().toUpperCase()).replaceAll("[^a-z^A-Z^0-9 ]", ""), 60, " "));\r\n\t\t// Sexo OK\r\n\t\tdados.append(StringUtils.rightPad(aluno.getSexo().toUpperCase(), 1, " "));\r\n\t\t// Nascimento OK\r\n\t\tDate dataNascimento = aluno.getDataNascimento();\r\n\t\tif( dataNascimento != null ){\r\n\t\t\tdados.append(StringUtils.rightPad(new SimpleDateFormat("dd/MM/yyyy").format( dataNascimento ), 10, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.rightPad( "" , 10, " "));\r\n\t\t}\r\n\t\t// CPF OK\r\n\t\tDocumentoPessoa cpf = pessoa.getCPF();\r\n\t\tif( cpf != null ){\r\n\t\t\tdados.append(StringUtils.rightPad( cpf.getNumeroDocumento().replaceAll("\\\\D", ""), 14, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.rightPad( "", 14, " "));\r\n\t\t}\r\n\t\t// RG OK\r\n\t\tDocumentoPessoa rg = pessoa.getRG();\r\n\t\tif( rg != null ){\r\n\t\t\tdados.append(StringUtils.leftPad( rg.getNumeroDocumento().replaceAll("\\\\D", ""), 14, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.leftPad( "", 14, " "));\r\n\t\t}\r\n\t\tif(endereco != null){\r\n\t\t\t// Telefone OK\r\n\t\t\tdados.append(StringUtils.leftPad(endereco.getFoneCelular() != null ? endereco.getFoneCelular().replaceAll("\\\\D", "") : "", 14, " "));\r\n\t\t\t// Endereço OK\r\n\t\t\tdados.append(StringUtils.rightPad(endereco.getRua() != null ? AcentosUtils.remover(endereco.getRua().replaceAll("[^a-z^A-Z^0-9 ]", "")).toUpperCase() : "", 60, " "));\r\n\t\t\t// Complemento OK\r\n\t\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(endereco.getComplemento() != null ? AcentosUtils.remover(endereco.getComplemento()).replaceAll("[^a-z^A-Z^0-9 ]", "") : "").toUpperCase(), 60, " "));\r\n\t\t\t// Bairro OK\r\n\t\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(endereco.getBairro() != null ? AcentosUtils.remover(endereco.getBairro()).replaceAll("[^a-z^A-Z^0-9 ]", "").toUpperCase() : ""), 30, " "));\r\n\t\t\t// CEP OK\r\n\t\t\tdados.append(StringUtils.rightPad(formataCEP(endereco.getCep()), 9, "0"));\r\n\t\t}else{\r\n\t\t\t// Telefone OK\r\n\t\t\tdados.append(StringUtils.leftPad( "", 14, " "));\r\n\t\t\t// Endereço OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 60, " "));\r\n\t\t\t// Complemento OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 60, " "));\r\n\t\t\t// Bairro OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 30, " "));\r\n\t\t\t// CEP OK\r\n\t\t\tdados.append(StringUtils.rightPad("", 9, "0"));\t\t\t\r\n\t\t}\r\n\t\t// Mãe OK\r\n\t\tString nomeMae = aluno.getNomeMae();\r\n\t\tif( nomeMae != null ){\r\n\t\t\tdados.append(StringUtils.rightPad(AcentosUtils.remover(aluno.getNomeMae()).replaceAll("[^a-z^A-Z^0-9 ]", "").toUpperCase(), 60, " "));\r\n\t\t}else{\r\n\t\t\tdados.append(StringUtils.rightPad( "" , 60, " "));\r\n\t\t}\r\n\t\t// CPF Mãe OK\r\n\t\tdados.append(StringUtils.rightPad(" ", 11));\r\n\t\t// Pai OK \r\n\t\tdados.append(StringUtils.rightPad(aluno.getNomePai() != null ? AcentosUtils.remover(aluno.getNomePai()).replaceAll("[^a-z^A-Z^0-9 ]", "").toUpperCase() : "", 60, " "));\r\n\t\t// CPF Pai OK\r\n\t\tdados.append(StringUtils.rightPad(" ", 11));\r\n\t\t// Série (Período) OK\r\n\t\tdados.append(StringUtils.leftPad(matriculaInstitucional.getPeriodoAtual().toString(), 2, " "));\r\n\t\t// Grau OK\r\n\t\tdados.append(StringUtils.rightPad("3", 1, " "));\r\n\t\t// Turno \r\n\t\tdados.append(StringUtils.rightPad(matriculaInstitucional.getVersaoCurso().getCurso().getTurno().getSigla(), 1, " "));\r\n\t\t// Código OK\r\n\t\tString codigoCursoTranspal = matriculaInstitucional.getVersaoCurso().getCurso().getCursoTranspal();\r\n\t\tif( codigoCursoTranspal == null ){\r\n\t\t\tthrow new IllegalArgumentException( "O curso correspondente à matrícula '"\r\n\t\t\t\t\t+matriculaInstitucional.getMatricula().toUpperCase()+"' não possui um código da Transpal." );\r\n\t\t}\r\n\t\tdados.append(StringUtils.rightPad( codigoCursoTranspal , 3, " "));\r\n\t\t// Status OK\r\n\t\tString status = this.retornarStatusAluno( ocorrencia );\r\n\t\tdados.append( StringUtils.rightPad( status, 1, " ") );\r\n\t\t// E-mail OK\r\n\t\tdados.append(StringUtils.rightPad(aluno.getEmail() != null ? aluno.getEmail().toUpperCase() : "", 40, " "));\r\n\t\t\t\r\n\t\treturn dados;\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprivate String retornarStatusAluno( Ocorrencia ocorrencia ){\r\n\t\tif( ocorrencia == null){\r\n\t\t\treturn "A";\r\n\t\t}\r\n\t\tlong idOcorrencia = ocorrencia.getTipoOcorrencia().getId();\r\n\t\tif( idOcorrencia == TipoOcorrencia.FALECIMENTO\r\n\t\t\t\t|| idOcorrencia == TipoOcorrencia.DESISTENCIA\r\n\t\t\t\t|| idOcorrencia == TipoOcorrencia.DESLIGAMENTO ){\r\n\t\t\treturn "D";\r\n\t\t}\r\n\t\tif( idOcorrencia == TipoOcorrencia.FORMATURA ){\r\n\t\t\treturn "C";\r\n\t\t}\r\n\t\tif( idOcorrencia == TipoOcorrencia.SAIDA_TRANSFERENCIA_EXTERNA ){\r\n\t\t\treturn "T";\r\n\t\t}\r\n\t\treturn "I";\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprotected StringBuilder formatarDados(MatriculaInstitucional matriculaInstitucional) throws IOException, Exception {\r\n\t\tStatusMatricula status = this.matriculaInstitucionalService.getStatusMatricula( matriculaInstitucional );\r\n\t\tif( !this.alunoEstaMatriculado( status ) ){\r\n\t\t\tString matricula = matriculaInstitucional.getMatricula();\r\n\t\t\tthrow new IllegalArgumentException( "O aluno de matrícula '"+matricula+"' aparentemente" +\r\n\t\t\t\t\t" não está regurlarmente matriculado" );\r\n\t\t}\r\n\t\t//-----------------------------------------------------------------------------------------\r\n\t\treturn this.processamento( matriculaInstitucional, null );\t\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\tprotected StringBuilder gerarStringArquivoDosAlunosDesligados( Ocorrencia ocorrencia ){\r\n\t\treturn this.processamento( ocorrencia.getMatricula(), ocorrencia );\r\n\t}\r\n\t//_____________________________________________________________________________________________\r\n\t\r\n\tprivate String formataCEP(String cep) {\r\n\t\tif (cep == null) {\r\n\t\t\treturn "";\r\n\t\t}\r\n\t\tString cepNumeros = cep.replaceAll("\\\\D", "");\r\n\t\tcepNumeros = StringUtils.rightPad(cepNumeros, 8, "0");\r\n\t\treturn cepNumeros.substring(0, 5) + "-" + cepNumeros.substring(5, 8);\r\n\t\t\r\n\t}\r\n \r\n}	O código abaixo da classe <code>GenericTranspalBean</code> está em seu estado original. Ou seja, antes das refatorações propostas. As próximas abas apresentam sucessivas refatorações efetuadas no método <code>processamento</code>, que é o trecho de código em destaque.	GenericTranspalBean_1.java	22-112	2
39	public class MatriculaInstitucional implements Serializable {\r\n\t\r\n\t// ...\r\n\t\r\n\tpublic MatriculaInstitucional(MatriculaInstitucional matriculaOrigem, Curso cursoDestino,\r\n\t\t\tCampus polo, ParametroAcademicoCurso param, PeriodoLetivo periodoLetivoAtual,\r\n\t\t\tCalculoMatricula geradorNumeroMatricula, VersaoCurso versaoDestino) {\r\n\t\t\r\n\t\tsetVersaoCurso(versaoDestino);\r\n\t\tsetAluno(matriculaOrigem.getAluno());\r\n\t\tsetAnoIngressoInstituicao(matriculaOrigem.getAnoIngressoInstituicao());\r\n\t\tsetPeriodoIngressoInstituicao(matriculaOrigem.getPeriodoIngressoInstituicao());\r\n\t\tsetAnoIngresso(periodoLetivoAtual.getAno());\r\n\t\tsetPeriodoAtual(1);\r\n\t\tsetTipoLocalVestibular("I");\r\n\t\tsetVersao(0l);\r\n\t\tsetPolo(polo);\r\n\t\tsetTurno(cursoDestino.getTurno());\r\n\t\tgeradorNumeroMatricula.calcular(this, NivelMatricula.GRADUACAO, param);\r\n\t}\r\n\t\r\n\t// ...\r\n\t\r\n}	Abaixo podemos ver a classe <code>MatriculaInstitucional</code> que recebeu o método <code>criarMatricula</code>. Note que esse método virou um construtor, como destacado abaixo.	MatriculaInstitucional_1.java	5-20	13
15	package br.les.opus.instagram.domain;\r\n\r\nimport java.util.Date;\r\nimport java.util.List;\r\n\r\nimport javax.persistence.CascadeType;\r\nimport javax.persistence.CollectionTable;\r\nimport javax.persistence.Column;\r\nimport javax.persistence.ElementCollection;\r\nimport javax.persistence.Entity;\r\nimport javax.persistence.FetchType;\r\nimport javax.persistence.Id;\r\nimport javax.persistence.JoinColumn;\r\nimport javax.persistence.ManyToOne;\r\nimport javax.persistence.OneToMany;\r\nimport javax.persistence.OneToOne;\r\nimport javax.persistence.Table;\r\nimport javax.persistence.Transient;\r\n\r\nimport com.fasterxml.jackson.annotation.JsonIgnore;\r\nimport com.google.gson.annotations.SerializedName;\r\n\r\n@Entity\r\n@Table(name = "media", schema = "instagram")\r\npublic class Media {\r\n\r\n\t@Id\r\n\tprivate String id;\r\n\r\n\tprivate String type;\r\n\r\n\tprivate String filter;\r\n\r\n\t@ElementCollection\r\n\t@CollectionTable(name="media_tag", schema = "instagram",  joinColumns = @JoinColumn(name="media_id"))\r\n\t@JsonIgnore\r\n\t@Column(name="tag")\r\n\tprivate List<String> tags;\r\n\r\n\t@OneToOne(cascade = CascadeType.ALL)\r\n\t@JsonIgnore\r\n\t@JoinColumn(name = "comments_envelope_id")\r\n\tprivate CommentsEnvelope comments;\r\n\t\r\n\t@OneToOne(cascade = CascadeType.ALL)\r\n\t@JoinColumn(name = "caption_id")\r\n\tprivate Comment caption;\r\n\t\r\n\t@OneToOne(cascade = CascadeType.ALL)\r\n\t@JsonIgnore\r\n\t@JoinColumn(name = "likes_envelope_id")\r\n\tprivate LikesEnvelope likes;\r\n\t\r\n\tprivate String link;\r\n\t\r\n\t@ManyToOne(cascade = CascadeType.ALL)\r\n\t@JoinColumn(name = "user_id")\r\n\tprivate InstagramUser user;\r\n\t\r\n\t@SerializedName("created_time")\r\n\tprivate Date createdTime;\r\n\t\r\n\t@OneToOne(cascade = CascadeType.ALL)\r\n\t@JoinColumn(name = "picture_pool_id")\r\n\tprivate PicturePool images;\r\n\t\r\n\t@OneToOne(cascade = CascadeType.ALL)\r\n\t@JoinColumn(name = "video_pool_id")\r\n\tprivate VideoPool videos;\r\n\t\r\n\t@ManyToOne(cascade = CascadeType.ALL)\r\n\t@JoinColumn(name = "location_id")\r\n\tprivate Location location;\r\n\t\r\n\t@SerializedName("users_in_photo")\r\n\t@JsonIgnore\r\n\t@OneToMany(mappedBy = "media", cascade = CascadeType.ALL, fetch = FetchType.EAGER)\r\n\tprivate List<UserInPhoto> taggedUsers;\r\n\t\r\n\t@Transient\r\n\tpublic boolean isValid() {\r\n\t\tif (images == null && videos == null) {\r\n\t\t\treturn false;\r\n\t\t}\r\n\t\tif (images != null && !images.isValid()) {\r\n\t\t\treturn false;\r\n\t\t}\r\n\t\tif (videos != null && !videos.isValid()) {\r\n\t\t\treturn false;\r\n\t\t}\r\n\t\treturn true; \r\n\t}\r\n\t\r\n\tpublic void replaceImages(PicturePool oldPool) {\r\n\t\tif (this.images == null) {\r\n\t\t\treturn;\r\n\t\t}\r\n\t\tupdatePool(oldPool);\r\n\t}\r\n\r\n\tprivate void updatePool(PicturePool oldPool) {\r\n\t\timages.setId(oldPool.getId());\r\n\t\timages.getLowResolution().setId(oldPool.getLowResolution().getId());\r\n\t\timages.getStandardResolution().setId(oldPool.getStandardResolution().getId());\r\n\t\timages.getThumbnail().setId(oldPool.getThumbnail().getId());\r\n\t}\r\n\t\r\n\tpublic void replaceVideos(VideoPool oldVideoPool) {\r\n\t\tif (this.videos == null) {\r\n\t\t\treturn;\r\n\t\t}\r\n\t\tvideos.setId(oldVideoPool.getId());\r\n\t\tvideos.getLowResolution().setId(oldVideoPool.getLowResolution().getId());\r\n\t\tvideos.getStandardResolution().setId(oldVideoPool.getStandardResolution().getId());\r\n\t}\r\n\t\r\n\tpublic List<UserInPhoto> getTaggedUsers() {\r\n\t\treturn taggedUsers;\r\n\t}\r\n\r\n\tpublic void setTaggedUsers(List<UserInPhoto> taggedUsers) {\r\n\t\tthis.taggedUsers = taggedUsers;\r\n\t}\r\n\r\n\tpublic String getId() {\r\n\t\treturn id;\r\n\t}\r\n\r\n\tpublic void setId(String id) {\r\n\t\tthis.id = id;\r\n\t}\r\n\r\n\tpublic String getType() {\r\n\t\treturn type;\r\n\t}\r\n\r\n\tpublic void setType(String type) {\r\n\t\tthis.type = type;\r\n\t}\r\n\r\n\tpublic String getFilter() {\r\n\t\treturn filter;\r\n\t}\r\n\r\n\tpublic void setFilter(String filter) {\r\n\t\tthis.filter = filter;\r\n\t}\r\n\r\n\tpublic List<String> getTags() {\r\n\t\treturn tags;\r\n\t}\r\n\r\n\tpublic void setTags(List<String> tags) {\r\n\t\tthis.tags = tags;\r\n\t}\r\n\r\n\tpublic CommentsEnvelope getComments() {\r\n\t\treturn comments;\r\n\t}\r\n\r\n\tpublic void setComments(CommentsEnvelope comments) {\r\n\t\tthis.comments = comments;\r\n\t}\r\n\r\n\tpublic Comment getCaption() {\r\n\t\treturn caption;\r\n\t}\r\n\r\n\tpublic void setCaption(Comment caption) {\r\n\t\tthis.caption = caption;\r\n\t}\r\n\r\n\tpublic LikesEnvelope getLikes() {\r\n\t\treturn likes;\r\n\t}\r\n\r\n\tpublic void setLikes(LikesEnvelope likes) {\r\n\t\tthis.likes = likes;\r\n\t}\r\n\r\n\tpublic String getLink() {\r\n\t\treturn link;\r\n\t}\r\n\r\n\tpublic void setLink(String link) {\r\n\t\tthis.link = link;\r\n\t}\r\n\r\n\tpublic InstagramUser getUser() {\r\n\t\treturn user;\r\n\t}\r\n\r\n\tpublic void setUser(InstagramUser user) {\r\n\t\tthis.user = user;\r\n\t}\r\n\r\n\tpublic Date getCreatedTime() {\r\n\t\treturn createdTime;\r\n\t}\r\n\r\n\tpublic void setCreatedTime(Date createdTime) {\r\n\t\tthis.createdTime = createdTime;\r\n\t}\r\n\r\n\tpublic PicturePool getImages() {\r\n\t\treturn images;\r\n\t}\r\n\r\n\tpublic void setImages(PicturePool images) {\r\n\t\tthis.images = images;\r\n\t}\r\n\r\n\tpublic VideoPool getVideos() {\r\n\t\treturn videos;\r\n\t}\r\n\r\n\tpublic void setVideos(VideoPool videos) {\r\n\t\tthis.videos = videos;\r\n\t}\r\n\r\n\tpublic Location getLocation() {\r\n\t\treturn location;\r\n\t}\r\n\r\n\tpublic void setLocation(Location location) {\r\n\t\tthis.location = location;\r\n\t}\r\n\t\r\n}	Algumas linhas de código foram extraídas do método <code>replaceImages</code>. Essas linhas deram origem ao método <code>updatePool</code>. O problema com essa operação é que o novo método criado também é uma <em>Feature Envy</em>. Assim, novas refatorações são necessárias.	Media_2.java	98,101-106	15
53	public class EmployeeRepository {  \r\n\t//...\r\n\t\r\n    public void fetchEmployee(string employeeId) {\r\n    \t//...\r\n    }  \r\n    \r\n    public void saveEmployee(Employee employee) {\r\n    \t//...\r\n    }  \r\n\r\n    //...\r\n}	Novos métodos recebidos	zzEmployeeRepository_1.java	4-10	44
43	@Service\r\npublic class ValidacaoMatriculaService implements Serializable {\r\n\t//...\r\n\t\r\n\tpublic List<RestricaoViolada> validarMatricula(Usuario usuario,MatriculaInstitucional matricula, List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<RestricaoViolada> validarMatriculaIsolada(Usuario usuario,MatriculaInstitucional matricula, List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<RestricaoViolada> validarMatriculaVagasRemanescentes(Usuario usuario,MatriculaInstitucional matricula, List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\r\n\t//...\r\n}	Abaixo podemos ver a classe <code>ValidacaoMatriculaService</code> que recebeu os métodos listados acima.	ValidacaoMatriculaService_1.java	5-15	23
49	public class EmployeeUtils {  \r\n    public void fetchEmployee(string employeeId) {\r\n    \t//...\r\n    }  \r\n    \r\n    public void saveEmployee(Employee employee) {\r\n    \t//...\r\n    }  \r\n    \r\n    public void validateEmployee(Employee employee) {\r\n    \t//...\r\n    }    \r\n    \r\n    public void exportEmployeeToCSV(Employee employe) {\r\n    \t//...\r\n    }    \r\n    \r\n    public void importEmployeeForDb(Employee employee) {\r\n    \t//...\r\n    }    \r\n\r\n    public class Employee {\r\n    \tprivate Long id;\r\n\r\n    \tprivate String name;\r\n\r\n    \tprivate String address;\r\n\r\n    \tprivate String designation;\r\n\r\n    \tprivate Float salary;\r\n    }\r\n}	Versão original da classe <code>EmployeeUtils</code>. A primeira refatoração a ser realizada é uma espécie de <em>Move Class</em>. Movemos a classe interna <code>Employee</code> (linhas destacadas abaixo) para um novo arquivo fora da classe <code>EmployeeUtils</code>.	EmployeeUtils_1.java	22-32	42
50	public class EmployeeUtils {  \r\n    public void fetchEmployee(string employeeId) {\r\n    \t//...\r\n    }  \r\n    \r\n    public void saveEmployee(Employee employee) {\r\n    \t//...\r\n    }  \r\n    \r\n    public void validateEmployee(Employee employee) {\r\n    \t//...\r\n    }    \r\n    \r\n    public void exportEmployeeToCSV(Employee employe) {\r\n    \t//...\r\n    }    \r\n    \r\n    public void importEmployeeForDb(Employee employee) {\r\n    \t//...\r\n    }    \r\n}	Classe <code>EmployeeUtils</code> depois do <em>Move Class</em> da classe interna <code>Employee</code>. Abaixo podemos ver a classe <code>EmployeeUtils</code> em seu novo estado e, logo depois, a nova classe <code>Employee</code>.\r\n\r\nOs métodos <code>fetchEmployee</code> e <code>saveEmployee</code> destacados abaixo sofrerão as próximas refatorações.	EmployeeUtils_2.java	2-8	43
52	public class EmployeeUtils {      \r\n    public void validateEmployee(Employee employee) {\r\n    \t//...\r\n    }\r\n    \r\n    public void exportEmployeeToCSV(Employee employe) {\r\n    \t//...\r\n    }\r\n    \r\n    public void importEmployeeForDb(Employee employee) {\r\n    \t//...\r\n    }\r\n}	Classe <code>EmployeeUtils</code> depois de dois <em>Move Methods</em> aplicados. Os métodos foram movidos pra classe <code>EmployeeRepository</code>, já que eles implementam operações de banco de dados sobre objetos do tipo <code>Employee</code>.\r\n\r\nOs métodos destacados abaixo sofrerão as últimas refatorações para resolver o <em>God Class</em> em <code>EmployeeUtils</code>.	EmployeeUtils_3.java	6-12	44
51	public class Employee {\r\n\tprivate Long id;\r\n\r\n\tprivate String name;\r\n\r\n\tprivate String address;\r\n\r\n\tprivate String designation;\r\n\r\n\tprivate Float salary;\r\n}	Classe <code>Employee</code> extraída da classe <code>EmployeeUtils</code>.	zEmployee_1.java	\N	43
44	public class LibraryMainControl {\r\n\tprivate Float fineAmount;\r\n\t\r\n\tprivate Person user;\r\n\t\r\n\tprivate Catalog catalog;\r\n\t\r\n\tprivate Item currentItem;\r\n\t\r\n\tpublic void doInventory() { \r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void checkOutItem(Item item) { \r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void checkInItem(Item item) { \r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void addItem(Item item) { \r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void deleteItem(Item item) { \r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void printCatalog(Catalog catalog) { \r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void sortCatalog(Catalog catalog) { \r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void searchCatalog(String term) { \r\n\t\t//...\r\n\t}\r\n}	Os métodos destacados abaixo parecem mais interessados na classe <code>Item</code> do que na própria classe onde foram implementados. Assim, recomendamos mover esses métodos para a referida classe.	LibraryMainControl_1.java	14-28	39
47	public class LibraryMainControl {\r\n\tprivate Float fineAmount;\r\n\t\r\n\tprivate Person user;\r\n\t\r\n\tprivate Catalog catalog;\r\n\t\r\n\tprivate Item currentItem;\r\n\t\r\n\tpublic void doInventory() { \r\n\t\t//...\r\n\t}\r\n}	Os métodos destacados na aba anterior parecem mais interessados na classe <code>Catalog</code>. Assim, movemos os três métodos para a referida classe. O resultado é apresentado logo depois do código final da classe <code>LibraryMainControl</code>.	LibraryMainControl_3.java	\N	41
48	public class Catalog {\r\n\r\n\t// linhas de código omitidas ...\r\n\t\r\n\tpublic void printCatalog(Catalog catalog) { \r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void sortCatalog(Catalog catalog) { \r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void searchCatalog(String term) { \r\n\t\t//...\r\n\t}\r\n\t\r\n\t// linhas de código omitidas ...\r\n}	Classe <code>Catalog</code> depois de receber os novos métodos.	zCatalog_1.java	5-15	41
45	public class LibraryMainControl {\r\n\tprivate Float fineAmount;\r\n\t\r\n\tprivate Person user;\r\n\t\r\n\tprivate Catalog catalog;\r\n\t\r\n\tprivate Item currentItem;\r\n\t\r\n\tpublic void doInventory() { \r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void printCatalog(Catalog catalog) { \r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void sortCatalog(Catalog catalog) { \r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void searchCatalog(String term) { \r\n\t\t//...\r\n\t}\r\n}	Os métodos destacados na aba anterior foram movidos para a classe <code>Item</code>. Abaixo do código da classe <code>LibraryMainControl</code> apresentado a seguir, podemos ver os métodos recebidos pela classe <code>Item</code>. Vale salientar que destacamos na classe <code>LibraryMainControl</code> os métodos que sofrerão novas refatorações do tipo <em>Move Method</em>.	LibraryMainControl_2.java	\N	40
54	public class EmployeeUtils {      \r\n    public void validateEmployee(Employee employee) {\r\n    \t//...\r\n    }\r\n}	Os métodos destacados na aba anterior foram movidos para a classe <code>EmployeeImportExport</code> por apenas conter operações de importação e exportação de <code>Employees</code>. Assim, a classe <code>EmployeeUtils</code> apenas implementa uma funcionalidade, que é a de validar objetos do tipo <code>Employee</code>. O desenvolvedor pode, nesse ponto deixar a classe <code>EmployeeUtils</code> como está. Porém, talvez não seja mais necessário manter essa classe com apenas um método.\r\n\r\nO código omitido do método <code>EmployeeUtils.validateEmployee</code> faz uma série de verificações para saber se o objeto employee é válido ou não. Assim, os detectores de smell marcaram esse método como uma <em>Feature Envy</em>. Já que ele apenas chama métodos e acessa dados da classe <code>Employee</code>,  as heurísticas recomendam mover o método para a classe <code>Employee</code> (isso é feito na próxima aba).	EmployeeUtils_4.java	2-4	45
55	public class EmployeeImportExport {  \r\n\t//...\r\n\r\n    public void exportEmployeeToCSV(Employee employe) {\r\n    \t//...\r\n    }\r\n    \r\n    public void importEmployeeForDb(Employee employee) {\r\n    \t//...\r\n    }  \r\n\r\n    //...\r\n}	Classe <code>EmployeeImportExport</code> com os métodos movidos da classe <code>EmployeeUtils</code>	EmployeeImportExport_1.java	4-10	45
56	public class EmployeeUtils {      \r\n\r\n}	A classe <code>EmployeeUtils</code> ficou com o corpo vazio após essa última refatoração. O que a torna uma <em>Lazy Class</em>. O desenvolvedor deve remover essa classe do sistema ou atribuir novas responsabilidades a ela nesse ponto.	EmployeeUtils_5.java	\N	46
57	public class Employee {\r\n\tprivate Long id;\r\n\r\n\tprivate String name;\r\n\r\n\tprivate String address;\r\n\r\n\tprivate String designation;\r\n\r\n\tprivate Float salary;\r\n\r\n\tpublic void validateEmployee(Employee employee) {\r\n    \t// ...\r\n    }\r\n}	Novo método movido da classe <code>EmployeeUtils</code> para a classe <code>Employee</code>.	Employee_2.java	12-14	46
58	package br.les.opus.auth.core.domain;\r\n\r\nimport java.util.ArrayList;\r\nimport java.util.Collection;\r\nimport java.util.List;\r\nimport java.util.StringTokenizer;\r\nimport java.util.UUID;\r\n\r\nimport javax.persistence.Column;\r\nimport javax.persistence.Entity;\r\nimport javax.persistence.GeneratedValue;\r\nimport javax.persistence.GenerationType;\r\nimport javax.persistence.Id;\r\nimport javax.persistence.Inheritance;\r\nimport javax.persistence.InheritanceType;\r\nimport javax.persistence.JoinColumn;\r\nimport javax.persistence.OneToMany;\r\nimport javax.persistence.OneToOne;\r\nimport javax.persistence.SequenceGenerator;\r\nimport javax.persistence.Table;\r\nimport javax.persistence.Transient;\r\nimport javax.persistence.Version;\r\nimport javax.validation.constraints.NotNull;\r\n\r\nimport org.apache.commons.codec.digest.DigestUtils;\r\nimport org.apache.commons.lang.StringUtils;\r\nimport org.hibernate.annotations.LazyCollection;\r\nimport org.hibernate.annotations.LazyCollectionOption;\r\nimport org.hibernate.annotations.NaturalId;\r\nimport org.hibernate.validator.constraints.Email;\r\nimport org.hibernate.validator.constraints.Length;\r\nimport org.springframework.security.core.GrantedAuthority;\r\nimport org.springframework.security.core.userdetails.UserDetails;\r\n\r\nimport com.fasterxml.jackson.annotation.JsonIgnore;\r\nimport com.fasterxml.jackson.annotation.JsonIgnoreProperties;\r\nimport com.fasterxml.jackson.annotation.JsonProperty;\r\n\r\nimport br.les.opus.auth.core.validators.UniqueUsername;\r\nimport br.les.opus.commons.persistence.IdAware;\r\nimport br.les.opus.dengue.core.domain.Picture;\r\nimport br.les.opus.dengue.core.domain.PoiStatusUpdate;\r\nimport br.les.opus.dengue.core.domain.PointOfInterest;\r\n\r\n/**\r\n * Classe que representa um usuário. Essa classe implementa a\r\n * interface {@link UserDetails} do Spring Security para servir como entidade\r\n * autenticável no framework mencionado.\r\n * \r\n * @author Diego Cedrim\r\n */\r\n@Entity\r\n@JsonIgnoreProperties(ignoreUnknown = true)\r\n@UniqueUsername(payload = {}) //ensures validation on insert/update regarding user name\r\n@Table(name = "system_user")\r\n@Inheritance(strategy = InheritanceType.JOINED)\r\npublic class User implements UserDetails, IdAware<Long> {\r\n\r\n\tprivate static final long serialVersionUID = 5060765600109301997L;\r\n\r\n\t@Id\r\n\t@GeneratedValue(strategy = GenerationType.AUTO, generator = "generator")\r\n\t@SequenceGenerator(name = "generator", sequenceName = "SQ_PK_USER")\r\n\tprivate Long id;\r\n\r\n\t@NotNull\r\n\t@Length(max = 250)\r\n\t@Column(nullable = false)\r\n\tprivate String name;\r\n\r\n\t@NotNull\r\n\t@Length(max = 250)\r\n\t@Column(nullable = false)\r\n\tprivate String password;\r\n\r\n\t@Email\r\n\t@NotNull\r\n\t@NaturalId\r\n\t@Length(max = 250)\r\n\t@Column(unique = true, nullable = false)\r\n\tprivate String username;\r\n\r\n\tprivate Boolean enabled;\r\n\r\n\tprivate Boolean locked;\r\n\t\r\n\t@JsonIgnore\r\n\t@OneToMany(mappedBy = "user")\r\n\tprivate List<PointOfInterest> reports;\r\n\t\r\n\t@JsonIgnore\r\n\t@OneToMany(mappedBy = "user")\r\n\tprivate List<PoiStatusUpdate> poiUpdates;\r\n\r\n\t@JsonIgnore\r\n\t@OneToMany(mappedBy = "user")\r\n\t@LazyCollection(LazyCollectionOption.FALSE)\r\n\tprivate List<UserRole> userRoles;\r\n\t\r\n\t@Transient\r\n\tprivate List<Role> roles;\r\n\t\r\n\t@Transient\r\n\tprivate List<Resource> resources;\r\n\t\r\n\t@JsonIgnore\r\n\t@Version\r\n    @Column(name="opt_lock")\r\n\tprivate Integer version;\r\n\t\r\n\t@OneToOne\r\n\t@JoinColumn(name = "picture_id")\r\n\tprivate Picture avatar;\r\n\t\r\n\tpublic User() {\r\n\t\tthis.reports = new ArrayList<>();\r\n\t\tthis.userRoles = new ArrayList<UserRole>();\r\n\t\tthis.enabled = true;\r\n\t\tthis.locked = false;\r\n\t\tthis.version = 0;\r\n\t}\r\n\t\r\n\tpublic User(facebook4j.User fbUser) {\r\n\t\tthis();\r\n\t\tthis.setEnabled(true);\r\n\t\tthis.setLocked(false);\r\n\t\tthis.setName(fbUser.getName());\r\n\t\tthis.setUsername(fbUser.getEmail());\r\n\t\tString randomPassword = DigestUtils.md5Hex(UUID.randomUUID().toString()); //generates a random password\r\n\t\tthis.setPassword(randomPassword);\r\n\t}\r\n\t\r\n\t@Override\r\n\t@Transient\r\n\t@JsonIgnore\r\n\tpublic Collection<? extends GrantedAuthority> getAuthorities() {\r\n\t\tCollection<Role> authorities = new ArrayList<Role>();\r\n\t\tfor (UserRole userRole : userRoles) {\r\n\t\t\tauthorities.add(userRole.getRole());\r\n\t\t}\r\n\t\treturn authorities;\r\n\t}\r\n\t\r\n\t@JsonIgnore\r\n\tpublic boolean isRoot() {\r\n\t\tfor (GrantedAuthority authority : this.getAuthorities()) {\r\n\t\t\tif (authority.getAuthority().equals(Role.ROOT)) {\r\n\t\t\t\treturn true;\r\n\t\t\t}\r\n\t\t}\r\n\t\treturn false;\r\n\t}\r\n\r\n\t@Transient\r\n\t@JsonIgnore\r\n\tpublic List<Resource> getAllResources() {\r\n\t\tList<Resource> resources = new ArrayList<Resource>();\r\n\t\tfor (UserRole userRole : userRoles) {\r\n\t\t\tList<Resource> roleResource = userRole.getRole().getAllResources();\r\n\t\t\tfor (Resource resource : roleResource) {\r\n\t\t\t\tresources.add(resource);\r\n\t\t\t}\r\n\t\t}\r\n\t\treturn resources;\r\n\t}\r\n\t\r\n\t@Transient\r\n\t@JsonIgnore\r\n\tpublic UserRole findUserRole(Role role) {\r\n\t\tfor (UserRole userRole : this.userRoles) {\r\n\t\t\tRole currentRole = userRole.getRole();\r\n\t\t\tif (currentRole != null && role.getId().equals(currentRole.getId()) ) {\r\n\t\t\t\treturn userRole;\r\n\t\t\t}\r\n\t\t}\r\n\t\treturn null;\r\n\t}\r\n\t\r\n\t@Transient\r\n\tpublic String getShortName() {\r\n\t\tif (StringUtils.isEmpty(this.name)) {\r\n\t\t\treturn null;\r\n\t\t}\r\n\t\tStringTokenizer tokenizer = new StringTokenizer(this.name);\r\n\t\tStringBuffer shortName = new StringBuffer();\r\n\t\tshortName.append(tokenizer.nextToken());\r\n\t\tif (tokenizer.hasMoreTokens()) {\r\n\t\t\tshortName.append(" ");\r\n\t\t\tshortName.append(tokenizer.nextToken());\r\n\t\t}\r\n\t\treturn shortName.toString();\r\n\t}\r\n\t\r\n\tpublic List<Resource> getResources() {\r\n\t\treturn resources;\r\n\t}\r\n\r\n\tpublic void setResources(List<Resource> resources) {\r\n\t\tthis.resources = resources;\r\n\t}\r\n\r\n\tpublic List<Role> getRoles() {\r\n\t\treturn roles;\r\n\t}\r\n\r\n\tpublic void setRoles(List<Role> roles) {\r\n\t\tthis.roles = roles;\r\n\t}\r\n\r\n\t@JsonIgnore\r\n\t@Override\r\n\tpublic String getPassword() {\r\n\t\treturn password;\r\n\t}\r\n\r\n\t@Override\r\n\tpublic String getUsername() {\r\n\t\treturn username;\r\n\t}\r\n\r\n\t@Override\r\n\tpublic boolean isAccountNonExpired() {\r\n\t\treturn true;\r\n\t}\r\n\r\n\t@Override\r\n\tpublic boolean isAccountNonLocked() {\r\n\t\tif (locked == null) {\r\n\t\t\treturn true;\r\n\t\t}\r\n\t\treturn !locked;\r\n\t}\r\n\r\n\t@Override\r\n\tpublic boolean isCredentialsNonExpired() {\r\n\t\treturn true;\r\n\t}\r\n\r\n\t@Override\r\n\tpublic boolean isEnabled() {\r\n\t\treturn enabled;\r\n\t}\r\n\r\n\tpublic Long getId() {\r\n\t\treturn id;\r\n\t}\r\n\r\n\tpublic void setId(Long id) {\r\n\t\tthis.id = id;\r\n\t}\r\n\r\n\tpublic String getName() {\r\n\t\treturn name;\r\n\t}\r\n\r\n\tpublic void setName(String name) {\r\n\t\tthis.name = name;\r\n\t}\r\n\r\n\tpublic Boolean getEnabled() {\r\n\t\treturn enabled;\r\n\t}\r\n\r\n\tpublic void setEnabled(Boolean enabled) {\r\n\t\tthis.enabled = enabled;\r\n\t}\r\n\r\n\tpublic Boolean getLocked() {\r\n\t\treturn locked;\r\n\t}\r\n\r\n\tpublic void setLocked(Boolean locked) {\r\n\t\tthis.locked = locked;\r\n\t}\r\n\r\n\t@JsonProperty\r\n\tpublic void setPassword(String password) {\r\n\t\tthis.password = password;\r\n\t}\r\n\r\n\tpublic void setUsername(String username) {\r\n\t\tthis.username = username;\r\n\t}\r\n\r\n\tpublic List<UserRole> getUserRoles() {\r\n\t\treturn userRoles;\r\n\t}\r\n\r\n\tpublic void setUserRoles(List<UserRole> userRoles) {\r\n\t\tthis.userRoles = userRoles;\r\n\t}\r\n\r\n\t@Override\r\n\tpublic String toString() {\r\n\t\treturn "User [id=" + id + ", name=" + name + ", username="\r\n\t\t\t\t+ username + "]";\r\n\t}\r\n\r\n\t@Override\r\n\tpublic int hashCode() {\r\n\t\tfinal int prime = 31;\r\n\t\tint result = 1;\r\n\t\tresult = prime * result + ((id == null) ? 0 : id.hashCode());\r\n\t\treturn result;\r\n\t}\r\n\r\n\t@Override\r\n\tpublic boolean equals(Object obj) {\r\n\t\tif (this == obj)\r\n\t\t\treturn true;\r\n\t\tif (obj == null)\r\n\t\t\treturn false;\r\n\t\tif (getClass() != obj.getClass())\r\n\t\t\treturn false;\r\n\t\tUser other = (User) obj;\r\n\t\tif (id == null) {\r\n\t\t\tif (other.id != null)\r\n\t\t\t\treturn false;\r\n\t\t} else if (!id.equals(other.id))\r\n\t\t\treturn false;\r\n\t\treturn true;\r\n\t}\r\n\r\n\tpublic Integer getVersion() {\r\n\t\treturn version;\r\n\t}\r\n\r\n\tpublic List<PointOfInterest> getReports() {\r\n\t\treturn reports;\r\n\t}\r\n\r\n\tpublic void setReports(List<PointOfInterest> reports) {\r\n\t\tthis.reports = reports;\r\n\t}\r\n\r\n\tpublic List<PoiStatusUpdate> getPoiUpdates() {\r\n\t\treturn poiUpdates;\r\n\t}\r\n\r\n\tpublic void setPoiUpdates(List<PoiStatusUpdate> poiUpdates) {\r\n\t\tthis.poiUpdates = poiUpdates;\r\n\t}\r\n\r\n\tpublic Picture getAvatar() {\r\n\t\treturn avatar;\r\n\t}\r\n\r\n\tpublic void setAvatar(Picture avatar) {\r\n\t\tthis.avatar = avatar;\r\n\t}\r\n\r\n\tpublic void setVersion(Integer version) {\r\n\t\tthis.version = version;\r\n\t}\r\n\r\n}	O antigo método <code>UserFactory.createUser</code> foi movido para a classe <code>User</code> na forma de um construtor (destacado abaixo). O corpo do método <code>UserFactory.createFromFacebook</code> ficou com apenas uma linha chamando esse novo construtor. Pode parecer intuitivo apenas deletar a classe <code>UserFactory</code>. Porém, outras camadas do sistema continuam chamando o método <code>UserFactory.createFromFacebook</code>. Portanto, é importante manter a assinatura. Depois dessas refatorações, o desenvolvedor pode pensar sobre deletar a classe <code>UserFactory</code> e atualizar todas as chamadas do sistema que apontam para <code>UserFactory.createFromFacebook</code> para o novo construtor de <code>User</code>.	User_1.1.java	123-131	26
13	@Service\r\npublic class IngressoUniversidadeService {\r\n\t\r\n\t@Autowired\r\n\tprivate MatriculaInstitucionalService matiInstService;\r\n\t\r\n\t@Autowired\r\n\tprivate MatriculaAcademicaService matriculaAcademicaService;\r\n\t\r\n\t@Autowired\r\n\tprivate GeradorNumeroMatriculaFactory geradorNumeroMatriculaService;\r\n\t\r\n\t@Autowired\r\n\tprivate ParametroAcademicoCursoService paramService;\r\n\t\r\n\t@Autowired\r\n\tprivate FormaEvasaoService formaEvasaoService;\r\n\t\r\n\t@Autowired\r\n\tprivate FormaIngressoService formaIngressoService;\r\n\t\r\n\t@Autowired\r\n\tprivate VersaoCursoService versaoService;\r\n\t\r\n\t@Autowired\r\n\tprivate DireitoMatriculaService direitoMatriculaService;\r\n\t\r\n\t@Autowired\r\n\tprivate PeriodoLetivoService periodoLetivoService;\r\n\t\t\r\n\t@Autowired\r\n\tprivate PeriodoIngressoCursoEloValidacao periodoIngressoValidacao;\r\n\t\t\t\r\n\t@Autowired\r\n\tprivate OcorrenciaService ocorrenciaService;\r\n\t\r\n\t@Autowired\r\n\tprivate AlunoService alunoService;\r\n\t\r\n\t@Autowired\r\n\tprivate AlunoFeraService alunoFeraService;\r\n\t\r\n\t@Autowired\r\n\tprivate TipoPeriodoService tipoPeriodoService;\r\n\t\r\n\t@Autowired\r\n\tprivate ParametroAcademicoCursoDao parametroAcademicoCursoDao;\r\n\t\r\n\t@Autowired\r\n\tprivate CampusService campusService;\r\n\t\r\n\t@Autowired\r\n\tprivate TurnoService turnoService;\r\n\t\r\n\t@Autowired\r\n\tprivate CalculoNovaMatricula2010EmDiante calculoNovoNumeroMatricula;\r\n\t\r\n\t@Autowired\r\n\tprivate MatriculaInstitucionalDao matriculaInstitucionalDao;\r\n\r\n\r\n\tpublic MatriculaInstitucional matricularReingresso(MatriculaInstitucional matriculaOrigem, Curso cursoDestino, Campus polo){\t\t\t\t\r\n\t\tParametroAcademicoCurso param = paramService.getParametrosCursoAtuais(cursoDestino);\r\n\t\tPeriodoLetivo periodoLetivoAtual = param.getPeriodoLetivoMatricula();\r\n\t\t\r\n\t\tatualizaMatriculaOrigem(matriculaOrigem, periodoLetivoAtual);\r\n\t\tmatiInstService.salvarOuEditar(matriculaOrigem);\r\n\t\t\r\n\t\tCalculoMatricula geradorNumeroMatricula = geradorNumeroMatriculaService.create(periodoLetivoAtual.getAno());\r\n\t\tVersaoCurso versaoDestino = cursoDestino.getVersaoCurso();\r\n\r\n\t\tMatriculaInstitucional matricula = new MatriculaInstitucional(matriculaOrigem, cursoDestino, polo, param,\r\n\t\t\t\tperiodoLetivoAtual, geradorNumeroMatricula, versaoDestino);\r\n\r\n\t\tocorrenciaService.inserirSaidaReingresso(matriculaOrigem, "O aluno(a) fez reingresso para " + cursoDestino.getNomeCompleto());\r\n\t\t\t\t\t\t\r\n\t\tmatiInstService.inserir(matricula);\r\n\t\treturn matricula;\r\n\t}\r\n\r\n\tprivate void atualizaMatriculaOrigem(MatriculaInstitucional matriculaOrigem, PeriodoLetivo periodoLetivoAtual) {\r\n\t\tmatriculaOrigem.setFormaEvasao(formaEvasaoService.carregar(FormaEvasao.REINGRESSO));\r\n\t\tmatriculaOrigem.setAnoEvasao(periodoLetivoAtual.getAno());\r\n\t\tmatriculaOrigem.setPeriodoEvasao(periodoLetivoService.getPeriodoIgnorandoFerias(periodoLetivoAtual));\r\n\t\tmatriculaOrigem.setDireitoMatricula(direitoMatriculaService.carregar(DireitoMatricula.SEM_DIREITO_MATRICULA));\r\n\t}\r\n\t\r\n\t\r\n\tpublic void remanejarMatricula(MatriculaInstitucional remanejada, MatriculaInstitucional excluida){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void permutarMatriculas(MatriculaInstitucional matriculaSegundo, MatriculaInstitucional matriculaPrimeiro){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorSegundaChamada(AlunoFera alunoFera, Curso curso, Campus polo, TipoPeriodo ingresso) throws ValidacaoException\r\n\t{\t\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorSegundaChamada(AlunoFera alunoFeraIngressante, MatriculaInstitucional matriculaDesistente, Campus polo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorForcaDeLei(Aluno aluno, Curso curso, Integer anoIngressoCurso, TipoPeriodo periodoIngressoCurso, Campus polo) throws ValidacaoException {\t\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarDiplomado(Aluno aluno, Curso curso, Campus polo) throws ValidacaoException {\t\r\n\t\t//...\r\n\t}\r\n\r\n\tprivate MatriculaInstitucional matricularInstitucionalPorForcaDeLei(Aluno aluno, Curso curso, Campus polo, Integer anoIngressoCurso, TipoPeriodo periodoIngressoCurso) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\t\r\n\tprivate MatriculaInstitucional matricularInstitucionalPorTipoIngresso(Aluno aluno, Curso curso, Campus polo, Long idFormaIngresso) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\t\r\n\tpublic void criarMatriculaInstitucionalAvulsa(Aluno aluno, Curso cursoSelecionado, Campus polo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorDecisaoJudicial(Aluno aluno, Curso curso, Campus polo) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorMobilidade(Aluno aluno, Curso curso, Campus polo) throws ValidacaoException\r\n\t{\t\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic MatriculaInstitucional ingressarPorTransferencia(Aluno aluno, Curso curso, Integer anoIngressoCurso, TipoPeriodo periodoIngressoCurso, Campus polo) throws ValidacaoException\r\n\t{\t\t\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorConvenio(Aluno aluno, Curso curso, Campus polo) throws ValidacaoException\r\n\t{\t\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional matricularReopcao(MatriculaInstitucional matriculaOrigem, Curso cursoDestino, Campus polo, Turno turnoSelecionado){\r\n\t\t//...\r\n\t}\r\n\t\r\n\t\r\n\tpublic MatriculaInstitucional matricularMudancaRegime(MatriculaInstitucional matriculaOrigem, Curso cursoDestino, Campus polo){\r\n\t\t//...\r\n\t}\r\n}	A refatoração <em>Extract Method</em> aplicada no passo anterior criou o método <code>criarMatricula</code>. Porém, esse método apresenta o mesmo problema apresentado pelo método <code>matricularReingresso</code>. Ele parece muito mais interessado na classe <code>MatriculaInstitucional</code> do que na classe <code>IngressoUniversidadeService</code>. Assim, o algoritmo detectou esse novo método como também sendo uma <em>Feature Envy</em>. Então, recomendou que esse método fosse movido para a classe <code>MatriculaInstitucional</code>. Como esse método é apenas uma maneira específica de criar um objeto do tipo <code>MatriculaInstitucional</code>, então movemos o método <code>criarMatricula</code> para a classe <code>MatriculaInstitucional</code> e o tornamos um construtor. No código abaixo podemos ver o resultado dessa refatoração na classe <code>IngressoUniversidadeService</code>.\r\n\r\nApós apresentar a classe <code>IngressoUniversidadeService</code>, apresentamos também a classe <code>MatriculaInstitucional</code>, que recebeu o novo método	IngressoUniversidadeService_4.java	72,73	13
32	@Service\r\npublic class DiarioClasseService {\r\n\r\n\t@Autowired private DiarioClasseDao diarioClasseDao;\r\n\t@Autowired private TipoAulaService tipoAulaService;\r\n\t@Autowired private ParametroAcademicoCursoService parametroAcademicoCursoService;\r\n\t\t\r\n\t\r\n\tpublic void gerarDiariosClasse(Turma turma){\r\n\t\t\r\n\t\tif (turma.getDisciplinaCurricular().getTipo().isEstagioCurricular()) {\r\n\t\t\treturn;\r\n\t\t}\r\n\t\t\r\n\t\tList<DiarioClasse> listaDiarios = new ArrayList<DiarioClasse>();\r\n\t\tList<HorarioAula> horariosAulas = turma.getHorariosAula();\r\n\t\t\r\n\t\tCalendar calendarioInicio = Calendar.getInstance();\r\n\t\tCalendar calendarioFim = Calendar.getInstance();\r\n\t\t\r\n\t\tParametroAcademicoCurso pCurso = this.parametroAcademicoCursoService.getParametrosCursoAtuais(turma.getCurso());\r\n\t\t\r\n\t\tDate dataInicioPeriodo;\r\n\t\tDate dataFimPeriodo;\r\n\t\tif (turma.getTipoPeriodo().isPeriodoFerias()) {\r\n\t\t\tdataInicioPeriodo = pCurso.getDataInicioPeriodoFerias();\r\n\t\t\tdataFimPeriodo = pCurso.getDataFimPeriodoFerias();\r\n\t\t} else {\r\n\t\t\tdataInicioPeriodo = pCurso.getDataInicioPeriodo();\r\n\t\t\tdataFimPeriodo = pCurso.getDataFimPeriodo();\r\n\t\t}\r\n\t\t\r\n\t\tcalendarioInicio.setTime(dataInicioPeriodo);\r\n\t\tcalendarioInicio.add(Calendar.DATE, -1); //tentativa de correção de bug na criação do primeiro dia letivo.\r\n\t\tcalendarioFim.setTime(dataFimPeriodo);\r\n\t\t\r\n\t\tlong primeiroDiaLetivoEmMilissegundos = calendarioInicio.getTimeInMillis();\r\n\t\tlong ultimoDiaLetivoEmMilissegundos = calendarioFim.getTimeInMillis();\r\n\t\tint diaSemanaInicioPeriodo = calendarioInicio.get(Calendar.DAY_OF_WEEK);\r\n\t\t\t\t\r\n\t\tfor(HorarioAula horario: horariosAulas){\r\n\t\t\tCalendar calendarioTemp = Calendar.getInstance();\r\n\t\t\t\r\n\t\t\t// Diminui um pois a contagem do dia na semana na Calendar se inicia em Zero\r\n\t\t\tint diaSemanaHorarioAula = horario.getDiaSemana().getOpcaoPk().getCodigoItemTabela().intValue();\r\n\t\t\tint qtdDiasParaAdicionar = 0;\r\n\t\t\tint numeroMilissegundos = 0;\r\n\t\t\t\r\n\t\t\tqtdDiasParaAdicionar = calculaQtdDias(diaSemanaInicioPeriodo, diaSemanaHorarioAula);\r\n\t\t\t\r\n\t\t\tnumeroMilissegundos = qtdDiasParaAdicionar*(24 * 60 * 60)*1000;\r\n\t\t\tint numeroMilissegundosEmUmaSemana = 7*24*60*60*1000;\r\n\t\t\t\r\n\t\t\t// Encontra o primeiro diario\r\n\t\t\tcalendarioTemp.setTimeInMillis(primeiroDiaLetivoEmMilissegundos + numeroMilissegundos);\r\n\t\t\t\r\n\t\t\twhile (calendarioTemp.getTimeInMillis() < ultimoDiaLetivoEmMilissegundos){\r\n\t\t\t\tDiarioClasse diario = criarDiario(turma, horario, calendarioTemp);\r\n\t\t\t\t\r\n\t\t\t\tlistaDiarios.add(diario);\r\n\t\t\t\t\r\n\t\t\t\tcalendarioTemp.setTimeInMillis(calendarioTemp.getTimeInMillis()+numeroMilissegundosEmUmaSemana);\r\n\t\t\t}\t\t\t\r\n\t\t}\r\n\t\t\r\n\t\tString listaIds = gerarListaIds(listaDiarios);\r\n\t\t\t\t\t\t\r\n\t\t// Remove os diarios que não pertencem aos horarios da turma devido a alterações ou exclusoes de horarios\r\n\t\t this.diarioClasseDao.excluirDiariosAlteradosOuRemovidosDaTurma(turma, listaIds);\r\n\t\t\t\t\r\n\t}\r\n\r\n\r\n\tprivate DiarioClasse criarDiario(Turma turma, HorarioAula horario, Calendar calendarioTemp) {\r\n\t\tDiarioClasse diario = new DiarioClasse();\r\n\t\t\r\n\t\tdiario.setData(calendarioTemp.getTime());\r\n\t\tdiario.setHora(horario.getHoraInicio());\r\n\t\tdiario.setTurma(turma);\r\n\t\tif (horario.getTipoAula()!=null){\r\n\t\t\tdiario.setTipoAula(horario.getTipoAula());\r\n\t\t} else {\r\n\t\t\t// Por default, carrega aulas do tipo teórica\r\n\t\t\tTipoAula tipoAula = tipoAulaService.carregarPorItemTabela(TipoAula.TEORICA);\r\n\t\t\tdiario.setTipoAula(tipoAula);\r\n\t\t}\r\n\t\tdiario.setDataAlteracao(new Date());\r\n\t\tdiario.setHoraAlteracao(new Date());\r\n\t\tdiario.setConcorrencia(0L);\r\n\t\tdiario.setCodOperador(0L);\r\n\t\treturn diario;\r\n\t}\r\n\r\n\r\n\tprivate int calculaQtdDias(int diaSemanaInicioPeriodo, int diaSemanaHorarioAula) {\r\n\t\tint qtdDiasParaAdicionar;\r\n\t\t// Se as aulas são dia de quarta-feira e o período começa na segunda-feira\r\n\t\tif (diaSemanaHorarioAula > diaSemanaInicioPeriodo){\r\n\t\t\tqtdDiasParaAdicionar = diaSemanaHorarioAula - diaSemanaInicioPeriodo;\r\n\t\t} else {\r\n\t\t\t// Vê qtos dias faltam para acabar a semana (ultimo dia = 6) e soma o dia da próxima semana\r\n\t\t\tqtdDiasParaAdicionar = 7 - diaSemanaInicioPeriodo + diaSemanaHorarioAula;\r\n\t\t}\r\n\t\treturn qtdDiasParaAdicionar;\r\n\t}\r\n\r\n\r\n\tprivate String gerarListaIds(List<DiarioClasse> listaDiarios) {\r\n\t\tString listaIds = "";\r\n\t\t\r\n\t\tfor (DiarioClasse d:listaDiarios){\r\n\t\t\tDiarioClasse diario = this.diarioClasseDao.consultarDiarioPorDataHora(d);\r\n\t\t\t\r\n\t\t\tif (diario == null){\r\n\t\t\t\tdiario = this.diarioClasseDao.inserir(d);\r\n\t\t\t} \r\n\t\t\tlistaIds += diario.getId() + ",";\r\n\t\t}\r\n\t\t// Apaga a última vírgula adicionada\r\n\t\tlistaIds = listaIds.substring(0, listaIds.length()-1);\r\n\t\treturn listaIds;\r\n\t}\r\n}	A estrutura <code>while</code> é responsável por criar um novo objeto do tipo <code>DiarioClasse</code> a partir de dados previamente computados. Para diminuir ainda mais a complexidade do método <code>gerarDiariosClasse</code>, uma nova refatoração do tipo <em>Extract Method</em> foi executada e o método <code>criarDiario</code> foi criado.\r\n\r\nAo fazer essa operação, os detectores de smell identificaram esse novo método como sendo uma <em>Feature Envy</em>, já que ele está mais interessado na classe <code>DiarioClasse</code> do que na classe <code>DiarioClasseService</code>. Assim, as heurísticas recomendaram mover esse método para a referida classe.	DiarioClasseService_4.java	58,74-92	32
2	package br.les.opus.commons.persistence.filtering;\r\n\r\nimport java.util.StringTokenizer;\r\n\r\nimport org.hibernate.Criteria;\r\nimport org.hibernate.criterion.Criterion;\r\nimport org.hibernate.criterion.Restrictions;\r\n\r\npublic class Clause {\r\n\r\n\tprivate String field;\r\n\t\r\n\tprivate String queryingField;\r\n\t\r\n\tprivate Object value;\r\n\t\r\n\tprivate ClauseOperator operator;\r\n\t\r\n\tpublic void createAliases(Criteria criteria) {\r\n\t\tif (!field.contains(".")) {\r\n\t\t\treturn;\r\n\t\t}\r\n\t\tStringTokenizer tokenizer = new StringTokenizer(field, ".");\r\n\t\tString lastAlias = "";\r\n\t\tString lastToken = null;\r\n\t\tint index = 1;\r\n\t\twhile (tokenizer.hasMoreTokens()) {\r\n\t\t\tString token = tokenizer.nextToken();\r\n\t\t\tif (tokenizer.hasMoreTokens()) {\r\n\t\t\t\tString nextAlias = "alias" + index++;\r\n\t\t\t\tcriteria.createAlias(lastAlias + token, nextAlias);\r\n\t\t\t\tlastAlias = nextAlias + ".";\r\n\t\t\t}\r\n\t\t\tlastToken = token;\r\n\t\t}\r\n\t\tthis.queryingField = lastAlias + lastToken;\r\n\t}\r\n\t\r\n\t\r\n\t/**\r\n\t * Diz se o valor da clausula pode ser usado com um like ou não\r\n\t * @return\r\n\t */\r\n\tpublic boolean isLikeable() {\r\n\t\tif (value instanceof String) {\r\n\t\t\tString stringValue = (String)value;\r\n\t\t\treturn stringValue.contains("*");\r\n\t\t}\r\n\t\treturn false;\r\n\t}\r\n\t\r\n\tprivate Criterion getEqualityCriterion() {\r\n\t\tif (operator.equals(ClauseOperator.IS_NULL)) { \r\n\t\t\treturn Restrictions.isNull(queryingField);\r\n\t\t} else if (operator.equals(ClauseOperator.EQUALS) && isLikeable()) { \r\n\t\t\treturn Restrictions.ilike(queryingField, this.getSQLValue());\r\n\t\t} else if (operator.equals(ClauseOperator.EQUALS) && !isLikeable()) {\r\n\t\t\treturn Restrictions.eq(queryingField, this.value);\r\n\t\t} else if (operator.equals(ClauseOperator.IS_NOT_NULL)) {\r\n\t\t\treturn Restrictions.isNotNull(queryingField);\r\n\t\t} else if (operator.equals(ClauseOperator.NOT_EQUALS)) {\r\n\t\t\treturn Restrictions.ne(queryingField, this.value);\r\n\t\t}\r\n\t\treturn null;\r\n\t}\r\n\t\r\n\tpublic Criterion toCriterion() {\r\n\t\tCriterion equality = getEqualityCriterion();\r\n\t\tif (equality != null) {\r\n\t\t\treturn equality;\r\n\t\t}\r\n\t\t\r\n\t\tif (operator.equals(ClauseOperator.GREATER)) {\r\n\t\t\treturn Restrictions.gt(queryingField, this.value);\r\n\t\t} else if (operator.equals(ClauseOperator.GREATER_EQUAL)) {\r\n\t\t\treturn Restrictions.ge(queryingField, this.value);\r\n\t\t} else if (operator.equals(ClauseOperator.LESSER)) {\r\n\t\t\treturn Restrictions.lt(queryingField, this.value);\r\n\t\t} else if (operator.equals(ClauseOperator.LESSER_EQUAL)) {\r\n\t\t\treturn Restrictions.le(queryingField, this.value);\r\n\t\t} \r\n\t\tthrow new FilteringException("Nenhum Criterion associado ao operador " + this);\r\n\t}\r\n\t\r\n\t/**\r\n\t * Remove os asteriscos da string colocando % no lugar\r\n\t * @param value\r\n\t * @return\r\n\t */\r\n\tprivate String replaceAsterisks(String value) {\r\n\t\tString newValue = value;\r\n\t\tint lastIndex = value.length() - 1;\r\n\t\tif (value.charAt(0) == '*') {\r\n\t\t\tnewValue = "%" + newValue.substring(1, lastIndex + 1);\r\n\t\t}\r\n\t\tif (value.charAt(lastIndex) == '*') {\r\n\t\t\tnewValue = newValue.substring(0, lastIndex) + "%"; \r\n\t\t}\r\n\t\treturn newValue;\r\n\t}\r\n\t\r\n\tpublic String getSQLValue() {\r\n\t\treturn replaceAsterisks((String)this.value);\r\n\t}\r\n\t\r\n\tpublic Clause(String field, Object value, ClauseOperator operator) {\r\n\t\tthis.field = field;\r\n\t\tthis.value = value;\r\n\t\tthis.operator = operator;\r\n\t\tthis.queryingField = field;\r\n\t}\r\n\t\r\n\r\n\tpublic String getField() {\r\n\t\treturn field;\r\n\t}\r\n\r\n\tpublic ClauseOperator getOperator() {\r\n\t\treturn operator;\r\n\t}\r\n\r\n\t@Override\r\n\tpublic String toString() {\r\n\t\treturn "Clause [field=" + field + ", value=" + value + ", operator="\r\n\t\t\t\t+ operator + "]";\r\n\t}\r\n}	O método <code>getEqualityCriterion</code> foi extraído do método <code>toCriterion</code>. A complexidade do método <code>toCriterion</code> foi reduzida, mas ainda existe um trecho que pode ser extraído para um novo método.	Clause_2.java	52-65,68-71	9
28	package br.les.opus.commons.persistence.filtering;\r\n\r\nimport java.util.StringTokenizer;\r\n\r\nimport org.hibernate.Criteria;\r\nimport org.hibernate.criterion.Criterion;\r\nimport org.hibernate.criterion.Restrictions;\r\n\r\npublic class Clause {\r\n\r\n\tprivate String field;\r\n\t\r\n\tprivate String queryingField;\r\n\t\r\n\tprivate Object value;\r\n\t\r\n\tprivate ClauseOperator operator;\r\n\t\r\n\tpublic void createAliases(Criteria criteria) {\r\n\t\tif (!field.contains(".")) {\r\n\t\t\treturn;\r\n\t\t}\r\n\t\tStringTokenizer tokenizer = new StringTokenizer(field, ".");\r\n\t\tString lastAlias = "";\r\n\t\tString lastToken = null;\r\n\t\tint index = 1;\r\n\t\twhile (tokenizer.hasMoreTokens()) {\r\n\t\t\tString token = tokenizer.nextToken();\r\n\t\t\tif (tokenizer.hasMoreTokens()) {\r\n\t\t\t\tString nextAlias = "alias" + index++;\r\n\t\t\t\tcriteria.createAlias(lastAlias + token, nextAlias);\r\n\t\t\t\tlastAlias = nextAlias + ".";\r\n\t\t\t}\r\n\t\t\tlastToken = token;\r\n\t\t}\r\n\t\tthis.queryingField = lastAlias + lastToken;\r\n\t}\r\n\t\r\n\t\r\n\t/**\r\n\t * Diz se o valor da clausula pode ser usado com um like ou não\r\n\t * @return\r\n\t */\r\n\tpublic boolean isLikeable() {\r\n\t\tif (value instanceof String) {\r\n\t\t\tString stringValue = (String)value;\r\n\t\t\treturn stringValue.contains("*");\r\n\t\t}\r\n\t\treturn false;\r\n\t}\r\n\t\r\n\tprivate Criterion getEqualityCriterion() {\r\n\t\tif (operator.equals(ClauseOperator.IS_NULL)) { \r\n\t\t\treturn Restrictions.isNull(queryingField);\r\n\t\t} else if (operator.equals(ClauseOperator.EQUALS) && isLikeable()) { \r\n\t\t\treturn Restrictions.ilike(queryingField, this.getSQLValue());\r\n\t\t} else if (operator.equals(ClauseOperator.EQUALS) && !isLikeable()) {\r\n\t\t\treturn Restrictions.eq(queryingField, this.value);\r\n\t\t} else if (operator.equals(ClauseOperator.IS_NOT_NULL)) {\r\n\t\t\treturn Restrictions.isNotNull(queryingField);\r\n\t\t} else if (operator.equals(ClauseOperator.NOT_EQUALS)) {\r\n\t\t\treturn Restrictions.ne(queryingField, this.value);\r\n\t\t}\r\n\t\treturn null;\r\n\t}\r\n\t\r\n\tprivate Criterion getComparisonCriterion() {\r\n\t\tif (operator.equals(ClauseOperator.GREATER)) {\r\n\t\t\treturn Restrictions.gt(queryingField, this.value);\r\n\t\t} else if (operator.equals(ClauseOperator.GREATER_EQUAL)) {\r\n\t\t\treturn Restrictions.ge(queryingField, this.value);\r\n\t\t} else if (operator.equals(ClauseOperator.LESSER)) {\r\n\t\t\treturn Restrictions.lt(queryingField, this.value);\r\n\t\t} else if (operator.equals(ClauseOperator.LESSER_EQUAL)) {\r\n\t\t\treturn Restrictions.le(queryingField, this.value);\r\n\t\t}\r\n\t\treturn null;\r\n\t}\r\n\t\r\n\tpublic Criterion toCriterion() {\r\n\t\tCriterion equality = getEqualityCriterion();\r\n\t\tif (equality != null) {\r\n\t\t\treturn equality;\r\n\t\t}\r\n\t\t\r\n\t\tCriterion comparison = getComparisonCriterion();\r\n\t\tif (comparison != null) {\r\n\t\t\treturn comparison;\r\n\t\t}\r\n\t\tthrow new FilteringException("Nenhum Criterion associado ao operador " + this);\r\n\t}\r\n\t\r\n\t/**\r\n\t * Remove os asteriscos da string colocando % no lugar\r\n\t * @param value\r\n\t * @return\r\n\t */\r\n\tprivate String replaceAsterisks(String value) {\r\n\t\tString newValue = value;\r\n\t\tint lastIndex = value.length() - 1;\r\n\t\tif (value.charAt(0) == '*') {\r\n\t\t\tnewValue = "%" + newValue.substring(1, lastIndex + 1);\r\n\t\t}\r\n\t\tif (value.charAt(lastIndex) == '*') {\r\n\t\t\tnewValue = newValue.substring(0, lastIndex) + "%"; \r\n\t\t}\r\n\t\treturn newValue;\r\n\t}\r\n\t\r\n\tpublic String getSQLValue() {\r\n\t\treturn replaceAsterisks((String)this.value);\r\n\t}\r\n\t\r\n\tpublic Clause(String field, Object value, ClauseOperator operator) {\r\n\t\tthis.field = field;\r\n\t\tthis.value = value;\r\n\t\tthis.operator = operator;\r\n\t\tthis.queryingField = field;\r\n\t}\r\n\t\r\n\r\n\tpublic String getField() {\r\n\t\treturn field;\r\n\t}\r\n\r\n\tpublic ClauseOperator getOperator() {\r\n\t\treturn operator;\r\n\t}\r\n\r\n\t@Override\r\n\tpublic String toString() {\r\n\t\treturn "Clause [field=" + field + ", value=" + value + ", operator="\r\n\t\t\t\t+ operator + "]";\r\n\t}\r\n}	O método <code>getComparisonCriterion</code> foi extraído de <code>toCriterion</code>, encerrando assim a sequência de refatorações.	Clause_3.java	67-78,86-89	28
46	public class Item {\r\n\tprivate Long id;\r\n\t\r\n\tprivate String name;\r\n\t\r\n\t// linhas de código omitidas ...\r\n\t\r\n\tpublic void checkOutItem(Item item) { \r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void checkInItem(Item item) { \r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void addItem(Item item) { \r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void deleteItem(Item item) { \r\n\t\t//...\r\n\t}\r\n\t\r\n\t// linhas de código omitidas ...\r\n}	Classe <code>Item</code> depois de receber os novos métodos.	Item_1.java	8-22	40
41	@Service\r\npublic class TurmaService extends AbstractService<Turma, Long> {\r\n\t//...\r\n\r\n\tpublic List<Turma> getTurmas(List<MatriculaAcademica> matriculas){\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic List<Turma> getTurmasOfertadasAluno(MatriculaInstitucional matricula){\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic List<Turma> listarTurmas(MatriculaInstitucional matricula, List<DisciplinaCurricular> disciplinas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<Turma> listarTurmasPorPeriodo(MatriculaInstitucional matricula, List<DisciplinaCurricular> disciplinas, PeriodoLetivo periodo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<Turma> listarTurmasRemanescentes(MatriculaInstitucional matricula, List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic List<Turma> aplicarFiltroMatriculaIsolada(List<Turma> turmas){\r\n\t\t//...\r\n\t}\r\n\r\n\t//...\r\n}	Abaixo podemos ver a classe <code>TurmaService</code> que recebeu os métodos listados acima.	TurmaService_1.java	5-27	21
16	package br.les.opus.instagram.domain;\r\n\r\nimport java.util.Date;\r\nimport java.util.List;\r\n\r\nimport javax.persistence.CascadeType;\r\nimport javax.persistence.CollectionTable;\r\nimport javax.persistence.Column;\r\nimport javax.persistence.ElementCollection;\r\nimport javax.persistence.Entity;\r\nimport javax.persistence.FetchType;\r\nimport javax.persistence.Id;\r\nimport javax.persistence.JoinColumn;\r\nimport javax.persistence.ManyToOne;\r\nimport javax.persistence.OneToMany;\r\nimport javax.persistence.OneToOne;\r\nimport javax.persistence.Table;\r\nimport javax.persistence.Transient;\r\n\r\nimport com.fasterxml.jackson.annotation.JsonIgnore;\r\nimport com.google.gson.annotations.SerializedName;\r\n\r\n@Entity\r\n@Table(name = "media", schema = "instagram")\r\npublic class Media {\r\n\r\n\t@Id\r\n\tprivate String id;\r\n\r\n\tprivate String type;\r\n\r\n\tprivate String filter;\r\n\r\n\t@ElementCollection\r\n\t@CollectionTable(name="media_tag", schema = "instagram",  joinColumns = @JoinColumn(name="media_id"))\r\n\t@JsonIgnore\r\n\t@Column(name="tag")\r\n\tprivate List<String> tags;\r\n\r\n\t@OneToOne(cascade = CascadeType.ALL)\r\n\t@JsonIgnore\r\n\t@JoinColumn(name = "comments_envelope_id")\r\n\tprivate CommentsEnvelope comments;\r\n\t\r\n\t@OneToOne(cascade = CascadeType.ALL)\r\n\t@JoinColumn(name = "caption_id")\r\n\tprivate Comment caption;\r\n\t\r\n\t@OneToOne(cascade = CascadeType.ALL)\r\n\t@JsonIgnore\r\n\t@JoinColumn(name = "likes_envelope_id")\r\n\tprivate LikesEnvelope likes;\r\n\t\r\n\tprivate String link;\r\n\t\r\n\t@ManyToOne(cascade = CascadeType.ALL)\r\n\t@JoinColumn(name = "user_id")\r\n\tprivate InstagramUser user;\r\n\t\r\n\t@SerializedName("created_time")\r\n\tprivate Date createdTime;\r\n\t\r\n\t@OneToOne(cascade = CascadeType.ALL)\r\n\t@JoinColumn(name = "picture_pool_id")\r\n\tprivate PicturePool images;\r\n\t\r\n\t@OneToOne(cascade = CascadeType.ALL)\r\n\t@JoinColumn(name = "video_pool_id")\r\n\tprivate VideoPool videos;\r\n\t\r\n\t@ManyToOne(cascade = CascadeType.ALL)\r\n\t@JoinColumn(name = "location_id")\r\n\tprivate Location location;\r\n\t\r\n\t@SerializedName("users_in_photo")\r\n\t@JsonIgnore\r\n\t@OneToMany(mappedBy = "media", cascade = CascadeType.ALL, fetch = FetchType.EAGER)\r\n\tprivate List<UserInPhoto> taggedUsers;\r\n\t\r\n\t@Transient\r\n\tpublic boolean isValid() {\r\n\t\tif (images == null && videos == null) {\r\n\t\t\treturn false;\r\n\t\t}\r\n\t\tif (images != null && !images.isValid()) {\r\n\t\t\treturn false;\r\n\t\t}\r\n\t\tif (videos != null && !videos.isValid()) {\r\n\t\t\treturn false;\r\n\t\t}\r\n\t\treturn true; \r\n\t}\r\n\t\r\n\tpublic void replaceImages(PicturePool oldPool) {\r\n\t\tif (this.images == null) {\r\n\t\t\treturn;\r\n\t\t}\r\n\t\timages.update(oldPool);\r\n\t}\r\n\t\r\n\tpublic void replaceVideos(VideoPool oldVideoPool) {\r\n\t\tif (this.videos == null) {\r\n\t\t\treturn;\r\n\t\t}\r\n\t\tvideos.setId(oldVideoPool.getId());\r\n\t\tvideos.getLowResolution().setId(oldVideoPool.getLowResolution().getId());\r\n\t\tvideos.getStandardResolution().setId(oldVideoPool.getStandardResolution().getId());\r\n\t}\r\n\t\r\n\tpublic List<UserInPhoto> getTaggedUsers() {\r\n\t\treturn taggedUsers;\r\n\t}\r\n\r\n\tpublic void setTaggedUsers(List<UserInPhoto> taggedUsers) {\r\n\t\tthis.taggedUsers = taggedUsers;\r\n\t}\r\n\r\n\tpublic String getId() {\r\n\t\treturn id;\r\n\t}\r\n\r\n\tpublic void setId(String id) {\r\n\t\tthis.id = id;\r\n\t}\r\n\r\n\tpublic String getType() {\r\n\t\treturn type;\r\n\t}\r\n\r\n\tpublic void setType(String type) {\r\n\t\tthis.type = type;\r\n\t}\r\n\r\n\tpublic String getFilter() {\r\n\t\treturn filter;\r\n\t}\r\n\r\n\tpublic void setFilter(String filter) {\r\n\t\tthis.filter = filter;\r\n\t}\r\n\r\n\tpublic List<String> getTags() {\r\n\t\treturn tags;\r\n\t}\r\n\r\n\tpublic void setTags(List<String> tags) {\r\n\t\tthis.tags = tags;\r\n\t}\r\n\r\n\tpublic CommentsEnvelope getComments() {\r\n\t\treturn comments;\r\n\t}\r\n\r\n\tpublic void setComments(CommentsEnvelope comments) {\r\n\t\tthis.comments = comments;\r\n\t}\r\n\r\n\tpublic Comment getCaption() {\r\n\t\treturn caption;\r\n\t}\r\n\r\n\tpublic void setCaption(Comment caption) {\r\n\t\tthis.caption = caption;\r\n\t}\r\n\r\n\tpublic LikesEnvelope getLikes() {\r\n\t\treturn likes;\r\n\t}\r\n\r\n\tpublic void setLikes(LikesEnvelope likes) {\r\n\t\tthis.likes = likes;\r\n\t}\r\n\r\n\tpublic String getLink() {\r\n\t\treturn link;\r\n\t}\r\n\r\n\tpublic void setLink(String link) {\r\n\t\tthis.link = link;\r\n\t}\r\n\r\n\tpublic InstagramUser getUser() {\r\n\t\treturn user;\r\n\t}\r\n\r\n\tpublic void setUser(InstagramUser user) {\r\n\t\tthis.user = user;\r\n\t}\r\n\r\n\tpublic Date getCreatedTime() {\r\n\t\treturn createdTime;\r\n\t}\r\n\r\n\tpublic void setCreatedTime(Date createdTime) {\r\n\t\tthis.createdTime = createdTime;\r\n\t}\r\n\r\n\tpublic PicturePool getImages() {\r\n\t\treturn images;\r\n\t}\r\n\r\n\tpublic void setImages(PicturePool images) {\r\n\t\tthis.images = images;\r\n\t}\r\n\r\n\tpublic VideoPool getVideos() {\r\n\t\treturn videos;\r\n\t}\r\n\r\n\tpublic void setVideos(VideoPool videos) {\r\n\t\tthis.videos = videos;\r\n\t}\r\n\r\n\tpublic Location getLocation() {\r\n\t\treturn location;\r\n\t}\r\n\r\n\tpublic void setLocation(Location location) {\r\n\t\tthis.location = location;\r\n\t}\r\n\t\r\n}	O método <code>updatePool</code> foi movido pra classe <code>PicturePool</code> por parecer mais interessado nela.	Media_3.java	98	16
59	package br.les.opus.instagram.domain;\r\n\r\nimport javax.persistence.CascadeType;\r\nimport javax.persistence.Entity;\r\nimport javax.persistence.GeneratedValue;\r\nimport javax.persistence.GenerationType;\r\nimport javax.persistence.Id;\r\nimport javax.persistence.JoinColumn;\r\nimport javax.persistence.OneToOne;\r\nimport javax.persistence.SequenceGenerator;\r\nimport javax.persistence.Table;\r\nimport javax.persistence.Transient;\r\n\r\nimport com.google.gson.annotations.SerializedName;\r\n\r\n@Entity\r\n@Table(name = "picture_pool", schema = "instagram")\r\npublic class PicturePool {\r\n\r\n\t@Id\r\n\t@GeneratedValue(strategy = GenerationType.AUTO, generator = "generator")\r\n\t@SequenceGenerator(name = "generator", sequenceName = "SQ_PK_PICTURE_POOL", schema = "instagram")\r\n\tprivate Long id;\r\n\t\r\n\t@SerializedName("low_resolution")\r\n\t@OneToOne(cascade = CascadeType.ALL)\r\n\t@JoinColumn(name = "low_id")\r\n\tprivate InstagramPicture lowResolution;\r\n\t\r\n\t@OneToOne(cascade = CascadeType.ALL)\r\n\t@JoinColumn(name = "thumbnail_id")\r\n\tprivate InstagramPicture thumbnail;\r\n\t\r\n\t@SerializedName("standard_resolution")\r\n\t@OneToOne(cascade = CascadeType.ALL)\r\n\t@JoinColumn(name = "std_id")\r\n\tprivate InstagramPicture standardResolution;\r\n\t\r\n\t@Transient\r\n\tpublic boolean isValid() {\r\n\t\treturn  lowResolution != null && lowResolution.isValid()\r\n\t\t\t\t&& standardResolution != null && standardResolution.isValid()\r\n\t\t\t\t&& thumbnail != null && thumbnail.isValid();\r\n\t}\r\n\t\r\n\tpublic void update(PicturePool oldPool) {\r\n\t\tthis.setId(oldPool.getId());\r\n\t\tthis.getLowResolution().setId(oldPool.getLowResolution().getId());\r\n\t\tthis.getStandardResolution().setId(oldPool.getStandardResolution().getId());\r\n\t\tthis.getThumbnail().setId(oldPool.getThumbnail().getId());\r\n\t}\r\n\r\n\tpublic Long getId() {\r\n\t\treturn id;\r\n\t}\r\n\r\n\tpublic void setId(Long id) {\r\n\t\tthis.id = id;\r\n\t}\r\n\r\n\tpublic InstagramPicture getLowResolution() {\r\n\t\treturn lowResolution;\r\n\t}\r\n\r\n\tpublic void setLowResolution(InstagramPicture lowResolution) {\r\n\t\tthis.lowResolution = lowResolution;\r\n\t}\r\n\r\n\tpublic InstagramPicture getThumbnail() {\r\n\t\treturn thumbnail;\r\n\t}\r\n\r\n\tpublic void setThumbnail(InstagramPicture thumbnail) {\r\n\t\tthis.thumbnail = thumbnail;\r\n\t}\r\n\r\n\tpublic InstagramPicture getStandardResolution() {\r\n\t\treturn standardResolution;\r\n\t}\r\n\r\n\tpublic void setStandardResolution(InstagramPicture standardResolution) {\r\n\t\tthis.standardResolution = standardResolution;\r\n\t}\r\n\t\r\n}	As linhas destacadas apresentam o resultado da refatoração <em>Move Method</em> aplicada na classe <code>Media</code>. O método <code>Media.updatePool</code> foi movido para a classe <code>PicturePool</code> e renomeado para apenas <code>PicturePool.update</code>	PicturePool_1.1.java	46-51	16
10	@Service\r\npublic class IngressoUniversidadeService {\r\n\t\r\n\t@Autowired\r\n\tprivate MatriculaInstitucionalService matiInstService;\r\n\t\r\n\t@Autowired\r\n\tprivate MatriculaAcademicaService matriculaAcademicaService;\r\n\t\r\n\t@Autowired\r\n\tprivate GeradorNumeroMatriculaFactory geradorNumeroMatriculaService;\r\n\t\r\n\t@Autowired\r\n\tprivate ParametroAcademicoCursoService paramService;\r\n\t\r\n\t@Autowired\r\n\tprivate FormaEvasaoService formaEvasaoService;\r\n\t\r\n\t@Autowired\r\n\tprivate FormaIngressoService formaIngressoService;\r\n\t\r\n\t@Autowired\r\n\tprivate VersaoCursoService versaoService;\r\n\t\r\n\t@Autowired\r\n\tprivate DireitoMatriculaService direitoMatriculaService;\r\n\t\r\n\t@Autowired\r\n\tprivate PeriodoLetivoService periodoLetivoService;\r\n\t\t\r\n\t@Autowired\r\n\tprivate PeriodoIngressoCursoEloValidacao periodoIngressoValidacao;\r\n\t\t\t\r\n\t@Autowired\r\n\tprivate OcorrenciaService ocorrenciaService;\r\n\t\r\n\t@Autowired\r\n\tprivate AlunoService alunoService;\r\n\t\r\n\t@Autowired\r\n\tprivate AlunoFeraService alunoFeraService;\r\n\t\r\n\t@Autowired\r\n\tprivate TipoPeriodoService tipoPeriodoService;\r\n\t\r\n\t@Autowired\r\n\tprivate ParametroAcademicoCursoDao parametroAcademicoCursoDao;\r\n\t\r\n\t@Autowired\r\n\tprivate CampusService campusService;\r\n\t\r\n\t@Autowired\r\n\tprivate TurnoService turnoService;\r\n\t\r\n\t@Autowired\r\n\tprivate CalculoNovaMatricula2010EmDiante calculoNovoNumeroMatricula;\r\n\t\r\n\t@Autowired\r\n\tprivate MatriculaInstitucionalDao matriculaInstitucionalDao;\r\n\r\n\r\n\tpublic MatriculaInstitucional matricularReingresso(MatriculaInstitucional matriculaOrigem, Curso cursoDestino, Campus polo){\t\t\t\t\r\n\t\tParametroAcademicoCurso param = paramService.getParametrosCursoAtuais(cursoDestino);\r\n\t\tPeriodoLetivo periodoLetivoAtual = param.getPeriodoLetivoMatricula();\r\n\t\t\r\n\t\tmatriculaOrigem.setFormaEvasao(formaEvasaoService.carregar(FormaEvasao.REINGRESSO));\r\n\t\tmatriculaOrigem.setAnoEvasao(periodoLetivoAtual.getAno());\r\n\t\tmatriculaOrigem.setPeriodoEvasao(periodoLetivoService.getPeriodoIgnorandoFerias(periodoLetivoAtual));\r\n\t\tmatriculaOrigem.setDireitoMatricula(direitoMatriculaService.carregar(DireitoMatricula.SEM_DIREITO_MATRICULA));\r\n\t\tmatiInstService.salvarOuEditar(matriculaOrigem);\r\n\t\t\r\n\t\tMatriculaInstitucional matricula = new MatriculaInstitucional();\t\t\r\n\t\tVersaoCurso versaoDestino = cursoDestino.getVersaoCurso();\t\t\r\n\t\tCalculoMatricula geradorNumeroMatricula = geradorNumeroMatriculaService.create(periodoLetivoAtual.getAno());\r\n\t\t\t\r\n\t\tmatricula.setVersaoCurso(versaoDestino);\r\n\t\tmatricula.setAluno(matriculaOrigem.getAluno());\r\n\t\tmatricula.setAnoIngressoInstituicao(matriculaOrigem.getAnoIngressoInstituicao());\r\n\t\tmatricula.setPeriodoIngressoInstituicao(matriculaOrigem.getPeriodoIngressoInstituicao());\r\n\t\tmatricula.setAnoIngresso(periodoLetivoAtual.getAno());\r\n\t\tmatricula.setPeriodoAtual(1);\r\n\t\tmatricula.setTipoLocalVestibular("I");\r\n\t\tmatricula.setVersao(0l);\r\n\t\tmatricula.setPolo(polo);\r\n\t\tmatricula.setTurno(cursoDestino.getTurno());\r\n\t\tgeradorNumeroMatricula.calcular(matricula, NivelMatricula.GRADUACAO, param);\r\n\r\n\t\tocorrenciaService.inserirSaidaReingresso(matriculaOrigem, "O aluno(a) fez reingresso para " + cursoDestino.getNomeCompleto());\r\n\t\t\t\t\t\t\r\n\t\tmatiInstService.inserir(matricula);\r\n\t\treturn matricula;\r\n\t}\r\n\t\r\n\t\r\n\tpublic void remanejarMatricula(MatriculaInstitucional remanejada, MatriculaInstitucional excluida){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void permutarMatriculas(MatriculaInstitucional matriculaSegundo, MatriculaInstitucional matriculaPrimeiro){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorSegundaChamada(AlunoFera alunoFera, Curso curso, Campus polo, TipoPeriodo ingresso) throws ValidacaoException\r\n\t{\t\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorSegundaChamada(AlunoFera alunoFeraIngressante, MatriculaInstitucional matriculaDesistente, Campus polo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorForcaDeLei(Aluno aluno, Curso curso, Integer anoIngressoCurso, TipoPeriodo periodoIngressoCurso, Campus polo) throws ValidacaoException {\t\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarDiplomado(Aluno aluno, Curso curso, Campus polo) throws ValidacaoException {\t\r\n\t\t//...\r\n\t}\r\n\r\n\tprivate MatriculaInstitucional matricularInstitucionalPorForcaDeLei(Aluno aluno, Curso curso, Campus polo, Integer anoIngressoCurso, TipoPeriodo periodoIngressoCurso) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\t\r\n\tprivate MatriculaInstitucional matricularInstitucionalPorTipoIngresso(Aluno aluno, Curso curso, Campus polo, Long idFormaIngresso) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\t\r\n\tpublic void criarMatriculaInstitucionalAvulsa(Aluno aluno, Curso cursoSelecionado, Campus polo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorDecisaoJudicial(Aluno aluno, Curso curso, Campus polo) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorMobilidade(Aluno aluno, Curso curso, Campus polo) throws ValidacaoException\r\n\t{\t\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic MatriculaInstitucional ingressarPorTransferencia(Aluno aluno, Curso curso, Integer anoIngressoCurso, TipoPeriodo periodoIngressoCurso, Campus polo) throws ValidacaoException\r\n\t{\t\t\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorConvenio(Aluno aluno, Curso curso, Campus polo) throws ValidacaoException\r\n\t{\t\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional matricularReopcao(MatriculaInstitucional matriculaOrigem, Curso cursoDestino, Campus polo, Turno turnoSelecionado){\r\n\t\t//...\r\n\t}\r\n\t\r\n\t\r\n\tpublic MatriculaInstitucional matricularMudancaRegime(MatriculaInstitucional matriculaOrigem, Curso cursoDestino, Campus polo){\r\n\t\t//...\r\n\t}\r\n}	Versão original da classe <code>IngressoUniversidadeService</code>. Observe o método destacado abaixo. Ele sofrerá as refatorações recomendadas pelas heurísticas.	IngressoUniversidadeService_1.java	62-92	10
11	@Service\r\npublic class IngressoUniversidadeService {\r\n\t\r\n\t@Autowired\r\n\tprivate MatriculaInstitucionalService matiInstService;\r\n\t\r\n\t@Autowired\r\n\tprivate MatriculaAcademicaService matriculaAcademicaService;\r\n\t\r\n\t@Autowired\r\n\tprivate GeradorNumeroMatriculaFactory geradorNumeroMatriculaService;\r\n\t\r\n\t@Autowired\r\n\tprivate ParametroAcademicoCursoService paramService;\r\n\t\r\n\t@Autowired\r\n\tprivate FormaEvasaoService formaEvasaoService;\r\n\t\r\n\t@Autowired\r\n\tprivate FormaIngressoService formaIngressoService;\r\n\t\r\n\t@Autowired\r\n\tprivate VersaoCursoService versaoService;\r\n\t\r\n\t@Autowired\r\n\tprivate DireitoMatriculaService direitoMatriculaService;\r\n\t\r\n\t@Autowired\r\n\tprivate PeriodoLetivoService periodoLetivoService;\r\n\t\t\r\n\t@Autowired\r\n\tprivate PeriodoIngressoCursoEloValidacao periodoIngressoValidacao;\r\n\t\t\t\r\n\t@Autowired\r\n\tprivate OcorrenciaService ocorrenciaService;\r\n\t\r\n\t@Autowired\r\n\tprivate AlunoService alunoService;\r\n\t\r\n\t@Autowired\r\n\tprivate AlunoFeraService alunoFeraService;\r\n\t\r\n\t@Autowired\r\n\tprivate TipoPeriodoService tipoPeriodoService;\r\n\t\r\n\t@Autowired\r\n\tprivate ParametroAcademicoCursoDao parametroAcademicoCursoDao;\r\n\t\r\n\t@Autowired\r\n\tprivate CampusService campusService;\r\n\t\r\n\t@Autowired\r\n\tprivate TurnoService turnoService;\r\n\t\r\n\t@Autowired\r\n\tprivate CalculoNovaMatricula2010EmDiante calculoNovoNumeroMatricula;\r\n\t\r\n\t@Autowired\r\n\tprivate MatriculaInstitucionalDao matriculaInstitucionalDao;\r\n\r\n\r\n\tpublic MatriculaInstitucional matricularReingresso(MatriculaInstitucional matriculaOrigem, Curso cursoDestino, Campus polo){\t\t\t\t\r\n\t\tParametroAcademicoCurso param = paramService.getParametrosCursoAtuais(cursoDestino);\r\n\t\tPeriodoLetivo periodoLetivoAtual = param.getPeriodoLetivoMatricula();\r\n\t\t\r\n\t\tatualizaMatriculaOrigem(matriculaOrigem, periodoLetivoAtual);\r\n\t\tmatiInstService.salvarOuEditar(matriculaOrigem);\r\n\t\t\r\n\t\tMatriculaInstitucional matricula = new MatriculaInstitucional();\t\t\r\n\t\tVersaoCurso versaoDestino = cursoDestino.getVersaoCurso();\t\t\r\n\t\tCalculoMatricula geradorNumeroMatricula = geradorNumeroMatriculaService.create(periodoLetivoAtual.getAno());\r\n\t\t\t\r\n\t\tmatricula.setVersaoCurso(versaoDestino);\r\n\t\tmatricula.setAluno(matriculaOrigem.getAluno());\r\n\t\tmatricula.setAnoIngressoInstituicao(matriculaOrigem.getAnoIngressoInstituicao());\r\n\t\tmatricula.setPeriodoIngressoInstituicao(matriculaOrigem.getPeriodoIngressoInstituicao());\r\n\t\tmatricula.setAnoIngresso(periodoLetivoAtual.getAno());\r\n\t\tmatricula.setPeriodoAtual(1);\r\n\t\tmatricula.setTipoLocalVestibular("I");\r\n\t\tmatricula.setVersao(0l);\r\n\t\tmatricula.setPolo(polo);\r\n\t\tmatricula.setTurno(cursoDestino.getTurno());\r\n\t\tgeradorNumeroMatricula.calcular(matricula, NivelMatricula.GRADUACAO, param);\r\n\r\n\t\tocorrenciaService.inserirSaidaReingresso(matriculaOrigem, "O aluno(a) fez reingresso para " + cursoDestino.getNomeCompleto());\r\n\t\t\t\t\t\t\r\n\t\tmatiInstService.inserir(matricula);\r\n\t\treturn matricula;\r\n\t}\r\n\r\n\tprivate void atualizaMatriculaOrigem(MatriculaInstitucional matriculaOrigem, PeriodoLetivo periodoLetivoAtual) {\r\n\t\tmatriculaOrigem.setFormaEvasao(formaEvasaoService.carregar(FormaEvasao.REINGRESSO));\r\n\t\tmatriculaOrigem.setAnoEvasao(periodoLetivoAtual.getAno());\r\n\t\tmatriculaOrigem.setPeriodoEvasao(periodoLetivoService.getPeriodoIgnorandoFerias(periodoLetivoAtual));\r\n\t\tmatriculaOrigem.setDireitoMatricula(direitoMatriculaService.carregar(DireitoMatricula.SEM_DIREITO_MATRICULA));\r\n\t}\r\n\t\r\n\t\r\n\tpublic void remanejarMatricula(MatriculaInstitucional remanejada, MatriculaInstitucional excluida){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void permutarMatriculas(MatriculaInstitucional matriculaSegundo, MatriculaInstitucional matriculaPrimeiro){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorSegundaChamada(AlunoFera alunoFera, Curso curso, Campus polo, TipoPeriodo ingresso) throws ValidacaoException\r\n\t{\t\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorSegundaChamada(AlunoFera alunoFeraIngressante, MatriculaInstitucional matriculaDesistente, Campus polo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorForcaDeLei(Aluno aluno, Curso curso, Integer anoIngressoCurso, TipoPeriodo periodoIngressoCurso, Campus polo) throws ValidacaoException {\t\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarDiplomado(Aluno aluno, Curso curso, Campus polo) throws ValidacaoException {\t\r\n\t\t//...\r\n\t}\r\n\r\n\tprivate MatriculaInstitucional matricularInstitucionalPorForcaDeLei(Aluno aluno, Curso curso, Campus polo, Integer anoIngressoCurso, TipoPeriodo periodoIngressoCurso) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\t\r\n\tprivate MatriculaInstitucional matricularInstitucionalPorTipoIngresso(Aluno aluno, Curso curso, Campus polo, Long idFormaIngresso) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\t\r\n\tpublic void criarMatriculaInstitucionalAvulsa(Aluno aluno, Curso cursoSelecionado, Campus polo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorDecisaoJudicial(Aluno aluno, Curso curso, Campus polo) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorMobilidade(Aluno aluno, Curso curso, Campus polo) throws ValidacaoException\r\n\t{\t\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic MatriculaInstitucional ingressarPorTransferencia(Aluno aluno, Curso curso, Integer anoIngressoCurso, TipoPeriodo periodoIngressoCurso, Campus polo) throws ValidacaoException\r\n\t{\t\t\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorConvenio(Aluno aluno, Curso curso, Campus polo) throws ValidacaoException\r\n\t{\t\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional matricularReopcao(MatriculaInstitucional matriculaOrigem, Curso cursoDestino, Campus polo, Turno turnoSelecionado){\r\n\t\t//...\r\n\t}\r\n\t\r\n\t\r\n\tpublic MatriculaInstitucional matricularMudancaRegime(MatriculaInstitucional matriculaOrigem, Curso cursoDestino, Campus polo){\r\n\t\t//...\r\n\t}\r\n}	Algumas linhas de código do método <code>matricularReingresso</code> são extraídas para um novo método chamado <code>atualizaMatriculaOrigem</code>. As linhas destacadas abaixo apresentam essas mudanças.	IngressoUniversidadeService_2.java	66, 91-96	11
12	@Service\r\npublic class IngressoUniversidadeService {\r\n\t\r\n\t@Autowired\r\n\tprivate MatriculaInstitucionalService matiInstService;\r\n\t\r\n\t@Autowired\r\n\tprivate MatriculaAcademicaService matriculaAcademicaService;\r\n\t\r\n\t@Autowired\r\n\tprivate GeradorNumeroMatriculaFactory geradorNumeroMatriculaService;\r\n\t\r\n\t@Autowired\r\n\tprivate ParametroAcademicoCursoService paramService;\r\n\t\r\n\t@Autowired\r\n\tprivate FormaEvasaoService formaEvasaoService;\r\n\t\r\n\t@Autowired\r\n\tprivate FormaIngressoService formaIngressoService;\r\n\t\r\n\t@Autowired\r\n\tprivate VersaoCursoService versaoService;\r\n\t\r\n\t@Autowired\r\n\tprivate DireitoMatriculaService direitoMatriculaService;\r\n\t\r\n\t@Autowired\r\n\tprivate PeriodoLetivoService periodoLetivoService;\r\n\t\t\r\n\t@Autowired\r\n\tprivate PeriodoIngressoCursoEloValidacao periodoIngressoValidacao;\r\n\t\t\t\r\n\t@Autowired\r\n\tprivate OcorrenciaService ocorrenciaService;\r\n\t\r\n\t@Autowired\r\n\tprivate AlunoService alunoService;\r\n\t\r\n\t@Autowired\r\n\tprivate AlunoFeraService alunoFeraService;\r\n\t\r\n\t@Autowired\r\n\tprivate TipoPeriodoService tipoPeriodoService;\r\n\t\r\n\t@Autowired\r\n\tprivate ParametroAcademicoCursoDao parametroAcademicoCursoDao;\r\n\t\r\n\t@Autowired\r\n\tprivate CampusService campusService;\r\n\t\r\n\t@Autowired\r\n\tprivate TurnoService turnoService;\r\n\t\r\n\t@Autowired\r\n\tprivate CalculoNovaMatricula2010EmDiante calculoNovoNumeroMatricula;\r\n\t\r\n\t@Autowired\r\n\tprivate MatriculaInstitucionalDao matriculaInstitucionalDao;\r\n\r\n\r\n\tpublic MatriculaInstitucional matricularReingresso(MatriculaInstitucional matriculaOrigem, Curso cursoDestino, Campus polo){\t\t\t\t\r\n\t\tParametroAcademicoCurso param = paramService.getParametrosCursoAtuais(cursoDestino);\r\n\t\tPeriodoLetivo periodoLetivoAtual = param.getPeriodoLetivoMatricula();\r\n\t\t\r\n\t\tatualizaMatriculaOrigem(matriculaOrigem, periodoLetivoAtual);\r\n\t\tmatiInstService.salvarOuEditar(matriculaOrigem);\r\n\t\t\r\n\t\tCalculoMatricula geradorNumeroMatricula = geradorNumeroMatriculaService.create(periodoLetivoAtual.getAno());\r\n\t\tVersaoCurso versaoDestino = cursoDestino.getVersaoCurso();\r\n\r\n\t\tMatriculaInstitucional matricula = criarMatricula(matriculaOrigem, cursoDestino, polo, param,\r\n\t\t\t\tperiodoLetivoAtual, geradorNumeroMatricula, versaoDestino);\r\n\r\n\t\tocorrenciaService.inserirSaidaReingresso(matriculaOrigem, "O aluno(a) fez reingresso para " + cursoDestino.getNomeCompleto());\r\n\t\t\t\t\t\t\r\n\t\tmatiInstService.inserir(matricula);\r\n\t\treturn matricula;\r\n\t}\r\n\r\n\tprivate MatriculaInstitucional criarMatricula(MatriculaInstitucional matriculaOrigem, Curso cursoDestino,\r\n\t\t\tCampus polo, ParametroAcademicoCurso param, PeriodoLetivo periodoLetivoAtual,\r\n\t\t\tCalculoMatricula geradorNumeroMatricula, \r\n\t\t\tVersaoCurso versaoDestino) {\r\n\t\tMatriculaInstitucional matricula = new MatriculaInstitucional();\r\n\t\tmatricula.setVersaoCurso(versaoDestino);\r\n\t\tmatricula.setAluno(matriculaOrigem.getAluno());\r\n\t\tmatricula.setAnoIngressoInstituicao(matriculaOrigem.getAnoIngressoInstituicao());\r\n\t\tmatricula.setPeriodoIngressoInstituicao(matriculaOrigem.getPeriodoIngressoInstituicao());\r\n\t\tmatricula.setAnoIngresso(periodoLetivoAtual.getAno());\r\n\t\tmatricula.setPeriodoAtual(1);\r\n\t\tmatricula.setTipoLocalVestibular("I");\r\n\t\tmatricula.setVersao(0l);\r\n\t\tmatricula.setPolo(polo);\r\n\t\tmatricula.setTurno(cursoDestino.getTurno());\r\n\t\tgeradorNumeroMatricula.calcular(matricula, NivelMatricula.GRADUACAO, param);\r\n\t\treturn matricula;\r\n\t}\r\n\r\n\tprivate void atualizaMatriculaOrigem(MatriculaInstitucional matriculaOrigem, PeriodoLetivo periodoLetivoAtual) {\r\n\t\tmatriculaOrigem.setFormaEvasao(formaEvasaoService.carregar(FormaEvasao.REINGRESSO));\r\n\t\tmatriculaOrigem.setAnoEvasao(periodoLetivoAtual.getAno());\r\n\t\tmatriculaOrigem.setPeriodoEvasao(periodoLetivoService.getPeriodoIgnorandoFerias(periodoLetivoAtual));\r\n\t\tmatriculaOrigem.setDireitoMatricula(direitoMatriculaService.carregar(DireitoMatricula.SEM_DIREITO_MATRICULA));\r\n\t}\r\n\t\r\n\t\r\n\tpublic void remanejarMatricula(MatriculaInstitucional remanejada, MatriculaInstitucional excluida){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic void permutarMatriculas(MatriculaInstitucional matriculaSegundo, MatriculaInstitucional matriculaPrimeiro){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorSegundaChamada(AlunoFera alunoFera, Curso curso, Campus polo, TipoPeriodo ingresso) throws ValidacaoException\r\n\t{\t\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorSegundaChamada(AlunoFera alunoFeraIngressante, MatriculaInstitucional matriculaDesistente, Campus polo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorForcaDeLei(Aluno aluno, Curso curso, Integer anoIngressoCurso, TipoPeriodo periodoIngressoCurso, Campus polo) throws ValidacaoException {\t\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarDiplomado(Aluno aluno, Curso curso, Campus polo) throws ValidacaoException {\t\r\n\t\t//...\r\n\t}\r\n\r\n\tprivate MatriculaInstitucional matricularInstitucionalPorForcaDeLei(Aluno aluno, Curso curso, Campus polo, Integer anoIngressoCurso, TipoPeriodo periodoIngressoCurso) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\t\r\n\tprivate MatriculaInstitucional matricularInstitucionalPorTipoIngresso(Aluno aluno, Curso curso, Campus polo, Long idFormaIngresso) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\t\r\n\tpublic void criarMatriculaInstitucionalAvulsa(Aluno aluno, Curso cursoSelecionado, Campus polo){\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorDecisaoJudicial(Aluno aluno, Curso curso, Campus polo) {\r\n\t\t//...\r\n\t}\r\n\t\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorMobilidade(Aluno aluno, Curso curso, Campus polo) throws ValidacaoException\r\n\t{\t\r\n\t\t//...\r\n\t}\r\n\r\n\tpublic MatriculaInstitucional ingressarPorTransferencia(Aluno aluno, Curso curso, Integer anoIngressoCurso, TipoPeriodo periodoIngressoCurso, Campus polo) throws ValidacaoException\r\n\t{\t\t\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional ingressarPorConvenio(Aluno aluno, Curso curso, Campus polo) throws ValidacaoException\r\n\t{\t\r\n\t\t//...\r\n\t}\r\n\t\r\n\tpublic MatriculaInstitucional matricularReopcao(MatriculaInstitucional matriculaOrigem, Curso cursoDestino, Campus polo, Turno turnoSelecionado){\r\n\t\t//...\r\n\t}\r\n\t\r\n\t\r\n\tpublic MatriculaInstitucional matricularMudancaRegime(MatriculaInstitucional matriculaOrigem, Curso cursoDestino, Campus polo){\r\n\t\t//...\r\n\t}\r\n}	Algumas linhas do método <code>matricularReingresso</code> foram extraídas para um novo método chamado <code>criarMatricula</code>.	IngressoUniversidadeService_3.java	72,73,81-98	12
30	@Service\r\npublic class DiarioClasseService {\r\n\r\n\t@Autowired private DiarioClasseDao diarioClasseDao;\r\n\t@Autowired private TipoAulaService tipoAulaService;\r\n\t@Autowired private ParametroAcademicoCursoService parametroAcademicoCursoService;\r\n\t\t\r\n\t\r\n\tpublic void gerarDiariosClasse(Turma turma){\r\n\t\t\r\n\t\tif (turma.getDisciplinaCurricular().getTipo().isEstagioCurricular()) {\r\n\t\t\treturn;\r\n\t\t}\r\n\t\t\r\n\t\tList<DiarioClasse> listaDiarios = new ArrayList<DiarioClasse>();\r\n\t\tList<HorarioAula> horariosAulas = turma.getHorariosAula();\r\n\t\t\r\n\t\tCalendar calendarioInicio = Calendar.getInstance();\r\n\t\tCalendar calendarioFim = Calendar.getInstance();\r\n\t\t\r\n\t\tParametroAcademicoCurso pCurso = this.parametroAcademicoCursoService.getParametrosCursoAtuais(turma.getCurso());\r\n\t\t\r\n\t\tDate dataInicioPeriodo;\r\n\t\tDate dataFimPeriodo;\r\n\t\tif (turma.getTipoPeriodo().isPeriodoFerias()) {\r\n\t\t\tdataInicioPeriodo = pCurso.getDataInicioPeriodoFerias();\r\n\t\t\tdataFimPeriodo = pCurso.getDataFimPeriodoFerias();\r\n\t\t} else {\r\n\t\t\tdataInicioPeriodo = pCurso.getDataInicioPeriodo();\r\n\t\t\tdataFimPeriodo = pCurso.getDataFimPeriodo();\r\n\t\t}\r\n\t\t\r\n\t\tcalendarioInicio.setTime(dataInicioPeriodo);\r\n\t\tcalendarioInicio.add(Calendar.DATE, -1); //tentativa de correção de bug na criação do primeiro dia letivo.\r\n\t\tcalendarioFim.setTime(dataFimPeriodo);\r\n\t\t\r\n\t\tlong primeiroDiaLetivoEmMilissegundos = calendarioInicio.getTimeInMillis();\r\n\t\tlong ultimoDiaLetivoEmMilissegundos = calendarioFim.getTimeInMillis();\r\n\t\tint diaSemanaInicioPeriodo = calendarioInicio.get(Calendar.DAY_OF_WEEK);\r\n\t\t\t\t\r\n\t\tfor(HorarioAula horario: horariosAulas){\r\n\t\t\tCalendar calendarioTemp = Calendar.getInstance();\r\n\t\t\t\r\n\t\t\t// Diminui um pois a contagem do dia na semana na Calendar se inicia em Zero\r\n\t\t\tint diaSemanaHorarioAula = horario.getDiaSemana().getOpcaoPk().getCodigoItemTabela().intValue();\r\n\t\t\tint qtdDiasParaAdicionar = 0;\r\n\t\t\tint numeroMilissegundos = 0;\r\n\t\t\t\r\n\t\t\t// Se as aulas são dia de quarta-feira e o período começa na segunda-feira\r\n\t\t\tif (diaSemanaHorarioAula > diaSemanaInicioPeriodo){\r\n\t\t\t\tqtdDiasParaAdicionar = diaSemanaHorarioAula - diaSemanaInicioPeriodo;\r\n\t\t\t} else {\r\n\t\t\t\t// Vê qtos dias faltam para acabar a semana (ultimo dia = 6) e soma o dia da próxima semana\r\n\t\t\t\tqtdDiasParaAdicionar = 7 - diaSemanaInicioPeriodo + diaSemanaHorarioAula;\r\n\t\t\t}\r\n\t\t\t\r\n\t\t\tnumeroMilissegundos = qtdDiasParaAdicionar*(24 * 60 * 60)*1000;\r\n\t\t\tint numeroMilissegundosEmUmaSemana = 7*24*60*60*1000;\r\n\t\t\t\r\n\t\t\t// Encontra o primeiro diario\r\n\t\t\tcalendarioTemp.setTimeInMillis(primeiroDiaLetivoEmMilissegundos + numeroMilissegundos);\r\n\t\t\t\r\n\t\t\twhile (calendarioTemp.getTimeInMillis() < ultimoDiaLetivoEmMilissegundos){\r\n\t\t\t\tDiarioClasse diario = new DiarioClasse();\r\n\t\t\t\t\r\n\t\t\t\tdiario.setData(calendarioTemp.getTime());\r\n\t\t\t\tdiario.setHora(horario.getHoraInicio());\r\n\t\t\t\tdiario.setTurma(turma);\r\n\t\t\t\tif (horario.getTipoAula()!=null){\r\n\t\t\t\t\tdiario.setTipoAula(horario.getTipoAula());\r\n\t\t\t\t} else {\r\n\t\t\t\t\t// Por default, carrega aulas do tipo teórica\r\n\t\t\t\t\tTipoAula tipoAula = tipoAulaService.carregarPorItemTabela(TipoAula.TEORICA);\r\n\t\t\t\t\tdiario.setTipoAula(tipoAula);\r\n\t\t\t\t}\r\n\t\t\t\tdiario.setDataAlteracao(new Date());\r\n\t\t\t\tdiario.setHoraAlteracao(new Date());\r\n\t\t\t\tdiario.setConcorrencia(0L);\r\n\t\t\t\tdiario.setCodOperador(0L);\r\n\t\t\t\t\r\n\t\t\t\tlistaDiarios.add(diario);\r\n\t\t\t\t\r\n\t\t\t\tcalendarioTemp.setTimeInMillis(calendarioTemp.getTimeInMillis()+numeroMilissegundosEmUmaSemana);\r\n\t\t\t}\t\t\t\r\n\t\t}\r\n\t\t\r\n\t\tString listaIds = gerarListaIds(listaDiarios);\r\n\t\t\t\t\t\t\r\n\t\t// Remove os diarios que não pertencem aos horarios da turma devido a alterações ou exclusoes de horarios\r\n\t\t this.diarioClasseDao.excluirDiariosAlteradosOuRemovidosDaTurma(turma, listaIds);\r\n\t\t\t\t\r\n\t}\r\n\r\n\r\n\tprivate String gerarListaIds(List<DiarioClasse> listaDiarios) {\r\n\t\tString listaIds = "";\r\n\t\t\r\n\t\tfor (DiarioClasse d:listaDiarios){\r\n\t\t\tDiarioClasse diario = this.diarioClasseDao.consultarDiarioPorDataHora(d);\r\n\t\t\t\r\n\t\t\tif (diario == null){\r\n\t\t\t\tdiario = this.diarioClasseDao.inserir(d);\r\n\t\t\t} \r\n\t\t\tlistaIds += diario.getId() + ",";\r\n\t\t}\r\n\t\t// Apaga a última vírgula adicionada\r\n\t\tlistaIds = listaIds.substring(0, listaIds.length()-1);\r\n\t\treturn listaIds;\r\n\t}\r\n}	Resultado do primeiro <em>Extract Method</em>	DiarioClasseService_2.java	87, 95-109	30
61	@Service\r\npublic class DiarioClasseService {\r\n\r\n\t@Autowired private DiarioClasseDao diarioClasseDao;\r\n\t@Autowired private TipoAulaService tipoAulaService;\r\n\t@Autowired private ParametroAcademicoCursoService parametroAcademicoCursoService;\r\n\t\t\r\n\t\r\n\tpublic void gerarDiariosClasse(Turma turma){\r\n\t\t\r\n\t\tif (turma.getDisciplinaCurricular().getTipo().isEstagioCurricular()) {\r\n\t\t\treturn;\r\n\t\t}\r\n\t\t\r\n\t\tList<DiarioClasse> listaDiarios = new ArrayList<DiarioClasse>();\r\n\t\tList<HorarioAula> horariosAulas = turma.getHorariosAula();\r\n\t\t\r\n\t\tCalendar calendarioInicio = Calendar.getInstance();\r\n\t\tCalendar calendarioFim = Calendar.getInstance();\r\n\t\t\r\n\t\tParametroAcademicoCurso pCurso = this.parametroAcademicoCursoService.getParametrosCursoAtuais(turma.getCurso());\r\n\t\t\r\n\t\tDate dataInicioPeriodo;\r\n\t\tDate dataFimPeriodo;\r\n\t\tif (turma.getTipoPeriodo().isPeriodoFerias()) {\r\n\t\t\tdataInicioPeriodo = pCurso.getDataInicioPeriodoFerias();\r\n\t\t\tdataFimPeriodo = pCurso.getDataFimPeriodoFerias();\r\n\t\t} else {\r\n\t\t\tdataInicioPeriodo = pCurso.getDataInicioPeriodo();\r\n\t\t\tdataFimPeriodo = pCurso.getDataFimPeriodo();\r\n\t\t}\r\n\t\t\r\n\t\tcalendarioInicio.setTime(dataInicioPeriodo);\r\n\t\tcalendarioInicio.add(Calendar.DATE, -1); //tentativa de correção de bug na criação do primeiro dia letivo.\r\n\t\tcalendarioFim.setTime(dataFimPeriodo);\r\n\t\t\r\n\t\tlong primeiroDiaLetivoEmMilissegundos = calendarioInicio.getTimeInMillis();\r\n\t\tlong ultimoDiaLetivoEmMilissegundos = calendarioFim.getTimeInMillis();\r\n\t\tint diaSemanaInicioPeriodo = calendarioInicio.get(Calendar.DAY_OF_WEEK);\r\n\t\t\t\t\r\n\t\tfor(HorarioAula horario: horariosAulas){\r\n\t\t\tCalendar calendarioTemp = Calendar.getInstance();\r\n\t\t\t\r\n\t\t\t// Diminui um pois a contagem do dia na semana na Calendar se inicia em Zero\r\n\t\t\tint diaSemanaHorarioAula = horario.getDiaSemana().getOpcaoPk().getCodigoItemTabela().intValue();\r\n\t\t\tint qtdDiasParaAdicionar = 0;\r\n\t\t\tint numeroMilissegundos = 0;\r\n\t\t\t\r\n\t\t\tqtdDiasParaAdicionar = calculaQtdDias(diaSemanaInicioPeriodo, diaSemanaHorarioAula);\r\n\t\t\t\r\n\t\t\tnumeroMilissegundos = qtdDiasParaAdicionar*(24 * 60 * 60)*1000;\r\n\t\t\tint numeroMilissegundosEmUmaSemana = 7*24*60*60*1000;\r\n\t\t\t\r\n\t\t\t// Encontra o primeiro diario\r\n\t\t\tcalendarioTemp.setTimeInMillis(primeiroDiaLetivoEmMilissegundos + numeroMilissegundos);\r\n\t\t\t\r\n\t\t\tTipoAula tipoAula = tipoAulaService.carregarPorItemTabela(TipoAula.TEORICA);\r\n\t\t\twhile (calendarioTemp.getTimeInMillis() < ultimoDiaLetivoEmMilissegundos){\r\n\t\t\t\tDiarioClasse diario = new DiarioClasse(turma, horario, calendarioTemp, tipoAula);\r\n\t\t\t\t\r\n\t\t\t\tlistaDiarios.add(diario);\r\n\t\t\t\t\r\n\t\t\t\tcalendarioTemp.setTimeInMillis(calendarioTemp.getTimeInMillis()+numeroMilissegundosEmUmaSemana);\r\n\t\t\t}\t\t\t\r\n\t\t}\r\n\t\t\r\n\t\tString listaIds = gerarListaIds(listaDiarios);\r\n\t\t\t\t\t\t\r\n\t\t// Remove os diarios que não pertencem aos horarios da turma devido a alterações ou exclusoes de horarios\r\n\t\t this.diarioClasseDao.excluirDiariosAlteradosOuRemovidosDaTurma(turma, listaIds);\r\n\t\t\t\t\r\n\t}\r\n\r\n\tprivate int calculaQtdDias(int diaSemanaInicioPeriodo, int diaSemanaHorarioAula) {\r\n\t\tint qtdDiasParaAdicionar;\r\n\t\t// Se as aulas são dia de quarta-feira e o período começa na segunda-feira\r\n\t\tif (diaSemanaHorarioAula > diaSemanaInicioPeriodo){\r\n\t\t\tqtdDiasParaAdicionar = diaSemanaHorarioAula - diaSemanaInicioPeriodo;\r\n\t\t} else {\r\n\t\t\t// Vê qtos dias faltam para acabar a semana (ultimo dia = 6) e soma o dia da próxima semana\r\n\t\t\tqtdDiasParaAdicionar = 7 - diaSemanaInicioPeriodo + diaSemanaHorarioAula;\r\n\t\t}\r\n\t\treturn qtdDiasParaAdicionar;\r\n\t}\r\n\r\n\r\n\tprivate String gerarListaIds(List<DiarioClasse> listaDiarios) {\r\n\t\tString listaIds = "";\r\n\t\t\r\n\t\tfor (DiarioClasse d:listaDiarios){\r\n\t\t\tDiarioClasse diario = this.diarioClasseDao.consultarDiarioPorDataHora(d);\r\n\t\t\t\r\n\t\t\tif (diario == null){\r\n\t\t\t\tdiario = this.diarioClasseDao.inserir(d);\r\n\t\t\t} \r\n\t\t\tlistaIds += diario.getId() + ",";\r\n\t\t}\r\n\t\t// Apaga a última vírgula adicionada\r\n\t\tlistaIds = listaIds.substring(0, listaIds.length()-1);\r\n\t\treturn listaIds;\r\n\t}\r\n}	Abaixo apresentamos o resultado na classe <code>DiarioClasseService</code> depois de movermos o método <code>DiarioClasseService.criarDiario</code> foi movido para a classe <code>DiarioClasse</code>.	DiarioClasseService_5.1.java	59	33
\.


--
-- Name: recommendations_sourcefile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('recommendations_sourcefile_id_seq', 61, true);


--
-- Data for Name: recommendations_usersubject; Type: TABLE DATA; Schema: public; Owner: -
--

COPY recommendations_usersubject (id, on_experiment, user_id, was_welcomed) FROM stdin;
2	t	2	f
6	t	6	f
10	t	10	f
16	t	16	f
17	t	17	f
18	t	18	f
19	t	19	f
15	f	15	f
11	f	11	f
20	f	20	f
12	f	12	f
13	f	13	f
8	f	8	f
5	f	5	f
4	f	4	f
9	f	9	f
14	f	14	f
7	f	7	f
1	t	1	t
\.


--
-- Name: recommendations_usersubject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('recommendations_usersubject_id_seq', 20, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: recommendations_batch_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recommendations_batch
    ADD CONSTRAINT recommendations_batch_pkey PRIMARY KEY (id);


--
-- Name: recommendations_batch_title_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recommendations_batch
    ADD CONSTRAINT recommendations_batch_title_key UNIQUE (title);


--
-- Name: recommendations_batchfeedback_batch_id_user_id_2a25bd82_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recommendations_batchfeedback
    ADD CONSTRAINT recommendations_batchfeedback_batch_id_user_id_2a25bd82_uniq UNIQUE (batch_id, user_id);


--
-- Name: recommendations_batchfeedback_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recommendations_batchfeedback
    ADD CONSTRAINT recommendations_batchfeedback_pkey PRIMARY KEY (id);


--
-- Name: recommendations_codesmell_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recommendations_codesmell
    ADD CONSTRAINT recommendations_codesmell_name_key UNIQUE (name);


--
-- Name: recommendations_codesmell_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recommendations_codesmell
    ADD CONSTRAINT recommendations_codesmell_pkey PRIMARY KEY (id);


--
-- Name: recommendations_refactoring_batch_id_order_5d5192e2_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recommendations_refactoring
    ADD CONSTRAINT recommendations_refactoring_batch_id_order_5d5192e2_uniq UNIQUE (batch_id, "order");


--
-- Name: recommendations_refactoring_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recommendations_refactoring
    ADD CONSTRAINT recommendations_refactoring_pkey PRIMARY KEY (id);


--
-- Name: recommendations_refactoringtype_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recommendations_refactoringtype
    ADD CONSTRAINT recommendations_refactoringtype_name_key UNIQUE (name);


--
-- Name: recommendations_refactoringtype_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recommendations_refactoringtype
    ADD CONSTRAINT recommendations_refactoringtype_pkey PRIMARY KEY (id);


--
-- Name: recommendations_sourcefile_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recommendations_sourcefile
    ADD CONSTRAINT recommendations_sourcefile_name_key UNIQUE (name);


--
-- Name: recommendations_sourcefile_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recommendations_sourcefile
    ADD CONSTRAINT recommendations_sourcefile_pkey PRIMARY KEY (id);


--
-- Name: recommendations_usersubject_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recommendations_usersubject
    ADD CONSTRAINT recommendations_usersubject_pkey PRIMARY KEY (id);


--
-- Name: recommendations_usersubject_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recommendations_usersubject
    ADD CONSTRAINT recommendations_usersubject_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: recommendations_batch_removed_smell_id_81d23f13; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX recommendations_batch_removed_smell_id_81d23f13 ON recommendations_batch USING btree (removed_smell_id);


--
-- Name: recommendations_batch_title_8d9cf5d3_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX recommendations_batch_title_8d9cf5d3_like ON recommendations_batch USING btree (title varchar_pattern_ops);


--
-- Name: recommendations_batchfeedback_batch_id_3204c79b; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX recommendations_batchfeedback_batch_id_3204c79b ON recommendations_batchfeedback USING btree (batch_id);


--
-- Name: recommendations_batchfeedback_user_id_4bac4ff3; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX recommendations_batchfeedback_user_id_4bac4ff3 ON recommendations_batchfeedback USING btree (user_id);


--
-- Name: recommendations_codesmell_name_567cd0e5_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX recommendations_codesmell_name_567cd0e5_like ON recommendations_codesmell USING btree (name varchar_pattern_ops);


--
-- Name: recommendations_refactoring_batch_id_d9655399; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX recommendations_refactoring_batch_id_d9655399 ON recommendations_refactoring USING btree (batch_id);


--
-- Name: recommendations_refactoring_type_id_b718b48f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX recommendations_refactoring_type_id_b718b48f ON recommendations_refactoring USING btree (type_id);


--
-- Name: recommendations_refactoringtype_name_88c99f05_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX recommendations_refactoringtype_name_88c99f05_like ON recommendations_refactoringtype USING btree (name varchar_pattern_ops);


--
-- Name: recommendations_sourcefile_name_b1718992_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX recommendations_sourcefile_name_b1718992_like ON recommendations_sourcefile USING btree (name varchar_pattern_ops);


--
-- Name: recommendations_sourcefile_refactoring_id_8b3303c1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX recommendations_sourcefile_refactoring_id_8b3303c1 ON recommendations_sourcefile USING btree (refactoring_id);


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recommendations_batc_batch_id_3204c79b_fk_recommend; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY recommendations_batchfeedback
    ADD CONSTRAINT recommendations_batc_batch_id_3204c79b_fk_recommend FOREIGN KEY (batch_id) REFERENCES recommendations_batch(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recommendations_batc_removed_smell_id_81d23f13_fk_recommend; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY recommendations_batch
    ADD CONSTRAINT recommendations_batc_removed_smell_id_81d23f13_fk_recommend FOREIGN KEY (removed_smell_id) REFERENCES recommendations_codesmell(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recommendations_batchfeedback_user_id_4bac4ff3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY recommendations_batchfeedback
    ADD CONSTRAINT recommendations_batchfeedback_user_id_4bac4ff3_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recommendations_refa_batch_id_d9655399_fk_recommend; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY recommendations_refactoring
    ADD CONSTRAINT recommendations_refa_batch_id_d9655399_fk_recommend FOREIGN KEY (batch_id) REFERENCES recommendations_batch(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recommendations_refa_type_id_b718b48f_fk_recommend; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY recommendations_refactoring
    ADD CONSTRAINT recommendations_refa_type_id_b718b48f_fk_recommend FOREIGN KEY (type_id) REFERENCES recommendations_refactoringtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recommendations_sour_refactoring_id_8b3303c1_fk_recommend; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY recommendations_sourcefile
    ADD CONSTRAINT recommendations_sour_refactoring_id_8b3303c1_fk_recommend FOREIGN KEY (refactoring_id) REFERENCES recommendations_refactoring(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recommendations_usersubject_user_id_e528b23a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY recommendations_usersubject
    ADD CONSTRAINT recommendations_usersubject_user_id_e528b23a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

