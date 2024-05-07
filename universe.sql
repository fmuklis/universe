--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(18,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(18,2),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(18,2),
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(18,2),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.types (
    types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.types OWNER TO freecodecamp;

--
-- Name: types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_type_id_seq OWNER TO freecodecamp;

--
-- Name: types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.types_type_id_seq OWNED BY public.types.types_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: types types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types ALTER COLUMN types_id SET DEFAULT nextval('public.types_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'The nearest spiral galaxy to the Milky Way', true, true, 10000, 2.54);
INSERT INTO public.galaxy VALUES (2, 'Whirlpool', 'Interacting galaxy with a companion', false, true, 2000, 23.00);
INSERT INTO public.galaxy VALUES (3, 'Pinwheel', 'Known for its beautiful spiral arms', true, true, 2000, 21.00);
INSERT INTO public.galaxy VALUES (4, 'Antennae', 'Colliding galaxies with extensive star formation', false, false, 3000, 25.00);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Galaxy with a prominent dust lane', false, true, 4000, 31.00);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 'Third-largest galaxy in the Local Group', true, true, 1500, 270.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon 1 of Andromeda Star 1 - Planet 1', 'Description of Moon 1 of Andromeda Star 1 - Planet 1', false, true, 1000, 5.00, 1);
INSERT INTO public.moon VALUES (2, 'Moon 2 of Andromeda Star 1 - Planet 1', 'Description of Moon 2 of Andromeda Star 1 - Planet 1', false, true, 1000, 5.00, 1);
INSERT INTO public.moon VALUES (3, 'Moon 3 of Andromeda Star 1 - Planet 1', 'Description of Moon 3 of Andromeda Star 1 - Planet 1', false, true, 1000, 5.00, 1);
INSERT INTO public.moon VALUES (4, 'Moon 1 of Andromeda Star 1 - Planet 2', 'Description of Moon 1 of Andromeda Star 1 - Planet 2', false, true, 1000, 5.00, 2);
INSERT INTO public.moon VALUES (5, 'Moon 2 of Andromeda Star 1 - Planet 2', 'Description of Moon 2 of Andromeda Star 1 - Planet 2', false, true, 1000, 5.00, 2);
INSERT INTO public.moon VALUES (6, 'Moon 3 of Andromeda Star 1 - Planet 2', 'Description of Moon 3 of Andromeda Star 1 - Planet 2', false, true, 1000, 5.00, 2);
INSERT INTO public.moon VALUES (7, 'Moon 1 of Andromeda Star 1 - Planet 3', 'Description of Moon 1 of Andromeda Star 1 - Planet 3', false, true, 1000, 5.00, 3);
INSERT INTO public.moon VALUES (8, 'Moon 2 of Andromeda Star 1 - Planet 3', 'Description of Moon 2 of Andromeda Star 1 - Planet 3', false, true, 1000, 5.00, 3);
INSERT INTO public.moon VALUES (9, 'Moon 3 of Andromeda Star 1 - Planet 3', 'Description of Moon 3 of Andromeda Star 1 - Planet 3', false, true, 1000, 5.00, 3);
INSERT INTO public.moon VALUES (10, 'Moon 1 of Andromeda Star 2 - Planet 1', 'Description of Moon 1 of Andromeda Star 2 - Planet 1', false, true, 1000, 5.00, 4);
INSERT INTO public.moon VALUES (11, 'Moon 2 of Andromeda Star 2 - Planet 1', 'Description of Moon 2 of Andromeda Star 2 - Planet 1', false, true, 1000, 5.00, 4);
INSERT INTO public.moon VALUES (12, 'Moon 3 of Andromeda Star 2 - Planet 1', 'Description of Moon 3 of Andromeda Star 2 - Planet 1', false, true, 1000, 5.00, 4);
INSERT INTO public.moon VALUES (13, 'Moon 1 of Andromeda Star 2 - Planet 2', 'Description of Moon 1 of Andromeda Star 2 - Planet 2', false, true, 1000, 5.00, 5);
INSERT INTO public.moon VALUES (14, 'Moon 2 of Andromeda Star 2 - Planet 2', 'Description of Moon 2 of Andromeda Star 2 - Planet 2', false, true, 1000, 5.00, 5);
INSERT INTO public.moon VALUES (15, 'Moon 3 of Andromeda Star 2 - Planet 2', 'Description of Moon 3 of Andromeda Star 2 - Planet 2', false, true, 1000, 5.00, 5);
INSERT INTO public.moon VALUES (16, 'Moon 1 of Andromeda Star 2 - Planet 3', 'Description of Moon 1 of Andromeda Star 2 - Planet 3', false, true, 1000, 5.00, 6);
INSERT INTO public.moon VALUES (17, 'Moon 2 of Andromeda Star 2 - Planet 3', 'Description of Moon 2 of Andromeda Star 2 - Planet 3', false, true, 1000, 5.00, 6);
INSERT INTO public.moon VALUES (18, 'Moon 3 of Andromeda Star 2 - Planet 3', 'Description of Moon 3 of Andromeda Star 2 - Planet 3', false, true, 1000, 5.00, 6);
INSERT INTO public.moon VALUES (19, 'Moon 1 of Andromeda Star 3 - Planet 1', 'Description of Moon 1 of Andromeda Star 3 - Planet 1', false, true, 1000, 5.00, 7);
INSERT INTO public.moon VALUES (20, 'Moon 2 of Andromeda Star 3 - Planet 1', 'Description of Moon 2 of Andromeda Star 3 - Planet 1', false, true, 1000, 5.00, 7);
INSERT INTO public.moon VALUES (21, 'Moon 3 of Andromeda Star 3 - Planet 1', 'Description of Moon 3 of Andromeda Star 3 - Planet 1', false, true, 1000, 5.00, 7);
INSERT INTO public.moon VALUES (22, 'Moon 1 of Andromeda Star 3 - Planet 2', 'Description of Moon 1 of Andromeda Star 3 - Planet 2', false, true, 1000, 5.00, 8);
INSERT INTO public.moon VALUES (23, 'Moon 2 of Andromeda Star 3 - Planet 2', 'Description of Moon 2 of Andromeda Star 3 - Planet 2', false, true, 1000, 5.00, 8);
INSERT INTO public.moon VALUES (24, 'Moon 3 of Andromeda Star 3 - Planet 2', 'Description of Moon 3 of Andromeda Star 3 - Planet 2', false, true, 1000, 5.00, 8);
INSERT INTO public.moon VALUES (25, 'Moon 1 of Andromeda Star 3 - Planet 3', 'Description of Moon 1 of Andromeda Star 3 - Planet 3', false, true, 1000, 5.00, 9);
INSERT INTO public.moon VALUES (26, 'Moon 2 of Andromeda Star 3 - Planet 3', 'Description of Moon 2 of Andromeda Star 3 - Planet 3', false, true, 1000, 5.00, 9);
INSERT INTO public.moon VALUES (27, 'Moon 3 of Andromeda Star 3 - Planet 3', 'Description of Moon 3 of Andromeda Star 3 - Planet 3', false, true, 1000, 5.00, 9);
INSERT INTO public.moon VALUES (28, 'Moon 1 of Andromeda Star 4 - Planet 1', 'Description of Moon 1 of Andromeda Star 4 - Planet 1', false, true, 1000, 5.00, 10);
INSERT INTO public.moon VALUES (29, 'Moon 2 of Andromeda Star 4 - Planet 1', 'Description of Moon 2 of Andromeda Star 4 - Planet 1', false, true, 1000, 5.00, 10);
INSERT INTO public.moon VALUES (30, 'Moon 3 of Andromeda Star 4 - Planet 1', 'Description of Moon 3 of Andromeda Star 4 - Planet 1', false, true, 1000, 5.00, 10);
INSERT INTO public.moon VALUES (31, 'Moon 1 of Andromeda Star 4 - Planet 2', 'Description of Moon 1 of Andromeda Star 4 - Planet 2', false, true, 1000, 5.00, 11);
INSERT INTO public.moon VALUES (32, 'Moon 2 of Andromeda Star 4 - Planet 2', 'Description of Moon 2 of Andromeda Star 4 - Planet 2', false, true, 1000, 5.00, 11);
INSERT INTO public.moon VALUES (33, 'Moon 3 of Andromeda Star 4 - Planet 2', 'Description of Moon 3 of Andromeda Star 4 - Planet 2', false, true, 1000, 5.00, 11);
INSERT INTO public.moon VALUES (34, 'Moon 1 of Andromeda Star 4 - Planet 3', 'Description of Moon 1 of Andromeda Star 4 - Planet 3', false, true, 1000, 5.00, 12);
INSERT INTO public.moon VALUES (35, 'Moon 2 of Andromeda Star 4 - Planet 3', 'Description of Moon 2 of Andromeda Star 4 - Planet 3', false, true, 1000, 5.00, 12);
INSERT INTO public.moon VALUES (36, 'Moon 3 of Andromeda Star 4 - Planet 3', 'Description of Moon 3 of Andromeda Star 4 - Planet 3', false, true, 1000, 5.00, 12);
INSERT INTO public.moon VALUES (37, 'Moon 1 of Andromeda Star 5 - Planet 1', 'Description of Moon 1 of Andromeda Star 5 - Planet 1', false, true, 1000, 5.00, 13);
INSERT INTO public.moon VALUES (38, 'Moon 2 of Andromeda Star 5 - Planet 1', 'Description of Moon 2 of Andromeda Star 5 - Planet 1', false, true, 1000, 5.00, 13);
INSERT INTO public.moon VALUES (39, 'Moon 3 of Andromeda Star 5 - Planet 1', 'Description of Moon 3 of Andromeda Star 5 - Planet 1', false, true, 1000, 5.00, 13);
INSERT INTO public.moon VALUES (40, 'Moon 1 of Andromeda Star 5 - Planet 2', 'Description of Moon 1 of Andromeda Star 5 - Planet 2', false, true, 1000, 5.00, 14);
INSERT INTO public.moon VALUES (41, 'Moon 2 of Andromeda Star 5 - Planet 2', 'Description of Moon 2 of Andromeda Star 5 - Planet 2', false, true, 1000, 5.00, 14);
INSERT INTO public.moon VALUES (42, 'Moon 3 of Andromeda Star 5 - Planet 2', 'Description of Moon 3 of Andromeda Star 5 - Planet 2', false, true, 1000, 5.00, 14);
INSERT INTO public.moon VALUES (43, 'Moon 1 of Andromeda Star 5 - Planet 3', 'Description of Moon 1 of Andromeda Star 5 - Planet 3', false, true, 1000, 5.00, 15);
INSERT INTO public.moon VALUES (44, 'Moon 2 of Andromeda Star 5 - Planet 3', 'Description of Moon 2 of Andromeda Star 5 - Planet 3', false, true, 1000, 5.00, 15);
INSERT INTO public.moon VALUES (45, 'Moon 3 of Andromeda Star 5 - Planet 3', 'Description of Moon 3 of Andromeda Star 5 - Planet 3', false, true, 1000, 5.00, 15);
INSERT INTO public.moon VALUES (46, 'Moon 1 of Andromeda Star 6 - Planet 1', 'Description of Moon 1 of Andromeda Star 6 - Planet 1', false, true, 1000, 5.00, 16);
INSERT INTO public.moon VALUES (47, 'Moon 2 of Andromeda Star 6 - Planet 1', 'Description of Moon 2 of Andromeda Star 6 - Planet 1', false, true, 1000, 5.00, 16);
INSERT INTO public.moon VALUES (48, 'Moon 3 of Andromeda Star 6 - Planet 1', 'Description of Moon 3 of Andromeda Star 6 - Planet 1', false, true, 1000, 5.00, 16);
INSERT INTO public.moon VALUES (49, 'Moon 1 of Andromeda Star 6 - Planet 2', 'Description of Moon 1 of Andromeda Star 6 - Planet 2', false, true, 1000, 5.00, 17);
INSERT INTO public.moon VALUES (50, 'Moon 2 of Andromeda Star 6 - Planet 2', 'Description of Moon 2 of Andromeda Star 6 - Planet 2', false, true, 1000, 5.00, 17);
INSERT INTO public.moon VALUES (51, 'Moon 3 of Andromeda Star 6 - Planet 2', 'Description of Moon 3 of Andromeda Star 6 - Planet 2', false, true, 1000, 5.00, 17);
INSERT INTO public.moon VALUES (52, 'Moon 1 of Andromeda Star 6 - Planet 3', 'Description of Moon 1 of Andromeda Star 6 - Planet 3', false, true, 1000, 5.00, 18);
INSERT INTO public.moon VALUES (53, 'Moon 2 of Andromeda Star 6 - Planet 3', 'Description of Moon 2 of Andromeda Star 6 - Planet 3', false, true, 1000, 5.00, 18);
INSERT INTO public.moon VALUES (54, 'Moon 3 of Andromeda Star 6 - Planet 3', 'Description of Moon 3 of Andromeda Star 6 - Planet 3', false, true, 1000, 5.00, 18);
INSERT INTO public.moon VALUES (55, 'Moon 1 of Whirlpool Star 1 - Planet 1', 'Description of Moon 1 of Whirlpool Star 1 - Planet 1', false, true, 1000, 5.00, 19);
INSERT INTO public.moon VALUES (56, 'Moon 2 of Whirlpool Star 1 - Planet 1', 'Description of Moon 2 of Whirlpool Star 1 - Planet 1', false, true, 1000, 5.00, 19);
INSERT INTO public.moon VALUES (57, 'Moon 3 of Whirlpool Star 1 - Planet 1', 'Description of Moon 3 of Whirlpool Star 1 - Planet 1', false, true, 1000, 5.00, 19);
INSERT INTO public.moon VALUES (58, 'Moon 1 of Whirlpool Star 1 - Planet 2', 'Description of Moon 1 of Whirlpool Star 1 - Planet 2', false, true, 1000, 5.00, 20);
INSERT INTO public.moon VALUES (59, 'Moon 2 of Whirlpool Star 1 - Planet 2', 'Description of Moon 2 of Whirlpool Star 1 - Planet 2', false, true, 1000, 5.00, 20);
INSERT INTO public.moon VALUES (60, 'Moon 3 of Whirlpool Star 1 - Planet 2', 'Description of Moon 3 of Whirlpool Star 1 - Planet 2', false, true, 1000, 5.00, 20);
INSERT INTO public.moon VALUES (61, 'Moon 1 of Whirlpool Star 1 - Planet 3', 'Description of Moon 1 of Whirlpool Star 1 - Planet 3', false, true, 1000, 5.00, 21);
INSERT INTO public.moon VALUES (62, 'Moon 2 of Whirlpool Star 1 - Planet 3', 'Description of Moon 2 of Whirlpool Star 1 - Planet 3', false, true, 1000, 5.00, 21);
INSERT INTO public.moon VALUES (63, 'Moon 3 of Whirlpool Star 1 - Planet 3', 'Description of Moon 3 of Whirlpool Star 1 - Planet 3', false, true, 1000, 5.00, 21);
INSERT INTO public.moon VALUES (64, 'Moon 1 of Whirlpool Star 2 - Planet 1', 'Description of Moon 1 of Whirlpool Star 2 - Planet 1', false, true, 1000, 5.00, 22);
INSERT INTO public.moon VALUES (65, 'Moon 2 of Whirlpool Star 2 - Planet 1', 'Description of Moon 2 of Whirlpool Star 2 - Planet 1', false, true, 1000, 5.00, 22);
INSERT INTO public.moon VALUES (66, 'Moon 3 of Whirlpool Star 2 - Planet 1', 'Description of Moon 3 of Whirlpool Star 2 - Planet 1', false, true, 1000, 5.00, 22);
INSERT INTO public.moon VALUES (67, 'Moon 1 of Whirlpool Star 2 - Planet 2', 'Description of Moon 1 of Whirlpool Star 2 - Planet 2', false, true, 1000, 5.00, 23);
INSERT INTO public.moon VALUES (68, 'Moon 2 of Whirlpool Star 2 - Planet 2', 'Description of Moon 2 of Whirlpool Star 2 - Planet 2', false, true, 1000, 5.00, 23);
INSERT INTO public.moon VALUES (69, 'Moon 3 of Whirlpool Star 2 - Planet 2', 'Description of Moon 3 of Whirlpool Star 2 - Planet 2', false, true, 1000, 5.00, 23);
INSERT INTO public.moon VALUES (70, 'Moon 1 of Whirlpool Star 2 - Planet 3', 'Description of Moon 1 of Whirlpool Star 2 - Planet 3', false, true, 1000, 5.00, 24);
INSERT INTO public.moon VALUES (71, 'Moon 2 of Whirlpool Star 2 - Planet 3', 'Description of Moon 2 of Whirlpool Star 2 - Planet 3', false, true, 1000, 5.00, 24);
INSERT INTO public.moon VALUES (72, 'Moon 3 of Whirlpool Star 2 - Planet 3', 'Description of Moon 3 of Whirlpool Star 2 - Planet 3', false, true, 1000, 5.00, 24);
INSERT INTO public.moon VALUES (73, 'Moon 1 of Whirlpool Star 3 - Planet 1', 'Description of Moon 1 of Whirlpool Star 3 - Planet 1', false, true, 1000, 5.00, 25);
INSERT INTO public.moon VALUES (74, 'Moon 2 of Whirlpool Star 3 - Planet 1', 'Description of Moon 2 of Whirlpool Star 3 - Planet 1', false, true, 1000, 5.00, 25);
INSERT INTO public.moon VALUES (75, 'Moon 3 of Whirlpool Star 3 - Planet 1', 'Description of Moon 3 of Whirlpool Star 3 - Planet 1', false, true, 1000, 5.00, 25);
INSERT INTO public.moon VALUES (76, 'Moon 1 of Whirlpool Star 3 - Planet 2', 'Description of Moon 1 of Whirlpool Star 3 - Planet 2', false, true, 1000, 5.00, 26);
INSERT INTO public.moon VALUES (77, 'Moon 2 of Whirlpool Star 3 - Planet 2', 'Description of Moon 2 of Whirlpool Star 3 - Planet 2', false, true, 1000, 5.00, 26);
INSERT INTO public.moon VALUES (78, 'Moon 3 of Whirlpool Star 3 - Planet 2', 'Description of Moon 3 of Whirlpool Star 3 - Planet 2', false, true, 1000, 5.00, 26);
INSERT INTO public.moon VALUES (79, 'Moon 1 of Whirlpool Star 3 - Planet 3', 'Description of Moon 1 of Whirlpool Star 3 - Planet 3', false, true, 1000, 5.00, 27);
INSERT INTO public.moon VALUES (80, 'Moon 2 of Whirlpool Star 3 - Planet 3', 'Description of Moon 2 of Whirlpool Star 3 - Planet 3', false, true, 1000, 5.00, 27);
INSERT INTO public.moon VALUES (81, 'Moon 3 of Whirlpool Star 3 - Planet 3', 'Description of Moon 3 of Whirlpool Star 3 - Planet 3', false, true, 1000, 5.00, 27);
INSERT INTO public.moon VALUES (82, 'Moon 1 of Whirlpool Star 4 - Planet 1', 'Description of Moon 1 of Whirlpool Star 4 - Planet 1', false, true, 1000, 5.00, 28);
INSERT INTO public.moon VALUES (83, 'Moon 2 of Whirlpool Star 4 - Planet 1', 'Description of Moon 2 of Whirlpool Star 4 - Planet 1', false, true, 1000, 5.00, 28);
INSERT INTO public.moon VALUES (84, 'Moon 3 of Whirlpool Star 4 - Planet 1', 'Description of Moon 3 of Whirlpool Star 4 - Planet 1', false, true, 1000, 5.00, 28);
INSERT INTO public.moon VALUES (85, 'Moon 1 of Whirlpool Star 4 - Planet 2', 'Description of Moon 1 of Whirlpool Star 4 - Planet 2', false, true, 1000, 5.00, 29);
INSERT INTO public.moon VALUES (86, 'Moon 2 of Whirlpool Star 4 - Planet 2', 'Description of Moon 2 of Whirlpool Star 4 - Planet 2', false, true, 1000, 5.00, 29);
INSERT INTO public.moon VALUES (87, 'Moon 3 of Whirlpool Star 4 - Planet 2', 'Description of Moon 3 of Whirlpool Star 4 - Planet 2', false, true, 1000, 5.00, 29);
INSERT INTO public.moon VALUES (88, 'Moon 1 of Whirlpool Star 4 - Planet 3', 'Description of Moon 1 of Whirlpool Star 4 - Planet 3', false, true, 1000, 5.00, 30);
INSERT INTO public.moon VALUES (89, 'Moon 2 of Whirlpool Star 4 - Planet 3', 'Description of Moon 2 of Whirlpool Star 4 - Planet 3', false, true, 1000, 5.00, 30);
INSERT INTO public.moon VALUES (90, 'Moon 3 of Whirlpool Star 4 - Planet 3', 'Description of Moon 3 of Whirlpool Star 4 - Planet 3', false, true, 1000, 5.00, 30);
INSERT INTO public.moon VALUES (91, 'Moon 1 of Whirlpool Star 5 - Planet 1', 'Description of Moon 1 of Whirlpool Star 5 - Planet 1', false, true, 1000, 5.00, 31);
INSERT INTO public.moon VALUES (92, 'Moon 2 of Whirlpool Star 5 - Planet 1', 'Description of Moon 2 of Whirlpool Star 5 - Planet 1', false, true, 1000, 5.00, 31);
INSERT INTO public.moon VALUES (93, 'Moon 3 of Whirlpool Star 5 - Planet 1', 'Description of Moon 3 of Whirlpool Star 5 - Planet 1', false, true, 1000, 5.00, 31);
INSERT INTO public.moon VALUES (94, 'Moon 1 of Whirlpool Star 5 - Planet 2', 'Description of Moon 1 of Whirlpool Star 5 - Planet 2', false, true, 1000, 5.00, 32);
INSERT INTO public.moon VALUES (95, 'Moon 2 of Whirlpool Star 5 - Planet 2', 'Description of Moon 2 of Whirlpool Star 5 - Planet 2', false, true, 1000, 5.00, 32);
INSERT INTO public.moon VALUES (96, 'Moon 3 of Whirlpool Star 5 - Planet 2', 'Description of Moon 3 of Whirlpool Star 5 - Planet 2', false, true, 1000, 5.00, 32);
INSERT INTO public.moon VALUES (97, 'Moon 1 of Whirlpool Star 5 - Planet 3', 'Description of Moon 1 of Whirlpool Star 5 - Planet 3', false, true, 1000, 5.00, 33);
INSERT INTO public.moon VALUES (98, 'Moon 2 of Whirlpool Star 5 - Planet 3', 'Description of Moon 2 of Whirlpool Star 5 - Planet 3', false, true, 1000, 5.00, 33);
INSERT INTO public.moon VALUES (99, 'Moon 3 of Whirlpool Star 5 - Planet 3', 'Description of Moon 3 of Whirlpool Star 5 - Planet 3', false, true, 1000, 5.00, 33);
INSERT INTO public.moon VALUES (100, 'Moon 1 of Whirlpool Star 6 - Planet 1', 'Description of Moon 1 of Whirlpool Star 6 - Planet 1', false, true, 1000, 5.00, 34);
INSERT INTO public.moon VALUES (101, 'Moon 2 of Whirlpool Star 6 - Planet 1', 'Description of Moon 2 of Whirlpool Star 6 - Planet 1', false, true, 1000, 5.00, 34);
INSERT INTO public.moon VALUES (102, 'Moon 3 of Whirlpool Star 6 - Planet 1', 'Description of Moon 3 of Whirlpool Star 6 - Planet 1', false, true, 1000, 5.00, 34);
INSERT INTO public.moon VALUES (103, 'Moon 1 of Whirlpool Star 6 - Planet 2', 'Description of Moon 1 of Whirlpool Star 6 - Planet 2', false, true, 1000, 5.00, 35);
INSERT INTO public.moon VALUES (104, 'Moon 2 of Whirlpool Star 6 - Planet 2', 'Description of Moon 2 of Whirlpool Star 6 - Planet 2', false, true, 1000, 5.00, 35);
INSERT INTO public.moon VALUES (105, 'Moon 3 of Whirlpool Star 6 - Planet 2', 'Description of Moon 3 of Whirlpool Star 6 - Planet 2', false, true, 1000, 5.00, 35);
INSERT INTO public.moon VALUES (106, 'Moon 1 of Whirlpool Star 6 - Planet 3', 'Description of Moon 1 of Whirlpool Star 6 - Planet 3', false, true, 1000, 5.00, 36);
INSERT INTO public.moon VALUES (107, 'Moon 2 of Whirlpool Star 6 - Planet 3', 'Description of Moon 2 of Whirlpool Star 6 - Planet 3', false, true, 1000, 5.00, 36);
INSERT INTO public.moon VALUES (108, 'Moon 3 of Whirlpool Star 6 - Planet 3', 'Description of Moon 3 of Whirlpool Star 6 - Planet 3', false, true, 1000, 5.00, 36);
INSERT INTO public.moon VALUES (109, 'Moon 1 of Pinwheel Star 1 - Planet 1', 'Description of Moon 1 of Pinwheel Star 1 - Planet 1', false, true, 1000, 5.00, 37);
INSERT INTO public.moon VALUES (110, 'Moon 2 of Pinwheel Star 1 - Planet 1', 'Description of Moon 2 of Pinwheel Star 1 - Planet 1', false, true, 1000, 5.00, 37);
INSERT INTO public.moon VALUES (111, 'Moon 3 of Pinwheel Star 1 - Planet 1', 'Description of Moon 3 of Pinwheel Star 1 - Planet 1', false, true, 1000, 5.00, 37);
INSERT INTO public.moon VALUES (112, 'Moon 1 of Pinwheel Star 1 - Planet 2', 'Description of Moon 1 of Pinwheel Star 1 - Planet 2', false, true, 1000, 5.00, 38);
INSERT INTO public.moon VALUES (113, 'Moon 2 of Pinwheel Star 1 - Planet 2', 'Description of Moon 2 of Pinwheel Star 1 - Planet 2', false, true, 1000, 5.00, 38);
INSERT INTO public.moon VALUES (114, 'Moon 3 of Pinwheel Star 1 - Planet 2', 'Description of Moon 3 of Pinwheel Star 1 - Planet 2', false, true, 1000, 5.00, 38);
INSERT INTO public.moon VALUES (115, 'Moon 1 of Pinwheel Star 1 - Planet 3', 'Description of Moon 1 of Pinwheel Star 1 - Planet 3', false, true, 1000, 5.00, 39);
INSERT INTO public.moon VALUES (116, 'Moon 2 of Pinwheel Star 1 - Planet 3', 'Description of Moon 2 of Pinwheel Star 1 - Planet 3', false, true, 1000, 5.00, 39);
INSERT INTO public.moon VALUES (117, 'Moon 3 of Pinwheel Star 1 - Planet 3', 'Description of Moon 3 of Pinwheel Star 1 - Planet 3', false, true, 1000, 5.00, 39);
INSERT INTO public.moon VALUES (118, 'Moon 1 of Pinwheel Star 2 - Planet 1', 'Description of Moon 1 of Pinwheel Star 2 - Planet 1', false, true, 1000, 5.00, 40);
INSERT INTO public.moon VALUES (119, 'Moon 2 of Pinwheel Star 2 - Planet 1', 'Description of Moon 2 of Pinwheel Star 2 - Planet 1', false, true, 1000, 5.00, 40);
INSERT INTO public.moon VALUES (120, 'Moon 3 of Pinwheel Star 2 - Planet 1', 'Description of Moon 3 of Pinwheel Star 2 - Planet 1', false, true, 1000, 5.00, 40);
INSERT INTO public.moon VALUES (121, 'Moon 1 of Pinwheel Star 2 - Planet 2', 'Description of Moon 1 of Pinwheel Star 2 - Planet 2', false, true, 1000, 5.00, 41);
INSERT INTO public.moon VALUES (122, 'Moon 2 of Pinwheel Star 2 - Planet 2', 'Description of Moon 2 of Pinwheel Star 2 - Planet 2', false, true, 1000, 5.00, 41);
INSERT INTO public.moon VALUES (123, 'Moon 3 of Pinwheel Star 2 - Planet 2', 'Description of Moon 3 of Pinwheel Star 2 - Planet 2', false, true, 1000, 5.00, 41);
INSERT INTO public.moon VALUES (124, 'Moon 1 of Pinwheel Star 2 - Planet 3', 'Description of Moon 1 of Pinwheel Star 2 - Planet 3', false, true, 1000, 5.00, 42);
INSERT INTO public.moon VALUES (125, 'Moon 2 of Pinwheel Star 2 - Planet 3', 'Description of Moon 2 of Pinwheel Star 2 - Planet 3', false, true, 1000, 5.00, 42);
INSERT INTO public.moon VALUES (126, 'Moon 3 of Pinwheel Star 2 - Planet 3', 'Description of Moon 3 of Pinwheel Star 2 - Planet 3', false, true, 1000, 5.00, 42);
INSERT INTO public.moon VALUES (127, 'Moon 1 of Pinwheel Star 3 - Planet 1', 'Description of Moon 1 of Pinwheel Star 3 - Planet 1', false, true, 1000, 5.00, 43);
INSERT INTO public.moon VALUES (128, 'Moon 2 of Pinwheel Star 3 - Planet 1', 'Description of Moon 2 of Pinwheel Star 3 - Planet 1', false, true, 1000, 5.00, 43);
INSERT INTO public.moon VALUES (129, 'Moon 3 of Pinwheel Star 3 - Planet 1', 'Description of Moon 3 of Pinwheel Star 3 - Planet 1', false, true, 1000, 5.00, 43);
INSERT INTO public.moon VALUES (130, 'Moon 1 of Pinwheel Star 3 - Planet 2', 'Description of Moon 1 of Pinwheel Star 3 - Planet 2', false, true, 1000, 5.00, 44);
INSERT INTO public.moon VALUES (131, 'Moon 2 of Pinwheel Star 3 - Planet 2', 'Description of Moon 2 of Pinwheel Star 3 - Planet 2', false, true, 1000, 5.00, 44);
INSERT INTO public.moon VALUES (132, 'Moon 3 of Pinwheel Star 3 - Planet 2', 'Description of Moon 3 of Pinwheel Star 3 - Planet 2', false, true, 1000, 5.00, 44);
INSERT INTO public.moon VALUES (133, 'Moon 1 of Pinwheel Star 3 - Planet 3', 'Description of Moon 1 of Pinwheel Star 3 - Planet 3', false, true, 1000, 5.00, 45);
INSERT INTO public.moon VALUES (134, 'Moon 2 of Pinwheel Star 3 - Planet 3', 'Description of Moon 2 of Pinwheel Star 3 - Planet 3', false, true, 1000, 5.00, 45);
INSERT INTO public.moon VALUES (135, 'Moon 3 of Pinwheel Star 3 - Planet 3', 'Description of Moon 3 of Pinwheel Star 3 - Planet 3', false, true, 1000, 5.00, 45);
INSERT INTO public.moon VALUES (136, 'Moon 1 of Pinwheel Star 4 - Planet 1', 'Description of Moon 1 of Pinwheel Star 4 - Planet 1', false, true, 1000, 5.00, 46);
INSERT INTO public.moon VALUES (137, 'Moon 2 of Pinwheel Star 4 - Planet 1', 'Description of Moon 2 of Pinwheel Star 4 - Planet 1', false, true, 1000, 5.00, 46);
INSERT INTO public.moon VALUES (138, 'Moon 3 of Pinwheel Star 4 - Planet 1', 'Description of Moon 3 of Pinwheel Star 4 - Planet 1', false, true, 1000, 5.00, 46);
INSERT INTO public.moon VALUES (139, 'Moon 1 of Pinwheel Star 4 - Planet 2', 'Description of Moon 1 of Pinwheel Star 4 - Planet 2', false, true, 1000, 5.00, 47);
INSERT INTO public.moon VALUES (140, 'Moon 2 of Pinwheel Star 4 - Planet 2', 'Description of Moon 2 of Pinwheel Star 4 - Planet 2', false, true, 1000, 5.00, 47);
INSERT INTO public.moon VALUES (141, 'Moon 3 of Pinwheel Star 4 - Planet 2', 'Description of Moon 3 of Pinwheel Star 4 - Planet 2', false, true, 1000, 5.00, 47);
INSERT INTO public.moon VALUES (142, 'Moon 1 of Pinwheel Star 4 - Planet 3', 'Description of Moon 1 of Pinwheel Star 4 - Planet 3', false, true, 1000, 5.00, 48);
INSERT INTO public.moon VALUES (143, 'Moon 2 of Pinwheel Star 4 - Planet 3', 'Description of Moon 2 of Pinwheel Star 4 - Planet 3', false, true, 1000, 5.00, 48);
INSERT INTO public.moon VALUES (144, 'Moon 3 of Pinwheel Star 4 - Planet 3', 'Description of Moon 3 of Pinwheel Star 4 - Planet 3', false, true, 1000, 5.00, 48);
INSERT INTO public.moon VALUES (145, 'Moon 1 of Pinwheel Star 5 - Planet 1', 'Description of Moon 1 of Pinwheel Star 5 - Planet 1', false, true, 1000, 5.00, 49);
INSERT INTO public.moon VALUES (146, 'Moon 2 of Pinwheel Star 5 - Planet 1', 'Description of Moon 2 of Pinwheel Star 5 - Planet 1', false, true, 1000, 5.00, 49);
INSERT INTO public.moon VALUES (147, 'Moon 3 of Pinwheel Star 5 - Planet 1', 'Description of Moon 3 of Pinwheel Star 5 - Planet 1', false, true, 1000, 5.00, 49);
INSERT INTO public.moon VALUES (148, 'Moon 1 of Pinwheel Star 5 - Planet 2', 'Description of Moon 1 of Pinwheel Star 5 - Planet 2', false, true, 1000, 5.00, 50);
INSERT INTO public.moon VALUES (149, 'Moon 2 of Pinwheel Star 5 - Planet 2', 'Description of Moon 2 of Pinwheel Star 5 - Planet 2', false, true, 1000, 5.00, 50);
INSERT INTO public.moon VALUES (150, 'Moon 3 of Pinwheel Star 5 - Planet 2', 'Description of Moon 3 of Pinwheel Star 5 - Planet 2', false, true, 1000, 5.00, 50);
INSERT INTO public.moon VALUES (151, 'Moon 1 of Pinwheel Star 5 - Planet 3', 'Description of Moon 1 of Pinwheel Star 5 - Planet 3', false, true, 1000, 5.00, 51);
INSERT INTO public.moon VALUES (152, 'Moon 2 of Pinwheel Star 5 - Planet 3', 'Description of Moon 2 of Pinwheel Star 5 - Planet 3', false, true, 1000, 5.00, 51);
INSERT INTO public.moon VALUES (153, 'Moon 3 of Pinwheel Star 5 - Planet 3', 'Description of Moon 3 of Pinwheel Star 5 - Planet 3', false, true, 1000, 5.00, 51);
INSERT INTO public.moon VALUES (154, 'Moon 1 of Pinwheel Star 6 - Planet 1', 'Description of Moon 1 of Pinwheel Star 6 - Planet 1', false, true, 1000, 5.00, 52);
INSERT INTO public.moon VALUES (155, 'Moon 2 of Pinwheel Star 6 - Planet 1', 'Description of Moon 2 of Pinwheel Star 6 - Planet 1', false, true, 1000, 5.00, 52);
INSERT INTO public.moon VALUES (156, 'Moon 3 of Pinwheel Star 6 - Planet 1', 'Description of Moon 3 of Pinwheel Star 6 - Planet 1', false, true, 1000, 5.00, 52);
INSERT INTO public.moon VALUES (157, 'Moon 1 of Pinwheel Star 6 - Planet 2', 'Description of Moon 1 of Pinwheel Star 6 - Planet 2', false, true, 1000, 5.00, 53);
INSERT INTO public.moon VALUES (158, 'Moon 2 of Pinwheel Star 6 - Planet 2', 'Description of Moon 2 of Pinwheel Star 6 - Planet 2', false, true, 1000, 5.00, 53);
INSERT INTO public.moon VALUES (159, 'Moon 3 of Pinwheel Star 6 - Planet 2', 'Description of Moon 3 of Pinwheel Star 6 - Planet 2', false, true, 1000, 5.00, 53);
INSERT INTO public.moon VALUES (160, 'Moon 1 of Pinwheel Star 6 - Planet 3', 'Description of Moon 1 of Pinwheel Star 6 - Planet 3', false, true, 1000, 5.00, 54);
INSERT INTO public.moon VALUES (161, 'Moon 2 of Pinwheel Star 6 - Planet 3', 'Description of Moon 2 of Pinwheel Star 6 - Planet 3', false, true, 1000, 5.00, 54);
INSERT INTO public.moon VALUES (162, 'Moon 3 of Pinwheel Star 6 - Planet 3', 'Description of Moon 3 of Pinwheel Star 6 - Planet 3', false, true, 1000, 5.00, 54);
INSERT INTO public.moon VALUES (163, 'Moon 1 of Antennae Star 1 - Planet 1', 'Description of Moon 1 of Antennae Star 1 - Planet 1', false, true, 1000, 5.00, 55);
INSERT INTO public.moon VALUES (164, 'Moon 2 of Antennae Star 1 - Planet 1', 'Description of Moon 2 of Antennae Star 1 - Planet 1', false, true, 1000, 5.00, 55);
INSERT INTO public.moon VALUES (165, 'Moon 3 of Antennae Star 1 - Planet 1', 'Description of Moon 3 of Antennae Star 1 - Planet 1', false, true, 1000, 5.00, 55);
INSERT INTO public.moon VALUES (166, 'Moon 1 of Antennae Star 1 - Planet 2', 'Description of Moon 1 of Antennae Star 1 - Planet 2', false, true, 1000, 5.00, 56);
INSERT INTO public.moon VALUES (167, 'Moon 2 of Antennae Star 1 - Planet 2', 'Description of Moon 2 of Antennae Star 1 - Planet 2', false, true, 1000, 5.00, 56);
INSERT INTO public.moon VALUES (168, 'Moon 3 of Antennae Star 1 - Planet 2', 'Description of Moon 3 of Antennae Star 1 - Planet 2', false, true, 1000, 5.00, 56);
INSERT INTO public.moon VALUES (169, 'Moon 1 of Antennae Star 1 - Planet 3', 'Description of Moon 1 of Antennae Star 1 - Planet 3', false, true, 1000, 5.00, 57);
INSERT INTO public.moon VALUES (170, 'Moon 2 of Antennae Star 1 - Planet 3', 'Description of Moon 2 of Antennae Star 1 - Planet 3', false, true, 1000, 5.00, 57);
INSERT INTO public.moon VALUES (171, 'Moon 3 of Antennae Star 1 - Planet 3', 'Description of Moon 3 of Antennae Star 1 - Planet 3', false, true, 1000, 5.00, 57);
INSERT INTO public.moon VALUES (172, 'Moon 1 of Antennae Star 2 - Planet 1', 'Description of Moon 1 of Antennae Star 2 - Planet 1', false, true, 1000, 5.00, 58);
INSERT INTO public.moon VALUES (173, 'Moon 2 of Antennae Star 2 - Planet 1', 'Description of Moon 2 of Antennae Star 2 - Planet 1', false, true, 1000, 5.00, 58);
INSERT INTO public.moon VALUES (174, 'Moon 3 of Antennae Star 2 - Planet 1', 'Description of Moon 3 of Antennae Star 2 - Planet 1', false, true, 1000, 5.00, 58);
INSERT INTO public.moon VALUES (175, 'Moon 1 of Antennae Star 2 - Planet 2', 'Description of Moon 1 of Antennae Star 2 - Planet 2', false, true, 1000, 5.00, 59);
INSERT INTO public.moon VALUES (176, 'Moon 2 of Antennae Star 2 - Planet 2', 'Description of Moon 2 of Antennae Star 2 - Planet 2', false, true, 1000, 5.00, 59);
INSERT INTO public.moon VALUES (177, 'Moon 3 of Antennae Star 2 - Planet 2', 'Description of Moon 3 of Antennae Star 2 - Planet 2', false, true, 1000, 5.00, 59);
INSERT INTO public.moon VALUES (178, 'Moon 1 of Antennae Star 2 - Planet 3', 'Description of Moon 1 of Antennae Star 2 - Planet 3', false, true, 1000, 5.00, 60);
INSERT INTO public.moon VALUES (179, 'Moon 2 of Antennae Star 2 - Planet 3', 'Description of Moon 2 of Antennae Star 2 - Planet 3', false, true, 1000, 5.00, 60);
INSERT INTO public.moon VALUES (180, 'Moon 3 of Antennae Star 2 - Planet 3', 'Description of Moon 3 of Antennae Star 2 - Planet 3', false, true, 1000, 5.00, 60);
INSERT INTO public.moon VALUES (181, 'Moon 1 of Antennae Star 3 - Planet 1', 'Description of Moon 1 of Antennae Star 3 - Planet 1', false, true, 1000, 5.00, 61);
INSERT INTO public.moon VALUES (182, 'Moon 2 of Antennae Star 3 - Planet 1', 'Description of Moon 2 of Antennae Star 3 - Planet 1', false, true, 1000, 5.00, 61);
INSERT INTO public.moon VALUES (183, 'Moon 3 of Antennae Star 3 - Planet 1', 'Description of Moon 3 of Antennae Star 3 - Planet 1', false, true, 1000, 5.00, 61);
INSERT INTO public.moon VALUES (184, 'Moon 1 of Antennae Star 3 - Planet 2', 'Description of Moon 1 of Antennae Star 3 - Planet 2', false, true, 1000, 5.00, 62);
INSERT INTO public.moon VALUES (185, 'Moon 2 of Antennae Star 3 - Planet 2', 'Description of Moon 2 of Antennae Star 3 - Planet 2', false, true, 1000, 5.00, 62);
INSERT INTO public.moon VALUES (186, 'Moon 3 of Antennae Star 3 - Planet 2', 'Description of Moon 3 of Antennae Star 3 - Planet 2', false, true, 1000, 5.00, 62);
INSERT INTO public.moon VALUES (187, 'Moon 1 of Antennae Star 3 - Planet 3', 'Description of Moon 1 of Antennae Star 3 - Planet 3', false, true, 1000, 5.00, 63);
INSERT INTO public.moon VALUES (188, 'Moon 2 of Antennae Star 3 - Planet 3', 'Description of Moon 2 of Antennae Star 3 - Planet 3', false, true, 1000, 5.00, 63);
INSERT INTO public.moon VALUES (189, 'Moon 3 of Antennae Star 3 - Planet 3', 'Description of Moon 3 of Antennae Star 3 - Planet 3', false, true, 1000, 5.00, 63);
INSERT INTO public.moon VALUES (190, 'Moon 1 of Antennae Star 4 - Planet 1', 'Description of Moon 1 of Antennae Star 4 - Planet 1', false, true, 1000, 5.00, 64);
INSERT INTO public.moon VALUES (191, 'Moon 2 of Antennae Star 4 - Planet 1', 'Description of Moon 2 of Antennae Star 4 - Planet 1', false, true, 1000, 5.00, 64);
INSERT INTO public.moon VALUES (192, 'Moon 3 of Antennae Star 4 - Planet 1', 'Description of Moon 3 of Antennae Star 4 - Planet 1', false, true, 1000, 5.00, 64);
INSERT INTO public.moon VALUES (193, 'Moon 1 of Antennae Star 4 - Planet 2', 'Description of Moon 1 of Antennae Star 4 - Planet 2', false, true, 1000, 5.00, 65);
INSERT INTO public.moon VALUES (194, 'Moon 2 of Antennae Star 4 - Planet 2', 'Description of Moon 2 of Antennae Star 4 - Planet 2', false, true, 1000, 5.00, 65);
INSERT INTO public.moon VALUES (195, 'Moon 3 of Antennae Star 4 - Planet 2', 'Description of Moon 3 of Antennae Star 4 - Planet 2', false, true, 1000, 5.00, 65);
INSERT INTO public.moon VALUES (196, 'Moon 1 of Antennae Star 4 - Planet 3', 'Description of Moon 1 of Antennae Star 4 - Planet 3', false, true, 1000, 5.00, 66);
INSERT INTO public.moon VALUES (197, 'Moon 2 of Antennae Star 4 - Planet 3', 'Description of Moon 2 of Antennae Star 4 - Planet 3', false, true, 1000, 5.00, 66);
INSERT INTO public.moon VALUES (198, 'Moon 3 of Antennae Star 4 - Planet 3', 'Description of Moon 3 of Antennae Star 4 - Planet 3', false, true, 1000, 5.00, 66);
INSERT INTO public.moon VALUES (199, 'Moon 1 of Antennae Star 5 - Planet 1', 'Description of Moon 1 of Antennae Star 5 - Planet 1', false, true, 1000, 5.00, 67);
INSERT INTO public.moon VALUES (200, 'Moon 2 of Antennae Star 5 - Planet 1', 'Description of Moon 2 of Antennae Star 5 - Planet 1', false, true, 1000, 5.00, 67);
INSERT INTO public.moon VALUES (201, 'Moon 3 of Antennae Star 5 - Planet 1', 'Description of Moon 3 of Antennae Star 5 - Planet 1', false, true, 1000, 5.00, 67);
INSERT INTO public.moon VALUES (202, 'Moon 1 of Antennae Star 5 - Planet 2', 'Description of Moon 1 of Antennae Star 5 - Planet 2', false, true, 1000, 5.00, 68);
INSERT INTO public.moon VALUES (203, 'Moon 2 of Antennae Star 5 - Planet 2', 'Description of Moon 2 of Antennae Star 5 - Planet 2', false, true, 1000, 5.00, 68);
INSERT INTO public.moon VALUES (204, 'Moon 3 of Antennae Star 5 - Planet 2', 'Description of Moon 3 of Antennae Star 5 - Planet 2', false, true, 1000, 5.00, 68);
INSERT INTO public.moon VALUES (205, 'Moon 1 of Antennae Star 5 - Planet 3', 'Description of Moon 1 of Antennae Star 5 - Planet 3', false, true, 1000, 5.00, 69);
INSERT INTO public.moon VALUES (206, 'Moon 2 of Antennae Star 5 - Planet 3', 'Description of Moon 2 of Antennae Star 5 - Planet 3', false, true, 1000, 5.00, 69);
INSERT INTO public.moon VALUES (207, 'Moon 3 of Antennae Star 5 - Planet 3', 'Description of Moon 3 of Antennae Star 5 - Planet 3', false, true, 1000, 5.00, 69);
INSERT INTO public.moon VALUES (208, 'Moon 1 of Antennae Star 6 - Planet 1', 'Description of Moon 1 of Antennae Star 6 - Planet 1', false, true, 1000, 5.00, 70);
INSERT INTO public.moon VALUES (209, 'Moon 2 of Antennae Star 6 - Planet 1', 'Description of Moon 2 of Antennae Star 6 - Planet 1', false, true, 1000, 5.00, 70);
INSERT INTO public.moon VALUES (210, 'Moon 3 of Antennae Star 6 - Planet 1', 'Description of Moon 3 of Antennae Star 6 - Planet 1', false, true, 1000, 5.00, 70);
INSERT INTO public.moon VALUES (211, 'Moon 1 of Antennae Star 6 - Planet 2', 'Description of Moon 1 of Antennae Star 6 - Planet 2', false, true, 1000, 5.00, 71);
INSERT INTO public.moon VALUES (212, 'Moon 2 of Antennae Star 6 - Planet 2', 'Description of Moon 2 of Antennae Star 6 - Planet 2', false, true, 1000, 5.00, 71);
INSERT INTO public.moon VALUES (213, 'Moon 3 of Antennae Star 6 - Planet 2', 'Description of Moon 3 of Antennae Star 6 - Planet 2', false, true, 1000, 5.00, 71);
INSERT INTO public.moon VALUES (214, 'Moon 1 of Antennae Star 6 - Planet 3', 'Description of Moon 1 of Antennae Star 6 - Planet 3', false, true, 1000, 5.00, 72);
INSERT INTO public.moon VALUES (215, 'Moon 2 of Antennae Star 6 - Planet 3', 'Description of Moon 2 of Antennae Star 6 - Planet 3', false, true, 1000, 5.00, 72);
INSERT INTO public.moon VALUES (216, 'Moon 3 of Antennae Star 6 - Planet 3', 'Description of Moon 3 of Antennae Star 6 - Planet 3', false, true, 1000, 5.00, 72);
INSERT INTO public.moon VALUES (217, 'Moon 1 of Sombrero Star 1 - Planet 1', 'Description of Moon 1 of Sombrero Star 1 - Planet 1', false, true, 1000, 5.00, 73);
INSERT INTO public.moon VALUES (218, 'Moon 2 of Sombrero Star 1 - Planet 1', 'Description of Moon 2 of Sombrero Star 1 - Planet 1', false, true, 1000, 5.00, 73);
INSERT INTO public.moon VALUES (219, 'Moon 3 of Sombrero Star 1 - Planet 1', 'Description of Moon 3 of Sombrero Star 1 - Planet 1', false, true, 1000, 5.00, 73);
INSERT INTO public.moon VALUES (220, 'Moon 1 of Sombrero Star 1 - Planet 2', 'Description of Moon 1 of Sombrero Star 1 - Planet 2', false, true, 1000, 5.00, 74);
INSERT INTO public.moon VALUES (221, 'Moon 2 of Sombrero Star 1 - Planet 2', 'Description of Moon 2 of Sombrero Star 1 - Planet 2', false, true, 1000, 5.00, 74);
INSERT INTO public.moon VALUES (222, 'Moon 3 of Sombrero Star 1 - Planet 2', 'Description of Moon 3 of Sombrero Star 1 - Planet 2', false, true, 1000, 5.00, 74);
INSERT INTO public.moon VALUES (223, 'Moon 1 of Sombrero Star 1 - Planet 3', 'Description of Moon 1 of Sombrero Star 1 - Planet 3', false, true, 1000, 5.00, 75);
INSERT INTO public.moon VALUES (224, 'Moon 2 of Sombrero Star 1 - Planet 3', 'Description of Moon 2 of Sombrero Star 1 - Planet 3', false, true, 1000, 5.00, 75);
INSERT INTO public.moon VALUES (225, 'Moon 3 of Sombrero Star 1 - Planet 3', 'Description of Moon 3 of Sombrero Star 1 - Planet 3', false, true, 1000, 5.00, 75);
INSERT INTO public.moon VALUES (226, 'Moon 1 of Sombrero Star 2 - Planet 1', 'Description of Moon 1 of Sombrero Star 2 - Planet 1', false, true, 1000, 5.00, 76);
INSERT INTO public.moon VALUES (227, 'Moon 2 of Sombrero Star 2 - Planet 1', 'Description of Moon 2 of Sombrero Star 2 - Planet 1', false, true, 1000, 5.00, 76);
INSERT INTO public.moon VALUES (228, 'Moon 3 of Sombrero Star 2 - Planet 1', 'Description of Moon 3 of Sombrero Star 2 - Planet 1', false, true, 1000, 5.00, 76);
INSERT INTO public.moon VALUES (229, 'Moon 1 of Sombrero Star 2 - Planet 2', 'Description of Moon 1 of Sombrero Star 2 - Planet 2', false, true, 1000, 5.00, 77);
INSERT INTO public.moon VALUES (230, 'Moon 2 of Sombrero Star 2 - Planet 2', 'Description of Moon 2 of Sombrero Star 2 - Planet 2', false, true, 1000, 5.00, 77);
INSERT INTO public.moon VALUES (231, 'Moon 3 of Sombrero Star 2 - Planet 2', 'Description of Moon 3 of Sombrero Star 2 - Planet 2', false, true, 1000, 5.00, 77);
INSERT INTO public.moon VALUES (232, 'Moon 1 of Sombrero Star 2 - Planet 3', 'Description of Moon 1 of Sombrero Star 2 - Planet 3', false, true, 1000, 5.00, 78);
INSERT INTO public.moon VALUES (233, 'Moon 2 of Sombrero Star 2 - Planet 3', 'Description of Moon 2 of Sombrero Star 2 - Planet 3', false, true, 1000, 5.00, 78);
INSERT INTO public.moon VALUES (234, 'Moon 3 of Sombrero Star 2 - Planet 3', 'Description of Moon 3 of Sombrero Star 2 - Planet 3', false, true, 1000, 5.00, 78);
INSERT INTO public.moon VALUES (235, 'Moon 1 of Sombrero Star 3 - Planet 1', 'Description of Moon 1 of Sombrero Star 3 - Planet 1', false, true, 1000, 5.00, 79);
INSERT INTO public.moon VALUES (236, 'Moon 2 of Sombrero Star 3 - Planet 1', 'Description of Moon 2 of Sombrero Star 3 - Planet 1', false, true, 1000, 5.00, 79);
INSERT INTO public.moon VALUES (237, 'Moon 3 of Sombrero Star 3 - Planet 1', 'Description of Moon 3 of Sombrero Star 3 - Planet 1', false, true, 1000, 5.00, 79);
INSERT INTO public.moon VALUES (238, 'Moon 1 of Sombrero Star 3 - Planet 2', 'Description of Moon 1 of Sombrero Star 3 - Planet 2', false, true, 1000, 5.00, 80);
INSERT INTO public.moon VALUES (239, 'Moon 2 of Sombrero Star 3 - Planet 2', 'Description of Moon 2 of Sombrero Star 3 - Planet 2', false, true, 1000, 5.00, 80);
INSERT INTO public.moon VALUES (240, 'Moon 3 of Sombrero Star 3 - Planet 2', 'Description of Moon 3 of Sombrero Star 3 - Planet 2', false, true, 1000, 5.00, 80);
INSERT INTO public.moon VALUES (241, 'Moon 1 of Sombrero Star 3 - Planet 3', 'Description of Moon 1 of Sombrero Star 3 - Planet 3', false, true, 1000, 5.00, 81);
INSERT INTO public.moon VALUES (242, 'Moon 2 of Sombrero Star 3 - Planet 3', 'Description of Moon 2 of Sombrero Star 3 - Planet 3', false, true, 1000, 5.00, 81);
INSERT INTO public.moon VALUES (243, 'Moon 3 of Sombrero Star 3 - Planet 3', 'Description of Moon 3 of Sombrero Star 3 - Planet 3', false, true, 1000, 5.00, 81);
INSERT INTO public.moon VALUES (244, 'Moon 1 of Sombrero Star 4 - Planet 1', 'Description of Moon 1 of Sombrero Star 4 - Planet 1', false, true, 1000, 5.00, 82);
INSERT INTO public.moon VALUES (245, 'Moon 2 of Sombrero Star 4 - Planet 1', 'Description of Moon 2 of Sombrero Star 4 - Planet 1', false, true, 1000, 5.00, 82);
INSERT INTO public.moon VALUES (246, 'Moon 3 of Sombrero Star 4 - Planet 1', 'Description of Moon 3 of Sombrero Star 4 - Planet 1', false, true, 1000, 5.00, 82);
INSERT INTO public.moon VALUES (247, 'Moon 1 of Sombrero Star 4 - Planet 2', 'Description of Moon 1 of Sombrero Star 4 - Planet 2', false, true, 1000, 5.00, 83);
INSERT INTO public.moon VALUES (248, 'Moon 2 of Sombrero Star 4 - Planet 2', 'Description of Moon 2 of Sombrero Star 4 - Planet 2', false, true, 1000, 5.00, 83);
INSERT INTO public.moon VALUES (249, 'Moon 3 of Sombrero Star 4 - Planet 2', 'Description of Moon 3 of Sombrero Star 4 - Planet 2', false, true, 1000, 5.00, 83);
INSERT INTO public.moon VALUES (250, 'Moon 1 of Sombrero Star 4 - Planet 3', 'Description of Moon 1 of Sombrero Star 4 - Planet 3', false, true, 1000, 5.00, 84);
INSERT INTO public.moon VALUES (251, 'Moon 2 of Sombrero Star 4 - Planet 3', 'Description of Moon 2 of Sombrero Star 4 - Planet 3', false, true, 1000, 5.00, 84);
INSERT INTO public.moon VALUES (252, 'Moon 3 of Sombrero Star 4 - Planet 3', 'Description of Moon 3 of Sombrero Star 4 - Planet 3', false, true, 1000, 5.00, 84);
INSERT INTO public.moon VALUES (253, 'Moon 1 of Sombrero Star 5 - Planet 1', 'Description of Moon 1 of Sombrero Star 5 - Planet 1', false, true, 1000, 5.00, 85);
INSERT INTO public.moon VALUES (254, 'Moon 2 of Sombrero Star 5 - Planet 1', 'Description of Moon 2 of Sombrero Star 5 - Planet 1', false, true, 1000, 5.00, 85);
INSERT INTO public.moon VALUES (255, 'Moon 3 of Sombrero Star 5 - Planet 1', 'Description of Moon 3 of Sombrero Star 5 - Planet 1', false, true, 1000, 5.00, 85);
INSERT INTO public.moon VALUES (256, 'Moon 1 of Sombrero Star 5 - Planet 2', 'Description of Moon 1 of Sombrero Star 5 - Planet 2', false, true, 1000, 5.00, 86);
INSERT INTO public.moon VALUES (257, 'Moon 2 of Sombrero Star 5 - Planet 2', 'Description of Moon 2 of Sombrero Star 5 - Planet 2', false, true, 1000, 5.00, 86);
INSERT INTO public.moon VALUES (258, 'Moon 3 of Sombrero Star 5 - Planet 2', 'Description of Moon 3 of Sombrero Star 5 - Planet 2', false, true, 1000, 5.00, 86);
INSERT INTO public.moon VALUES (259, 'Moon 1 of Sombrero Star 5 - Planet 3', 'Description of Moon 1 of Sombrero Star 5 - Planet 3', false, true, 1000, 5.00, 87);
INSERT INTO public.moon VALUES (260, 'Moon 2 of Sombrero Star 5 - Planet 3', 'Description of Moon 2 of Sombrero Star 5 - Planet 3', false, true, 1000, 5.00, 87);
INSERT INTO public.moon VALUES (261, 'Moon 3 of Sombrero Star 5 - Planet 3', 'Description of Moon 3 of Sombrero Star 5 - Planet 3', false, true, 1000, 5.00, 87);
INSERT INTO public.moon VALUES (262, 'Moon 1 of Sombrero Star 6 - Planet 1', 'Description of Moon 1 of Sombrero Star 6 - Planet 1', false, true, 1000, 5.00, 88);
INSERT INTO public.moon VALUES (263, 'Moon 2 of Sombrero Star 6 - Planet 1', 'Description of Moon 2 of Sombrero Star 6 - Planet 1', false, true, 1000, 5.00, 88);
INSERT INTO public.moon VALUES (264, 'Moon 3 of Sombrero Star 6 - Planet 1', 'Description of Moon 3 of Sombrero Star 6 - Planet 1', false, true, 1000, 5.00, 88);
INSERT INTO public.moon VALUES (265, 'Moon 1 of Sombrero Star 6 - Planet 2', 'Description of Moon 1 of Sombrero Star 6 - Planet 2', false, true, 1000, 5.00, 89);
INSERT INTO public.moon VALUES (266, 'Moon 2 of Sombrero Star 6 - Planet 2', 'Description of Moon 2 of Sombrero Star 6 - Planet 2', false, true, 1000, 5.00, 89);
INSERT INTO public.moon VALUES (267, 'Moon 3 of Sombrero Star 6 - Planet 2', 'Description of Moon 3 of Sombrero Star 6 - Planet 2', false, true, 1000, 5.00, 89);
INSERT INTO public.moon VALUES (268, 'Moon 1 of Sombrero Star 6 - Planet 3', 'Description of Moon 1 of Sombrero Star 6 - Planet 3', false, true, 1000, 5.00, 90);
INSERT INTO public.moon VALUES (269, 'Moon 2 of Sombrero Star 6 - Planet 3', 'Description of Moon 2 of Sombrero Star 6 - Planet 3', false, true, 1000, 5.00, 90);
INSERT INTO public.moon VALUES (270, 'Moon 3 of Sombrero Star 6 - Planet 3', 'Description of Moon 3 of Sombrero Star 6 - Planet 3', false, true, 1000, 5.00, 90);
INSERT INTO public.moon VALUES (271, 'Moon 1 of Triangulum Star 1 - Planet 1', 'Description of Moon 1 of Triangulum Star 1 - Planet 1', false, true, 1000, 5.00, 91);
INSERT INTO public.moon VALUES (272, 'Moon 2 of Triangulum Star 1 - Planet 1', 'Description of Moon 2 of Triangulum Star 1 - Planet 1', false, true, 1000, 5.00, 91);
INSERT INTO public.moon VALUES (273, 'Moon 3 of Triangulum Star 1 - Planet 1', 'Description of Moon 3 of Triangulum Star 1 - Planet 1', false, true, 1000, 5.00, 91);
INSERT INTO public.moon VALUES (274, 'Moon 1 of Triangulum Star 1 - Planet 2', 'Description of Moon 1 of Triangulum Star 1 - Planet 2', false, true, 1000, 5.00, 92);
INSERT INTO public.moon VALUES (275, 'Moon 2 of Triangulum Star 1 - Planet 2', 'Description of Moon 2 of Triangulum Star 1 - Planet 2', false, true, 1000, 5.00, 92);
INSERT INTO public.moon VALUES (276, 'Moon 3 of Triangulum Star 1 - Planet 2', 'Description of Moon 3 of Triangulum Star 1 - Planet 2', false, true, 1000, 5.00, 92);
INSERT INTO public.moon VALUES (277, 'Moon 1 of Triangulum Star 1 - Planet 3', 'Description of Moon 1 of Triangulum Star 1 - Planet 3', false, true, 1000, 5.00, 93);
INSERT INTO public.moon VALUES (278, 'Moon 2 of Triangulum Star 1 - Planet 3', 'Description of Moon 2 of Triangulum Star 1 - Planet 3', false, true, 1000, 5.00, 93);
INSERT INTO public.moon VALUES (279, 'Moon 3 of Triangulum Star 1 - Planet 3', 'Description of Moon 3 of Triangulum Star 1 - Planet 3', false, true, 1000, 5.00, 93);
INSERT INTO public.moon VALUES (280, 'Moon 1 of Triangulum Star 2 - Planet 1', 'Description of Moon 1 of Triangulum Star 2 - Planet 1', false, true, 1000, 5.00, 94);
INSERT INTO public.moon VALUES (281, 'Moon 2 of Triangulum Star 2 - Planet 1', 'Description of Moon 2 of Triangulum Star 2 - Planet 1', false, true, 1000, 5.00, 94);
INSERT INTO public.moon VALUES (282, 'Moon 3 of Triangulum Star 2 - Planet 1', 'Description of Moon 3 of Triangulum Star 2 - Planet 1', false, true, 1000, 5.00, 94);
INSERT INTO public.moon VALUES (283, 'Moon 1 of Triangulum Star 2 - Planet 2', 'Description of Moon 1 of Triangulum Star 2 - Planet 2', false, true, 1000, 5.00, 95);
INSERT INTO public.moon VALUES (284, 'Moon 2 of Triangulum Star 2 - Planet 2', 'Description of Moon 2 of Triangulum Star 2 - Planet 2', false, true, 1000, 5.00, 95);
INSERT INTO public.moon VALUES (285, 'Moon 3 of Triangulum Star 2 - Planet 2', 'Description of Moon 3 of Triangulum Star 2 - Planet 2', false, true, 1000, 5.00, 95);
INSERT INTO public.moon VALUES (286, 'Moon 1 of Triangulum Star 2 - Planet 3', 'Description of Moon 1 of Triangulum Star 2 - Planet 3', false, true, 1000, 5.00, 96);
INSERT INTO public.moon VALUES (287, 'Moon 2 of Triangulum Star 2 - Planet 3', 'Description of Moon 2 of Triangulum Star 2 - Planet 3', false, true, 1000, 5.00, 96);
INSERT INTO public.moon VALUES (288, 'Moon 3 of Triangulum Star 2 - Planet 3', 'Description of Moon 3 of Triangulum Star 2 - Planet 3', false, true, 1000, 5.00, 96);
INSERT INTO public.moon VALUES (289, 'Moon 1 of Triangulum Star 3 - Planet 1', 'Description of Moon 1 of Triangulum Star 3 - Planet 1', false, true, 1000, 5.00, 97);
INSERT INTO public.moon VALUES (290, 'Moon 2 of Triangulum Star 3 - Planet 1', 'Description of Moon 2 of Triangulum Star 3 - Planet 1', false, true, 1000, 5.00, 97);
INSERT INTO public.moon VALUES (291, 'Moon 3 of Triangulum Star 3 - Planet 1', 'Description of Moon 3 of Triangulum Star 3 - Planet 1', false, true, 1000, 5.00, 97);
INSERT INTO public.moon VALUES (292, 'Moon 1 of Triangulum Star 3 - Planet 2', 'Description of Moon 1 of Triangulum Star 3 - Planet 2', false, true, 1000, 5.00, 98);
INSERT INTO public.moon VALUES (293, 'Moon 2 of Triangulum Star 3 - Planet 2', 'Description of Moon 2 of Triangulum Star 3 - Planet 2', false, true, 1000, 5.00, 98);
INSERT INTO public.moon VALUES (294, 'Moon 3 of Triangulum Star 3 - Planet 2', 'Description of Moon 3 of Triangulum Star 3 - Planet 2', false, true, 1000, 5.00, 98);
INSERT INTO public.moon VALUES (295, 'Moon 1 of Triangulum Star 3 - Planet 3', 'Description of Moon 1 of Triangulum Star 3 - Planet 3', false, true, 1000, 5.00, 99);
INSERT INTO public.moon VALUES (296, 'Moon 2 of Triangulum Star 3 - Planet 3', 'Description of Moon 2 of Triangulum Star 3 - Planet 3', false, true, 1000, 5.00, 99);
INSERT INTO public.moon VALUES (297, 'Moon 3 of Triangulum Star 3 - Planet 3', 'Description of Moon 3 of Triangulum Star 3 - Planet 3', false, true, 1000, 5.00, 99);
INSERT INTO public.moon VALUES (298, 'Moon 1 of Triangulum Star 4 - Planet 1', 'Description of Moon 1 of Triangulum Star 4 - Planet 1', false, true, 1000, 5.00, 100);
INSERT INTO public.moon VALUES (299, 'Moon 2 of Triangulum Star 4 - Planet 1', 'Description of Moon 2 of Triangulum Star 4 - Planet 1', false, true, 1000, 5.00, 100);
INSERT INTO public.moon VALUES (300, 'Moon 3 of Triangulum Star 4 - Planet 1', 'Description of Moon 3 of Triangulum Star 4 - Planet 1', false, true, 1000, 5.00, 100);
INSERT INTO public.moon VALUES (301, 'Moon 1 of Triangulum Star 4 - Planet 2', 'Description of Moon 1 of Triangulum Star 4 - Planet 2', false, true, 1000, 5.00, 101);
INSERT INTO public.moon VALUES (302, 'Moon 2 of Triangulum Star 4 - Planet 2', 'Description of Moon 2 of Triangulum Star 4 - Planet 2', false, true, 1000, 5.00, 101);
INSERT INTO public.moon VALUES (303, 'Moon 3 of Triangulum Star 4 - Planet 2', 'Description of Moon 3 of Triangulum Star 4 - Planet 2', false, true, 1000, 5.00, 101);
INSERT INTO public.moon VALUES (304, 'Moon 1 of Triangulum Star 4 - Planet 3', 'Description of Moon 1 of Triangulum Star 4 - Planet 3', false, true, 1000, 5.00, 102);
INSERT INTO public.moon VALUES (305, 'Moon 2 of Triangulum Star 4 - Planet 3', 'Description of Moon 2 of Triangulum Star 4 - Planet 3', false, true, 1000, 5.00, 102);
INSERT INTO public.moon VALUES (306, 'Moon 3 of Triangulum Star 4 - Planet 3', 'Description of Moon 3 of Triangulum Star 4 - Planet 3', false, true, 1000, 5.00, 102);
INSERT INTO public.moon VALUES (307, 'Moon 1 of Triangulum Star 5 - Planet 1', 'Description of Moon 1 of Triangulum Star 5 - Planet 1', false, true, 1000, 5.00, 103);
INSERT INTO public.moon VALUES (308, 'Moon 2 of Triangulum Star 5 - Planet 1', 'Description of Moon 2 of Triangulum Star 5 - Planet 1', false, true, 1000, 5.00, 103);
INSERT INTO public.moon VALUES (309, 'Moon 3 of Triangulum Star 5 - Planet 1', 'Description of Moon 3 of Triangulum Star 5 - Planet 1', false, true, 1000, 5.00, 103);
INSERT INTO public.moon VALUES (310, 'Moon 1 of Triangulum Star 5 - Planet 2', 'Description of Moon 1 of Triangulum Star 5 - Planet 2', false, true, 1000, 5.00, 104);
INSERT INTO public.moon VALUES (311, 'Moon 2 of Triangulum Star 5 - Planet 2', 'Description of Moon 2 of Triangulum Star 5 - Planet 2', false, true, 1000, 5.00, 104);
INSERT INTO public.moon VALUES (312, 'Moon 3 of Triangulum Star 5 - Planet 2', 'Description of Moon 3 of Triangulum Star 5 - Planet 2', false, true, 1000, 5.00, 104);
INSERT INTO public.moon VALUES (313, 'Moon 1 of Triangulum Star 5 - Planet 3', 'Description of Moon 1 of Triangulum Star 5 - Planet 3', false, true, 1000, 5.00, 105);
INSERT INTO public.moon VALUES (314, 'Moon 2 of Triangulum Star 5 - Planet 3', 'Description of Moon 2 of Triangulum Star 5 - Planet 3', false, true, 1000, 5.00, 105);
INSERT INTO public.moon VALUES (315, 'Moon 3 of Triangulum Star 5 - Planet 3', 'Description of Moon 3 of Triangulum Star 5 - Planet 3', false, true, 1000, 5.00, 105);
INSERT INTO public.moon VALUES (316, 'Moon 1 of Triangulum Star 6 - Planet 1', 'Description of Moon 1 of Triangulum Star 6 - Planet 1', false, true, 1000, 5.00, 106);
INSERT INTO public.moon VALUES (317, 'Moon 2 of Triangulum Star 6 - Planet 1', 'Description of Moon 2 of Triangulum Star 6 - Planet 1', false, true, 1000, 5.00, 106);
INSERT INTO public.moon VALUES (318, 'Moon 3 of Triangulum Star 6 - Planet 1', 'Description of Moon 3 of Triangulum Star 6 - Planet 1', false, true, 1000, 5.00, 106);
INSERT INTO public.moon VALUES (319, 'Moon 1 of Triangulum Star 6 - Planet 2', 'Description of Moon 1 of Triangulum Star 6 - Planet 2', false, true, 1000, 5.00, 107);
INSERT INTO public.moon VALUES (320, 'Moon 2 of Triangulum Star 6 - Planet 2', 'Description of Moon 2 of Triangulum Star 6 - Planet 2', false, true, 1000, 5.00, 107);
INSERT INTO public.moon VALUES (321, 'Moon 3 of Triangulum Star 6 - Planet 2', 'Description of Moon 3 of Triangulum Star 6 - Planet 2', false, true, 1000, 5.00, 107);
INSERT INTO public.moon VALUES (322, 'Moon 1 of Triangulum Star 6 - Planet 3', 'Description of Moon 1 of Triangulum Star 6 - Planet 3', false, true, 1000, 5.00, 108);
INSERT INTO public.moon VALUES (323, 'Moon 2 of Triangulum Star 6 - Planet 3', 'Description of Moon 2 of Triangulum Star 6 - Planet 3', false, true, 1000, 5.00, 108);
INSERT INTO public.moon VALUES (324, 'Moon 3 of Triangulum Star 6 - Planet 3', 'Description of Moon 3 of Triangulum Star 6 - Planet 3', false, true, 1000, 5.00, 108);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Andromeda Star 1 - Planet 1', 'First planet orbiting Andromeda Star 1', false, true, 10000, 2.54, 1);
INSERT INTO public.planet VALUES (2, 'Andromeda Star 1 - Planet 2', 'Second planet orbiting Andromeda Star 1', false, true, 10000, 2.54, 1);
INSERT INTO public.planet VALUES (3, 'Andromeda Star 1 - Planet 3', 'Third planet orbiting Andromeda Star 1', false, true, 10000, 2.54, 1);
INSERT INTO public.planet VALUES (4, 'Andromeda Star 2 - Planet 1', 'First planet orbiting Andromeda Star 2', false, true, 10000, 2.54, 2);
INSERT INTO public.planet VALUES (5, 'Andromeda Star 2 - Planet 2', 'Second planet orbiting Andromeda Star 2', false, true, 10000, 2.54, 2);
INSERT INTO public.planet VALUES (6, 'Andromeda Star 2 - Planet 3', 'Third planet orbiting Andromeda Star 2', false, true, 10000, 2.54, 2);
INSERT INTO public.planet VALUES (7, 'Andromeda Star 3 - Planet 1', 'First planet orbiting Andromeda Star 3', false, true, 10000, 2.54, 3);
INSERT INTO public.planet VALUES (8, 'Andromeda Star 3 - Planet 2', 'Second planet orbiting Andromeda Star 3', false, true, 10000, 2.54, 3);
INSERT INTO public.planet VALUES (9, 'Andromeda Star 3 - Planet 3', 'Third planet orbiting Andromeda Star 3', false, true, 10000, 2.54, 3);
INSERT INTO public.planet VALUES (10, 'Andromeda Star 4 - Planet 1', 'First planet orbiting Andromeda Star 4', false, true, 10000, 2.54, 4);
INSERT INTO public.planet VALUES (11, 'Andromeda Star 4 - Planet 2', 'Second planet orbiting Andromeda Star 4', false, true, 10000, 2.54, 4);
INSERT INTO public.planet VALUES (12, 'Andromeda Star 4 - Planet 3', 'Third planet orbiting Andromeda Star 4', false, true, 10000, 2.54, 4);
INSERT INTO public.planet VALUES (13, 'Andromeda Star 5 - Planet 1', 'First planet orbiting Andromeda Star 5', false, true, 10000, 2.54, 5);
INSERT INTO public.planet VALUES (14, 'Andromeda Star 5 - Planet 2', 'Second planet orbiting Andromeda Star 5', false, true, 10000, 2.54, 5);
INSERT INTO public.planet VALUES (15, 'Andromeda Star 5 - Planet 3', 'Third planet orbiting Andromeda Star 5', false, true, 10000, 2.54, 5);
INSERT INTO public.planet VALUES (16, 'Andromeda Star 6 - Planet 1', 'First planet orbiting Andromeda Star 6', false, true, 10000, 2.54, 6);
INSERT INTO public.planet VALUES (17, 'Andromeda Star 6 - Planet 2', 'Second planet orbiting Andromeda Star 6', false, true, 10000, 2.54, 6);
INSERT INTO public.planet VALUES (18, 'Andromeda Star 6 - Planet 3', 'Third planet orbiting Andromeda Star 6', false, true, 10000, 2.54, 6);
INSERT INTO public.planet VALUES (19, 'Whirlpool Star 1 - Planet 1', 'First planet orbiting Whirlpool Star 1', false, true, 2000, 23.00, 7);
INSERT INTO public.planet VALUES (20, 'Whirlpool Star 1 - Planet 2', 'Second planet orbiting Whirlpool Star 1', false, true, 2000, 23.00, 7);
INSERT INTO public.planet VALUES (21, 'Whirlpool Star 1 - Planet 3', 'Third planet orbiting Whirlpool Star 1', false, true, 2000, 23.00, 7);
INSERT INTO public.planet VALUES (22, 'Whirlpool Star 2 - Planet 1', 'First planet orbiting Whirlpool Star 2', false, true, 2000, 23.00, 8);
INSERT INTO public.planet VALUES (23, 'Whirlpool Star 2 - Planet 2', 'Second planet orbiting Whirlpool Star 2', false, true, 2000, 23.00, 8);
INSERT INTO public.planet VALUES (24, 'Whirlpool Star 2 - Planet 3', 'Third planet orbiting Whirlpool Star 2', false, true, 2000, 23.00, 8);
INSERT INTO public.planet VALUES (25, 'Whirlpool Star 3 - Planet 1', 'First planet orbiting Whirlpool Star 3', false, true, 2000, 23.00, 9);
INSERT INTO public.planet VALUES (26, 'Whirlpool Star 3 - Planet 2', 'Second planet orbiting Whirlpool Star 3', false, true, 2000, 23.00, 9);
INSERT INTO public.planet VALUES (27, 'Whirlpool Star 3 - Planet 3', 'Third planet orbiting Whirlpool Star 3', false, true, 2000, 23.00, 9);
INSERT INTO public.planet VALUES (28, 'Whirlpool Star 4 - Planet 1', 'First planet orbiting Whirlpool Star 4', false, true, 2000, 23.00, 10);
INSERT INTO public.planet VALUES (29, 'Whirlpool Star 4 - Planet 2', 'Second planet orbiting Whirlpool Star 4', false, true, 2000, 23.00, 10);
INSERT INTO public.planet VALUES (30, 'Whirlpool Star 4 - Planet 3', 'Third planet orbiting Whirlpool Star 4', false, true, 2000, 23.00, 10);
INSERT INTO public.planet VALUES (31, 'Whirlpool Star 5 - Planet 1', 'First planet orbiting Whirlpool Star 5', false, true, 2000, 23.00, 11);
INSERT INTO public.planet VALUES (32, 'Whirlpool Star 5 - Planet 2', 'Second planet orbiting Whirlpool Star 5', false, true, 2000, 23.00, 11);
INSERT INTO public.planet VALUES (33, 'Whirlpool Star 5 - Planet 3', 'Third planet orbiting Whirlpool Star 5', false, true, 2000, 23.00, 11);
INSERT INTO public.planet VALUES (34, 'Whirlpool Star 6 - Planet 1', 'First planet orbiting Whirlpool Star 6', false, true, 2000, 23.00, 12);
INSERT INTO public.planet VALUES (35, 'Whirlpool Star 6 - Planet 2', 'Second planet orbiting Whirlpool Star 6', false, true, 2000, 23.00, 12);
INSERT INTO public.planet VALUES (36, 'Whirlpool Star 6 - Planet 3', 'Third planet orbiting Whirlpool Star 6', false, true, 2000, 23.00, 12);
INSERT INTO public.planet VALUES (37, 'Pinwheel Star 1 - Planet 1', 'First planet orbiting Pinwheel Star 1', false, true, 2000, 21.00, 13);
INSERT INTO public.planet VALUES (38, 'Pinwheel Star 1 - Planet 2', 'Second planet orbiting Pinwheel Star 1', false, true, 2000, 21.00, 13);
INSERT INTO public.planet VALUES (39, 'Pinwheel Star 1 - Planet 3', 'Third planet orbiting Pinwheel Star 1', false, true, 2000, 21.00, 13);
INSERT INTO public.planet VALUES (40, 'Pinwheel Star 2 - Planet 1', 'First planet orbiting Pinwheel Star 2', false, true, 2000, 21.00, 14);
INSERT INTO public.planet VALUES (41, 'Pinwheel Star 2 - Planet 2', 'Second planet orbiting Pinwheel Star 2', false, true, 2000, 21.00, 14);
INSERT INTO public.planet VALUES (42, 'Pinwheel Star 2 - Planet 3', 'Third planet orbiting Pinwheel Star 2', false, true, 2000, 21.00, 14);
INSERT INTO public.planet VALUES (43, 'Pinwheel Star 3 - Planet 1', 'First planet orbiting Pinwheel Star 3', false, true, 2000, 21.00, 15);
INSERT INTO public.planet VALUES (44, 'Pinwheel Star 3 - Planet 2', 'Second planet orbiting Pinwheel Star 3', false, true, 2000, 21.00, 15);
INSERT INTO public.planet VALUES (45, 'Pinwheel Star 3 - Planet 3', 'Third planet orbiting Pinwheel Star 3', false, true, 2000, 21.00, 15);
INSERT INTO public.planet VALUES (46, 'Pinwheel Star 4 - Planet 1', 'First planet orbiting Pinwheel Star 4', false, true, 2000, 21.00, 16);
INSERT INTO public.planet VALUES (47, 'Pinwheel Star 4 - Planet 2', 'Second planet orbiting Pinwheel Star 4', false, true, 2000, 21.00, 16);
INSERT INTO public.planet VALUES (48, 'Pinwheel Star 4 - Planet 3', 'Third planet orbiting Pinwheel Star 4', false, true, 2000, 21.00, 16);
INSERT INTO public.planet VALUES (49, 'Pinwheel Star 5 - Planet 1', 'First planet orbiting Pinwheel Star 5', false, true, 2000, 21.00, 17);
INSERT INTO public.planet VALUES (50, 'Pinwheel Star 5 - Planet 2', 'Second planet orbiting Pinwheel Star 5', false, true, 2000, 21.00, 17);
INSERT INTO public.planet VALUES (51, 'Pinwheel Star 5 - Planet 3', 'Third planet orbiting Pinwheel Star 5', false, true, 2000, 21.00, 17);
INSERT INTO public.planet VALUES (52, 'Pinwheel Star 6 - Planet 1', 'First planet orbiting Pinwheel Star 6', false, true, 2000, 21.00, 18);
INSERT INTO public.planet VALUES (53, 'Pinwheel Star 6 - Planet 2', 'Second planet orbiting Pinwheel Star 6', false, true, 2000, 21.00, 18);
INSERT INTO public.planet VALUES (54, 'Pinwheel Star 6 - Planet 3', 'Third planet orbiting Pinwheel Star 6', false, true, 2000, 21.00, 18);
INSERT INTO public.planet VALUES (55, 'Antennae Star 1 - Planet 1', 'First planet orbiting Antennae Star 1', false, false, 3000, 25.00, 19);
INSERT INTO public.planet VALUES (56, 'Antennae Star 1 - Planet 2', 'Second planet orbiting Antennae Star 1', false, false, 3000, 25.00, 19);
INSERT INTO public.planet VALUES (57, 'Antennae Star 1 - Planet 3', 'Third planet orbiting Antennae Star 1', false, false, 3000, 25.00, 19);
INSERT INTO public.planet VALUES (58, 'Antennae Star 2 - Planet 1', 'First planet orbiting Antennae Star 2', false, false, 3000, 25.00, 20);
INSERT INTO public.planet VALUES (59, 'Antennae Star 2 - Planet 2', 'Second planet orbiting Antennae Star 2', false, false, 3000, 25.00, 20);
INSERT INTO public.planet VALUES (60, 'Antennae Star 2 - Planet 3', 'Third planet orbiting Antennae Star 2', false, false, 3000, 25.00, 20);
INSERT INTO public.planet VALUES (61, 'Antennae Star 3 - Planet 1', 'First planet orbiting Antennae Star 3', false, false, 3000, 25.00, 21);
INSERT INTO public.planet VALUES (62, 'Antennae Star 3 - Planet 2', 'Second planet orbiting Antennae Star 3', false, false, 3000, 25.00, 21);
INSERT INTO public.planet VALUES (63, 'Antennae Star 3 - Planet 3', 'Third planet orbiting Antennae Star 3', false, false, 3000, 25.00, 21);
INSERT INTO public.planet VALUES (64, 'Antennae Star 4 - Planet 1', 'First planet orbiting Antennae Star 4', false, false, 3000, 25.00, 22);
INSERT INTO public.planet VALUES (65, 'Antennae Star 4 - Planet 2', 'Second planet orbiting Antennae Star 4', false, false, 3000, 25.00, 22);
INSERT INTO public.planet VALUES (66, 'Antennae Star 4 - Planet 3', 'Third planet orbiting Antennae Star 4', false, false, 3000, 25.00, 22);
INSERT INTO public.planet VALUES (67, 'Antennae Star 5 - Planet 1', 'First planet orbiting Antennae Star 5', false, false, 3000, 25.00, 23);
INSERT INTO public.planet VALUES (68, 'Antennae Star 5 - Planet 2', 'Second planet orbiting Antennae Star 5', false, false, 3000, 25.00, 23);
INSERT INTO public.planet VALUES (69, 'Antennae Star 5 - Planet 3', 'Third planet orbiting Antennae Star 5', false, false, 3000, 25.00, 23);
INSERT INTO public.planet VALUES (70, 'Antennae Star 6 - Planet 1', 'First planet orbiting Antennae Star 6', false, false, 3000, 25.00, 24);
INSERT INTO public.planet VALUES (71, 'Antennae Star 6 - Planet 2', 'Second planet orbiting Antennae Star 6', false, false, 3000, 25.00, 24);
INSERT INTO public.planet VALUES (72, 'Antennae Star 6 - Planet 3', 'Third planet orbiting Antennae Star 6', false, false, 3000, 25.00, 24);
INSERT INTO public.planet VALUES (73, 'Sombrero Star 1 - Planet 1', 'First planet orbiting Sombrero Star 1', false, true, 4000, 31.00, 25);
INSERT INTO public.planet VALUES (74, 'Sombrero Star 1 - Planet 2', 'Second planet orbiting Sombrero Star 1', false, true, 4000, 31.00, 25);
INSERT INTO public.planet VALUES (75, 'Sombrero Star 1 - Planet 3', 'Third planet orbiting Sombrero Star 1', false, true, 4000, 31.00, 25);
INSERT INTO public.planet VALUES (76, 'Sombrero Star 2 - Planet 1', 'First planet orbiting Sombrero Star 2', false, true, 4000, 31.00, 26);
INSERT INTO public.planet VALUES (77, 'Sombrero Star 2 - Planet 2', 'Second planet orbiting Sombrero Star 2', false, true, 4000, 31.00, 26);
INSERT INTO public.planet VALUES (78, 'Sombrero Star 2 - Planet 3', 'Third planet orbiting Sombrero Star 2', false, true, 4000, 31.00, 26);
INSERT INTO public.planet VALUES (79, 'Sombrero Star 3 - Planet 1', 'First planet orbiting Sombrero Star 3', false, true, 4000, 31.00, 27);
INSERT INTO public.planet VALUES (80, 'Sombrero Star 3 - Planet 2', 'Second planet orbiting Sombrero Star 3', false, true, 4000, 31.00, 27);
INSERT INTO public.planet VALUES (81, 'Sombrero Star 3 - Planet 3', 'Third planet orbiting Sombrero Star 3', false, true, 4000, 31.00, 27);
INSERT INTO public.planet VALUES (82, 'Sombrero Star 4 - Planet 1', 'First planet orbiting Sombrero Star 4', false, true, 4000, 31.00, 28);
INSERT INTO public.planet VALUES (83, 'Sombrero Star 4 - Planet 2', 'Second planet orbiting Sombrero Star 4', false, true, 4000, 31.00, 28);
INSERT INTO public.planet VALUES (84, 'Sombrero Star 4 - Planet 3', 'Third planet orbiting Sombrero Star 4', false, true, 4000, 31.00, 28);
INSERT INTO public.planet VALUES (85, 'Sombrero Star 5 - Planet 1', 'First planet orbiting Sombrero Star 5', false, true, 4000, 31.00, 29);
INSERT INTO public.planet VALUES (86, 'Sombrero Star 5 - Planet 2', 'Second planet orbiting Sombrero Star 5', false, true, 4000, 31.00, 29);
INSERT INTO public.planet VALUES (87, 'Sombrero Star 5 - Planet 3', 'Third planet orbiting Sombrero Star 5', false, true, 4000, 31.00, 29);
INSERT INTO public.planet VALUES (88, 'Sombrero Star 6 - Planet 1', 'First planet orbiting Sombrero Star 6', false, true, 4000, 31.00, 30);
INSERT INTO public.planet VALUES (89, 'Sombrero Star 6 - Planet 2', 'Second planet orbiting Sombrero Star 6', false, true, 4000, 31.00, 30);
INSERT INTO public.planet VALUES (90, 'Sombrero Star 6 - Planet 3', 'Third planet orbiting Sombrero Star 6', false, true, 4000, 31.00, 30);
INSERT INTO public.planet VALUES (91, 'Triangulum Star 1 - Planet 1', 'First planet orbiting Triangulum Star 1', true, true, 1500, 270.00, 31);
INSERT INTO public.planet VALUES (92, 'Triangulum Star 1 - Planet 2', 'Second planet orbiting Triangulum Star 1', true, true, 1500, 270.00, 31);
INSERT INTO public.planet VALUES (93, 'Triangulum Star 1 - Planet 3', 'Third planet orbiting Triangulum Star 1', true, true, 1500, 270.00, 31);
INSERT INTO public.planet VALUES (94, 'Triangulum Star 2 - Planet 1', 'First planet orbiting Triangulum Star 2', true, true, 1500, 270.00, 32);
INSERT INTO public.planet VALUES (95, 'Triangulum Star 2 - Planet 2', 'Second planet orbiting Triangulum Star 2', true, true, 1500, 270.00, 32);
INSERT INTO public.planet VALUES (96, 'Triangulum Star 2 - Planet 3', 'Third planet orbiting Triangulum Star 2', true, true, 1500, 270.00, 32);
INSERT INTO public.planet VALUES (97, 'Triangulum Star 3 - Planet 1', 'First planet orbiting Triangulum Star 3', true, true, 1500, 270.00, 33);
INSERT INTO public.planet VALUES (98, 'Triangulum Star 3 - Planet 2', 'Second planet orbiting Triangulum Star 3', true, true, 1500, 270.00, 33);
INSERT INTO public.planet VALUES (99, 'Triangulum Star 3 - Planet 3', 'Third planet orbiting Triangulum Star 3', true, true, 1500, 270.00, 33);
INSERT INTO public.planet VALUES (100, 'Triangulum Star 4 - Planet 1', 'First planet orbiting Triangulum Star 4', true, true, 1500, 270.00, 34);
INSERT INTO public.planet VALUES (101, 'Triangulum Star 4 - Planet 2', 'Second planet orbiting Triangulum Star 4', true, true, 1500, 270.00, 34);
INSERT INTO public.planet VALUES (102, 'Triangulum Star 4 - Planet 3', 'Third planet orbiting Triangulum Star 4', true, true, 1500, 270.00, 34);
INSERT INTO public.planet VALUES (103, 'Triangulum Star 5 - Planet 1', 'First planet orbiting Triangulum Star 5', true, true, 1500, 270.00, 35);
INSERT INTO public.planet VALUES (104, 'Triangulum Star 5 - Planet 2', 'Second planet orbiting Triangulum Star 5', true, true, 1500, 270.00, 35);
INSERT INTO public.planet VALUES (105, 'Triangulum Star 5 - Planet 3', 'Third planet orbiting Triangulum Star 5', true, true, 1500, 270.00, 35);
INSERT INTO public.planet VALUES (106, 'Triangulum Star 6 - Planet 1', 'First planet orbiting Triangulum Star 6', true, true, 1500, 270.00, 36);
INSERT INTO public.planet VALUES (107, 'Triangulum Star 6 - Planet 2', 'Second planet orbiting Triangulum Star 6', true, true, 1500, 270.00, 36);
INSERT INTO public.planet VALUES (108, 'Triangulum Star 6 - Planet 3', 'Third planet orbiting Triangulum Star 6', true, true, 1500, 270.00, 36);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Andromeda Star 1', 'Star in the Andromeda Galaxy', false, true, 10000, 2.54, 1);
INSERT INTO public.star VALUES (2, 'Andromeda Star 2', 'Another star in the Andromeda Galaxy', false, true, 10000, 2.54, 1);
INSERT INTO public.star VALUES (3, 'Andromeda Star 3', 'Yet another star in the Andromeda Galaxy', false, true, 10000, 2.54, 1);
INSERT INTO public.star VALUES (4, 'Andromeda Star 4', 'A star in the Andromeda Galaxy with unique characteristics', false, true, 10000, 2.54, 1);
INSERT INTO public.star VALUES (5, 'Andromeda Star 5', 'Star with interesting properties in the Andromeda Galaxy', false, true, 10000, 2.54, 1);
INSERT INTO public.star VALUES (6, 'Andromeda Star 6', 'A special star in the Andromeda Galaxy', false, true, 10000, 2.54, 1);
INSERT INTO public.star VALUES (7, 'Whirlpool Star 1', 'Star in the Whirlpool Galaxy', false, true, 2000, 23.00, 2);
INSERT INTO public.star VALUES (8, 'Whirlpool Star 2', 'Another star in the Whirlpool Galaxy', false, true, 2000, 23.00, 2);
INSERT INTO public.star VALUES (9, 'Whirlpool Star 3', 'Yet another star in the Whirlpool Galaxy', false, true, 2000, 23.00, 2);
INSERT INTO public.star VALUES (10, 'Whirlpool Star 4', 'A star in the Whirlpool Galaxy with unique characteristics', false, true, 2000, 23.00, 2);
INSERT INTO public.star VALUES (11, 'Whirlpool Star 5', 'Star with interesting properties in the Whirlpool Galaxy', false, true, 2000, 23.00, 2);
INSERT INTO public.star VALUES (12, 'Whirlpool Star 6', 'A special star in the Whirlpool Galaxy', false, true, 2000, 23.00, 2);
INSERT INTO public.star VALUES (13, 'Pinwheel Star 1', 'Star in the Pinwheel Galaxy', false, true, 2000, 21.00, 3);
INSERT INTO public.star VALUES (14, 'Pinwheel Star 2', 'Another star in the Pinwheel Galaxy', false, true, 2000, 21.00, 3);
INSERT INTO public.star VALUES (15, 'Pinwheel Star 3', 'Yet another star in the Pinwheel Galaxy', false, true, 2000, 21.00, 3);
INSERT INTO public.star VALUES (16, 'Pinwheel Star 4', 'A star in the Pinwheel Galaxy with unique characteristics', false, true, 2000, 21.00, 3);
INSERT INTO public.star VALUES (17, 'Pinwheel Star 5', 'Star with interesting properties in the Pinwheel Galaxy', false, true, 2000, 21.00, 3);
INSERT INTO public.star VALUES (18, 'Pinwheel Star 6', 'A special star in the Pinwheel Galaxy', false, true, 2000, 21.00, 3);
INSERT INTO public.star VALUES (19, 'Antennae Star 1', 'Star in the Antennae Galaxy', false, false, 3000, 25.00, 4);
INSERT INTO public.star VALUES (20, 'Antennae Star 2', 'Another star in the Antennae Galaxy', false, false, 3000, 25.00, 4);
INSERT INTO public.star VALUES (21, 'Antennae Star 3', 'Yet another star in the Antennae Galaxy', false, false, 3000, 25.00, 4);
INSERT INTO public.star VALUES (22, 'Antennae Star 4', 'A star in the Antennae Galaxy with unique characteristics', false, false, 3000, 25.00, 4);
INSERT INTO public.star VALUES (23, 'Antennae Star 5', 'Star with interesting properties in the Antennae Galaxy', false, false, 3000, 25.00, 4);
INSERT INTO public.star VALUES (24, 'Antennae Star 6', 'A special star in the Antennae Galaxy', false, false, 3000, 25.00, 4);
INSERT INTO public.star VALUES (25, 'Sombrero Star 1', 'Star in the Sombrero Galaxy', false, true, 4000, 31.00, 5);
INSERT INTO public.star VALUES (26, 'Sombrero Star 2', 'Another star in the Sombrero Galaxy', false, true, 4000, 31.00, 5);
INSERT INTO public.star VALUES (27, 'Sombrero Star 3', 'Yet another star in the Sombrero Galaxy', false, true, 4000, 31.00, 5);
INSERT INTO public.star VALUES (28, 'Sombrero Star 4', 'A star in the Sombrero Galaxy with unique characteristics', false, true, 4000, 31.00, 5);
INSERT INTO public.star VALUES (29, 'Sombrero Star 5', 'Star with interesting properties in the Sombrero Galaxy', false, true, 4000, 31.00, 5);
INSERT INTO public.star VALUES (30, 'Sombrero Star 6', 'A special star in the Sombrero Galaxy', false, true, 4000, 31.00, 5);
INSERT INTO public.star VALUES (31, 'Triangulum Star 1', 'Star in the Triangulum Galaxy', true, true, 1500, 270.00, 6);
INSERT INTO public.star VALUES (32, 'Triangulum Star 2', 'Another star in the Triangulum Galaxy', true, true, 1500, 270.00, 6);
INSERT INTO public.star VALUES (33, 'Triangulum Star 3', 'Yet another star in the Triangulum Galaxy', true, true, 1500, 270.00, 6);
INSERT INTO public.star VALUES (34, 'Triangulum Star 4', 'A star in the Triangulum Galaxy with unique characteristics', true, true, 1500, 270.00, 6);
INSERT INTO public.star VALUES (35, 'Triangulum Star 5', 'Star with interesting properties in the Triangulum Galaxy', true, true, 1500, 270.00, 6);
INSERT INTO public.star VALUES (36, 'Triangulum Star 6', 'A special star in the Triangulum Galaxy', true, true, 1500, 270.00, 6);


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.types VALUES (1, 'Galaxy', 'Type representing a galaxy');
INSERT INTO public.types VALUES (2, 'Planet', 'Type representing a planet');
INSERT INTO public.types VALUES (3, 'Star', 'Type representing a star');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 324, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 108, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 36, true);


--
-- Name: types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.types_type_id_seq', 3, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: types type_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT type_name UNIQUE (name);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (types_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

