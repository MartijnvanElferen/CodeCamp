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
-- Name: countries; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.countries (
    countries_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    CONSTRAINT name_not_null CHECK ((name IS NOT NULL))
);


ALTER TABLE public.countries OWNER TO freecodecamp;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO freecodecamp;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.countries_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying NOT NULL,
    galaxy_id integer NOT NULL,
    circumference_in_km numeric,
    shinyness character varying(30),
    leefbaarheid character varying(10),
    CONSTRAINT always_shine CHECK ((shinyness IS NOT NULL)),
    CONSTRAINT name_not_null CHECK ((name IS NOT NULL))
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer,
    has_ocean boolean,
    has_desert boolean,
    CONSTRAINT name_not_null CHECK ((name IS NOT NULL))
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    age_in_m_years integer,
    distance_in_m_km integer,
    description text,
    always_freezing_temperatures boolean,
    in_milkyway boolean,
    star_id integer,
    CONSTRAINT check_name_is_not_null CHECK ((name IS NOT NULL))
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    no_of_stars integer,
    contains_dwarf_stars boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: countries countries_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.countries ALTER COLUMN countries_id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.countries VALUES (1, 'USA', 1);
INSERT INTO public.countries VALUES (2, 'Canada', 1);
INSERT INTO public.countries VALUES (3, 'Tomorrowland', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milkyway', 1, 5000, '10', NULL);
INSERT INTO public.galaxy VALUES ('Coldplay', 4, 1, '5', NULL);
INSERT INTO public.galaxy VALUES ('Yellow Claw', 5, 2, '5', NULL);
INSERT INTO public.galaxy VALUES ('Like a G6', 6, 3, '6', NULL);
INSERT INTO public.galaxy VALUES ('Brown', 2, 5000, '3', NULL);
INSERT INTO public.galaxy VALUES ('Yellow', 3, 10000, '4', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('moon', 1, 1, NULL, NULL);
INSERT INTO public.moon VALUES ('mini moon', 2, 1, NULL, NULL);
INSERT INTO public.moon VALUES ('pluto', 3, 2, NULL, NULL);
INSERT INTO public.moon VALUES ('Lunastris', 4, 3, NULL, NULL);
INSERT INTO public.moon VALUES ('Novamoon', 5, 1, NULL, NULL);
INSERT INTO public.moon VALUES ('Selenea', 6, 2, NULL, NULL);
INSERT INTO public.moon VALUES ('Lunaris', 7, 1, NULL, NULL);
INSERT INTO public.moon VALUES ('Celestia', 8, 2, NULL, NULL);
INSERT INTO public.moon VALUES ('Nocturnix', 9, 3, NULL, NULL);
INSERT INTO public.moon VALUES ('Solara', 10, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('Nebulana', 11, 3, NULL, NULL);
INSERT INTO public.moon VALUES ('Lumindra', 12, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('Stellera', 13, 1, NULL, NULL);
INSERT INTO public.moon VALUES ('Astrion', 14, 1, NULL, NULL);
INSERT INTO public.moon VALUES ('Umbralith', 15, 2, NULL, NULL);
INSERT INTO public.moon VALUES ('Cassimoon', 16, 1, NULL, NULL);
INSERT INTO public.moon VALUES ('Etheria', 17, 2, NULL, NULL);
INSERT INTO public.moon VALUES ('Quassara', 18, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('Galaxia', 19, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Nebulith', 20, 1, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, 2000, 0, 'Our Home', false, true, 1);
INSERT INTO public.planet VALUES ('Mars', 2, 3000, 10, 'Elons home', true, true, 1);
INSERT INTO public.planet VALUES ('Uranus', 3, 5000, 5, 'Lets not discuss', true, true, 1);
INSERT INTO public.planet VALUES ('Pluto', 4, 10000, 1, 'Disney?', true, true, 1);
INSERT INTO public.planet VALUES ('Jupiter', 5, 5000, 20, 'This is the large one', true, true, 1);
INSERT INTO public.planet VALUES ('Saturn', 6, 6000, 5, 'What to say', true, true, 1);
INSERT INTO public.planet VALUES ('Halo', 7, 2000, 2000, 'From that video game', false, false, 1);
INSERT INTO public.planet VALUES ('Cities Skylines', 8, 1, 583, 'This is just a game', false, true, 2);
INSERT INTO public.planet VALUES ('Assassins Creed', 9, 2, 43, 'This is on earth', false, false, 1);
INSERT INTO public.planet VALUES ('Flight Simulator', 10, 39, 59, 'Best game', false, false, 1);
INSERT INTO public.planet VALUES ('Tobi', 11, 0, 0, 'This is our Dachshund', false, true, 1);
INSERT INTO public.planet VALUES ('Hummer', 12, 0, 1, 'This is another dog', false, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('sun', 1, 1, NULL, NULL);
INSERT INTO public.star VALUES ('Halo Universe', 2, 2, NULL, NULL);
INSERT INTO public.star VALUES ('Dune Universe', 3, 2, NULL, NULL);
INSERT INTO public.star VALUES ('Harry potter Universe', 4, 2, NULL, NULL);
INSERT INTO public.star VALUES ('Better Call Saul', 5, 1, NULL, NULL);
INSERT INTO public.star VALUES ('My universe', 6, 3, NULL, NULL);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.countries_id_seq', 1, false);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 1, false);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 1, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 1, false);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 1, false);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 1, false);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (countries_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy id_galaxy_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT id_galaxy_unique UNIQUE (galaxy_id);


--
-- Name: moon id_unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT id_unique_moon UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: countries name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique_id UNIQUE (star_id);


--
-- Name: planet unique_id_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_id_planet UNIQUE (planet_id);


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

