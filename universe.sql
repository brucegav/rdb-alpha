--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(40) NOT NULL,
    abbreviation character varying(5),
    visible_season text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_type text,
    distance_from_earth integer,
    galaxy_size_ly double precision,
    is_spherical boolean DEFAULT false,
    has_life boolean DEFAULT false
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
    planet_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    has_water boolean NOT NULL,
    diameter_km integer,
    description text
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
    name character varying(40) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_star numeric,
    planet_type text
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
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    is_main_sequence boolean NOT NULL,
    mass numeric
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'Ori', 'Winter');
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'UMa', 'All Year');
INSERT INTO public.constellation VALUES (3, 'Leo', 'Leo', 'Spring');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred-Spiral', 0, 100000, false, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, 220000, false, false);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Lenticular', 29000000, 50000, false, false);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'Spiral', 2730000, 60000, false, false);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 'Elliptical', 53000000, 120000, true, false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 23000000, 60000, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, true, false, 3474, 'Earths only natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, false, false, 22, 'Larger moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, false, false, 12, 'Smaller moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 3, true, false, 3642, 'Volcanically active moon of Jupiter');
INSERT INTO public.moon VALUES (5, 'Europa', 3, true, true, 3121, 'Icy moon with subsurface ocean');
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, true, true, 5268, 'Largest moon in the solar system');
INSERT INTO public.moon VALUES (7, 'Callisto', 3, true, true, 4820, 'Heavily cratered Jovian moon');
INSERT INTO public.moon VALUES (8, 'Titan', 4, true, true, 5150, 'Saturns largest moon with thick atmosphere');
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, true, true, 504, 'Saturnian moon with water geysers');
INSERT INTO public.moon VALUES (10, 'Mimas', 4, true, false, 396, 'The Death Star moon');
INSERT INTO public.moon VALUES (11, 'Rhea', 4, true, false, 1527, 'Saturns second largest moon');
INSERT INTO public.moon VALUES (12, 'Dione', 4, true, false, 1122, 'Dense moon of Saturn');
INSERT INTO public.moon VALUES (13, 'Tethys', 4, true, false, 1062, 'Icy Saturnian moon');
INSERT INTO public.moon VALUES (14, 'Miranda', 7, true, false, 471, 'Uranian moon with extreme canyons');
INSERT INTO public.moon VALUES (15, 'Ariel', 7, true, false, 1158, 'Brightest moon of Uranus');
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, true, false, 1169, 'Darkest moon of Uranus');
INSERT INTO public.moon VALUES (17, 'Titania', 7, true, false, 1577, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (18, 'Oberon', 7, true, false, 1522, 'Outermost major moon of Uranus');
INSERT INTO public.moon VALUES (19, 'Triton', 8, true, true, 2706, 'Neptunes largest moon with retrograde orbit');
INSERT INTO public.moon VALUES (20, 'Proteus', 8, false, false, 420, 'Irregularly shaped moon of Neptune');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, true, 1.0, 'Terrestrial');
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, true, 1.5, 'Terrestrial');
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, false, true, 5.2, 'Gas Giant');
INSERT INTO public.planet VALUES (4, 'Saturn', 1, false, true, 9.5, 'Gas Giant');
INSERT INTO public.planet VALUES (5, 'Venus', 1, false, true, 0.7, 'Terrestrial');
INSERT INTO public.planet VALUES (6, 'Mercury', 1, false, true, 0.4, 'Terrestrial');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, true, 19.2, 'Ice Giant');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, true, 30.1, 'Ice Giant');
INSERT INTO public.planet VALUES (9, 'Proxima b', 4, false, true, 0.05, 'Terrestrial');
INSERT INTO public.planet VALUES (10, 'Sirius Prime', 2, false, true, 2.5, 'Exoplanet');
INSERT INTO public.planet VALUES (11, 'Andromeda-P1', 5, false, true, 1.2, 'Gas Giant');
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 1, false, true, 0.13, 'Super Earth');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, true, 1.0);
INSERT INTO public.star VALUES (2, 'Sirius', 1, true, 2.02);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, false, 16.5);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, true, 1.1);
INSERT INTO public.star VALUES (5, 'Andromeda Giant', 2, false, 25.0);
INSERT INTO public.star VALUES (6, 'M87-S1', 5, true, 0.8);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

