--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.0

-- Started on 2025-04-25 15:45:35

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 16422)
-- Name: avto_import; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avto_import (
    car_id bigint NOT NULL,
    car_name character varying(128),
    car_type bigint,
    car_year bigint,
    car_km character varying(128),
    car_value bigint,
    car_steering character varying(128),
    car_price bigint,
    car_desc character varying(128),
    image_url character varying(128)
);


ALTER TABLE public.avto_import OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16421)
-- Name: avto_import_car_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.avto_import_car_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.avto_import_car_id_seq OWNER TO postgres;

--
-- TOC entry 4840 (class 0 OID 0)
-- Dependencies: 219
-- Name: avto_import_car_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.avto_import_car_id_seq OWNED BY public.avto_import.car_id;


--
-- TOC entry 224 (class 1259 OID 16445)
-- Name: bookings_import; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings_import (
    booking_id integer NOT NULL,
    user_id bigint,
    car_id bigint,
    start_date date,
    end_date date,
    total_price bigint,
    status character varying(128),
    paymernt_status character varying(128),
    created_at timestamp without time zone
);


ALTER TABLE public.bookings_import OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16444)
-- Name: bookings_import_booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bookings_import_booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookings_import_booking_id_seq OWNER TO postgres;

--
-- TOC entry 4841 (class 0 OID 0)
-- Dependencies: 223
-- Name: bookings_import_booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bookings_import_booking_id_seq OWNED BY public.bookings_import.booking_id;


--
-- TOC entry 218 (class 1259 OID 16390)
-- Name: car_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.car_type (
    type_id bigint NOT NULL,
    type_name character varying(128)
);


ALTER TABLE public.car_type OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16389)
-- Name: car_type_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.car_type_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.car_type_type_id_seq OWNER TO postgres;

--
-- TOC entry 4842 (class 0 OID 0)
-- Dependencies: 217
-- Name: car_type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.car_type_type_id_seq OWNED BY public.car_type.type_id;


--
-- TOC entry 226 (class 1259 OID 16462)
-- Name: payments_import; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments_import (
    payment_id integer NOT NULL,
    booking_id bigint,
    amount bigint,
    payment_date date,
    method character varying(128),
    status character varying(128)
);


ALTER TABLE public.payments_import OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16461)
-- Name: payments_import_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_import_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_import_payment_id_seq OWNER TO postgres;

--
-- TOC entry 4843 (class 0 OID 0)
-- Dependencies: 225
-- Name: payments_import_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_import_payment_id_seq OWNED BY public.payments_import.payment_id;


--
-- TOC entry 222 (class 1259 OID 16436)
-- Name: users_import; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_import (
    user_id integer NOT NULL,
    user_name character varying(128),
    user_surname character varying(128),
    user_mail character varying(128),
    user_phone character varying(128),
    user_licence character varying(128),
    user_status character varying(128),
    user_reg_date date
);


ALTER TABLE public.users_import OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16435)
-- Name: users_import_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_import_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_import_user_id_seq OWNER TO postgres;

--
-- TOC entry 4844 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_import_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_import_user_id_seq OWNED BY public.users_import.user_id;


--
-- TOC entry 4662 (class 2604 OID 16425)
-- Name: avto_import car_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avto_import ALTER COLUMN car_id SET DEFAULT nextval('public.avto_import_car_id_seq'::regclass);


--
-- TOC entry 4664 (class 2604 OID 16448)
-- Name: bookings_import booking_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings_import ALTER COLUMN booking_id SET DEFAULT nextval('public.bookings_import_booking_id_seq'::regclass);


--
-- TOC entry 4661 (class 2604 OID 16393)
-- Name: car_type type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_type ALTER COLUMN type_id SET DEFAULT nextval('public.car_type_type_id_seq'::regclass);


--
-- TOC entry 4665 (class 2604 OID 16465)
-- Name: payments_import payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments_import ALTER COLUMN payment_id SET DEFAULT nextval('public.payments_import_payment_id_seq'::regclass);


--
-- TOC entry 4663 (class 2604 OID 16439)
-- Name: users_import user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_import ALTER COLUMN user_id SET DEFAULT nextval('public.users_import_user_id_seq'::regclass);


