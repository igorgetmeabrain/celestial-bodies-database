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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    brightest_star text,
    no_of_main_stars integer,
    area integer,
    galaxy_id integer
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
    name character varying(30) NOT NULL,
    type text,
    diameter integer,
    mass integer,
    no_of_stars integer,
    visible_naked_eye boolean,
    apparent_magnitude numeric(3,1)
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
    name character varying(30) NOT NULL,
    planet_id integer,
    radius integer,
    mass text
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
    type text,
    radius integer,
    mass numeric(7,3),
    length_of_day numeric(5,2),
    has_moons boolean,
    star_id integer,
    constellation_id integer,
    galaxy_id integer
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
    name character varying(30) NOT NULL,
    type text,
    mass numeric(4,2),
    radius numeric(4,2),
    visible_naked_eye boolean,
    apparent_magnitude numeric(4,2),
    constellation_id integer,
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

INSERT INTO public.constellation VALUES (1, 'Sagittarius', 'Epsilon Sagittarii', 20, 67, 1);
INSERT INTO public.constellation VALUES (2, 'Andromeda', 'Alpha Andromedae', 9, 722, 2);
INSERT INTO public.constellation VALUES (3, 'Triangulum', 'Beta Trianguli', 3, 132, 3);
INSERT INTO public.constellation VALUES (4, 'Dorado', 'Alpha Doradus', 3, 179, 4);
INSERT INTO public.constellation VALUES (5, 'Mensa', 'Alpha Mensae', 4, 153, 4);
INSERT INTO public.constellation VALUES (6, 'Tucana', 'Alpha Tucanae', 3, 295, 5);
INSERT INTO public.constellation VALUES (7, 'Hydrus', 'Beta Hydri', 3, 243, 5);
INSERT INTO public.constellation VALUES (8, 'Virgo', 'Spica', 24, 1294, 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral', 106, 1500, 250, true, -20.5);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral', 220, 1200, 1000, true, 3.4);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'spiral', 60, 50, 40, true, 5.7);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'irregular', 14, 250, 30, true, 0.9);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'dwarf irregular', 7, 7, 3, true, 2.7);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'supergiant elliptical', 132, 3000, 750, false, 8.6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1738, '7.35x10^22');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, '10.6x10^15');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, '1.5x10^15');
INSERT INTO public.moon VALUES (4, 'Europa', 5, 1561, '4.8x10^22');
INSERT INTO public.moon VALUES (5, 'Ganymede', 5, 2634, '1.5x10^23');
INSERT INTO public.moon VALUES (6, 'Io', 5, 1822, '8.9x10^22');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, '1.1x10^23');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2575, '1.35x10^23');
INSERT INTO public.moon VALUES (9, 'Mimas', 6, 198, '3.8x10^19');
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 252, '1.08x10^20');
INSERT INTO public.moon VALUES (11, 'Tethys', 6, 531, '6.17x10^20');
INSERT INTO public.moon VALUES (12, 'Dione', 6, 562, '1.05x10^21');
INSERT INTO public.moon VALUES (13, 'Rhea', 6, 763, '2.31x10^21');
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 735, '1.81x10^21');
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 236, '6.4x10^19');
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 579, '1.25x10^21');
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 761, '3.08x10^21');
INSERT INTO public.moon VALUES (18, 'Titania', 7, 788, '3.4x10^21');
INSERT INTO public.moon VALUES (19, 'Umbriel', 7, 585, '1.27x10^21');
INSERT INTO public.moon VALUES (20, 'Naiad', 8, 33, '1.9x10^17');
INSERT INTO public.moon VALUES (21, 'Thalassa', 8, 41, '3.5x10^17');
INSERT INTO public.moon VALUES (22, 'Despina', 8, 75, '2.2x10^18');
INSERT INTO public.moon VALUES (23, 'Galatea', 8, 87, '2.12x10^18');
INSERT INTO public.moon VALUES (24, 'Larissa', 8, 97, '4.2x10^18');
INSERT INTO public.moon VALUES (25, 'Hippocamp', 8, 9, '5x10^16');
INSERT INTO public.moon VALUES (26, 'Proteus', 8, 210, '4.4x10^19');
INSERT INTO public.moon VALUES (27, 'Charon', 9, 606, '1.6x10^21');
INSERT INTO public.moon VALUES (28, 'Styx', 9, 8, '7.5x10^15');
INSERT INTO public.moon VALUES (29, 'Nix', 9, 50, '4.5x10^16');
INSERT INTO public.moon VALUES (30, 'Kerberos', 9, 7, '1.65x10^16');
INSERT INTO public.moon VALUES (31, 'Hydra', 9, 26, '4.2x10^17');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'terrestrial', 2440, 0.055, 58.65, false, 1, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'terrestrial', 6051, 0.815, 58.65, false, 1, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'terrestrial', 6371, 1.000, 1.00, true, 1, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'terrestrial', 3390, 0.107, 1.02, true, 1, NULL, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'gas giant', 69911, 317.800, 0.42, true, 1, NULL, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'gas giant', 36184, 95.160, 0.44, true, 1, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'ice giant', 25362, 14.540, 0.72, true, 1, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'ice giant', 24622, 17.150, 0.67, true, 1, NULL, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'dwarf', 1188, 0.002, 6.38, true, 1, NULL, 1);
INSERT INTO public.planet VALUES (10, '14 Andromedae b', 'gas giant', 125840, 1525.440, 4.62, false, NULL, 2, 2);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 'terrestrial', 8282, 1.070, NULL, false, NULL, NULL, 1);
INSERT INTO public.planet VALUES (12, 'Keppler 22b', 'terrestrial', 15163, 36.000, NULL, false, NULL, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'g-type main sequence', 1.00, 1.00, true, -26.70, NULL, 1);
INSERT INTO public.star VALUES (2, 'Epsilon Sagittarii', 'binary', 6.80, 3.50, true, 1.85, 1, 1);
INSERT INTO public.star VALUES (3, 'Alpha Andromedae', 'binary', 1.50, 1.85, true, 2.07, 2, 2);
INSERT INTO public.star VALUES (4, 'Beta Trianguli', 'binary', 1.98, 3.50, true, 3.00, 3, 3);
INSERT INTO public.star VALUES (5, 'Alpha Doradus', 'binary', 1.90, 2.70, true, 3.30, 4, 4);
INSERT INTO public.star VALUES (6, 'Alpha Mensae', 'g-type main sequence', 0.99, 0.96, true, 5.09, 5, 4);
INSERT INTO public.star VALUES (7, 'Alpha Tucanae', 'binary', 28.90, 3.00, true, 2.86, 6, 5);
INSERT INTO public.star VALUES (8, 'Beta Hydri', 'subgiant', 1.80, 1.08, true, 2.80, 7, 5);
INSERT INTO public.star VALUES (9, 'Spica', 'binary', 7.47, 10.30, true, 0.97, 8, 6);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 8, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 31, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: constellation constellation_constellation_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_constellation_id_key UNIQUE (constellation_id);


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
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


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
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

