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
    name character varying(40) NOT NULL,
    description text,
    age_in_millons_of_years integer,
    galaxy_type character varying(30) NOT NULL,
    distance_from_earth numeric,
    has_life boolean
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
    name character varying(40) NOT NULL,
    age_in_millons_of_years integer,
    moon_type character varying(40) NOT NULL,
    distance_from_earth numeric,
    was_explored boolean,
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
    name character varying(30) NOT NULL,
    description text,
    age_in_millons_of_years integer,
    planet_type character varying(30) NOT NULL,
    distance_from_earth numeric,
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
-- Name: satellites; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellites (
    satellites_id integer NOT NULL,
    name character varying(50) NOT NULL,
    year integer NOT NULL,
    distance_from_earth numeric,
    nickname text,
    is_working boolean,
    version integer
);


ALTER TABLE public.satellites OWNER TO freecodecamp;

--
-- Name: satellites_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellites_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellites_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellites_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellites_satellite_id_seq OWNED BY public.satellites.satellites_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    age_in_millons_of_years integer,
    star_type character varying(30) NOT NULL,
    distance_from_earth numeric,
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellites satellites_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellites ALTER COLUMN satellites_id SET DEFAULT nextval('public.satellites_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Galaxia espiral', 13000, 'espiral', 0, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Vecina de la Milky Way', 10000, 'espiral', 2, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'menor del grupo', 7500, 'espiral', 3, false);
INSERT INTO public.galaxy VALUES (4, 'Milky', 'Galaxia espiral', 13000, 'espiral', 0, true);
INSERT INTO public.galaxy VALUES (5, 'Andromed', 'Vecina de la Milky Way', 10000, 'espiral', 2, false);
INSERT INTO public.galaxy VALUES (6, 'Triangulu', 'menor del grupo', 7500, 'espiral', 3, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 4500, 'roca', 0.384, true, 1);
INSERT INTO public.moon VALUES (2, 'Fobos', 4000, 'roca', 23.460, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 4000, 'roca', 9.3, false, 2);
INSERT INTO public.moon VALUES (4, 'Europa', 4600, 'hielo', 670.9, false, 3);
INSERT INTO public.moon VALUES (5, 'Titan', 4500, 'hielo', 1.222, false, 4);
INSERT INTO public.moon VALUES (6, 'Caronte', 4500, 'roca', 0.384, true, 5);
INSERT INTO public.moon VALUES (7, 'Io', 4000, 'roca', 23.460, false, 2);
INSERT INTO public.moon VALUES (8, 'Calisto', 4000, 'roca', 9.3, false, 2);
INSERT INTO public.moon VALUES (9, 'Encelado', 4600, 'hielo', 670.9, false, 3);
INSERT INTO public.moon VALUES (10, 'Triton', 4500, 'hielo', 1.222, false, 4);
INSERT INTO public.moon VALUES (11, 'Liyue', 4500, 'roca', 0.384, true, 5);
INSERT INTO public.moon VALUES (12, 'Ritania', 4000, 'roca', 23.460, false, 2);
INSERT INTO public.moon VALUES (13, 'Fhobos', 4000, 'roca', 9.3, false, 2);
INSERT INTO public.moon VALUES (14, 'Mirandoa', 4600, 'hielo', 670.9, false, 3);
INSERT INTO public.moon VALUES (15, 'Febe', 4500, 'hielo', 1.222, false, 2);
INSERT INTO public.moon VALUES (16, 'Albert', 4500, 'roca', 0.384, true, 5);
INSERT INTO public.moon VALUES (17, 'Beidou', 4000, 'roca', 23.460, false, 2);
INSERT INTO public.moon VALUES (18, 'Isabel', 4000, 'roca', 9.3, false, 2);
INSERT INTO public.moon VALUES (19, 'Amber', 4600, 'hielo', 670.9, false, 3);
INSERT INTO public.moon VALUES (20, 'Nilou', 4500, 'hielo', 1.222, false, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Tierra', 'Nuestro planeta', 4500, 'Terrestre', 0, true, 1);
INSERT INTO public.planet VALUES (2, 'Marte', 'Planeta Rojo', 4000, 'Terrestre', 78.3, false, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gigante gaseoso', 4600, 'Terrestre', 628.7, false, 1);
INSERT INTO public.planet VALUES (4, 'Saturno', 'Planeta con anillos', 4600, 'Gaseoso', 1.275, false, 1);
INSERT INTO public.planet VALUES (5, 'Earth', 'Nuestro planeta', 4500, 'Terrestre', 0, true, 1);
INSERT INTO public.planet VALUES (6, 'Mar', 'Planeta Rojo', 4000, 'Terrestre', 78.3, false, 1);
INSERT INTO public.planet VALUES (7, 'Jupr', 'Gigante', 4640, 'Terrestre', 28.7, false, 1);
INSERT INTO public.planet VALUES (8, 'Urano', 'Solitario', 4600, 'Gaseoso', 1.5, false, 1);
INSERT INTO public.planet VALUES (9, 'Eart', 'Nuestro planeta', 4500, 'Terrestre', 0, true, 1);
INSERT INTO public.planet VALUES (10, 'Mercurio', 'Planeta Verde', 4000, 'Terrestre', 78.3, false, 1);
INSERT INTO public.planet VALUES (11, 'Saturn', 'Gigant', 4640, 'Terrestre', 28.7, false, 1);
INSERT INTO public.planet VALUES (12, 'Venus', 'Solitario', 4600, 'Gaseoso', 1.5, false, 1);


--
-- Data for Name: satellites; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellites VALUES (1, 'Cesar', 1985, 2, 'Cesarino', true, 2);
INSERT INTO public.satellites VALUES (2, 'Eula', 2021, 4, 'Eulalia', true, 3);
INSERT INTO public.satellites VALUES (3, 'Jean', 1944, 8, 'Dandhou', false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'Centro del sistema solar', 4600, 'Enana amarilla', 0, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'La mas brillante', 250, 'Enana blanca', 8.6, 1);
INSERT INTO public.star VALUES (3, 'Betelgeus', 'Supergigante roja', 8, 'Supergigante', 642.5, 1);
INSERT INTO public.star VALUES (4, 'Sun', 'Centro del sistema solar', 4600, 'Enana amarilla', 0, 1);
INSERT INTO public.star VALUES (5, 'Siris', 'La mas brillante', 250, 'Enana blanca', 8.6, 1);
INSERT INTO public.star VALUES (6, 'Betel', 'Supergigante roja', 8, 'Supergigante', 642.5, 1);


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
-- Name: satellites_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellites_satellite_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellites satellites_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellites
    ADD CONSTRAINT satellites_pkey PRIMARY KEY (satellites_id);


--
-- Name: satellites satellites_version_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellites
    ADD CONSTRAINT satellites_version_key UNIQUE (version);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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

