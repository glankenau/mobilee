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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: multiple_choice_answers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.multiple_choice_answers (
    id bigint NOT NULL,
    value text,
    selected_count integer,
    question_id bigint,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: COLUMN multiple_choice_answers.value; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.multiple_choice_answers.value IS 'Value of the answer';


--
-- Name: COLUMN multiple_choice_answers.selected_count; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.multiple_choice_answers.selected_count IS 'How many times this answer has been selected';


--
-- Name: multiple_choice_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.multiple_choice_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: multiple_choice_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.multiple_choice_answers_id_seq OWNED BY public.multiple_choice_answers.id;


--
-- Name: multiple_choice_selected_answers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.multiple_choice_selected_answers (
    id bigint NOT NULL,
    value text NOT NULL,
    question_id bigint,
    report_id bigint,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: multiple_choice_selected_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.multiple_choice_selected_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: multiple_choice_selected_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.multiple_choice_selected_answers_id_seq OWNED BY public.multiple_choice_selected_answers.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.questions (
    id bigint NOT NULL,
    title text,
    number integer,
    type character varying DEFAULT 'OpenQuestion'::character varying,
    survey_id bigint,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: TABLE questions; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.questions IS 'List of Questions for a given Survey';


--
-- Name: COLUMN questions.title; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.questions.title IS 'Question Title';


--
-- Name: COLUMN questions.number; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.questions.number IS 'Number of question in survey';


--
-- Name: COLUMN questions.type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.questions.type IS 'Type of question.';


--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: reports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reports (
    id bigint NOT NULL,
    number integer NOT NULL,
    survey_id bigint,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: COLUMN reports.number; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.reports.number IS 'Report number';


--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: single_answers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.single_answers (
    id bigint NOT NULL,
    value text,
    type character varying DEFAULT 'DescriptionAnswer'::character varying,
    question_id bigint,
    report_id bigint,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: COLUMN single_answers.value; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.single_answers.value IS 'Value of the answer';


--
-- Name: single_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.single_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: single_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.single_answers_id_seq OWNED BY public.single_answers.id;


--
-- Name: surveys; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.surveys (
    id bigint NOT NULL,
    title text NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: TABLE surveys; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.surveys IS 'List of Surveys';


--
-- Name: COLUMN surveys.title; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.surveys.title IS 'Survey Title';


--
-- Name: surveys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.surveys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: surveys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.surveys_id_seq OWNED BY public.surveys.id;


--
-- Name: multiple_choice_answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.multiple_choice_answers ALTER COLUMN id SET DEFAULT nextval('public.multiple_choice_answers_id_seq'::regclass);


--
-- Name: multiple_choice_selected_answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.multiple_choice_selected_answers ALTER COLUMN id SET DEFAULT nextval('public.multiple_choice_selected_answers_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);


--
-- Name: single_answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.single_answers ALTER COLUMN id SET DEFAULT nextval('public.single_answers_id_seq'::regclass);


--
-- Name: surveys id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.surveys ALTER COLUMN id SET DEFAULT nextval('public.surveys_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: multiple_choice_answers multiple_choice_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.multiple_choice_answers
    ADD CONSTRAINT multiple_choice_answers_pkey PRIMARY KEY (id);


--
-- Name: multiple_choice_selected_answers multiple_choice_selected_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.multiple_choice_selected_answers
    ADD CONSTRAINT multiple_choice_selected_answers_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: single_answers single_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.single_answers
    ADD CONSTRAINT single_answers_pkey PRIMARY KEY (id);


--
-- Name: surveys surveys_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.surveys
    ADD CONSTRAINT surveys_pkey PRIMARY KEY (id);


--
-- Name: index_multiple_choice_answers_on_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_multiple_choice_answers_on_question_id ON public.multiple_choice_answers USING btree (question_id);


--
-- Name: index_multiple_choice_selected_answers_on_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_multiple_choice_selected_answers_on_question_id ON public.multiple_choice_selected_answers USING btree (question_id);


--
-- Name: index_multiple_choice_selected_answers_on_report_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_multiple_choice_selected_answers_on_report_id ON public.multiple_choice_selected_answers USING btree (report_id);


--
-- Name: index_questions_on_survey_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_questions_on_survey_id ON public.questions USING btree (survey_id);


--
-- Name: index_reports_on_survey_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reports_on_survey_id ON public.reports USING btree (survey_id);


--
-- Name: index_single_answers_on_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_single_answers_on_question_id ON public.single_answers USING btree (question_id);


--
-- Name: index_single_answers_on_report_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_single_answers_on_report_id ON public.single_answers USING btree (report_id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20240109194625'),
('20240109191223'),
('20231221121727'),
('20231221121656'),
('20231221120558'),
('20231221110719');