--
-- TOC entry 4828 (class 0 OID 16422)
-- Dependencies: 220
-- Data for Name: avto_import; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (1, 'Toyota Camry', 1, 2022, '60L', 5, 'Левый', 3500, 'Премиальный 1 с кожаным салоном и подогревом сидений', '/Resources/CarsImages/Toyota Camry.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (2, 'Hyundai Solaris', 1, 2021, '50L', 5, 'Левый', 2800, 'Экономичный городской автомобиль', '/Resources/CarsImages/Hyundai Solaris.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (3, 'Kia Rio', 2, 2023, '45L', 5, 'Левый', 3000, 'Компактный автомобиль с современной мультимедиа системой', '/Resources/CarsImages/Kia Rio.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (4, 'BMW X5', 3, 2021, '85L', 5, 'Левый', 6500, 'Роскошный SUV с полным приводом', '/Resources/CarsImages/BMW X5.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (5, 'Lada Vesta', 1, 2022, '55L', 5, 'Левый', 2500, 'Надежный российский автомобиль', '/Resources/CarsImages/Lada Vesta.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (6, 'Mercedes-Benz E-Class', 1, 2023, '66L', 5, 'Левый', 7500, 'Бизнес-класс с системами автономного вождения', '/Resources/CarsImages/Mercedes-Benz E-Class.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (7, 'Nissan Qashqai', 4, 2022, '55L', 5, 'Левый', 4000, 'Популярный 4 с увеличенным клиренсом', '/Resources/CarsImages/Nissan Qashqai.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (33, 'Ford F-150 Raptor', 13, 2023, '98L', 5, 'Правый', 20000, 'Мощный внедорожный пикап с 3.5L EcoBoost V6 (450 л.с.)', '/Resources/CarsImages/Ford F-150 Raptor.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (8, 'Volkswagen Polo', 2, 2021, '45L', 5, 'Левый', 2700, 'Немецкое качество в компактном формате', '/Resources/CarsImages/Volkswagen Polo.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (9, 'Skoda Octavia', 5, 2023, '50L', 5, 'Левый', 3200, 'Просторный салон и большой багажник', '/Resources/CarsImages/Skoda Octavia.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (10, 'Renault Duster', 3, 2022, '50L', 5, 'Левый', 3800, 'Доступный 3 для города и бездорожья', '/Resources/CarsImages/Renault Duster.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (11, 'Audi A6', 1, 2021, '65L', 5, 'Левый', 7000, 'Идеальный выбор для бизнес-поездок', '/Resources/CarsImages/Audi A6.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (12, 'Lexus RX', 3, 2023, '72L', 5, 'Левый', 8500, 'Премиальный SUV с гибридной установкой', '/Resources/CarsImages/Lexus RX.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (13, 'Ford Focus', 2, 2022, '52L', 5, 'Левый', 2900, 'Динамичный 2 с отличной управляемостью', '/Resources/CarsImages/Ford Focus.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (14, 'Chevrolet Tahoe', 3, 2021, '98L', 8, 'Правый', 9000, 'Большой 7-местный 3', '/Resources/CarsImages/Chevrolet Tahoe.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (15, 'Mitsubishi Outlander', 4, 2023, '60L', 7, 'Левый', 4500, 'Семейный 4 с третьим рядом сидений', '/Resources/CarsImages/Mitsubishi Outlander.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (16, 'Porsche 911 Turbo S', 6, 2023, '64L', 2, 'Левый', 25000, 'Легендарный немецкий 6 с 650 л.с., задним приводом и PDK-коробкой', '/Resources/CarsImages/Porsche 911 Turbo S.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (17, 'Ferrari 488 GTB', 7, 2022, '78L', 2, 'Левый', 45000, 'Итальянский V8 с турбонаддувом (720 л.с.), 0-100 за 2.8 сек', '/Resources/CarsImages/Ferrari 488 GTB.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (18, 'Lamborghini Hurac?n EVO', 7, 2023, '80L', 2, 'Левый', 50000, 'Агрессивный дизайн, 5.2L V10 (640 л.с.), полный привод', '/Resources/CarsImages/Lamborghini Huracan EVO.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (19, 'Chevrolet Corvette C8 Stingray', 6, 2023, '70L', 2, 'Правый', 30000, 'Среднемоторный 6 с 6.2L V8 (495 л.с.), первый праворульный Corvette', '/Resources/CarsImages/Chevrolet Corvette C8 Stingray.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (22, 'McLaren 720S', 7, 2022, '72L', 2, 'Левый', 55000, 'Британский гиперкар с 720 л.с., карбоновым монококом', '/Resources/CarsImages/McLaren 720S.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (23, 'BMW M8 Competition', 8, 2023, '68L', 4, 'Левый', 32000, '4.4L V8 (625 л.с.), xDrive, роскошный салон', '/Resources/CarsImages/BMW M8 Competition.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (24, 'Mercedes-AMG GT R', 6, 2022, '75L', 2, 'Левый', 38000, '4.0L V8 (585 л.с.), активной аэродинамикой', '/Resources/CarsImages/Mercedes-AMG GT R.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (25, 'Ford Mustang Shelby GT500', 8, 2023, '70L', 4, 'Правый', 28000, '5.2L V8 с компрессором (760 л.с.), 7-ступенчатая DCT', '/Resources/CarsImages/Ford Mustang Shelby GT500.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (26, 'Tesla Model S Plaid', 9, 2023, '600KM', 5, 'Левый', 22000, 'Самый быстрый серийный 9 (0-100 за 1.99 сек, 1020 л.с.)', '/Resources/CarsImages/Tesla Model S Plaid.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (27, 'Jeep Wrangler Rubicon', 3, 2022, '80L', 5, 'Левый', 12000, 'Легендарный 3 с отключаемым стабилизатором и блокировками дифференциалов', '/Resources/CarsImages/Jeep Wrangler Rubicon.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (28, 'Toyota Land Cruiser 300', 3, 2023, '110L', 7, 'Правый', 25000, 'Флагманский 3 с 3.5L V6 Twin-Turbo (415 л.с.)', '/Resources/CarsImages/Toyota Land Cruiser 300.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (29, 'Mini Cooper JCW', 2, 2022, '44L', 4, 'Левый', 9000, 'Горячая версия Mini с 231 л.с. и спортивной подвеской', '/Resources/CarsImages/Mini Cooper JCW.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (30, 'Rolls-Royce Ghost', 11, 2023, '82L', 5, 'Правый', 120000, 'Роскошный 1 с 6.75L V12 (571 л.с.) и звездным потолком', '/Resources/CarsImages/Rolls-Royce Ghost.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (31, 'Lada Niva Travel', 3, 2023, '58L', 5, 'Левый', 5000, 'Легендарный российский 3 с блокировкой дифференциала', '/Resources/CarsImages/Lada Niva Travel.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (32, 'Polestar 2', 9, 2023, '540KM', 5, 'Левый', 15000, 'Шведский премиальный 9 с 476 л.с.', '/Resources/CarsImages/Polestar 2.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (21, 'Nissan GT-R Nismo', 6, 2023, '74L', 4, 'Правый', 35000, 'Японский Годзилла с 3.8L V6 (600 л.с.), полный привод', '/Resources/CarsImages/Nissan GT-R Nismo.png');
INSERT INTO public.avto_import (car_id, car_name, car_type, car_year, car_km, car_value, car_steering, car_price, car_desc, image_url) VALUES (20, 'Audi R8 V10 Performance', 7, 2022, '73L', 2, 'Левый', 40000, '5.2L V10 (620 л.с.), quattro, алюминиевый кузов', '/Resources/CarsImages/Audi R8 V10 Performance.png');


--
-- TOC entry 4832 (class 0 OID 16445)
-- Dependencies: 224
-- Data for Name: bookings_import; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bookings_import (booking_id, user_id, car_id, start_date, end_date, total_price, status, paymernt_status, created_at) VALUES (1, 1, 3, '2024-03-10', '2024-03-12', 9000, 'завершенный', 'оплаченный', '2024-03-05 14:30:00');
INSERT INTO public.bookings_import (booking_id, user_id, car_id, start_date, end_date, total_price, status, paymernt_status, created_at) VALUES (2, 2, 5, '2024-03-15', '2024-03-17', 7500, 'завершенный', 'оплаченный', '2024-03-10 09:15:00');
INSERT INTO public.bookings_import (booking_id, user_id, car_id, start_date, end_date, total_price, status, paymernt_status, created_at) VALUES (3, 3, 1, '2024-03-18', '2024-03-20', 10500, 'активный', 'оплаченный', '2024-03-12 16:45:00');
INSERT INTO public.bookings_import (booking_id, user_id, car_id, start_date, end_date, total_price, status, paymernt_status, created_at) VALUES (4, 4, 7, '2024-03-22', '2024-03-25', 12000, 'подтвержденный', 'оплаченный', '2024-03-15 11:20:00');
INSERT INTO public.bookings_import (booking_id, user_id, car_id, start_date, end_date, total_price, status, paymernt_status, created_at) VALUES (5, 5, 2, '2024-03-14', '2024-03-16', 8400, 'отменен', 'возвращен', '2024-03-08 18:10:00');
INSERT INTO public.bookings_import (booking_id, user_id, car_id, start_date, end_date, total_price, status, paymernt_status, created_at) VALUES (6, 6, 10, '2024-03-25', '2024-03-28', 15000, 'ожидание', 'неоплаченный', '2024-03-20 13:25:00');
INSERT INTO public.bookings_import (booking_id, user_id, car_id, start_date, end_date, total_price, status, paymernt_status, created_at) VALUES (7, 7, 4, '2024-04-01', '2024-04-05', 26000, 'подтвержденный', 'оплаченный', '2024-03-22 10:30:00');
INSERT INTO public.bookings_import (booking_id, user_id, car_id, start_date, end_date, total_price, status, paymernt_status, created_at) VALUES (8, 8, 8, '2024-04-02', '2024-04-04', 9600, 'завершенный', 'оплаченный', '2024-03-25 15:40:00');
INSERT INTO public.bookings_import (booking_id, user_id, car_id, start_date, end_date, total_price, status, paymernt_status, created_at) VALUES (9, 9, 6, '2024-04-06', '2024-04-08', 7500, 'ожидание', 'неоплаченный', '2024-03-28 12:15:00');
INSERT INTO public.bookings_import (booking_id, user_id, car_id, start_date, end_date, total_price, status, paymernt_status, created_at) VALUES (10, 10, 9, '2024-04-10', '2024-04-15', 16000, 'подтвержденный', 'оплаченный', '2024-04-01 17:50:00');
INSERT INTO public.bookings_import (booking_id, user_id, car_id, start_date, end_date, total_price, status, paymernt_status, created_at) VALUES (11, 1, 12, '2024-04-12', '2024-04-14', 11000, 'активный', 'оплаченный', '2024-04-05 14:20:00');
INSERT INTO public.bookings_import (booking_id, user_id, car_id, start_date, end_date, total_price, status, paymernt_status, created_at) VALUES (12, 2, 15, '2024-04-16', '2024-04-18', 18000, 'завершенный', 'оплаченный', '2024-04-10 09:30:00');
INSERT INTO public.bookings_import (booking_id, user_id, car_id, start_date, end_date, total_price, status, paymernt_status, created_at) VALUES (13, 3, 11, '2024-04-20', '2024-04-22', 21000, 'завершенный', 'оплаченный', '2024-04-12 16:10:00');
INSERT INTO public.bookings_import (booking_id, user_id, car_id, start_date, end_date, total_price, status, paymernt_status, created_at) VALUES (14, 4, 14, '2024-04-25', '2024-04-28', 27000, 'ожидание', 'неоплаченный', '2024-04-15 11:45:00');
INSERT INTO public.bookings_import (booking_id, user_id, car_id, start_date, end_date, total_price, status, paymernt_status, created_at) VALUES (15, 5, 13, '2024-05-01', '2024-05-05', 30000, 'завершенный', 'оплаченный', '2024-04-20 18:00:00');
INSERT INTO public.bookings_import (booking_id, user_id, car_id, start_date, end_date, total_price, status, paymernt_status, created_at) VALUES (16, 6, 16, '2024-05-06', '2024-05-08', 22500, 'завершенный', 'оплаченный', '2024-04-25 13:35:00');
INSERT INTO public.bookings_import (booking_id, user_id, car_id, start_date, end_date, total_price, status, paymernt_status, created_at) VALUES (17, 7, 17, '2024-05-10', '2024-05-12', 25000, 'активный', 'оплаченный', '2024-04-28 10:50:00');
INSERT INTO public.bookings_import (booking_id, user_id, car_id, start_date, end_date, total_price, status, paymernt_status, created_at) VALUES (18, 8, 18, '2024-05-15', '2024-05-17', 28000, 'ожидание', 'неоплаченный', '2024-05-05 15:25:00');
INSERT INTO public.bookings_import (booking_id, user_id, car_id, start_date, end_date, total_price, status, paymernt_status, created_at) VALUES (19, 9, 19, '2024-05-20', '2024-05-22', 32000, 'завершенный', 'оплаченный', '2024-05-10 12:40:00');
INSERT INTO public.bookings_import (booking_id, user_id, car_id, start_date, end_date, total_price, status, paymernt_status, created_at) VALUES (20, 10, 20, '2024-05-25', '2024-05-28', 36000, 'завершенный', 'оплаченный', '2024-05-15 17:15:00');


--
-- TOC entry 4826 (class 0 OID 16390)
-- Dependencies: 218
-- Data for Name: car_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.car_type (type_id, type_name) VALUES (1, 'Седан');
INSERT INTO public.car_type (type_id, type_name) VALUES (2, 'Хэтчбек');
INSERT INTO public.car_type (type_id, type_name) VALUES (3, 'Внедорожник');
INSERT INTO public.car_type (type_id, type_name) VALUES (4, 'Кроссовер');
INSERT INTO public.car_type (type_id, type_name) VALUES (5, 'Лифтбек');
INSERT INTO public.car_type (type_id, type_name) VALUES (6, 'Спорткар');
INSERT INTO public.car_type (type_id, type_name) VALUES (7, 'Суперкар');
INSERT INTO public.car_type (type_id, type_name) VALUES (8, 'Гран Туризмо');
INSERT INTO public.car_type (type_id, type_name) VALUES (9, 'Мускулкар');
INSERT INTO public.car_type (type_id, type_name) VALUES (10, 'Электрокар');
INSERT INTO public.car_type (type_id, type_name) VALUES (11, 'Люкс-седан');
INSERT INTO public.car_type (type_id, type_name) VALUES (13, 'Пикап');


--
-- TOC entry 4834 (class 0 OID 16462)
-- Dependencies: 226
-- Data for Name: payments_import; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.payments_import (payment_id, booking_id, amount, payment_date, method, status) VALUES (1, 1, 9000, '2023-09-30', 'Кредитная карта', 'завершенный');
INSERT INTO public.payments_import (payment_id, booking_id, amount, payment_date, method, status) VALUES (2, 2, 7500, '2023-10-01', 'Дебитовая карта', 'завершенный');
INSERT INTO public.payments_import (payment_id, booking_id, amount, payment_date, method, status) VALUES (3, 3, 7000, '2023-10-02', 'Кредитная карта', 'завершенный');
INSERT INTO public.payments_import (payment_id, booking_id, amount, payment_date, method, status) VALUES (4, 3, 7000, '2023-10-03', 'Кредитная карта', 'завершенный');
INSERT INTO public.payments_import (payment_id, booking_id, amount, payment_date, method, status) VALUES (5, 4, 3000, '2023-10-03', 'Банковский перевод', 'возвращен');
INSERT INTO public.payments_import (payment_id, booking_id, amount, payment_date, method, status) VALUES (6, 5, 14000, '2023-10-04', 'Кредитная карта', 'завершенный');
INSERT INTO public.payments_import (payment_id, booking_id, amount, payment_date, method, status) VALUES (7, 6, 13000, '2023-10-05', 'Дебитовая карта', 'завершенный');
INSERT INTO public.payments_import (payment_id, booking_id, amount, payment_date, method, status) VALUES (8, 7, 5000, '2023-10-06', 'Кредитная карта', 'завершенный');
INSERT INTO public.payments_import (payment_id, booking_id, amount, payment_date, method, status) VALUES (9, 8, 6000, '2023-10-07', 'Дебитовая карта', 'завершенный');
INSERT INTO public.payments_import (payment_id, booking_id, amount, payment_date, method, status) VALUES (10, 8, 6000, '2023-10-08', 'Банковский перевод', 'ожидание');


--
-- TOC entry 4830 (class 0 OID 16436)
-- Dependencies: 222
-- Data for Name: users_import; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users_import (user_id, user_name, user_surname, user_mail, user_phone, user_licence, user_status, user_reg_date) VALUES (1, 'Алексей', 'Смирнов', 'alex@mail.ru', '79161234567', '78AA123456', 'active', '2023-01-15');
INSERT INTO public.users_import (user_id, user_name, user_surname, user_mail, user_phone, user_licence, user_status, user_reg_date) VALUES (2, 'Екатерина', 'Иванова', 'katya@yandex.ru', '79162345678', '77BB654321', 'active', '2023-02-20');
INSERT INTO public.users_import (user_id, user_name, user_surname, user_mail, user_phone, user_licence, user_status, user_reg_date) VALUES (3, 'Дмитрий', 'Петров', 'dima@gmail.com', '79163456789', '50CC789012', 'suspended', '2023-03-10');
INSERT INTO public.users_import (user_id, user_name, user_surname, user_mail, user_phone, user_licence, user_status, user_reg_date) VALUES (4, 'Ольга', 'Сидорова', 'olga@mail.ru', '79164567890', '45DD345678', 'active', '2023-04-05');
INSERT INTO public.users_import (user_id, user_name, user_surname, user_mail, user_phone, user_licence, user_status, user_reg_date) VALUES (5, 'Михаил', 'Кузнецов', 'misha@yandex.ru', '79165678901', '23EE901234', 'active', '2023-05-12');
INSERT INTO public.users_import (user_id, user_name, user_surname, user_mail, user_phone, user_licence, user_status, user_reg_date) VALUES (6, 'Анна', 'Васильева', 'anna@gmail.com', '79166789012', '34FF567890', 'banned', '2023-06-18');
INSERT INTO public.users_import (user_id, user_name, user_surname, user_mail, user_phone, user_licence, user_status, user_reg_date) VALUES (7, 'Сергей', 'Попов', 'sergey@mail.ru', '79167890123', '12GG234567', 'active', '2023-07-22');
INSERT INTO public.users_import (user_id, user_name, user_surname, user_mail, user_phone, user_licence, user_status, user_reg_date) VALUES (8, 'Мария', 'Новикова', 'maria@yandex.ru', '79168901234', '56HH890123', 'active', '2023-08-30');
INSERT INTO public.users_import (user_id, user_name, user_surname, user_mail, user_phone, user_licence, user_status, user_reg_date) VALUES (9, 'Андрей', 'Морозов', 'andrey@gmail.com', '79169012345', '67JJ456789', 'active', '2023-09-05');
INSERT INTO public.users_import (user_id, user_name, user_surname, user_mail, user_phone, user_licence, user_status, user_reg_date) VALUES (10, 'Наталья', 'Волкова', 'natalya@mail.ru', '79160123456', '89KK012345', 'active', '2023-10-10');


--
-- TOC entry 4845 (class 0 OID 0)
-- Dependencies: 219
-- Name: avto_import_car_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.avto_import_car_id_seq', 39, true);


--
-- TOC entry 4846 (class 0 OID 0)
-- Dependencies: 223
-- Name: bookings_import_booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_import_booking_id_seq', 20, true);


--
-- TOC entry 4847 (class 0 OID 0)
-- Dependencies: 217
-- Name: car_type_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.car_type_type_id_seq', 13, true);


--
-- TOC entry 4848 (class 0 OID 0)
-- Dependencies: 225
-- Name: payments_import_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_import_payment_id_seq', 10, true);


--
-- TOC entry 4849 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_import_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_import_user_id_seq', 39, true);


--
-- TOC entry 4669 (class 2606 OID 16429)
-- Name: avto_import avto_import_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avto_import
    ADD CONSTRAINT avto_import_pkey PRIMARY KEY (car_id);


--
-- TOC entry 4673 (class 2606 OID 16450)
-- Name: bookings_import bookings_import_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings_import
    ADD CONSTRAINT bookings_import_pkey PRIMARY KEY (booking_id);


--
-- TOC entry 4667 (class 2606 OID 16395)
-- Name: car_type car_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_type
    ADD CONSTRAINT car_type_pkey PRIMARY KEY (type_id);


--
-- TOC entry 4675 (class 2606 OID 16467)
-- Name: payments_import payments_import_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments_import
    ADD CONSTRAINT payments_import_pkey PRIMARY KEY (payment_id);


--
-- TOC entry 4671 (class 2606 OID 16443)
-- Name: users_import users_import_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_import
    ADD CONSTRAINT users_import_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4676 (class 2606 OID 16430)
-- Name: avto_import avto_import_car_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avto_import
    ADD CONSTRAINT avto_import_car_type_fkey FOREIGN KEY (car_type) REFERENCES public.car_type(type_id);


--
-- TOC entry 4677 (class 2606 OID 16456)
-- Name: bookings_import bookings_import_car_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings_import
    ADD CONSTRAINT bookings_import_car_id_fkey FOREIGN KEY (car_id) REFERENCES public.avto_import(car_id);


--
-- TOC entry 4678 (class 2606 OID 16451)
-- Name: bookings_import bookings_import_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings_import
    ADD CONSTRAINT bookings_import_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users_import(user_id);


--
-- TOC entry 4679 (class 2606 OID 16468)
-- Name: payments_import payments_import_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments_import
    ADD CONSTRAINT payments_import_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.bookings_import(booking_id);


-- Completed on 2025-04-25 15:45:36

--
-- PostgreSQL database dump complete
--

