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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    speed integer NOT NULL,
    has_tail boolean NOT NULL,
    composition text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    galaxy_type character varying(50),
    distance_from_earth numeric NOT NULL,
    has_life boolean NOT NULL
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    radius numeric NOT NULL,
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    planet_type character varying(50),
    distance_from_sun numeric NOT NULL
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    temperature numeric
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 70, true, 'Dust and ice');
INSERT INTO public.comet VALUES (2, 'Comet Swift-Tuttle', 58, true, 'Ice and rock');
INSERT INTO public.comet VALUES (3, 'Comet Hale-Bopp', 157, true, 'Ammonia, methane, and ice');
INSERT INTO public.comet VALUES (4, 'Comet Hyakutake', 100, true, 'Organic compounds and ice');
INSERT INTO public.comet VALUES (5, 'Comet Tempel 1', 40, true, 'Carbon dioxide and silicates');
INSERT INTO public.comet VALUES (6, 'Comet Encke', 69, true, 'Dust, rock, and organic materials');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 'Spiral', 0, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy', 'Spiral', 2537000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest in the Local Group', 'Spiral', 3000000, false);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Satellite galaxy of Milky Way', 'Irregular', 163000, false);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Another satellite galaxy', 'Irregular', 200000, false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'Famous spiral galaxy', 'Spiral', 23000000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Moon', 1, true, 1737.1, 'Earth''s only natural satellite');
INSERT INTO public.moon VALUES (22, 'Phobos', 2, true, 11.2667, 'Largest moon of Mars');
INSERT INTO public.moon VALUES (23, 'Deimos', 2, true, 6.2, 'Small moon of Mars');
INSERT INTO public.moon VALUES (24, 'Io', 3, true, 1821.6, 'Volcanic moon of Jupiter');
INSERT INTO public.moon VALUES (25, 'Europa', 3, true, 1560.8, 'Ice-covered moon of Jupiter');
INSERT INTO public.moon VALUES (26, 'Ganymede', 3, true, 2634.1, 'Largest moon in the Solar System');
INSERT INTO public.moon VALUES (27, 'Callisto', 3, true, 2410.3, 'Heavily cratered moon of Jupiter');
INSERT INTO public.moon VALUES (28, 'Titan', 4, true, 2574.7, 'Largest moon of Saturn');
INSERT INTO public.moon VALUES (29, 'Enceladus', 4, true, 252.1, 'Icy moon with geysers');
INSERT INTO public.moon VALUES (30, 'Mimas', 4, true, 198.2, 'Small moon with a large crater');
INSERT INTO public.moon VALUES (31, 'Triton', 5, true, 1353.4, 'Largest moon of Neptune');
INSERT INTO public.moon VALUES (32, 'Oberon', 6, true, 761.4, 'Moon of Uranus');
INSERT INTO public.moon VALUES (33, 'Ariel', 6, true, 578.9, 'Moon of Uranus');
INSERT INTO public.moon VALUES (34, 'Umbriel', 6, true, 584.7, 'Moon of Uranus');
INSERT INTO public.moon VALUES (35, 'Miranda', 6, true, 235.8, 'Small moon with varied terrain');
INSERT INTO public.moon VALUES (36, 'Dione', 4, true, 561.4, 'Moon of Saturn');
INSERT INTO public.moon VALUES (37, 'Rhea', 4, true, 763.8, 'Moon of Saturn');
INSERT INTO public.moon VALUES (38, 'Tethys', 4, true, 531.1, 'Moon of Saturn');
INSERT INTO public.moon VALUES (39, 'Iapetus', 4, true, 734.5, 'Moon of Saturn');
INSERT INTO public.moon VALUES (40, 'Charon', 7, true, 606, 'Largest moon of Pluto');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 'Terrestrial', 1.5);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, false, 'Gas Giant', 5.2);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, false, 'Gas Giant', 9.5);
INSERT INTO public.planet VALUES (5, 'Neptune', 1, false, 'Ice Giant', 30.1);
INSERT INTO public.planet VALUES (6, 'Uranus', 1, false, 'Ice Giant', 19.8);
INSERT INTO public.planet VALUES (7, 'Pluto', 1, false, 'Dwarf Planet', 39.5);
INSERT INTO public.planet VALUES (9, 'Mercury', 1, false, 'Terrestrial', 0.4);
INSERT INTO public.planet VALUES (10, 'Venus', 1, false, 'Terrestrial', 0.7);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 2, true, 'Super-Earth', 0.13);
INSERT INTO public.planet VALUES (12, 'Kepler-22b', 3, false, 'Super-Earth', 600);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri b', 4, true, 'Terrestrial', 0.0485);
INSERT INTO public.planet VALUES (14, 'HD 209458 b', 5, false, 'Gas Giant', 0.05);
INSERT INTO public.planet VALUES (15, 'Trappist-1e', 6, true, 'Terrestrial', 0.028);
INSERT INTO public.planet VALUES (16, 'Trappist-1f', 6, true, 'Terrestrial', 0.037);
INSERT INTO public.planet VALUES (17, 'Trappist-1g', 6, true, 'Terrestrial', 0.046);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, true, 4600, 5778);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, true, 5000, 5790);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, true, 10000, 3500);
INSERT INTO public.star VALUES (4, 'Sirius', 1, true, 300, 9940);
INSERT INTO public.star VALUES (5, 'Vega', 2, true, 500, 9600);
INSERT INTO public.star VALUES (6, 'Rigel', 3, true, 8000, 12100);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

