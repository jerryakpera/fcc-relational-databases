--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(128) NOT NULL,
    diameter_in_light_years numeric,
    has_life boolean NOT NULL,
    galaxy_category_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_category; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_category (
    galaxy_category_id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_category OWNER TO freecodecamp;

--
-- Name: galaxy_category_galaxy_category_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_category_galaxy_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_category_galaxy_category_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_category_galaxy_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_category_galaxy_category_id_seq OWNED BY public.galaxy_category.galaxy_category_id;


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
    name character varying(64) NOT NULL,
    diameter_in_km integer,
    discovery_year text,
    planet_id integer
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
    name character varying(64) NOT NULL,
    type text,
    age_in_millions_of_years numeric NOT NULL,
    has_life boolean,
    star_id integer
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
    name character varying(64) NOT NULL,
    age_in_billions_of_years integer NOT NULL,
    is_visible boolean,
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_category galaxy_category_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_category ALTER COLUMN galaxy_category_id SET DEFAULT nextval('public.galaxy_category_galaxy_category_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, true, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, false, 1);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40000, false, 1);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 50000, false, 1);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 100000, false, 2);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 60000, false, 1);


--
-- Data for Name: galaxy_category; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_category VALUES (1, 'Spiral', 'Central large bulge with a flattened surrounding disk with spiral arms');
INSERT INTO public.galaxy_category VALUES (2, 'Elliptical', 'Semi-spherical or elliptical shape');
INSERT INTO public.galaxy_category VALUES (3, 'Irregular', 'Lack structure and organized shape');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3475, 'Ancient', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, '1877', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, '1877', 2);
INSERT INTO public.moon VALUES (4, 'Io', 3637, '1610', 3);
INSERT INTO public.moon VALUES (5, 'Europa', 3122, '1610', 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5262, '1610', 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 4800, '1610', 3);
INSERT INTO public.moon VALUES (8, 'Mimas', 198, '1789', 4);
INSERT INTO public.moon VALUES (9, 'Enceladus', 252, '1789', 4);
INSERT INTO public.moon VALUES (10, 'Tethys', 536, '1684', 4);
INSERT INTO public.moon VALUES (11, 'Dione', 563, '1684', 4);
INSERT INTO public.moon VALUES (12, 'Rhea', 764, '1672', 4);
INSERT INTO public.moon VALUES (13, 'Titan', 5150, '1655', 4);
INSERT INTO public.moon VALUES (14, 'Iapetus', 1436, '1671', 4);
INSERT INTO public.moon VALUES (15, 'Miranda', 472, '1948', 5);
INSERT INTO public.moon VALUES (16, 'Ariel', 579, '1851', 5);
INSERT INTO public.moon VALUES (17, 'Umbriel', 585, '1851', 5);
INSERT INTO public.moon VALUES (18, 'Titania', 1578, '1787', 5);
INSERT INTO public.moon VALUES (19, 'Oberon', 1523, '1787', 5);
INSERT INTO public.moon VALUES (20, 'Charon', 1212, '1978', 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 4543, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 4603, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Terrestrial', 4537, false, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Gas Giant', 4540, false, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Gas Giant', 4537, false, 1);
INSERT INTO public.planet VALUES (6, 'Mercury', 'Terrestrial', 4540, false, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 'Ice Giant', 4537, false, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 'Ice Giant', 4537, false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf', 4600, false, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 'Exoplanet', 1200, false, 2);
INSERT INTO public.planet VALUES (11, 'Trappist-1e', 'Exoplanet', 1200, false, 3);
INSERT INTO public.planet VALUES (12, 'HD 209458b', 'Exoplanet', 700, false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Cetauri', 5, true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 9, true, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 6, true, 1);
INSERT INTO public.star VALUES (5, 'Sirius', 3, true, 1);
INSERT INTO public.star VALUES (6, 'Vega', 0, true, 1);
INSERT INTO public.star VALUES (7, 'Polaris', 0, true, 1);


--
-- Name: galaxy_category_galaxy_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_category_galaxy_category_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy_category galaxy_category_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_category
    ADD CONSTRAINT galaxy_category_name_key UNIQUE (name);


--
-- Name: galaxy_category galaxy_category_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_category
    ADD CONSTRAINT galaxy_category_name_key1 UNIQUE (name);


--
-- Name: galaxy_category galaxy_category_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_category
    ADD CONSTRAINT galaxy_category_pkey PRIMARY KEY (galaxy_category_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_category_id_fkey FOREIGN KEY (galaxy_category_id) REFERENCES public.galaxy_category(galaxy_category_id);


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

