PGDMP                          {            hotel    15.2    15.2 S    {           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            |           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            }           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ~           1262    16398    hotel    DATABASE     y   CREATE DATABASE hotel WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE hotel;
                postgres    false                        2615    16400    hotel    SCHEMA        CREATE SCHEMA hotel;
    DROP SCHEMA hotel;
                postgres    false            �            1259    16539    cleaning    TABLE     �   CREATE TABLE hotel.cleaning (
    id integer NOT NULL,
    room_id integer NOT NULL,
    employee_id integer NOT NULL,
    created_at date NOT NULL,
    cleaned_at date NOT NULL,
    status boolean NOT NULL
);
    DROP TABLE hotel.cleaning;
       hotel         heap    postgres    false    6            �            1259    16538    cleaning_id_seq    SEQUENCE     �   ALTER TABLE hotel.cleaning ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hotel.cleaning_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            hotel          postgres    false    6    234            �            1259    16409    client    TABLE     �   CREATE TABLE hotel.client (
    passport integer NOT NULL,
    full_name character varying(255) NOT NULL,
    address character varying(255) NOT NULL
);
    DROP TABLE hotel.client;
       hotel         heap    postgres    false    6            �            1259    16475 	   commodity    TABLE     �   CREATE TABLE hotel.commodity (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(100) NOT NULL
);
    DROP TABLE hotel.commodity;
       hotel         heap    postgres    false    6            �            1259    16474    commodity_id_seq    SEQUENCE     �   ALTER TABLE hotel.commodity ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hotel.commodity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            hotel          postgres    false    227    6            �            1259    16555    discount    TABLE     }  CREATE TABLE hotel.discount (
    id integer NOT NULL,
    description character varying(50) NOT NULL,
    discount double precision NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    hotel_id integer NOT NULL,
    CONSTRAINT discount_check CHECK ((start_date <= end_date)),
    CONSTRAINT discount_discount_check CHECK ((discount > (0)::double precision))
);
    DROP TABLE hotel.discount;
       hotel         heap    postgres    false    6            �            1259    16554    discount_id_seq    SEQUENCE     �   ALTER TABLE hotel.discount ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hotel.discount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            hotel          postgres    false    236    6            �            1259    16439    employee    TABLE     �   CREATE TABLE hotel.employee (
    id integer NOT NULL,
    full_name character varying(30) NOT NULL,
    position_id integer NOT NULL
);
    DROP TABLE hotel.employee;
       hotel         heap    postgres    false    6            �            1259    16438    employee_id_seq    SEQUENCE     �   ALTER TABLE hotel.employee ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hotel.employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            hotel          postgres    false    221    6            �            1259    16402    hotel    TABLE     �   CREATE TABLE hotel.hotel (
    id integer NOT NULL,
    address character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE hotel.hotel;
       hotel         heap    postgres    false    6            �            1259    16401    hotel_id_seq    SEQUENCE     �   ALTER TABLE hotel.hotel ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hotel.hotel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            hotel          postgres    false    6    216            �            1259    16568    order    TABLE     �  CREATE TABLE hotel."order" (
    id integer NOT NULL,
    passport integer NOT NULL,
    employee_id integer NOT NULL,
    room_id integer NOT NULL,
    created_at date NOT NULL,
    arrival_date date NOT NULL,
    departure_date date NOT NULL,
    payment_type character varying(10) NOT NULL,
    status character varying(10) NOT NULL,
    CONSTRAINT order_check CHECK ((departure_date >= arrival_date))
);
    DROP TABLE hotel."order";
       hotel         heap    postgres    false    6            �            1259    16567    order_id_seq    SEQUENCE     �   ALTER TABLE hotel."order" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hotel.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            hotel          postgres    false    6    238            �            1259    16417    position    TABLE     �   CREATE TABLE hotel."position" (
    id integer NOT NULL,
    hotel_id integer NOT NULL,
    name character varying(20) NOT NULL,
    salary integer NOT NULL
);
    DROP TABLE hotel."position";
       hotel         heap    postgres    false    6            �            1259    16416    position_id_seq    SEQUENCE     �   ALTER TABLE hotel."position" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hotel.position_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            hotel          postgres    false    6    219            �            1259    16455    price    TABLE     #  CREATE TABLE hotel.price (
    id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    price integer NOT NULL,
    room_type_id integer NOT NULL,
    CONSTRAINT price_check CHECK ((start_date <= end_date)),
    CONSTRAINT price_price_check CHECK ((price >= 0))
);
    DROP TABLE hotel.price;
       hotel         heap    postgres    false    6            �            1259    16454    price_id_seq    SEQUENCE     �   ALTER TABLE hotel.price ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hotel.price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            hotel          postgres    false    223    6            �            1259    16521    promo    TABLE     g  CREATE TABLE hotel.promo (
    id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    discount double precision NOT NULL,
    hotel_id integer NOT NULL,
    room_type_id integer NOT NULL,
    CONSTRAINT promo_check CHECK ((end_date >= start_date)),
    CONSTRAINT promo_discount_check CHECK ((discount > (0)::double precision))
);
    DROP TABLE hotel.promo;
       hotel         heap    postgres    false    6            �            1259    16520    promo_id_seq    SEQUENCE     �   ALTER TABLE hotel.promo ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hotel.promo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            hotel          postgres    false    6    232            �            1259    16501    room    TABLE     �   CREATE TABLE hotel.room (
    id integer NOT NULL,
    hotel_id integer NOT NULL,
    room_type_id integer NOT NULL,
    number smallint NOT NULL,
    is_cleaned boolean NOT NULL,
    is_free boolean NOT NULL
);
    DROP TABLE hotel.room;
       hotel         heap    postgres    false    6            �            1259    16500    room_id_seq    SEQUENCE     �   ALTER TABLE hotel.room ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hotel.room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            hotel          postgres    false    6    230            �            1259    16463 	   room_type    TABLE     �   CREATE TABLE hotel.room_type (
    id integer NOT NULL,
    type character varying(20) NOT NULL,
    guests_number integer NOT NULL,
    CONSTRAINT room_type_guests_number_check CHECK ((guests_number > 0))
);
    DROP TABLE hotel.room_type;
       hotel         heap    postgres    false    6            �            1259    16485    room_type_commodity    TABLE     q   CREATE TABLE hotel.room_type_commodity (
    room_type_id integer NOT NULL,
    commodity_id integer NOT NULL
);
 &   DROP TABLE hotel.room_type_commodity;
       hotel         heap    postgres    false    6            �            1259    16462    room_type_id_seq    SEQUENCE     �   ALTER TABLE hotel.room_type ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hotel.room_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            hotel          postgres    false    225    6            t          0    16539    cleaning 
   TABLE DATA           [   COPY hotel.cleaning (id, room_id, employee_id, created_at, cleaned_at, status) FROM stdin;
    hotel          postgres    false    234   Te       c          0    16409    client 
   TABLE DATA           =   COPY hotel.client (passport, full_name, address) FROM stdin;
    hotel          postgres    false    217   qe       m          0    16475 	   commodity 
   TABLE DATA           9   COPY hotel.commodity (id, name, description) FROM stdin;
    hotel          postgres    false    227   �O      v          0    16555    discount 
   TABLE DATA           \   COPY hotel.discount (id, description, discount, start_date, end_date, hotel_id) FROM stdin;
    hotel          postgres    false    236   WQ      g          0    16439    employee 
   TABLE DATA           =   COPY hotel.employee (id, full_name, position_id) FROM stdin;
    hotel          postgres    false    221   �Q      b          0    16402    hotel 
   TABLE DATA           1   COPY hotel.hotel (id, address, name) FROM stdin;
    hotel          postgres    false    216   wW      x          0    16568    order 
   TABLE DATA           �   COPY hotel."order" (id, passport, employee_id, room_id, created_at, arrival_date, departure_date, payment_type, status) FROM stdin;
    hotel          postgres    false    238   gX      e          0    16417    position 
   TABLE DATA           ?   COPY hotel."position" (id, hotel_id, name, salary) FROM stdin;
    hotel          postgres    false    219   �X      i          0    16455    price 
   TABLE DATA           M   COPY hotel.price (id, start_date, end_date, price, room_type_id) FROM stdin;
    hotel          postgres    false    223   �Y      r          0    16521    promo 
   TABLE DATA           Z   COPY hotel.promo (id, start_date, end_date, discount, hotel_id, room_type_id) FROM stdin;
    hotel          postgres    false    232   !Z      p          0    16501    room 
   TABLE DATA           V   COPY hotel.room (id, hotel_id, room_type_id, number, is_cleaned, is_free) FROM stdin;
    hotel          postgres    false    230   >Z      k          0    16463 	   room_type 
   TABLE DATA           ;   COPY hotel.room_type (id, type, guests_number) FROM stdin;
    hotel          postgres    false    225   ]      n          0    16485    room_type_commodity 
   TABLE DATA           H   COPY hotel.room_type_commodity (room_type_id, commodity_id) FROM stdin;
    hotel          postgres    false    228   D]                 0    0    cleaning_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('hotel.cleaning_id_seq', 1, false);
          hotel          postgres    false    233            �           0    0    commodity_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('hotel.commodity_id_seq', 7, true);
          hotel          postgres    false    226            �           0    0    discount_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('hotel.discount_id_seq', 5, true);
          hotel          postgres    false    235            �           0    0    employee_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('hotel.employee_id_seq', 124, true);
          hotel          postgres    false    220            �           0    0    hotel_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('hotel.hotel_id_seq', 6, true);
          hotel          postgres    false    215            �           0    0    order_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('hotel.order_id_seq', 1, true);
          hotel          postgres    false    237            �           0    0    position_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('hotel.position_id_seq', 34, true);
          hotel          postgres    false    218            �           0    0    price_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('hotel.price_id_seq', 5, true);
          hotel          postgres    false    222            �           0    0    promo_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('hotel.promo_id_seq', 1, false);
          hotel          postgres    false    231            �           0    0    room_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('hotel.room_id_seq', 191, true);
          hotel          postgres    false    229            �           0    0    room_type_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('hotel.room_type_id_seq', 5, true);
          hotel          postgres    false    224            �           2606    16543    cleaning cleaning_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY hotel.cleaning
    ADD CONSTRAINT cleaning_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY hotel.cleaning DROP CONSTRAINT cleaning_pkey;
       hotel            postgres    false    234            �           2606    16415    client client_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY hotel.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (passport);
 ;   ALTER TABLE ONLY hotel.client DROP CONSTRAINT client_pkey;
       hotel            postgres    false    217            �           2606    16479    commodity commodity_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY hotel.commodity
    ADD CONSTRAINT commodity_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY hotel.commodity DROP CONSTRAINT commodity_pkey;
       hotel            postgres    false    227            �           2606    16595 !   discount discount_discount_check1    CHECK CONSTRAINT     }   ALTER TABLE hotel.discount
    ADD CONSTRAINT discount_discount_check1 CHECK ((discount < (1)::double precision)) NOT VALID;
 E   ALTER TABLE hotel.discount DROP CONSTRAINT discount_discount_check1;
       hotel          postgres    false    236    236            �           2606    16561    discount discount_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY hotel.discount
    ADD CONSTRAINT discount_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY hotel.discount DROP CONSTRAINT discount_pkey;
       hotel            postgres    false    236            �           2606    16443    employee employee_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY hotel.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY hotel.employee DROP CONSTRAINT employee_pkey;
       hotel            postgres    false    221            �           2606    16408    hotel hotel_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY hotel.hotel
    ADD CONSTRAINT hotel_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY hotel.hotel DROP CONSTRAINT hotel_pkey;
       hotel            postgres    false    216            �           2606    16573    order order_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY hotel."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY hotel."order" DROP CONSTRAINT order_pkey;
       hotel            postgres    false    238            �           2606    16432    position position_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY hotel."position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY hotel."position" DROP CONSTRAINT position_pkey;
       hotel            postgres    false    219            �           2606    16461    price price_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY hotel.price
    ADD CONSTRAINT price_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY hotel.price DROP CONSTRAINT price_pkey;
       hotel            postgres    false    223            �           2606    16594    promo promo_discount_check1    CHECK CONSTRAINT     w   ALTER TABLE hotel.promo
    ADD CONSTRAINT promo_discount_check1 CHECK ((discount < (1)::double precision)) NOT VALID;
 ?   ALTER TABLE hotel.promo DROP CONSTRAINT promo_discount_check1;
       hotel          postgres    false    232    232            �           2606    16527    promo promo_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY hotel.promo
    ADD CONSTRAINT promo_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY hotel.promo DROP CONSTRAINT promo_pkey;
       hotel            postgres    false    232            �           2606    16505    room room_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY hotel.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (id);
 7   ALTER TABLE ONLY hotel.room DROP CONSTRAINT room_pkey;
       hotel            postgres    false    230            �           2606    16489 ,   room_type_commodity room_type_commodity_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY hotel.room_type_commodity
    ADD CONSTRAINT room_type_commodity_pkey PRIMARY KEY (room_type_id, commodity_id);
 U   ALTER TABLE ONLY hotel.room_type_commodity DROP CONSTRAINT room_type_commodity_pkey;
       hotel            postgres    false    228    228            �           2606    16468    room_type room_type_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY hotel.room_type
    ADD CONSTRAINT room_type_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY hotel.room_type DROP CONSTRAINT room_type_pkey;
       hotel            postgres    false    225            �           2606    16549 "   cleaning cleaning_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hotel.cleaning
    ADD CONSTRAINT cleaning_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES hotel.employee(id);
 K   ALTER TABLE ONLY hotel.cleaning DROP CONSTRAINT cleaning_employee_id_fkey;
       hotel          postgres    false    3249    234    221            �           2606    16544    cleaning cleaning_room_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY hotel.cleaning
    ADD CONSTRAINT cleaning_room_id_fkey FOREIGN KEY (room_id) REFERENCES hotel.room(id);
 G   ALTER TABLE ONLY hotel.cleaning DROP CONSTRAINT cleaning_room_id_fkey;
       hotel          postgres    false    234    3259    230            �           2606    16562    discount discount_hotel_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hotel.discount
    ADD CONSTRAINT discount_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES hotel.hotel(id) ON UPDATE CASCADE ON DELETE CASCADE;
 H   ALTER TABLE ONLY hotel.discount DROP CONSTRAINT discount_hotel_id_fkey;
       hotel          postgres    false    216    3243    236            �           2606    16444 "   employee employee_position_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hotel.employee
    ADD CONSTRAINT employee_position_id_fkey FOREIGN KEY (position_id) REFERENCES hotel."position"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY hotel.employee DROP CONSTRAINT employee_position_id_fkey;
       hotel          postgres    false    219    3247    221            �           2606    16579    order order_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hotel."order"
    ADD CONSTRAINT order_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES hotel.employee(id) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY hotel."order" DROP CONSTRAINT order_employee_id_fkey;
       hotel          postgres    false    238    3249    221            �           2606    16574    order order_passport_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hotel."order"
    ADD CONSTRAINT order_passport_fkey FOREIGN KEY (passport) REFERENCES hotel.client(passport) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY hotel."order" DROP CONSTRAINT order_passport_fkey;
       hotel          postgres    false    217    3245    238            �           2606    16584    order order_room_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hotel."order"
    ADD CONSTRAINT order_room_id_fkey FOREIGN KEY (room_id) REFERENCES hotel.room(id) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY hotel."order" DROP CONSTRAINT order_room_id_fkey;
       hotel          postgres    false    238    3259    230            �           2606    16433    position position_hotel_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hotel."position"
    ADD CONSTRAINT position_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES hotel.hotel(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 J   ALTER TABLE ONLY hotel."position" DROP CONSTRAINT position_hotel_id_fkey;
       hotel          postgres    false    219    3243    216            �           2606    16768    price price_room_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hotel.price
    ADD CONSTRAINT price_room_type_id_fkey FOREIGN KEY (room_type_id) REFERENCES hotel.room_type(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY hotel.price DROP CONSTRAINT price_room_type_id_fkey;
       hotel          postgres    false    3253    223    225            �           2606    16528    promo promo_hotel_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hotel.promo
    ADD CONSTRAINT promo_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES hotel.hotel(id) ON UPDATE CASCADE ON DELETE CASCADE;
 B   ALTER TABLE ONLY hotel.promo DROP CONSTRAINT promo_hotel_id_fkey;
       hotel          postgres    false    216    232    3243            �           2606    16533    promo promo_room_type_id    FK CONSTRAINT     �   ALTER TABLE ONLY hotel.promo
    ADD CONSTRAINT promo_room_type_id FOREIGN KEY (room_type_id) REFERENCES hotel.room_type(id) ON UPDATE CASCADE ON DELETE CASCADE;
 A   ALTER TABLE ONLY hotel.promo DROP CONSTRAINT promo_room_type_id;
       hotel          postgres    false    3253    225    232            �           2606    16511    room room_hotel_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hotel.room
    ADD CONSTRAINT room_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES hotel.hotel(id) ON UPDATE CASCADE ON DELETE CASCADE;
 @   ALTER TABLE ONLY hotel.room DROP CONSTRAINT room_hotel_id_fkey;
       hotel          postgres    false    230    216    3243            �           2606    16506    room room_room_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hotel.room
    ADD CONSTRAINT room_room_type_id_fkey FOREIGN KEY (room_type_id) REFERENCES hotel.room_type(id) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY hotel.room DROP CONSTRAINT room_room_type_id_fkey;
       hotel          postgres    false    225    230    3253            �           2606    16495 9   room_type_commodity room_type_commodity_commodity_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hotel.room_type_commodity
    ADD CONSTRAINT room_type_commodity_commodity_id_fkey FOREIGN KEY (commodity_id) REFERENCES hotel.commodity(id) ON UPDATE CASCADE ON DELETE CASCADE;
 b   ALTER TABLE ONLY hotel.room_type_commodity DROP CONSTRAINT room_type_commodity_commodity_id_fkey;
       hotel          postgres    false    228    3255    227            �           2606    16490 9   room_type_commodity room_type_commodity_room_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY hotel.room_type_commodity
    ADD CONSTRAINT room_type_commodity_room_type_id_fkey FOREIGN KEY (room_type_id) REFERENCES hotel.room_type(id) ON UPDATE CASCADE ON DELETE CASCADE;
 b   ALTER TABLE ONLY hotel.room_type_commodity DROP CONSTRAINT room_type_commodity_room_type_id_fkey;
       hotel          postgres    false    3253    228    225            t      x������ � �      c      x��}�z�F��5�)� ���F7�:ي%��%'ޙ;��ED �H����kU$$L�I2�I}�ZU�jU�4�S�LpVTe~,�h�i�؆ߋn^�U�-ڢX�;�n�e��S�W�I���_q��4v*I���.�y[�EU�]Sq��	��&�8������9��$�Lf|�Q&����|�h�/U�ݯǱ�?��:����U�X�!Nn�T���ƑQ6rY�y�w����^��(�k��Y�1_�'�E�ķ|��|�g(���u�U�/Q�q�EQ|j�Yx^TM�$Q�6uxR��ϟ�M�X�j|Q�ޜ�*V��+6.M�S�
>���(��X,��ϧ���-��7M�xh�E����8�X	�h�be�O�����2c5�6P6�B����K�X��T�1�>�u�&I�(8��wyx3�:+Z��+������*�i���O茎�#²Zc��X��ٯ~n�J��c�t�~��ɧܔ������F&�:��.Sx�iQ��x������8����������6<�w�(Q�����Rk|���Ux�\JG&�埗���.��:�.��:�݌]��,�t�͋𺬧��l�U�j�CzV��
���w3��}u�T�/�$�X4��x������Rfچ�����]D��_��������-����.���"i����}�6���,���KEYGx�k��x�O�z����-�8<3���+v�<E�i�fp��Ԅ�y���-nW��]Y=��in����܏/Wa��ț�5�bG��rZT�%��[pM`Et�-\���%϶���Gc��v'ˇe�(q�?ª��� �b�=��I�66��G�ZG<�&'�aA���-�pQ/���E�"�F��k���|�x�����+ol������.q"���;���;����F�&��r��+�ɬ���ƻfGE�]>š��_�.а��W���xY��g��X�c��R�x�a��"��4,�ע��U��30 ��Y31�Ii����K�$��i^V_�z,�.��77yY��{���h^���$�`��đ�9�
����;8yĂ8y�"�f��u��8�V��)�������*�K9kj����[����Q� ���s�o��2�]0~�J~:HSX�良���7�9|�	�%s�}�3�>V|$l��i�Xr���Φ�j�1�����
8�To>�4B�Z�U#'6�x��&S�D�U���
��ʇ'~�2������7��;ٚnk���MVQ��R�S���iﱑg͔�����C��i����ok��6:�V��Fp,\�p���3|�_I\�iU`CVޒ�n`!tf�3����X�o8�80�8'O�����Xa9�Q��PZa�2�x�o�^&I�����ֆ����\q���2���)d�x7��?�gx���!ex�]V0Ɓ�mu.�c8X�+<s��Yց�3�a���zk��5#����k�U��w�2*���<����*���	O�Qd���m>�3�s)�$q�ٲ�YZ��b:��{Ÿ�q�U���*m9�a�Z�y~��0"X������y8��G�^�� ��r��8��9���]��`Q�b�0�Q��p"eQ�	v��(��`��;8k��i��P||�<�������ۗ���.j�R���~���=�c^�&w��o3�������q�758���,��U�& �����2��cK�g���8pw��
�TrفR���
3��Q\㦓e���?E1N����q�{�}U�����z8xR�� �d�ɂ�J>�f^���>'�m9}(f9�밿���?eJ@�x���z��|Yw�%ଇ�oomL8��6�G�.�6�+��M)V�P(Nx�h"|Jy��i	SvO����c���}!�2nZ���4�~��?Β�fٕ�����iYO%Τ�\����MYx�{������&��
��x�b����T�V0Lp��s'�����ϲ�%)?��M��n��Knr� �K�]��:��8!Xg��Ο)48�
O�e�:050�8Dx�����{
�sٴ�q�{�@x�*�X]xT"kX�o��n���R1�[��M1����� a\{�mI0 {;/�� p^V4	c{�ǃ�X�i��!"=�`�8������k\|?�����p�Q�hgw�� �pE��O��"�%�2�mb�B����gP�����VH�����Als��r��3-�y��gm� ��u3�b�(	�7e��Æb����;*l����	��*�A����\s�H�<��8`�4�)��eh{MK}����a�e�� �b�i��Z'�̟������3�2",��N��+[��Bd 2�OA��ѴH���\�B���u |�X`��z�eF<�0Q�,x/�Gޮf���Q�;���5��tNy7����(xS� ���'p�8������f�j0�@�e��Y�7�exd�3`GZ1Ȼl�E 4pQ����oi����ya�#����S��T4 ���9m�A-"�$&� ������Z�]�8�4�'�3�ٻ,��Yd5b��{V�wNV2������A���`�{��h5,v��+����Fi��qnlx�S��Vc�%��( ���Z��\�z��ˉ��^", 4��>��T>���������'�N|�:j���ߒ�@EP�E�|�W��W��=�J��;b�h�^Cr&��*	N	HOy�+�)��y����h�A��Ka(lp������m���o ��4��E1/�U>�m����x�)s>1�`��հx�?�h�]�����6�u!G5�%����Ʀ�x�(��z��I�q��Z �3�U����q2;�e	,0�'	�M� ���j~\���m���̖A��y\g�a�hHBD8z���p�e���hVV���K����.�}v*������~����޹ p������-�	 <j�<yD����(���g�s���ȥ1~9��\,?N,�g°;f��KБ*&7<�Y������5O%��7(T�~Sp�z�+ܪY��Za�ѱ�@J񫂳���-,O����zl`��`�LM_��������B���͏{of��f�ؤ@�xx�]68�0tp����b_ZV[gU��ª2�{!�Lz>����ӭO��G���������s�\�,���a���`(��4�~�~��yڗZIҌX�0fs1.(p\l�b��Q@���6@���"`���m�ʅߘO�Yr�e���G1��'X��$LEѳ����62�v@Q)STs�E8X@�����@�&�� k |f����K	/��HG���E7��]�<C�����Y	���N�Q�}jV��6�}I�A�G]"�Ƥ�5�[���3ga�@��o�ϋiޯ&�o��E�Q��K b���#J�.���n>�|a��K�8bm�5pPo��B�� �=�K�ώD�KX=�,�,����P������:��r[1��-` ��i�����<H hZ?<а��l�ǈ�0/��W�p�ES��t_ǹ� e���l�xf��=�h�S�`�N����k?�t����Hp�`'�O���6Q�NC�Y����%���R.4�4n=�d>dپϊ�j&��9����R�@����?� �"�kX�E�;�)�L�����0��bj�ڏ�?<!��9�����K��c����|@Xe���jqa���څ\E��']jc���6ǝaɌv� @Tqx3��@o�e��&�Յ=����qU1����L�����h	>�(���(@&D�0�E�}T�c�w�ύ$9��U��i�U����f9�r�R��X�{y�-2�[}�p�h*/�_0 H�_e�X���S�.�H4�iW�G��Ş���a�YV���o�DLl�|�Wc���?~08�*��b�p*�J�b�� C����(@��'�s��B0=�o�g�|���(K��h�$�򏀜����    4_�A��V'bc����8Q�p�S���b�P���.?p��`�e�	dx�c�:�}��g��h'������W/�i�N� w� @��gN���O��p����B0I	h���	������va��\xw��L+��|�+�e�+ģ,�[%Ho�MFƐ��/N��+U>�#e=i��B���E&`������ 촄W@��E��bϭ�A�����nX�����t8Em5.Q� @�P��"`�9�]�����[�5~���GY;n��PJ
�,����lU�I�$������eƌ
���g�|p!���K���kY8ϥ�IƉ�S�7(��6+^�7�.�ojW>�xR!����� %�f �HT�fΟ��W�
i��,�=� D)�;�"	Foi�8�ŻEކ��N T��;�&�f���,N�%��p	\��2$�|�}��ǉ��YU����}@��#f�����"Z��Ȯh%e_f�4+���}^/�N"|em����I�26�W�[|�G���vŏR%x�Is�w�i�"�K���o��M��v�t˶��vG���*'݌��Z|���F@<Q*S�w7w���^B�֌�+o�;�|�t�F_E��tĊf����!�l�ֈؚ%3^d��/�{�򱅮D�r����u�e���p�-GD�Y�w�L#\J�y���>��E)�up�*�}'3�GRFLג/��p7.4����	�&�+LI̊rC��oQ7{�3��6�<�'��*>��2�Կ���|Uԯ�-�e�Z��,�6f��Lp��.�6�HHA��~	BCgq�l��霦DI���>�`W��G�z ξg^�k�@���;��#0��&M�qѱ1=��
�F }���v8)>T�)$����G��a�#�|RpU�-��Ȉ��x ��5�Ӎ,������0����i;"E ��G�N�ihD|1�ү2�{g�k(�yv��=���`����?�o!/C
�
�C�y�={7_%��I7�HF�ؑ��?�Cxu,FŶkk����=��#��F��:K��j�j������|��aG�+{�F�F8
�o��%��NJ��2+~�ܭ(8�Y}�.�W������ͫ��=��z��9��_�4�M\p�m�舯��A���,�|�v�yw8C�MvY
�E|^<�lN�u��3n�(%�Q���I�S�=�#�-r���\�J<~�}	_� f�@p��8O��k���0i�дeC�6/�՛>E�Z��a����IS��!s�
�&�e��u,�ϲ�i`��.;F����g?�Q��O��`�>�8��瀀7��a>�D@*��� ;�6�⚏��.ʓ%� pHаpuI�~y)�yجO|���ܑ���wL� �n���"[�O˺|b �Ԓø	�w�C,�h�^�4��x�ϴ
ez�M�m��O%����;�4��I'�{���<����I�)���X`f���}<�� 5�m�����6:����¢�L��MYV�Q������J��|��/�zT�|cVt��d�c.�e��R�x��Y����:�]q
�K�<�8��0k�k���"���<�� �Y
ӈx�DB@�g�����9 ��sm�;�	9E�K�dC� �h�W ��Zh��Hj�v�6v	�`Ip��ͳT����X�8t�i�uL�NH�Ʉ4��3<��+qf��L�YD�F���r7���첶ͬ�;�|��٘�ů�K�/WSxE�	�m:g|�/�l�#F��'Y�!�0
8�O��Ӳ~����&�w����#��m9�i����9��8I�p:5@}��:9�g@?I�n��K����V��&iLVՕ���9ˁ�����wg��"�4��#��Y%e����l����%p�p6���X�p����k��L/������C�UKz��8������_�-s���e�2����6�<+	�O��n��,_�+�zZT#$���κ,��( Ƃ�}�t�oئ���G=%�HB�Y��"xL��#ڵU�� �J�����0�ZfC��L,���<��B�(�vNI��I�rЄZ!� Ie��H����fB$��:��}1�{	�05���/�ڷk &�՛��J�ab �6J�������h+�m��0bt�nS)���>��+	@��K<J9Ex�.��X��,7�!�F����2K�ۜ]^��A�2��f�v9J�K�%��Lb��x4M\���wdk!�p��?�&ŧ�Z�'N��B�<���˜3)Kۼ��+qk]����W��	�A���l
�9�f��Y�x{S5������#�n��a��2T � VϜ����
����D�O:��=bk� ��4^���g傅Ve`�F.�s�2�]`�I�aS�ʒ�t��|)/ �%�!�Fv�h�T���S�.��&��W��>?6l�9|��}�"�-��x��?,%-��N�^�zc��c�ϭy��zǳ���ᑨ��Z/e]��;�8COGn.У��/�9�� 
s�e�/J�	��p�a#�k������Oߋi���$��F� uU���@2-��ͳt�s;�{퍿0�"��|��\3f(�Y���&�?��Ӑ1�_�zZ��0i����d^t��͞�>�ߓb�����j �3�z��G����hD��Yp;�9�z}U	ss�cx|��xmѾ�"�"5Nj�]~+tË�־n��l��e�=r��i�X?<gxW3�@0<N|��a"��i�)��W+��}^֒Z'��i��ډ1�\�0����E%���8����:�ّ�%�6�g�����%�%A^��J,�ߐ]�)%е&r��x⫦���p�;��f����U'�Y���=�qH��:����ZuL�TS\l�;sL�
�.dJj�I-V|�ĉ�+غk�����mU?F%V!� ��ܰP��2����Ci�mh֣0dW1���3��e��V3'����r��f����U��a�&�;ҿ���D��	��<�m���v�FAd�HV��Ŏ.`<�+��3�N�6��`���i�0Wɀ4S7�׼�Ҥ�cH���Z�3P'�V�����q˔
b�{��R6�2��ϥ^�	3�?#�C�b��UC��s���^ڧ-6~�m��5_�"��7�"��$�`9�%i�7�o\�i`�#c��Oe�W�*aGé����-ط�0�bIU����V��^0�wY�z�����D��k��.�cM��M$�>�z/��'E|$���,��`=��rX)�i�R�q�ڱ㋽����]F[ﯘ��)$#cE�\Z[�BFI����}��I3��f��.�,Hr?�똯g8���*#�p��5��&%��&9�8�Wcr�?#L#K��y^�Tnl�����ŷ��³H�z�c��:������hR�L��f��'}�BL.2`a�F����R�9al=r7��,Udv9NR|Χ<��M%i ��<z�Ӣ},�?���
+��Y��1g])W���ߪ�^�TV�i�,�vT�y�!�= �8׫5�|c��c2zL�< �"��=�@��U�����q�Ub�Vk�V�*�� �!'M��2�:b�r�4�r�))Պ�ǟ��Wa�Zw4S7bK<�|F/����B
����3I�a1�m�\��)���MIn�pl�u?h�s@N��}�J�}CT��Q�YR	%j��\��8��qa���<+��ԗΤU%�ќ��O���ˢ{*�^_Ai�\j2�ĕ��V@�Sa���XI��k?v����X6�0������00�+�13���u�m�?�d��Lx2�ӳ�4cL�4$��so�/�P6��OY�Iz�7�A�'�<�^dO4K`p�V+���6_P���
��F]ǥo2�,��E�%�uf�w�bcC�$�ь%%cR6ˎ�f�"P��XWDw�&�����!�Ǎ��J�4�Q��; x��� ϋ�.I+(�K2N��9�Q9�+`��$d���LK$�c��m^h#Y�Ŋ�U7
w�3�IfҢ�ˤo�<Z0���ej    Mr�}3�ϵ*���) ɻ�C�M���%v���i���w[����R��(�[O�Y�� M1�����GN���Hc�"i@���H
�W�w��H���X��i�u)��h
�'�u��Lf�^SJG><��~��%��r`����Nf%�&P!��e.���w O�I���;�����)[�Ԋ���	=�&u�=^p�^�$�ŭ=ϥ�������r�d���`HV2˄+�|-v��]��,;S���	v7�.s�>,��p�`q�ȍl���K�ه�(�	K�߅�8��[���#���R[:|è������z��:����l.Z`��}���T�&`"�$��乤��VՐ��]g���x��x�$�a�=�f�Ŕ��$h*�}�s�"�e������6����
���#p�6&���
<�&��`H�@�������0Qcc@��fk��c:B����Z�X	�|�I�Ϣ�(ͼk!,�' Ҧp�,V|�}IEƍ#��A�/��&{(�K��_;�.�q�P������
����ȷ�
%t���S�,�'�%О�8`^�Ӝɳ��u�c��AiD�#ܛu�N�����iY=������塶H��	c~����~` F�X�����g�%4��=��-��Λ��15��v[y���R�E�f9�ꮩ�9P���%ٙ�^���7� I�#�t0=콪X��B��d�~@8�	V�����#Νل�%��]��B:���ˢ�Ł��W���Z�% ϱCtL�����_N�@��
��n��c�~ٖ�'���T�I�3Io>�?���R��X�(�,�Q�'�˖yG"c&O��gl�K�r���D����q$�V�ϲ��/ʎ�)8wl��NI�؄�Ѿ�άW��x�����cr�:���i#�Ɯ����A	��ߖ�`���!f�іI=�� *>��ڏ�%����i�� ˾a�p�T���^ a�(���D*���*8��]7��8E)�W�K"Y�K���~
��g�\D�q���i�t=�E�yL�"�`��	/$s��W��I/l�M�i��Hu�xiYXŋ�'������b��z_��1�b�0�E��v���J+Ś���9�rM�#�{f�JʰX�������B�sd{Go �eRo��_�P;e���u���4Q0�����겛�{}�p���N2��c=����L~�@ĸ�[�|����w<�aJ3�Ws�VAJ��p%�q��m�<N�䣷5@"��=�
p��ǹ+X�*�_Ů��-�1�SǵU�>�$?`=ZvU�����Zޯ��I�4e�c�<ޚ2+�O�̆�s/����.;xh<>~��+q%��ò̏��P�P�>d��s9gq e���L�� ƤH�[p�x���xܟ���&�A`�5�~(3p7o�E ��J�y�g=��bJr��� 33F�C^rV��6�(QVC����U��hs�TB0*��lff��Cd���3J��>� ���=v�dޤ�gr1�o�N�Xe��>IjN8�%D��RT�H敖Ǌy��Ք �7� Ʋ�J�Y���R���xq��v�BrO}{��M/F��C	iI�CI3`�R�`�m���	x����}Bج�̒�?~��)ѭg2��#�FVbLf�q^�y�76R��4�d�N�.�&��Hm�Կ�oc\�)����j�x[ QHω�/S�D��Ed�{�h7��� z�jȀ��+�m������^� �̚�n���,��oz�6(@H�#f�Dٰ+�a8�!�P�7�M�9fhS%�#������s"�f�DDK֣��:�=i^�������ɣ�L�;�gb(�*���3�*��+
��q��]ݼ��/�+hkp�T�N4��'L�gi$�/���]x��q aT�9������8�ɿ���Xa�����^���{Q��J�v+ 
"�	@Mf���%�?���?����rK:8��U"z@�;bo +X���k6�V�0�&ЈdH���X�`Jx�B����u^F�D�1��.�	��7�?�AWSm�}h�|H��(�ɻK��G��|aT�i-�V���>�@���Ŏ�I�A��'�H�����	��H�`u���Y���,+K"f>��J_`�����&�1� �ff�UXI��p��N�D_�9[Yn�OO����;ӷ?I�<9��>-qr�]Q"\!@'�KDD��n�6�g@\�s�H�	#�4�"���N�姂�F�ה��^����M�6���aaa�`)��� |�^9���0y5X�>�?4"kKn�+���QG��H^6V�y�^V�dT���b�7��'. ��#��g��Q�p
���}m�p@Nr�oJ�*Bv��MU�����O��>���̀S�1f����.)&��th�Yv[h�Xh��ඔ�ע���OM��U����~X�6�)��M���W���E�k_9�Ώ���l��6��%��MvW�UDxꂏ�o����*j^I4��o$��mF��Yt��o&��O�P��n�wE��69_߻v<[�GV�,S��Mc������߭�R�Pߗ,w��X��k�=L��4#ݑU7a(���GVә��*Z�,� [���7����Tmb�}��.�*fa%8��.)����RȌǈ[��k����߄��zㇰ	�ȉ��
���Pf�#��)�n�k;k�,�{lɛU�C�P����Rn8C��^D�-z���)KH����j!v�Lb�є�Y�1�V��}���R��)
^�8�~��0[f����h�u�����0~�5�+�s���u�Ƒ��g*reE�F����=�>erFt�����_x��ܖe���oİe���뾷��؋��?nh�+�rg��d&�?��SCSx	������<�Y:M%�ԉ`��u�Dp�S���Ey	�F4[� �W�b=p��#��+����g�$DT���ԏwv;� U��N��%�"%��yji���ŉaN�1b�I�h\�{�n n�M��K�1�I����y8Lu�s�;Тƣ��l�����V�T��Uʜ���;O��D��W���¦&���<Q�;�@±�	!!V\��H�2�iu�ɢ���7#ι�x�{M�YS�C��I�t0�_�
���Gx�o;��wCM�� iR$�_1V�}l@]��Y����\��^��ZYR�U"�;�M�/��g���D��eG��6�w�����zE�9�@TO��G��
������_mA|%'Τt^0�&��F��g����p���v���ۡn�Q웭��N����IX�s<�((����);�u��">�S]p�"�;j�@s�Μ�۽�J����#�8��(�Q�E�P��Χ*;:ѭ�K�:����lH ��V�z/������OU�qOe6���Ɔ�ؑl�q9�肄��CC%�z��0�X��W�l���<�N��`���̤l5��6�( *<�Y�=<>�Z�y��I��@�t������7<�m��0(�h�G2l�����*��2�i'l�v�){E�Z|!'5Ts�m	�#��cZ}tb5���4����R���cU6�;2w�\�v�<�B�$��3!��b鵫4�f�?�T^k���HGY��8O�� G4�Ns��n��E ��Uˢ�����`zO�;�|e��LFN�t߇e�HI��#�o��[[����,x��Ĵ��Hv�� b�����M���[$�};[u�2��j�n��34fb+f��R�%3#��+`�`4�jgG()��H��D�����F��.J��!��C���'�2��>�<԰����z_�<�YMqf�^8��lӊ�"�~�wӄWM���}�6�2R��c�Bz��yVs6fKO�;Y�	E|a,�[�ok� D��0�� ���`�m�����$��z�pw?(\��7o��)���|�/���JT�|� �Pި����J�qbU��g�+uM��ݱ)t҂��7[�(��M-���;������^:;����Sί1��TF�S|٪3է4�H|�g�м
�4Ѧg�9�/qN6ci)�    ���dx�]�OR��l��T�g؎ߥڒ�Ť��b����G�_q����¯}ľM�(�AMG������̦y��!=�X����G���ٲz򃷌N]x�G��):�J/.%B�4����l�O��͎;��懮CX��)Qw�Y�^�έ�8(f�&Bq��F��C���'���aG��{18�tr����]k ���5D��8�5tH���ET�s�O�#H0�ZPsEb�}�a��,��阀�,�i1��ʚY*V,�C�V��4�Z��&u�0�����r�MX�
����Ϊ:�7D�Y?��E��_6ս�LY��Ŕ��a�)��rf'��J�J���cy�$+~ ��<'��ij��)�R�g���x�A{�6�SwV�5QX��\7_q[���cM�ԋH����4ek�Pv��0��Qn���2�}g+��ͤ��NE4��|X�?�_�$��/34�&(��I<��>cD�6G�jl4v&�y��$�$ �aA�Z�q��4$XG�{1���a��i����.��$ ������r � �ϮE��ڶ8��r&��u��5���r2c��N�L�
�����l��+NF~|w��9��������>#��ٖ�M�2lǜ
��쁲�����:!CXt���P�v�t	P�ײ~�^5��07�3�2�9�g�D��L��wQ��{5�LU���F��x�R$Ee��uJS�[����Șvű'R:}Os��c�Z�5��Y	�`R 8��'�Sz.�?V��zc�,3^I�R�MY�bW���a�lU���Vs)Kȇ��9�X�H�DD^��u��$C�\�P�d`P�����(g3�ٰ#��m�È=���ԋ�'��P$ {�XsTÛ�}�����lB�&a�0�0��#;V�Q��X�y5m�kD�D��Y8����/������#�}��8�"f�n�r��2[�Ꚕ�`e�/�r���M{� ��a��D��%2xB$�t�Lޮ�+b`to��I��&�ƣ��P��U��o�l�c����J6��ˮg���S��k��}��$� �����
�ie=����91@�,qz`a�0-W��?^g	�e�(��dΣ4��dٻ#�9�/g�r�۪��l��L
eR�=��j�W4�r�<���nY����+�Q�1/��#��)��6�1�޻�n|�oI�o�JZ�Mb���q���[�B����K;���#�^q�銑�OE�$\@������nmv����ec&gjP=�ϭ��X�p2�:�߁��=
�d�Ip��y�]X�?P�igJ��h*��rд��Ĳ?�x��3�nZI�j36�X���!�������w�<�A��aك��2��M��(+笒��0�3���tjW�t��nL�����͡��$�cÉ"GԘI;6	@v �qr,��;TEd#�@�-��ࣦy@�Y?�{>����|+t��g�D��g;(+��^�����s����[)�?Hz;Z�N*}��|����6+���k{�1Q��]�-Ȭ��%j�EפXI"S>����*���;����H-�ԌX��I3�pO�gS��H2*矁�H�S��
8���\�mI��"V�6�4����s�}f���B�}���/2�!��L5�mݨ�J	��Q�,��LK��T��ɃRϙ4S	����-� �H뒰�R
�1)b�s�A9!U�ڟ�9�}�y�Ld������Ӣl�.��ʌ���F��!鳾TX �$'w`�$�Rݞ�ĻBX���P;H}�� �`K�m�Z�ٳN2C�{ox�8b�/����d���6�çϋ�:kQK�?�A��r!��=��vCK�Z`RJC1�=c1����*��MF1F�n��/��2W^K0 s������ r�"5�js_��.�с�Ch��'\Ϝ���G ���E���Z�����9		�s����э�进�D;J�1�TQ�r٪*@$��/'�|�Ԗ���<�}�S�/����z�C�x�8��$�8G]�_cK�v0	�I�N�4sQ�z^]��sF��8��j>�f�{��X��z���;�,���3˄��v��d+)ʕP-�]@	�a�_�T:h&�佗�i s{����+��G��&T����b��@��4���a�3'|¥�}���9,B�AO�q)E����G�݉����$�r�r�q�zn��D��G��K"��"���C�ົZ�2`Q hO�G�8I�F�ѮS-O��Ӌ���	xF��G���HҊ�����)�\,.<�|x'�5~����ϒ�@�����7��,7?����T�\��!ב��,.�ؔ�oE8�x��]��-闗L�N��^�h���B^�2:5T��?���*���g�(�>�7�����n�������py�G<u��z˷�}���=i���,���5��Mx��XZ��RdR4�}O9��F���K�k����F�`d&�M#I������a>�m�<&W���A���"~R�J`Z8X�𾔶�J�ܾ��9GM.g�.d<S�I
����W����f�:۬�<��!g�EA���f�TPx��=�>���F.)��.@�ue�{��"pIf��d��s�l��c5��D9�sz� ��CU�o���I�ک�#����D��8�x�zÖ������)�����F��X`\Vc����-#'2����5Q�$�����R��z�l�O^��d��f���ϟ�k�[��4Y��B:3�&帐ֳOe��\C���6�S�4����N%�;R�]+Q	1���Zs4���9���������l)�=�}M��SJ\���XVOĪ=��Ɂ;\��r�)�L��8��/�>�a`�pɌ�~_�2p�)J�#�S��� O��I96i�Q�m�������'UR��Y&O!NH���eߓ���w�#D7Q�%B��9��z���आI�;F�^�8����soG-d��ZJD�<���t܎��o8;�"#�3�75�͏�Ȇ��)8��xa|4Ȣ����Ă��)
u[����cok
hY�K��ˮm����p��MT�ϟy�#t*S��$�����Ï��V�k���_≎�:88G�yöKʔR`_��������Y�:��X������l��B/�O9�,�������(!���i,!4$ZR��͖B.��+���r�p8��P'���Q�N�����L���Ce�~�XN��8[�9����jĹ�@j�	Ya �{�a12{���Y���j����a���Ƌ�mjɑ�,�w�*�VS�bVB��M�T�����-�����<�VZ`�VaF֍�;>ʽ���b2c���(N�٤�����+K^��_%e���"ҩ��!�U�nf��v����a�-�g���hEhrB���.�z�q�Ò��QN9��fE����1�^8\|L�I�߳�.�4�����i���Ll�� Gv�,r� sS-�`��u�^��`0�ژ!�B&��2gۏ�V�V�W��FNp�-�����%CXP[-6e�m�U��e�3���$e�|<�o_d��(¨?���~R�1_����v��"$���-�+�E�]����a�j�$�=g!Yy�2	;��7�:�m�B�E�(�:)~̪f�ı�J�oa�EZ�"R
j^�����1/��s�>�s�<�~N���u���~GS)8%��O26��ҍ'}��1�j.��`�E�x�K�D��(j�̔I�x�Xt�;G1�o�Æ���h��W�ݰp6���&����F?� �z�KؽBz2>��ДJ�̔A�8��S8aa��3Uk��YzuP�����i�)�d2	x�??4Rw�z�-�(*e���c{D�9�r�?���h���Y�ף"4	7<���UT�4��D�O����w6��cz�����mi˲�J3��|��v�6)�ݶm��� l+�p�/7�;�O�и�v�g4`�Z������3u��W$T�c�,ة>��2}�i\ӯ��y	�Iڱ��b��VyK�F̊�J�M'�����    �`�|
nԝ�F+MP�a�Do8^sEq�D[���яk��F��%]ks�5bf랰��ј���q_��Ҋ��Q��<o'+�S�-+��8���n��RG��j���E�e��!wLC��$��Ԭ�����ԙ"N&����������g�#(��2������O�E�ȭ5q��x�N���ٮ�k*vX�Q�fE�D ������OvJDJ8_�'�)'B:�����J:~�y�sl��*�>Il��g{��?P �s�dwV�2m"�R�	i�MfRT�O��+�7b'Eꢷ��F���r�"��S:�݌J��p�������S����e��"���x���qO�r�o�fE����Ԧ��zY�s���*�n1o{$����y����`&Ŵ�8��l-\_Ff�r�D�J�+�"���z-��h/!3�nk��� UuX'��I���L��t�υ��o���Q3Cs��l(�4��ta2�(Y��	o����X���^/#1�O�c�}�m�>Q"�Cگ������ˆ�g87�i�̈Lъ��OEGT�l��Ia���^Vf#j۳xbJ���|��D�m~}��tng����VXyd�Kk5�ϥ�kg�ۏ��Xj�5ÒЖ��J����K��E�ȣ%��ϓ����gp��_�s�#"�׶��Џ.�F�)�h"-�2�y����q��J9�Y{T�ab��0{�b.ȥ�!߭�`��+K`����~��K�|��k�WB5�x,� _�X�6����`t`6�Z��ӷC������Da�L����ƣE������$5����E�V�n�k)�2�|��l��ó�%��+:l=V��T�����.���]Օ�J�3�T��	��D�7��H5������ɴ���''��p����wD�<��9	�Uy�E>��|!WC%�ۉ��	+��QR�S9�˸B)�K�Pe��ȚT�M��w���u�!#�:��dؓQ.a �@�o����J��t�l��wj��jf����������Y3l�{�ͽ4�H(+�sR�ڰ~�D��X�$8D�&~�(j��G�'�i_ʱ�}Ru`��ZI��Κ� �t"%� �q�<����t�ݭ;��P2F�9t�rؤ�'�4tŀC5E�(ll�� ,�ag���^\gd���u;�nG�#�bZ�&�V�[ZV�cM[t49rl%��p2/%�06:�Ǻ��p0�NJ�YBܥ+�p�_A&�е��w�07S��THL(��x2���y�,�E��1��%�-
���	��ι������Hg�'2Q(�����8�33iL6'I��s���H�U �st��3D~l��=�^S�2��X�C~���u`��X��4�~��/����7�OqQ;"na�'�W�wٌ�7ϗ����PX=Ɂ�	ժd��UN�F�v�|	���� ��8��J<e j���*���=w*"��q@���K7�K�Q�ψ���x?�>.UCO.,�y��e�?,�?M�����b��4R��RW�(����XJ� �b�*������9S�H9�/�#�ࣜ���cY���T�<.e�8�;J�xH�U���.�#��Y���X��p̡p��L�$�&r�,W��}�;�O�P�Lg����s`��tX.`o'c�DH�T�,޳�1�&d8�̢������9?
������P��(fI��,%��5�?]B�I7C._��mqR�ި8�U�336"��� l���i�tBeE��,$^k<�p,Y���}�HBNT.}�����,eD�)R��G��#� �ɖ�E�� �WƲ��
�ۊZ���p��T��d������`/��\�ϰ��2�aO^#�YQ�;ы�,CeR>x �JH+tt9C�M}(;�"En�	���h{���%I1�S#���b���ϫ�	eF\�q��p?����إw��X4uXT��y�T�U�S��/���Y�"�V2�YP�XdU�پ�9p��JF���(�[�Ͽ��WcZ��y���ҙ�S�Hl㷄J��b�#G�m_|�)뷇�v����-��_���ͤa�1;��يQ�3�-����i�����T�*qo�d�M��?b}Q��)�.�3��s�Y��ߧ�*�f���k�3I�֌��n��pӢT8�x�5#`��Ƒ��`�q)XM"���!Qh��1��G�+�ҥQc��h�����p�DÊ�x����s9����@�d*k�#�+,���e�/s�J/;�9�ٔ�N��п�"�R���"�(���H�]浼�����C=���G����=�|8�;Y�
a8��Z�������0a����k�4S�����۹C��Si;�"���pW]�nT���qFC���g�]j_0��E��<�q�R�Mr��̏m��\�0���+_������� D������k�cH5k�F[6�I����ڔQ(""�� kY��z�"f��fǐ�&���&\�5�zo�=M%�hc�U� ��Z�	���?-��.�MMhg_Ɵ���$�2�	�X;^����⹽����D2L����Q�Q�ƃ�`���2���̃��'�O	�*6��o4(�͵z�G���`X,�E�I�c_wc��cIdM/sh(�	�r�>ip�m�@�����
h�(��[���?7��p�7�#/�n����t<�wG�=�$e��"�d���*��0,�F�AZsC�M����H��J���!9|�e��`c��M��`�6�5����1���D 㛨�-$��0R�@$�x0���%���b9����>?�Vm~n�XƊ������~j8��+]�L)s
�X��w�t����7J��$�~Ʋ�����:��Lp1-�\g�, ���F߭O�Pz�y�%�E4�h1iX7�(T<[	Z������CQXyͻ�K���\�K�K"K4�,glWB��}�8*�C�娄r�MA�eAy8,i$	b�Y��G~ǅɗ�4U�qWsǶ���}�n���L�%I��u��P"�@!q�\tB�'n����U�����?�kȄ'�q$�m�Dl���~,fFJ�����r݊|
6#�/����$Y�/54Եͨ=������_u��9�b�� �0� ��ce�S�v.H�I�+��E1x �ah�����y6d(7u'���HԌ`��L�/�m�=ZI,c�w9��o����?����i�I�S�LS��er�	k�kz֩�\ل�$ ��a��K���7�$X�ր�1�Ocrd�Zl���⊿�,=i�c�C�9�ޑ��l��~�FJ�T�X~F�'�$>�9	i��b�v�(u�9�0L7l�ez>�ރ�����8Ii�(:v��R��3�M�n{_bTJ��"h�X�q���Do�N��s��f&B�V8�|)�  ��F]Ȕǀv�ᛌr5�Խ؛��5��e_�T��L�MazW�\JJ��xo:<Z��}_� -�����K
���ח��"pJ裖���U��q� EKm;�a �\ .k�g��7�U�p�Wt�R��/�_k�	����x��Ǹ���k$�'ҕ-�Ͼ.�)������~&�������ďˤ<9��A�d��o���Y͌����d3%�7�R���=�R�?V!��4[�?�#���{���%Ж�Ğ��L�S���_1�e"��4.ʰK2����?�Z�M���%���cE�����-}4�.$��=�����D+Z�i˹��K���v�'//5��K��oy%=�+r�`��y���^N��i���y�5�Yp#��O�7y�
���9F�x~�RPX,"��r��{�� 7K]&�S ZRRɹ�8$ԃ�����<b�aAq�4�-:Y7��Q�J�k�ʱl`ٴ%�!MM����<,^�,�r_Lï?��m�	;ýC�7:���61�=�H�ƏٌI�<p�c��sX#���8
Őި)T�a63n��^d��:E��R�a�g����a��aW���C�����Y�����\��0��7�)o��#��I#]/�ZB02�"�-DII�5@��R����(>�J�6��W�}t(7��e8i�Y��܀㭴M�V�.��g�+	�    �n`�*J��dѪ*��g¤	��h��]�t�H��!<��jI�,5u;��ƝWo{�DF.B�R���5Jqe	��p�}����ʱ�2��r�HQ�����t$Mce����m�8S�Ytя��p�x3
�М�X�lbJ��Z�����lgR��:������Ө�&��§�+\���;���Q�&*���yE�+�]�֡�C��a�4ˤ���g��D�q�8ۧ�wV��I�!�iN�nV��%�n0-�0:�� 5���J�޵��N\}L���&������e#��.9Ia�dȤ4P�Δ4N��z�9��A���}z�I� ?�eӷ��~��'���a����Hd�$6sR��Y�d����JY��`h���$�
�Ѵ�|O�d�[�nQ���B2��|�y0
�*�8T�J]�H�vR
} �kR�7��<�K�dG���?�,fCQ:���MBKڞW�D?˰'�D���p����/��-���85,7f�GɃ$�������Q�����tB���"cV��wJ�u��WHZ`��	�xV8�,G��ۓK�Xf�|}�l��i��z��t��R	���K4N��^N��P)'kk��%��#��c��d�E�e>���9ŏ������DKz���ʱ��|��&li[��S܈�-���ɝ���Qq~z�Pe!�W�Vિ�ڏ�~>+4M'
_:/�h�
G����w�_����B�Q��l0Mo��R�K��Rc��3KN�\p� �d��w��q��-��2 CrJ�����NS&2ռܖ�Ž�׀=X�{�z|?+����Ca��D��Ó�}��)�X�^	�vN��ڢ�.C�zb�u��c��T�D�LL����Z�fL���B�i^-J��f�)�a!���������$�Ч9�d��1���$�������z�t`\���AkC?	.�W@4�w4�~��bκx,�����o8k�)���5�6��I#�A��#"�#j��p���9f�"<��f)���e�+��_'Қv�/�\?+m����EL�6dxS�b �$G=��k)��|ߴ~V��Q�� �������ɡrV,*[I�}|�ÇN���i2�����l�"��l����Dw�2����G����)�����=#�!���T^&�=a�UN�G�-{��"/��,�̛�������i˴�i�8��C ,��$$ۡ��i��6o(�o�4;�U�Dl<k8ΝaEG�k�ڟ1 ��y aU����J�)뒞5����)O���
M�����8^H&��TXWBe����Eeh-3�C]�HTΤK����m�0�+6J'�}dq9�I���%$i�Ew�ڋҘ^E��2��G�ÂOf����0��8��5�cSH�׮��j����;C��HP�"��I/?�ev=��Q2����4jh����t���dپ�ﮢ�I��E��pg����փ<<ǎJ�A���yGI9s����&��i�U�P��Z���ۋ^]�e�)��K%����f��Pi���,�$���IΕ#�ڎ'��v�b��L�46lC��@�T�a�ԓ�ˈmM��Y�k�hR,Sp��|��'��&g0J}�4��ȓ�A ;1��4���a�[����ݩ����|�͝�pmH��|dJaE~��ApIF�$�$L-.З���gڇ�g�P�&�P���r������V5����ܔ3�p��t��O�).��Y����)�R93O�2N� ��HI�k��@q�8`r*eW�y�U9a�2[�4[{�����R����rKl_�\L�U���x�����ؑ	N*X\���z�p-,d��bV@#��K�Tr�;��؅Uz�� �u����SRco4�bo�-�T�@��e�ȩ`5Ђ�!�bس�<-iC��"�H�?�|�:p`����3=���GbHe��A��[���Zd��gG����v�>0 B('�kq^K6���{ ��N��Y Xʀq�Oń!���$�/.���Oi��8-db��X�ke��i3�е�fӤ�w�L���c�,�k�f,�=�2����\x�J	�:%>����(�)a��B��o竽8�m���(/�?��*��LaS�q�����1��.���jXҋ��P��RJ�Q�c��?��G�l��ML�I����<4�:N(;��[�m���H�����{%d�)
25#��E-�w}�w�v��"��?��
_S"��\���9�9Z3^Η��"v{��٦�=�z�YN�Im3�i�'�Nُ��Aila-�'*���B��Dxb�^�f�P�%<?���Z-��R".�֙�N`�?H+���?D� }VgJQ�u-�	����Ax	��P�D*}�:����8�(u:�a�%0|�X�0����s�8�L6�_1�'��=Q^.O���B,Ł!�XS�z�P�Ys'�e���átdQ5˽�iW�Ȧ��\�3�%[j<ٌ��NdRDKB�y��DDD_�2�5΄d"�|�Mo�
"<Qjk�p��z�1gr���8`[%�'�t/��|3��r�_��_��(����1�����iɄ�~H��.k����5��8���TDBE�bpY�\��=�wq��V)��]��D���鉵�$X�O�g��R�����ŭ���<H�鬩'͚�+�vĈ�:�&�-�)���t*5/^g�@��$cM*S
M�������qk$��2�bN8A�SH�d[6$�*7�yI��n�=�KbO�9Ri�ƃy5���������܈�җʋk�Ч����kű� w3��u�A�b�1�b�Ő��B���9�Y��^"�`��օ���a#]o�8 ky�Ͽ���$���V��9�����~��:Z#�#���Y�f�\�2u3f�{1���H�|�L3���S�Z"|p�*%�~?��s{=�t�^;�b[����c���ߋv��L���Z��cU��l��zؤn����SQ��h�9�d�m��Ss�-pwL�{���Na?���h5�WH���aE��#�9�e�4g��ԛz����]�*Job�S�>F�A?�z�P���;�,X���lw���nQ/7-�p8�u��Č�k@�pj�r��٘< ����L�,��ݫ]l7�R�*�%��X1����8�lz���ߎ�!�^�~��p�e�xPZX	?�p�|�d�=�� ��=Y�n8��le�1\j�)�G����;�뱉�ϗ�8N�I��\�J�Y��=��Uk�?��#��
�����&�c,�����b2V(DO
N�����^_�g���1�{�~P�lAm����q6 @jdFw������z�k@6+��a)��D"���1r�Vw]3�)��D܏]`{0F�+Ô���n8��ff^" !�zl���C��@��ne���|�C�W���z��,B\���;���-���Q(.�6��U�c��$B���B�3��Cֲ6�l�ld��X�W�������ɖ��9 ֑ƽ5�xg�H��i�ePS.S���2?�R��Wm4���Y�ٯ�u�]Ň����H��>�>%~�u�9v؇��[J&I-�aG��V����,�g,L�	1!��v������h�E�1�^NFS��Q��9�	�P��.�ơ��]ݼL��%��Dw�Y�Ȁe��(�XC?;�g�+e���ҳ+Ê#��P?1�3��}F
�y�����@�X�0���5��ݜ�ˤ�E��Ⱦ�N|
��"]��Cp�rHe+i ��Q^��·	�㌅V� �M�V�~1qJȥ-��x-6 $+����-�$Q)(&�b���{!!Q�9�h�s�pMX�����t�(��H��*ބq�[���q��f��7[��?C%���~L�[N������P8�zg^��2ٝI@�����D�\�E�0;r�X=��J,��U!�E�K�w]̛�W�]
����
N�x��oȔ��f�K[F��H	�"�W"��x��g�d�Կ3m��"A��<�v�TH~}���X�� ����Cy\ï3/ 
'��_��>�`�|�    �8	s?�N��d��S�$�n���y�0�xZV��!i<ݧC#Y�|9X�뜛N�LE�}b�7/���e��P����D>�c��(=��4��"�Fz��d��l49$nS��H�)����dP'�$����/?���fT����D��/���sr���N ��X_�e]�a0s�a�k�:���F8'=b���H�Yx�}�~�ܔ����p��d���w�]]�h�IH�ߥv�!h0.�(�"�`���2,�� �Y����Λ��Tm�Q25��|JB#f�Kj�o�V�W�8�Jꊦ�K��}��M��d ��1%c'�~��X̒�h�l�%�Ñ2�U�>�����pl�I5J��;WR�H�ҵ���~@�M��c�'rL��׆���0��ٌ�����D��z����r��i&d@u%����1���G&�e�wtcP�8U^ij+3�h+�2&��Jŀ�0�7���E�d��ƪ4,}��]�
�Ī�1�7np����健���R��g�iS;�Ij��`�X~(��J=:����r��C_q�4!F���"�kQ��Id��Fe�^���Ȩ�G�y�I���gKKO�����{V-�9N3J�#2X����D�6�n��	�oF?t�ƾ0k�d��h]�Y����r脢gI?�����'��]�%N�<�"�z����1� ��(��q��y�Ō�<���啦���~��E�Ah���!:&_��X]���x軗��,�{�.SR��$�.:�4^]�n��;*�7��w`�%�f�.���!�������(��YI��łI�x
*�Q�#�FnƲ����?�M��?�2�SXL4UV���$=���b�Ɩ�_р�����y�B��FJ9����/[��o��Rl�@�?�x(�Vn�PY�}o�M��w�F�eR���<>�	LԊ�R��d2T���[�z�.#�7�J��Km��;Vt�W0��gIOYz�Ɣ´ǌB�~.0����,+?|��05/Vw��J��Rt�g��E�뇪�f�v���W�;o�Pj��4D�u�7%q�
��r�"J�%���/F|_�x��$��2(s$��{�|�i��"�|s�F�Lq�6�tR�><� 6e�_����Mw񫗦�ɩSsdT�]�^r�bČi-�H�(}�Ծ�noFB�Zl�i!�?��le���"6%C�
�t+Y*c�{�5rT�6O��Up���PS=	/�숐#�?�5�]�* ����T���@�Vy>X��!�8�2U�`���標���aQMs%�l�N��ɱ�(�g6�_J�i�����9!={ z�y�Ǣ�u�4���#b����w����@�]�{��tTQ �DY�'α+K��Q�RvH�7�i�� ���x4ׇ>��x=c��k8�A�X�5S�mٗ �����svf�m[k�>�]����<zv�!ޖ����`	Ehs�B_��=�Z !������ډ$X��7����k������S:_le���dp��l��Fٲ�g�me\��ڬ;�t.�)B�HȆdL�Ыx�+��}Ҕ/�VW��=�t�<�ĕ���k<��ep�'Z��	���ש2����-T���M��J1��x�\��*�� E��G�U�T�v���ͥ�f��_�>�D�q��Ż�(�]C+��[���$w��������"�DV��S���\v��3;�f};�,{;u% �`Ĺ�b����6�NZ�Q���n�'�uݿ����j����&����CK��񽆅����	d@��:e�և�)_K�����sĤ׋G(��UH�EU�΢7���x�������X>�+;.�˝��hE�\�zQ,�_�||RN��L��oP�r���N)�p�;,,55�LB]��:~DK���e���l��J�C3og�;E��Mr�O`@�S��;�!���Ӄ�?�<
e���xhņUbZ�o`uƃ��N���;*ߕ��SŔ�)����A�����f���F�ja7��+F1ъ��V�/ג?�S~�L�0�a����wYn�1I�����t��#���C�YN�Kd�g6�*�b$=]U��0���\8�IVH�;���9m���bh�I������Y!����z��H����q����Ŭ�k,�'�F�hi������؅$�Cg�7��w����r�rA�.��\μR�,5�Q���sF��-��l��"A	,��H�9�FTǛ9�G�lK�'��²J��j��O�hQ6O��&%�}�2ˑ�X�4~�D�I��������
@�EL�PXe�9���亽c���e镾�E��;�5�h����D��LN��VY��<� � }�~�Eof1���f�1���Ԧ[s9�Yn^�'^;k�-���5�+v��P*���۝k�X3^��`}�n.^|���M��vx�FɌi��VTŏ�y)x3����>�����*�-�2Y�'߱�G��{Kϣ����{����� [����Q��][q�c�U�jz$����R�ģ���B�^��,g�}MJ�rȔ���<��}��l�߷,�9����xi��~�U�Fw�tle%��h4�6/u=��m���1����a)If��Y��R
O�e��Y�Hh#I�P:o�cL�d�m1��{��(�*.,�_�SϦ���9*��`IM���'�|��DE�W1�IR8�$�s ��z8��/Sp�������䬛u��O�Ә�9��e�i��߶�a>����W�p� �v����-m��52�X�Λ骝�W�5���,��$)-,��^���ί�j ���>�\����K��9�E��Z&'O�� -%�΂w\�(�ۥx��q��G<&����X�(���6�T�v@,Q��#�#i��
���ӭ�nXvJ��.:}������i}�;�h�xS��"Ħ�M��a�v_ͅV�۶���8ɓ���2�s��ݞY���q?{�y8%P7^��)KT� ����FK#L�"�X	۝��~M�ച% 4��3&�v�,�P�Vd����5[ɘF�E �ۧ��֪��?,�;(���+ԙOS�@���`_�O��v�K ^�-�ӷ4��\�1��F�۠�D�C'[�C��P�V�-	 s�N^�'X<��e�U4����u[�����݈å�,�J-�>���9�Dg5��ni��'�N�lO�����n#��6�xX#%i:9.�=���&��Q|s�Xg�a�[SeOo0���mc�?NT�rH�{!z������"�5ww�! ��oW�A�e��@��
�x8v���=�'��k�eχ�4����V�5g��!��R{g ������N"{��թ1��Z�vc��/z3k�����;f�}s
��ڢ��0�}]_�Ts�����[�R�g.gW/����F��������c��z��g� T���\���Kv��U4�A��b���l;�1�֊�7��,D=)������g{�e�`�Y� %��ai3E���
���1��|gO�+'����h�� 5�j�nO�S�՘J< �x���YIR��?	���z��rH�ڳ��U���<��/�J��m�X�*�?m߆��g�|�[��M^�<!�h�t��N�Ί��r�#�����������.a_]�%���X�3V�)��wp��n�,m?z2;!�`��������㔒�-��r������B�T���y� �;� *zjY�Q�I~����Vn�I�;Z�Dpj[WQRcze�W�\[8�R����Fa���Xm5����N&�CX�~���:η��7�
�A�ˤ�׶[]w3/^�b%��(��+ӈ/Mw'�+8n������5!�k�ૣOYXX�N�%�r�_'�5,٥��Kk��;�-ڟЄz�����*?���H�L-o�e�a������1M9�eH
^ ��O� ����צY����E����͆@㾂!�� *����΀���K*mV�r*��We�g{��QRU9`$;| :.���]�3��e{iآrbuW�8�������R;�������Nz��G�V� I������ݖ�� �����    �%������!���-�dv5��R8vnn��,�N�z���
��V�t������-�������`"11 ɾ�S��XhJ��tI�{����\�^�d���}�����z�)���jNnUy�Y�QƋ����P�K�X!G��$bu 4^~��ver��흶];b�'N,ck]�?�+!ÖS�����
��@���	DV�XUOy"bzc/��v��9G"�5z�G���[X��Z��)IR$r��6����9�a�u@Y	XK�-���5����ro6̉��p�dD��� ��!��I�o.��u� ���ܹdQA�D|�K�8.�3���G�J�`,����cE"[]o�V���E�Q�S�[sj�o���zn�-�O{�)=-
�ФJ�q���S*K�%���ՂN.pr��R;�9������J�}�b堵a��N�@Ue�1>.��W�&<�	������G�T쒖	;W���-����܇?�!�!=��$������E��#��f��o�ʑ�� t���(+��Ņeu�1=�{m>v��*�� �~���+x���%�Գ�ɸ��6�)��j+i��k��æ����c"5�B!�A�3�����U7#���i�S�T��Ģj�v�n��Y�o�V��z���:l7�ڀ�X��ƞ��¢���-�������/P��U99/����V˄��^]/�~`$- �*h���jE�C�%�˶e��,��]���ɗ� �v���>��Pu(ّ�-,��w^X��s� ����Jf�]=L���`��_W���Fc��v'��7��w�&���F��B�"4N�}X�?5����n������SCFW+�EhP({A7AU6C���:�1e��?��m>_ �
kw#ՙ�ȭ�}�����m��]�D���v��G�X��*Ll�V{�����Q,����}Ay�y�]�t��-$�X��e/�h7�����|��D���^5i�]HƟ���~�ı|�/dO[U(w���{��z6ט��g�����va!p��z�2c�yRک�4��ͭtj� ��I,�4K,��ΒD(	戯-��C�1J�c���Ek!� M��6�|`��8u�%7�4�m:�q..�+�ݙ�@���'�jt쌗%:_��z�3k��E΢�o�Doy�ܭ�CN�X��u]��׺%o�Z���kkGlMi��ĉ���L:]!ݣU:)�DٙOX%�S텐��-,�L .?/�擥C��jٝl&���%�X(E&AO�`-\$����7�6,�:�j�
g�r�~�/����s�A��g���r��.,��Cl������a^��6��.�����:C��~��e�j�"����Jߔ��rrv������L����H�atб��/�يZ�(�>���8��I�s}����$��~��#&17��^굲.2g�cD/�����><M+����Q�.�-�ζ�o}t��D����U�XT�%�,Z�����'���T^�f̲�m>�Fb=�b/���x]�QNӀ�9y����z�1��Q��/��z��o�D��*~�T)���E8^Q6K_�y��z�X��P���c�t��!�U\�Nc��J��du�Jb��}�Y��콺��[7KMr��kSY���q��=o����"��7�O\uu��J����ڃ��B��'tvܳr��n�|n�N�Y5,�|bc�	A�?i�o,���Nؒ�?y���ޓXa�P^��T�Ǧ�#	�O-#�%\r	����w�Ֆ#|��ͽT�wz��jg�E�C�O��6m5�<4�M��ෛ����;NT��?m�!��q�S�Z�R-���+��m6�$OQZU�΢��hD
,)�)'j�D��S��ք�G��p'=��/^�7�ŕ��r�|h�=Wk/~�-���2��ORW-l��0i��@^j�J�V�L�k��j��������>G��_BQ��d��m	}ls��g+D�ε�
���r�n-G~�MLZB-�ho�e��ٷ`���!���(KibxKwр�14�z%���-��D�Wb)��:��^�2'vS���;w���|��8�kj@�E�ͅm�h�#�9k�R~�r�Y�~;5�<� )s;�%���U-�O�vK6����}���KŅ.�������nT��U����H++0B��s!M����d*8�~��H<�bn�}C�[1ӿZN�g��wj�D�Rq���3C��gfg�A�Dk���a�z�x��B�ng�U����8ij��3��f
jӖ��.�R��`S	���V�K�j	�vH�4ˆB�{�vҴ�+�S�_ڝ��m�f�%;/�g�4�zb��=��}����3�I[�����6n���$b���'x٬��D�H=Ca/��5��w��ײ��_+mES�����Hx�<K�.����8���h��K�(�=�� ATȂ�u{�DY �&,2;_J��f�d�RW�^����7����MS�ЙȖ �mI��V�³mz�Eg=�t��G�6�4p��༹�ԓ7Ov����a��h\:P�;X���tVU����6�����+E�$N�.�Z�={��� ���� ��K1��~���7/ ���C,�u3�'�d ��Y1��M|]_���X�?���i��BM_Z�h�Z�J����a��5ii&�(?oa�=֔Ǝ�U���0���)�b���}-7md�ќ5�a�C@Ǎ̺��p�Vg��f�	?ɘ�yL8���+�8�#�2({sbB�-�t�s�m��}=[޴h�$�	�d��>>��uՉ��9*ӍW�Rk�4d�
���ư�)���d� -�s~!]����_7���V�"�c�^c����u�w-]���tsjϐ��n.��O�қ}�EMs�$9�{�+��z��D�>ތ�D��}"��w��<��(`m^�c/��^�� ?�W��,�a���׉�� ܩ��&xA��Ƶ�G����Rc
��6+��R���,.W��.�>�[%t��*|K.-���7����`�ء��c��9\Oe���9r"�	:���F�^8Q�t��1�~գ�f1�6i�X����:��K���$�|Z�, GMƱˠ}a��B�;�m;�ʉ�"�����
�tR٥����ʇ����/�Z��vo������Ý�.R�����j.�X�u��ق�����b��v
tU�R)�{���֋X>9��a�W@�{����Fȕ�_�k��7�g}C��,���V� hF>�sh
߈����Θ��Y��>�[�<\����PG>�E�ň}=^�G�4���#���-V�%q�L��X!���idx����S�����K������~����x�3���q���,d�sT�5M3����V: �;�7p�
���������}���*?2�X���2�7��|ǑF4�_̝������V(��|u�i���@�����D���:���=Ho~b��kɈ�u������*Qo�W�~]��DŶ��WS�l��?|�F��2�
1.���������S����I�3��Vqt-ժ��6M6��)�����,�)6�;oU��I#y�EN���/�g;Q����j�bɰ�8�N,6�+a��3v��U���T����;�,@��3Y�+/�s�-��`�s��NЗ���6���5�[e�ھ���e�	䰘����s�>ϧ� �bG-~��i/,�4��� %�2�`�����z���ȏ�C�vp�-"Y��a��l�O�{J��1SPj�Ņ��B��ثM�#ST�J�AE�'V[r���'�����v*øS&�D��G?���'��o	��03���rM��J�Vxʿv�sVLI��/ڧ��^9�Ù�����I��Vl�8䒙E�����Gxv���J9ã�/�aX�e���R7�MX�gt'���1�!?PH8�4�.x�9	~_/W�M�����|�	�2;�9�XAɐ��jMCn��g�Z����n?j&Q
|"P`���z�z��=�G�    �އ�-��C���a^���ߍ����`�4[�����t�>�]v2�� ��Z
����<��0M����d텃�Y��bq�t�"�a�4`(lN���~��6��
/t@0����-� ,�B"��sG����:T���HzZ���`�e��~K9/�SE����R�5֯CG�H@�Yw�I�r������	֜y�� ��`1��w��ڙS]G=�Ğ��k}�J1�9h�c���=[���"d�$������iJ`/3�&="X�1#�4CcΞ%N�W <^Z|�Fl��wGϥ�W��Y�#��&�4�u�!f��#XK�ETY��/z9������>/%���\:hw!��,d�G�ۯ�W3U�Upee�Cw�j�T�A���9@v��N�8�J8,bo�k�֭D�"�*���X�!����0qu������qϊ?҆9R_�bW+u�کtAV�>Z�h���}^g������	t��!?e�"1�,I⪈оr������ N�hc=5-���KֶJ|���ŷ�f	NßN��*Lr�M6{LZ䫭�8�������H~�h�~o���T[�KT��wHe.�}�Ī�[5q��Ғv�Qf��sI�ۆ<��_E�{���єh
j��d�$5:�o��$�_޶���k.��~��?N�"��?�tSͰ����Yb��	����s�M_��:*V�Q���*#�(��3�Z�����M��=lzf�/�ZG��r�ݑ(p�;�ҿܼ�H�V�`'/�����X�#]���H��U�<��YARa�d!Tk��Mu��߆�{�E�o�N����ݺ�[����5�V&ZAR�os���k���h^�T���ph2��"<��'iA�H�B�d�[#ް i���EN�ST�g�cs9L��[Y�W=����#rwyX���w͇fª(#dA��mh����j���g�-oF���/��xQTd]�7V��RyC{��k6t���g��zC%�7�v�a�GIn-a�_����Q�����O�zEp !Y�V!%q��^�+i!���2s�����Y�z]��v�S�F*o+�b�M��2_xa�٩薐u�p���︩8,���@o4�����u����TĐ�o�^������";�b���u6��3�1kgEv��5�J�
\����7�k����?��g+�p�v#������bN#�8�>�e�0݁�>m������g�ݴA��l�eB�j,w ���gA��ٻ<$ ������`�W�pg�rV۝�q��C�x�#�k{Qe��^��n5��m9��dJ����r���Un�3o��W��aM�&YΦgVo�T�#�XJ���#)�~o���u�ƃ����]U�-CH�r���C����[=F�O�y䳍*�����ӟ[�|�桲�����]������Yd�-�9�[\��p�u��V}��2��X�L��B�no��U~��q�b�k�װ_3P	<�$]``_�?���H�^A�I�#a3�K�SV(V+c�����^,$ t�̼�~�Rx�]�|S;�����^(p��ȣE*5�����t�W��T�1��8�kX�\�l[�n���byߏ!�F�vq�>�e�+��QU�.)1�1�9]��${�%2����G�>O`E�H�y��F���*�,ƣqo�h��T}#Ƽ&a�
����x�C�~��@�`q�d�e�: �7��;�Cb�<vk�Fa	�����6�T�[��`�ن ���=��,��"g�z��$�X�[�ip^_�mI	9<���y7��J���ni_��K���\�ݟ����/�v,dn�9���#5N�<����a |��Ɏ���ё�����=��G��.��f6��=�����Z_�c�Μ�+�m�z���	����1���Mz,˄r����aOY=���
[�@G� �֗c�R}�nr�i�p��:��s�CⴙC��cѴd��DEH]��,�h��+���9^��Ӳd.��ꂲ^Bk�`��<ͻ�H�$�\F����a(0�M���h<A�4��GX޼� ���M�!����g��Zx��s�7<��a4�J�M�h@`�aav��}��uD��>:Uh��=�|볈c�T�ǳ���DOug����n�Q8"�}� ����D,�P4d�D��t���Cc��@��Ѱ���Z`�V��rG�f�� ����r&ߟ��5�CV]/RkA�/r)���$�v�������8)�����'�k�� ��k�H^�8�A�)ϐoDN�m�ɏ��A-H&0u,2�E𛠵�A~�q�Ǚ�o<�,Tƕ��êj�Y�v�lW�N�M�ǉd�	�G=�U�B��4�m�9:K}"Z�C�"��w]/�y��@�ц�-#V:� ~�}	g��i�޼��ت؜xn�`�|~�vJ����e��(��Ŕ�lgJV�\�����^:�J"=VIؑ����A�]�i#Or*��b�s�ۗC��89��}}Z��?z���Z�Sw�_�g��D�Ȥ�_:�мG�;�Ã�{���*,'�����.EK�dگdըu����������ȣ|��ܞp -?qT\��Ğ'P$��2�a����Y�:�1<^�)WN0�F��`l-�{~�����ۿH�/(cLS;j�Wh՗��}��-`9ƚ��Y4U�ox�9.0_�_����i���� ��`�f�����d�%_�;|?٠r��)�#��1=��:.Ʉdb���'�����p��k�?�ه�LMJc�q3�#�xN�3�W���9����s�c��t��@����h�`3+}�4��m�7�b|7�j��C���EV$�}yl����
�W�St:F����vƊ���G��܆C[l*W�R�5��M�e;��
��5��w��#cP�Eh�%�+o��U��<�y��v�������Iέg�3��:$#�w���i��\ޠ�����?���a�!>�!'$"6F�%��v������na�_�kQ?��R�VRw�Pi+l��frv��H㨒@�Һ�)�k���?�z:�5�������R�9�g{��>�G+Sp�-M��@;�4	��<�������9���I��y�����(�a�6<����Md�)�����2���V8�rI�*�>䦉:�1yĝ3�{�\,Α�n�	�g+gZ*���È��[����K�UFR��b�)�i~�ǥTBX�h�2�lݶ2������{�LFV9�1jA��[������]:_�^�s��1���)[��z;NV(���XC�����<�s��Ė,�qҰ�ںH�{c�xJ�<O_��ݳ교 ��aT���y�$�[�
���[��QuopVr���M��vXRza�Ն3Q�k�څx<S%��
k��7ؗ؃�ez�9�r�+��G�6��V��0r.G/g��Z���k�ʭifN�[�܀\�w�J���
Ij��V@.�[7��0Ǿc����Y��>�F���$gv�r�<���#��5�"���_�7��^�R�t�SEl���c�{��e`�*����پ���';�ؽei�s�u
<y��=L�	m��j��ɹ��ImBJV̀-��Og���Ż1�.h^L^-��X��֠�tע����fy��C�B������do~6��Ay�2\�� �e��7@V���L�6�O�jv5%�����ȡb"H�VL����� ��(�e�������h�!h6|�	Ե�D�=�6 �a�����	�+}7�5/{�䝛��L�����I������l��V)icx��G�A�z+{��7_}p�1��Zlyyw5W�|�G�����#*x�U,��$��Ver�S���^ȉ*��Wٞ����Ĳa������N�NCT�^*���G$�re�EU,�8T��j ���ύ㷜&&@ʁh�U_�����`0Z�VY3_$n�cŕ�s��R�F���P:J�tX�s i�>�ח(�0�v�J���L����3d��*���I{���y���1�xU�`p�}����s8M�;d�g3�G��Y����H� ���[(+�s�n�2��f~J�go7G    B-�
_�,��aΨ�j���U�2�YVH�R��su�!X�j��9������R�x��IжH�,-����C��Z�
����k�p ��9
pH��<��P���u��~%��߀�p���� ��-r�{}uչ%jN�la��ݏ;Zk��.KGrE��;�=-Ɖ,sf1��X��
]$O�g��Q�
SF���͢u
?A��/��L��qa��E�e�{���ͽ���V��u>E:����-�,�3wr�Ԋ{�y�	����C�nW�W����͚��GO��ͤd��N�R�
���|=e��\���(b/��grU����h3;Vᤎ��Y%SoQ�F�~�J�"G�{LXː9�;Zd/'Xn���W� �Y$ F��k��N����vV��'�f�����s�l�^I}C����S���$�	ԟ~�%,J]zד.���.��m�� �*CJ��?0YY��v�?����C���n/Nj&畩�J��y�)T�K�hnn71��w���[Q�2��#�oZ�ANc>(@.|�N�(5�溴dc_!�w��л%��}�����eH�c-�)�\��7�al=�C����Q~l�zZ�۟/��-KC�^��E���=81�2c�|A%��d�BH_��HK��a3
�@Mz����J�å���ڽ땿���1Dl�cN��5���HDFt-ߛ��ͤ��wU{��!{��~Ux*���v�\�Be�@��Y$$���K8X9��]O�`�qYȰ���Cv;��]��T�[0Z,HVp�����3 mYRe���n��;-��ֳ��Cl��Ż4����`� 3�%�/������:<E2�?}����V#�<���z�;p*g���U���)�$CI�����w��e'�9��)ue=J�@��JS(���(U�w�w2�� 2��ϲ��v�Ң�G�y����O�����/������o�0+�T[��H=Η��{앰޵�e��}���S��W���{$�����#7�h\}��ǂ<O\Yً�*̲��l�M�)zoև�`'S:e�u�j��S�%����7ZO&�X4���x�s-J��v��em���Y}����bz.���XNE����(���_7fE�&t���H���b�j�����z�z{�*,^\�#�����^�&���q�Ċ���fZ������6�E����m���ͺ��V�J��lQ���'�[Ȱ��bug����柝-��tOn��2#r� ���Ἱ��5b\Ѯ�sw$GI)2U/�YY�7�#�Q4�?4R�.�h iR���m�hQ������S��ܮV=;Wo�BY,�ݢ��̴D�|��e���#�ͪ��;�G�i��W�BnZ�~8��H�{|0,X�̓��@b������O�uE�X��NK�5��O�#����Ţ���E{3���������dzv��t*�r�M�Yu��Q	z1/v����״�F�������&�^fI���E�y6���о�j]/�	qt�PX��x�n��'�UX�j�G���W�L~_�a�oO����9�k�U�ũܽHa��u�jwN��z\E���#7Qxa���e8�P��Z� l�������y�Y\GDm� ~���cJ���ys���u�*q�J��<6F�-�b�z������c6ѡ�#^�9+7��-�e�:q_�(�;��m��
0��bY.+����J�s��?vWKКe�d��X4��yt����L�ʉ�e���4�#�Ċ
��>�����W!�R:�N2�iK$�3����ռ���hq͡�����M���C& �'ùp-;��sc����Հ��G�\#)�L�q������5hWɤ�
��@dE��T���wlh�$�z��/Fآޮ4t0���d������DCf�v-�c���݁��B�ӱ�Wp[��%t��T�aehW~��S�bBN��W�z��{���Tib��e݊���?�W��ZCo4r\�s�, L���f�-���B3I�G�О����Q$��{��1�ՙ���V�U���u��bK���d�d(c�?8M܊�`Le�	�~��/e(
>Ա$�I+Ǯ���$e��m�S��b�I���o%��\�r�N��22����0= ��ۺ�L�P�T1'O��!�$��,��2����]�٧X��[�gz(� o����|�j��f���$�)�]^W@	S@���Jzpaۖl9�`O��n�ZQGekWi3�8���~n��w:5O*
'���2�����u�Hy)�L�Vr���,���nU����]�¹9�Jl�/�����n�> ;��q�f��w\�Q�3�a/���E�UpˏAXqg��*8.^��}��	Z[�-�,���X�Do+�׭"�%��NV��1�^��^,'�K�I4쉷9<D����b� ���B�؝R�!������O������dO���L�$.p���*��O�:��~�s��;?V�/�� ��c]�B�bi�3A�������$>W0k���zf�.�����Q�UL��v_�ʂm��h|���y�r�.֗}9���s���).E
{KLA��Pk]���v��Mpz��z�bW�%�Sw�Z�e��T��Գ���&&��4�B��Ũ��� ��>�C=F*&9�X�yΠ�X��./1捞.ѣ�:����+$�7��l=����}�cHa��e�$��'}�Vx\��P�D�:�9L���%��Z��푮�����U-��9� �9G�O�y��y��<L�3)�ଅ'�rf� "����=�������������[�+k4@��)`o�~F�h��b��=>84P�k�i!�ǶA�ӱ�^��IT9�
����-]
gI���F���4�_��c�2�r������������:�>����S9������f��k=-R�$���`qK��e� ��<����%a�UDʷ*�-E>^Hi��p��n>eWh4���*hk���7@)`k H�����aS�;6��x��љA
��]�=�{c���08����~䞻��=�b����[� �ì���k��Ҭ��	��la0��F:2`0Wk
$�<�a8��'\6kZh$+��]:�h�M�X���l�� t��LIm���_�d��vq��ݢ��tgC��I�U�̳�&��N�q>���}�!����)���aƝ��TXqj�p�!p�`�V�>�yyLu;d����6,�ǲ�wjU�{Ki���ES��(��ES&���}�����ˎ��P�!�h3��R�k
N;��Xyz$���_Բ}�b�c��Q=��A�L��Z���ś�Ӂ,���ɨ��`ۗ���
~ג	q�ͼ[RrY�_�Cy?���I�X�n5�4l����>�8ǜ-���x9��N��^�<�iY4���d�j"i��\4&�9��:�)p�#������	���������j@�Pe�*	�wM�p����Ѱ{�~5��D��IZ9-��e���y.M��S�f|�C �������z���gU"�,�5�jl��������!�K3b�U������{��8�,a9����{UI�W$�<���v�v*ҥ���0i�B�4��E���b�*>}�A%R��W��f�*���U(I�m��?h��K��M@�����ŜuS��Vgm�p�6��g�V?�]��e\"Qc��]����\�ǥ��ϣ,,�[3e�cʧ�"L`�m�5hw��Sw���A_�1�<��A��`��� ��=oG����e�:�C�|���&b� 3{�>��bl�m�2Y`=K�8+31)������	��=n; �yxS����8�� �rK�h\H��/�l;K��-mjc��C���!�L�51��.�����J�V�72D�|'��e(N�Z2�nJ[��Z�����Os���b�����"�S���K;��e��]�^ʲ(b�6�b���QN+n�D�׶�G&�� �9Y�<ͭ�N٫x��_��f5,���͖�;j+WZx)�����/m4�ԉ)-é�>��    �r:@���-`�%��e{��@�aD�0��݋�~��r�g'g����L��<�p�`���k��n��i-��>>Dl���N��m���f/r��wh��Zb�3��$>���';QشG�=�A��_��|�v��q�<�z(��d�
T�RB��f4N�ޔ��O ��"�>�)�.&߬hA{k뉳�u?q��PT1U
�[[��H4��L��4���%,%�3����`�eV��j�����e���oEN�V.���3�2f�_���_0�}(�b����f�F'`:�1Y�� =���=�<N� ��9v�!ccq��^f��zb�mg�}Ƣ�W�N�#�Q����<�2��Xc�ny�(�c}��-֓��2�C��F������zag�m�r�%hf�L��$���P�vֳR�*A��ܓ@%-3����D�>�i�Qk^��o���[]�4�Uvݬ�����Z2A�{C7<ԝa��+t�t����ϜV����`�V����	ٜYc�0�_��٣�7�'^���ʹ������$�
);��׫�-}�a�n3? ���9t4��.�c���v���u�,����7��x�V˼����ު]ܶ��~f!�)�b�Q�__�[��@�f���lj��#9KE2=Lq���0���u�j�
�w�M)������<�	�o��?S�+?ͮ�@��S�ǩw��H���������ԣ׵�R�����e&�Ȫ�y&�ַ��ɗ*���Pk��Ɖt� N�W�?��&���.N�����"�#�Y�xCE�Q7��	
v�f����%�+������̧�y+�aBB�o*��y��}Sc*�.IE�þ�%�8�r0��k6��T���v.㣀RB
�M��ݒ�ŧgӀy�i~('�7��sJ�}�(}b�)�#k��9�[�� ����2��nxQ� RJ��	$}Xhʐ�^4�=[�G��z���e��pm���UR�Ќ�gX�<Z�����n�c�1��,~l���f2��V��`Zqxu��Ot8^r��6*"`�	�I�Q&�2M�'B��zO@�����1r-��=�=Ya��"G˞%��Mn]�ZY>�|�5�Fʤ�&��]L]D�~���*��ϝP�^�y�[��Α	,NQ���n��Pu�Ī�l�J�[m��}	�%�L�c�E�J��R��-�"~o���)�D��c��j��jvQC�pk�	4r׍��
i�X ���GV��`:�y3��e�U�{���i�٥�%9�_cKu�}eŔ�{Q�v�b���_�r�VB��v*ډ���O��N�#d�1�1����hTO7zp��,E�d�ʶ$gٽ
��FK	����y3ƾ}��I)N��땓mjf+�?{���9Rx���Y�H��� t���t�$���b�UR��Z�c����AR���qVZ� ]}�Nn�vRv���9��]s����h�LO�Lv�Rb\Kw
�B�&�ڧl�:�F��R_sA�J�5 �e��\�ʯ�XW��YZ	7��\�F L�0�m��@H�0e�o1b�˙v���?h�4r/��D�Cq�9���n�����*L�7��Y�tS���\h�1�xpU~��ڞ���/�w�|?��#�L����Z��������"ima2y���n�Szt�K�?	��HZjZg~�n3��&`�1::h��d��g�\t85�v���X<���ٝ�g?�!�!�nŀ��ZT%L�2�׹kSK��<���%'�z1Q"������@�?�d�}R��3���ڳ�X�k'��=����Y�����ɥi���Z|�S�Q�"fX/d�qF�bk�j�_���fq���9�6��������"K&�
�Cv9��bm��5��Q�O(��w�H`�p6��@s'ɴ�꧰� 8�b��ʷ�?n��2Hfl��X��K���N�j��_d=���Ai��|�`����e -x)S�O�7�E����s_����}�am��Nr�3�����`����.����C�*2uX�eL�y��=[���v��حw���8��8�lƎDnU�Ϛz������t�����F��}ZQ�*�a�����uV��l�;�Gݚ�%����4gʊ� ���Up}���pˬ�+.@ա���𥹻�V������`��ii��d�i#�I=�T?0�p�|��+M~1��34��?���b����í�3���W��*G�S=���Z��=�h��������{���?�|��X/O�f���J���w�_$��0D���õ��K���"�K0pq�٧��4�@����G���r���_���Q�#�J�ȅ�"�* :)�У{�0}���0�DSS�z��%�,z��+�*3����:�H$؉8QK{�C;���o���9-2XWU��cyp��q}��i<����KJ)j1��Sm�ޗ&b����X]�g�%5.8]�����J����}p�!T�:�FY��k���7HeTs������Z�v��6����:�����ю�'���3�C�*�:��oX\�sK�v�O�e��-,�ay(�p��V�w�
v_e1&$o�"�e-MC��Q�w&@d#�%��S�K�B}[-�V��.��V4c��q��y�s�)���C{a�ӑ=��-��@�c�5 �Zݲ���Jpm�-0XP-��L��
0��'{w�q?�~ǟV�]-W8�����1�����KK��e�s�3`�iUbx��?�2�z3�J�K�֋G����,�[u	�ѻ#L汒\�GD!G�0�`{���P��aG47��uۯF��.�C��r�}�[��ww���(�Y��'��3jX�sd?��~�؎ȡ�6>f�T"_��~��s��+�d�l�$��RÞ�*����<��1�JT]�n��kw�/�'*+��+�S'�C\�L(����[��̥VelEb)$��0p�}Çʫ#:�����)�\�Q�k����#L��Q���Ԩ&�aC��A��7G�It�I�w�X���p8��!k�Dtd+'�>��uI�mA��ݡB�/N�X��sbr�D�%�`���� ��n�֮~��W���-�}B?dah=+��?�{�4�9ؖ~�Yb��l�y��崻��������i����֋��x�Lެ��ӠU�����#KOؾY8{D9�yX��:��ь�^�|�x�o�F��v�%�4��qi�����JK+�-�Φ����U�"KD��4�'(U\"l�P��#`�ԗa��#ؓ��Vy�r�M�K�@�+3��נA��!�OWֶ��LҔ���N'F�����Eל`
����$�c\i�U�0��v�7n�d�\��.\����.ֿ�KO��C�;�B^%l��7����f%'�v�·��}��e�"B##p��@��$�������1?�F���S���]���C�lϚ�Z2$[���|E>Z���������(�-l����vr���2>E �$�zR:^��^u[��#:nq���@����B�xX����kd<2�³}��Cr�H.�8-��Zq��S�E۳z=s���JiQTva�ں�|�g���P;߻<��Z��=��`��9c�XggA���0��<k�m�vj��0z���Q�A��HOyP�!��`^Y����Ԫ�$�VbV%�g+@�20�5;���	\QX`�@rZ�N�T�WTi��F��J
�F�������T/V} }\�[�,Bd�Q�b��8EN�	�`�h)�V������l��P�,��p���*#/�����Wm �yP9D0x�zӃU����+;�1�B0�[`�G��x�#�p/fs7׻!̓-��v
�(�Yg;�r+�؞(;�!H��p�څ�)q˄�e� t�3�K�g>�%p)0u�$2�$�Y7h���f��2�Q%�s�E��?gtj�j�@�J�#
K����-�al����l5�ĞLq�.�03�����{�L���1cWm�kS8Ph��'hA� �VY��վv��,�~(���1�p�R�jy�5�D�,aV�:4!�3bnR�ج�j��^Y�    ����Z��0�"G���՛jV�pS�$���:�i6V�
+�3+>�+�alps��-f1����z=�]*��%�	���n���̡�Qi���PS�I#.�@a5� �|l(ț��no�*W��
�����������Y��X7[��xu��޿�S�D��(d"�݂a��]��m��{XZ�&��e���O���,�JT�A��oy����$p��[��4�o)��/]�(�H9�*���u�^uBFcZ+
���)v(,蒬9n�'՟��,)ؓa�;E�]i��=���ǶcVX��\�7���ǎz:���QOJ<����/���"�X����k���;izUy�I`%&I����Z�n�֪�9�2!��*dS��5"g<k��e�[����w&F1���D��-�ѽ���y��0J Ӵ-�����m$?/㰴3؏�{���d1�8����,:��V���Z��\��z���`H�}� ��<-���od�p��MW�!e`���n���D{�fy4���(��Vth����pO�)��V�NC�!+2�����j�K��G9�ĥ�*�=�p���9�Т����C�D@Q�U��)[<A�a��a��-n�T�/Ї'��^��}L� 6��x�$	�ԟ���� �w����l0 ��=E	b�V^���M>}5���9+���"�K{3�6�2�U��gSPr��<������r�u�C��HO�}S���ͫ�%㇎~�b;]���lT��B���������c�=%np��e{��8�t&8��Z�[���K��za����tY��ʸ� �t���6e�\�����V[x�WP�03<��6MQ^��w��]�6��u5�N�Kʖ�{�$,��+�%=_�Ӕ����z0)�`~'���?"QZ����n�u>��&h�e�T���8��3��B�����$\mW�_��'�ȴ~���y��"�Y]�E9vH��B~Z
�i	�U�� vC�맦��~���W��/��d�����f��ʠC@�W�2�E�����/���QU�$�ګ1��9�f�ê{�m���P-�8p�T�%��v��V�@��,�?IXIe^�au�c&�r���Q��}����</E)H*��-ٺ5���Eg�.MԳ8q��A��4{Nl�`�|(�Ъ��,�����hL�[1;:�Ь:�_9킂E�蛷���n��ǲ�p��"x��tX7��ԿY�E̎���`�zt��0"�
�xP�k�C�0�Jߍ:;%�������jQ�I"��d7���*�B���࢘��Nq�������'�t�G=hㄖ�^�m3���F��-�,V��G��^��6"`1�S��&j�ef�gj�)����P�D�'�N[+y�7�|,���{�2�i��v��R�as�jg���Ps�5����~hX.H�-��"j��vR�ބ	"D�#ɜM��?����]�����C��W�_��u`��i�'�5̻��1��ʫ���S��
ik��ޣ��J�vf'��Y}��ce'}��f�ۢQ��?�0�U�l�7�����CI��f�Kza�`���r�ұ0v�h�WEx©Ӕ�+��ɵB�[�	 .�}���S�D����ǀ�36�ܾKb��J⒲2��;�F���\�XIfw<�1I^Ƌ "�/7C(ҁƲ��_
Hmo�5Чz�J��+��"N&࡭9��Z֛�2.{�ơ8`���Ң}{��&D8+U�f���G������M����_������Y�O-uV��i6K�Rk��C����+�Z�fI�[{|�vi}�ǥ���Y\
�qSB9�%�-�i��oĄj/��<ji�a�j�L�r��ZnY�9ɮ��Vw�Y�(S ����$���zj:4��Ե?\�V�UZf���"xc��C��pY*R�)���YYsb9�o� ��umU���]�Ud�C�)"���^8�@�d�L��� 9�嚿�f;��D*f��@�����~E�$���hVř��e���\��j�O��*���@�x�$�d֌Q��� �u���k�K>���U�d�&e;.w���r�썵'�n�<U��*5:)T��^�Pp+y(Q��0�)a���8x5�pX2K�Nvz�"-��;��;BT��]."$b��Y��a�l��b7VVvPu,Ԟs�/�Z��/�f}u�򚍱���JA��n�Gp?�\8G�>�B.�U����.�o��{�Ivxf͕��JŽ��2���n2�Bc�Ћ �eH^2³N��*�z>*��\eT�ا�c8o�������)C�û,^?��I�wn��;�E����k��Q�'��T�W�$O4�ʬ�����7�@-� �рm�}���$]���:��Aϼ^�܎���T�C���Tњ���DP-K��_�i�J2y���,��0H�(p�h�U_6y����{��<�ŎO�R�����.t�kZGf�Q�|$�Q��_\���|�۾E�2�[k"�>0"�2ۛ��<�0���YOa����%f����+vjLGkg\��������X��WA%��p��/-?�l/���"b�POW0�a�
mS{�$�o��;�Ø�14y���@���JK�����0p@O�]�ǅ+�wcY&�(i%�~���F��j~.A|�)�DS�8-
;ߖ���Z��OC= �8�f�b��M�{¾�<�URM�(�T~��'���~|ۥ��8/ќaw��Ah� �I؝�!z��2��>Ȏ6�Ua}j�$�k�U�~>#�؃�w������`>;X_j�����D^���W�_���_�aq��w�ؚ�/��&8��}3w�B�f��4OL�"\��5,.��r���V��Y���VAkG�ǡ0Ų�i5Tl� ��[H���LS{�����KS%�#;6��k�BB��c˄�+�����7Hm� &�!�2V_a��G����GV)��Rv3��#M���c�C�EQ��E͒�:�S����{��OgD!��������l�^4�%s���Z	N_��t&FU����a��Y%Nؚ�ݞ+A��C�ԃk7��y�쪀GZqf��@j��Ƌ�YV<V�{��X,���P��M�g-���;Z�A̪*�N1Fe����T$T8g7A�f��旖l�����~�b�0#ɑϙ-���˿�ȦURҫt��d��D�!�i�/Q�,�iP����R�k~?������Iol�T�9s�h���h�઻��M�ő'��\as*��d�z���je�$�Q}\J���3����9͗	�ܮ�QWD���p���m�Ǡ�P1*�M��\Gq$@'��A��"��?�k�����V��{7���w�t�$k)��z�`��h�'�\T�f�@p��h�� ���E �giŠ��Vo�_�55�2$�q�����9�
�olY��^�̢�Fn��z��/���)������ʨ8�Y �+_����\Q�h(��H��E�^9����-�u%����4�"է�;� �n�s���^~K�`z)-�\��}I%���{��"_Ae�%�P_3 �s`{�rGܥ&��yv����4�+��C;��2�c�+
yQb{E��򣂍��`�\Z3T~x�)$wGk���5�UK%Z+#�3
~�	�� ��=~/�v!ȶ9-+M,/�1]�x4�*_��$�խ��0;_�Η��DY�X�|�ͶD�H�4_�b�r����nHvx�L@�"�c�]@�V�!�{�Q�}�2Gӂz�b�kÚ)�n0N�pu����uQ�$���B����˒��Y����~��JX#�]<��[�y���ܺG>#����W}nuP��,{��z���z���Q�5dU���YT�rv
�g��V��]~�A�=���v$��TU���=��uZ��=���]�#��l��-+������N��Q�,�I�:��
 �\ ��g~qbC��߶W���5A� !�D4hJ?����ҝdf,+�j ���򾳣��?��]��]�M��.W�(�yf��>5�R��aR�NaJ��s�b��cn���N�5\�h�b�e�+��呇f����d�]�{�>+!�v�    
6HVf�6��;��5.M��|І>"ʣFf�R*���=��}<��!�k\��[k�40[�t�	���бn��-u�ZZ�{R[s9P���c��5yL�.V�UFv_��@)��[G�ɘ���nQ�D0�>;��Y��
�2jя��5�A��NR)I�%�84y{�/fַ\="ȸ����3Kqf/ʬ�{߭�-�V^�2V`N��ql�N�;рq#'���G���<@"���E;Kő�|�IV�5W���-'�s����${jz�ɬ�?���N��_�8�a]�fC2�����0~,e���~�ί���v�w��c2��P`3t'0і� ��1�}6ݧ��
�b)��.��G,j���\���;Nǲj�nn�.�.���
���[�������m(8e���v��,n�]�ض�.K�C�n�ｳ�ee�:�w;=�Ѷ..�$llAMg?��E	%�ù�l���eꬊ*��]�����C�
�y5�\DNGh�!��2p�,�4S��;�"K*�ˮ�#߰]g��HrfcQ�9��v���a.	>0�c�)� ��d 9q�'���"AAf LN8zۮ~ݱUbZ[R�t��}�vPe(oU<+���V<y	r��Z(~<��b�&��p~ �\��-�^k�셶�v)uP��/�����]	�xc?�t  �η��b�3|�ZI���Z�Xǈ����ڿ�Z�� 1��Ǡ0@)i׊2z��kz������~*��E���()��u��ݳv���`< ��AϽn���C��NNb�wG!	���2�a�����?���R:��8�����_�1R�RW�z�=�	cS���z���{ÃT�Spe�]����Q�{%z���'�l�=���]2�Ij�6OJA���LŵG�(���I���#��T�y��/�HR�ԓ�%�ږ�쟷�&TÍkSf2r,0.��k����Jm�����[Sg�FϮ�Kl�墸�3�u�kl'o�����)���T�Z�5�08�$���^鮩�������0G��\ne}彙�8��e�EWY{-��9e�J��v�.HI�;�%jQ�z�yh� Z*�4��ǚ�����+�ZdgH;Pz�E�4wc'7�r-o�4��6��q�qDd�e,
�t;3Z�-�ԺW���Y���,��0�J���eIy=�D�,�/$io�̬���r�j��1�䷟7������e$���SЗV�[-
�;D랣>fa�s�{ݷ�����}���^`M��fo�@���}�o����V�yN!��~p{��r���;)s\�j:k������Or��R���ej�HRe�9��@oMY:f�����),
��O�q�7����P�h@�%�-lm��0�+OBY�y�=W���g��7s�u�] ��Yഥ��9��8�j F�A���r��ꪝ����7(P0��N'/�]v-�F�=��@��`����<�X&hl$"I�w=��T�\e���־�^O��:H&�ۋ�%6(�k��~V�6�eR�
>c������tޣn�)c#W���玒��P�NٟrT(�bVFVր�Ɏ���d)ԺrL����f���n�Y�obO��|͙��S�怦� J?)�)٬1>>$!��E �[�K���`�'˘g��H��yn��|��N��9Ѕ��^�t}���G�d�{���+��4t��)�|��ܲ����E���#�ԙ���D���)n��3�@]��Q�~�-	�V�I\26�1z�n�i�Hx�'��G�(ؙ���X���:*k��]�s�OA1�!:�W�b���kZ�C����T��[����E��t�6�-�0-�^�L`�<�i��(����(J+�H��W�Q_�0`g7�k>}a�l���y��B�R�D��^����w?�NH��{��2d(�!aڮ:�q��&��ʆ��F������Օ�VWm�/ן`�E���K-OWd�v�4I��l��O�����T���ve�-t�E����O��۶z4
v��*��]�*�O��4�h��k��;�ۂ��v����T����g�e����o�
��� ��z�/qHA2� WBߝz͹]b�]��/�9���[H`I.������K����{�) ��c��vac!�������� =k�Zy�U��B";����U	9a���׃�\7�w�[��@���o5-��ܾS}d �����W�z�a-$;��P��ž�_�X��)q�WfE�f#+�߰K��.�O����u�ڮ �s8Xt���kU.�g��s;�c*:�Sf�e�(���]��#�nG��z�����\K	�ڽ�^��8p(�K��Y�vE�3�ϘL%\ς�	���Z��L����!��������� �L�^���B�o�ߨ�� z��3�*����^��7~]Z�+y%.� �<�SM� "���L��݋�$i�������OP�}+3��@�j}��kl;������Mh[��Wn�y��ob������n��[���MgZ�6 i[�(lGMlB&����Nr�� �? ��b��Y�6T:2��Lң��[�(�$/d?�L��(�!cv���?�y� �i��d���F����(a�nF~HF�C�~�+;����L�z�ck�n|��V#a��wdq�e��*z����Zډ����!�sT�� nAL���	 yZ�#�P�/Q���H���Vv��|"���^�h�-N] ���'_�_c�Z�/G���$
󰲰w

�,M��.�87U�+�K+P�/ZJMs�^������O7��Fj���7مzU_t��ߓ�Պ�c9�
Z���_le�?Zh�� õk]k��4�xM,L�nٛn�#�W�ㄓP�'�"g�i�w����Ð�{^!�y�K�L,|�7'��y��~n双�\߭�g��X!b#&Uĩ>��K��C������w��-�|0�ITn]d�x9[��Nv"�4�� ��������~���F=�(�O���K �K"���Їv
��R���� XtU/����H�ۋ�>��C�JZ�ǟn�i��U�}֝[���}��tz��a�����5Q����P��zn?���]�TyQ�|�����E{uӪ�9y�ƨ�?G���}0h}_�PV�Lޯ���.W�{�^��2r�:��^SY4A!P���3kn��`��FG�+C�Zy0��ߝ.,z�Wq?4�<E�?���J�7&q���G����?vp����R�r%+�J��z��]Orp��\\ӊ�S�p3=S�;��,z�&Ϭ9��*I��t�l�C���B�de�����y1�xIY#�����l)O����.�q�g�"�,�&��%�D?[���^���U��iq#(\YUUI�m�$� �3N�y@w�ʅϠe*Y,΃�A�*��5��]�3�^���Sm]1X�&K'j��C���RX������$�2s��V��;�|�vYȶ�(�,IصD�1��+��!ɯ/��؋X){����5d&�������9����Y硲D��u�����=H�Jڗ�����Y=D~�AbvS#��I[�� *�!��Bp�ơ��%�1�w��#��s���U7���d�|��k�&$D�)���6�
����b�o����1	¿@���Ԭ&D�l�Fb#ʔVf�%Ps���b���@������x���I�^K�ȥ2˧!�����`}3"�x�]���k�q��O�ؕ�Y-�inނ�H[�E�یp�o�t�lsRL���k5'A�"��۱##�x.�2�8��q���������2û:�\�'�٣���R���{)���<�-�c:�0F�Ձ��>�� I�`��g�NFO7Z[IN+�oc�	�(�S�W�'l�d:�Ku��
�����ܾ��wJFù�N�c-B�"�qfŵ��߽~B�gv������2^Ě<���6�ufCY�>�R@�X/�$R�@�2%��ęu���fʾ:z �[�.I�����bôHN��	fNa*z-��/�b��j�\~��N��o����N�Z�u�����A����n�    ��8�NBEC#��
62^��U�ֻ�9�9�qU̒���z��d!�����I��:%�ޮ���O�����X a�,0����	G
�)R��9�r���P��m5$�r7U|����0́��Re�&f}�D�G��''�e��]��꾳��>ꩩ�C-��y�}(���������[\��/_H�@��������m��^$�����7��u�c|N/���f^����w��W���^u���"!�U���Mn�n�����N�ΉҞ/m��hӗ���l��
v��u�|`�G�!��K������q�l1R���A�^��׵{d24���	�ċ���O�H6�H�d�Gɤ 4����8J�/�W�Lԭ���uX����M�GC��z� g2����C�Ka��V�8����Z�MZ���&���v>�r��'��e����3��N&W[����"Ϣ?��(#�p!02`���)�,�0c{�H�����6��
c��	ٲ�h�yH9���;�^�yUpo�$s�F]���aӟN_IU�y^Z��m���a�]��]Z0OQ�p�N
��߀q"\������ۘm�q���I��%U����fn�jǋ�f�&®Du�� ��,����3tč�`�jAO����������u=[욧}8f^CR�\�+9y����"��E{;X��n`7�1�����s,��K��/�W륪 {�� �%hSb�8)@��H�H�0�?(m� �~��@����5��1�x�]n�~�<Sw ��{(l�ж&e����H�+�<e��G�G�����D����z%̭�k%;���=���!_r�P����/���/S��a����)���c�A%qk��S�w�=�.�(L!"#[����]��ޤ��,]�ǿ���k_�7C��&�Ǹ�'k@�
�c�����RB��R�Zo�4��Ҭ�~��ԑ����B?lum�Lϡm���� �f		[]��ކ��rS�>7���bȋ�u��ׯ��h�Ҭ&�^c��0��؋�_�����l�t<s�1��u�|hZU)>PY��T��o�S&�C�9�&4���'�|�U�{y�Ms����b�H��ja2d��ͼ�sMC��8�u&�7��g��j̓q�njٵi�z��lx��͞r�b�
%����VHpz�p��ϔJ�b��v+C'J�0����O�XG�?
�[X�i��x�YM56��U&odk���"�X�1�mr~�L��ITS����u���PJ�2�MS���T�ߚf��x�=?i�����<S����me55��H���Q�*EKOV[��U(�$ib��g�[���?��n��)R�.%�Bq�}]/�������|�����j�L/x��ȗ�9v���EΧ�0��s�\���d�q�B=ǞƬ���Z�Z`5�L�ϑ�7ޙ��!�Ry��@� �}F�lFm��i\�ᅴ�K\&�`<�܂��z��.Wľw��.�K�)��Ϟ�4�U�POy���w\�"�s�)9�%,�*4Y�wg�0�vv?��{	4%�ҤrL3�S�(O�����}��>	>�
���S����h�lu;+�oT�NG��\�ndL��+��q1�H�������������4��fb���u�|Zܤc�=	Na[(�Yp��C��sM�X���n5�2���8!)���彸�G՗��� �*2���9}��5��7͢cpx�N�L�\�w-�7����a�l�cO�q�#���T*��KN��� ��R��~� 5_<��4�μ��aA3t��H�p�r��S�yI���f�L�̧M=_���"�P�����v��{h�>�Z��hm�X��ϓq>��5���B�ƥ�I��U�e�F4)��=+Ĭ�+A*d��˜�<���ύg�>oP�/���q��k���lxW�s����ofH�j���Mu�U�/�6��0��x
 �O�2Lo��l�`�4>�d�P3����o*�ۗ�`�ձ���T��PC��7�jqG�I��kx4ޙ�:$1���g-�uB~�w�U���!;K&Ռ0A�%`��᠎VW�tQtv]W7�1�E,G��BS��4���1�^�2`g\0*��#u�ۅ���&Bu�. ��Ƶq��z�V���X�V,Ď��V���?��ꇵ����A�L0��]��!�n�L�~�Ъ�+V]�ra_cS�mŰ�G����řہ�Ц�*+�﹡���� i��3�?���Gυ���dY'�7��ҕW�N��]5ܒ�I�e�_���>J���δp��N��F6������Yv�T=��ak�{��i�*��{�7���� ����4��M���e�_�y�����+8�L���Q��	L'�D\��.�	% v�f��r'ӥ�Iǂ���CF���I �Q:W�f$ܙw`��S�4S��f��w,E��C��Y�*WY��Ȉ������g .+Y���z\�� NHc���[� DF�q��i/�}�?��P� $Ա߉�a[^C��y ��9oL��X�ڊ�6D	�3؀ɻ�)�Gn���(���h7-�J�.�~�ܚ��k�U�[�Ӈ��Sc�"����pç���2P��@Y�#�m�n{�u�t
�X� =V��\��(s��L��0����_2����Vd9���$�S���Fȱ����49�Xl�Ĵ�~�?Z�(�ҧ�<�U�_�ȯ� V��+_�ς-L��j������ewu��	���K"n�ک�"h�I�Mo>P7�j�r������_̜��r�@T�����jk%�8��6��W���8g��q?��a�dw��̼L�[�>��]�Ֆ'���Uq�s��ߡq�!z���]OU�~�+�f�R�-t�'6���U7�n�}}���"�"SS�P��C��'(�}X�?lުiD�%�{9>!�]�>��هĲ+�xpg�n�0}�A��g5���BҰ��ZO�Gk;�s�s�ꀢ��2$F����Ku~�j�Pz�3�ӖW��B��[q�
z���<�#��$�U6�y���3��UȮ&j�z°.��{(�z'������Y]��+'�uG*ڷ2�����ps����7����7!�I���s>Mt�^�qJ�
 K:0]w:vA�+�-��܁�p�4S2Dh���>�W:qЂ�ѐ�ow����a
NN�I�Xx!�!U��VK�ck�2W9���uD���cG���.� ����{��ĝ�AtPz�1$��d�MH^�`�^2��C��9HkI�d��X,��a���z*)�s�~�RG5ϱ�6����T�G�,��#$9�n��+�C�c�B�A�t�תq�c\��pr�����D� #y	�U��廙������YfT�Vf�6Q��H=��M6֙?e�;p���9"�)�@ddp�w{�"�G/K��� �]-�GPE�p~�V`�-�ǁ��H��W`8��|0��p}@��JeU�?~ԳV7u�N�eLsX$��d����*��%���ғ!n�r ��P��vYv�@������G�2UG�����kI�>���7�o�+�B�-�����>�Н�K%�a_��j��%�����\J����x`�?o��'�>��*��9Vj|�c�d��u ���Lb�,�ߚ�.��
{?�u�o��1��L\[�§�\rt��~��ק����2j���=z/��.���X�r�"�o���)Øȴ�#�fRV�6'�����g`�Gx;�T��δ�Jt�̓��4���m��=8DW���%��3dB�|!d~;�&�;��t��yV��N-��7����>�/5,ࢨib-�"�P�>4����hHv#�v��d0�I�g{�g���Z�\�V�q��x�,F��Pd��١C��x�p2����q�P=樹n�P&���	��ۏ��pSV9~y-Е~�M�Ǧ���i�
Y�*E��_����T��q���U�����̍�1O���n�nK����1��X?�|��ي ��I�l�X�'l*�V�M@VT@����L�$�Nkch���rcݖ8Ĩ/2�:r��Gi~�
�+�:��    ���M�R���f�7�.�k��P���2��$nr��y��
����1�/��l�!��y�#����'7���|���t���ؿQ�ک9�}yQ��K"�u4��Ɣ��ݴ^�'�5�f����]dx?���!�޲Rk��ܘ5���P����:��ΈCQ��"-�Ҥ,KR۰N[�����ц7[�����}Lw4���!�K������LS�Z�!�T~�>< }Q��҉��ݣ�4�[��
w�ٞ��,������0��������{�5����߬��GߙT��ua0� z�yf���zP��a�85
P
,�
C���h� ��������|Ja�4�q�-�Q��J�\ܭ�m/��s��!B��*�B̓��&�	���y���pCy~&��J>�ݭ(z~��
��$������J*�u�v���c��J�T�',(� �٤BА��Ԧb�Q�e���[g's�/G U�Vn���)Z�`��-�q�Sګ��b<RI��N�j���K�fD�����p~_��.���易���7S�K�B8(Y�B�"��5�)��p&KiE��aNQA/�Ql� k,�RE��΃�� �F��P2L0q��P�H�u,�U+�;9��su���w�:��筞�q�<� ���.�I�U�_���df}5���oM�m��N���:[~�8Β*�����eN�]�eIlo�t�~�,+���$�b��<�7����b/��m+V,�#P�vifҶS����6���Y����f*R�&�OיA2LB��MT�`L�[���<4�t���W�����1�NuɶX�O�YL�����絺!�^�J!��,�颩{}P�>聆�_�LǸ(F�`�Mb�zuW�z[��#F�D���d�"Ҩ���C�ʹު]tU�ad�~�l��d��ꫨ�M���+T.�1�K���a��"*�*�d�6�����n�p�7ڦ]��'�&��=HE:U��Yc=ǹ�1����'%�+gc��C�r� ��%ԉ����U�4�F�ިz�H�:Rdz���eUl�D&������|2�'㆒��v��F~n�o���6����ײK|�|�z��'���N�}F�xl��Ai}������z����c��M_�Ĝ�x���y>{DP���Jy=T��כ��'����JTD��iD@�P�=�M�	 ��}˓ô�s�Cxs����|�ݬ��\N>X�1�\f�
 A���z� �rQgOd<�]�=�G�(>�a�z�<�`�'&�Q2j�c�T8�A���Z�1���
I�X�!-��A�f��SY��b`��կÚ�K�J�U����{��5�^�j�%���W��N��*������ȝL�ҍ^�[����+v+n] ���@o��Z��� �x�6O�	�����-��)E9@�=�&y��F�)4�$���%�L2*s�&�-�:��F�¹�+܉x��o�3�LN��'�+��D\���w�{��t��ۍ���P�$�ͪ	R��zC]�nV�T۾�×aX`����=~���F�[ ���� YX(�-�MQh�<U>
M��Ҙ	إ�]�8)2&�y���|G�����Nqp��ۑ���?�*�#��v��E~k����r���*@ݠ�o:�cw�R_����c&�!��\��A��G7[t��ҡ��K�scx!��B6�J���@)ʁ��Vb�����,�̀�v�y���Lp8�����ԇ�1�j�,�JU����L����=Lpӄo����.܃MXs�J[�R�"��r��`��Q�~���|�0+q}�D�ǻYS�\��f����l͠�f�a�!��>������ʲɲ�9`��n�bA�ڮ��׫`C�k�8�d���#����y�[:X���r��N��N��\1���*����r�F��#Nf�)�p�h>V��gΦ�*�,��17����Hi��v� 5p�JT�+��ݵ����zs����gQYU���=���Ve�o攑Ny��J��"���X�I�L�5�)GwP�u׺
�x�J��bu��V&g+����O�:8��L@Ʌ�n�~�t�9��t�����\�&#�lztva�Sݻ�bҕ�&-mF�L1�TAW�^�u��t���y6mm���ZEm�e
ߛ��~OES��R�X�ř�K��/4��/L2�%ِ8-c�@E�g��<��>�{�*~+��o����6��r�}^�f�6�I�Y�
}��W���F����~���~ܰ�M#�"��$;ÜD�N��6o�C�6�򡚢���[T8�tA���j~u{x��K��)߫��@� �䳹>cGt?��+���W�:무��o��Ȗ3!<ll����@Ϛ@:�-DQ&2��c��ݚ`L�;0��AG��hDO{�N]Q�����8;���C�W�0�B��5�WX-FfJ�2�*�KWW�����b�a���E�H蛚ݑC���%jhƓ��@c����g(E���w�[e$"�k�;ҡ}�mL\�݀��^��û�}7��Nu����Ё��Ǵ\�zLя��N�j�vnp'�P��(�Y��!D͔������]{\�%��$�I0iW��Paf��kM���-V�� ~"_c�Pt�����+�P؉�WH���)	}�\u��Y�W�*ت��5$�lX������ӏ`AIu6.���j�6/�@_qA��v9��{�^�2�s����^S@���P'~O�e��(WߦC���C7#L�I�NN����hi�w9�'}?���ЖO�!)y�a��K��LPu��^��of�������T����2Λ֌yd��Mh���v�]fO��6m�{v?U���e�Q��r\R�2�%�9׍����k?�H��5�
%#���}���p���b]��_�q�{�<�ؕ������Z���U9p�����ˌs֘��~ܖZ��Ɯ��~�c7�v��Nm��A�Ey^b�}b�]�W�C�)}ρ����qr�I�^�|�dX����$"��kjU�2|Z���cm�}}Cc����|�x����������rdQ������� ���M<,'%�#����4o�<q�+��àR�'��A_\�nt��(��d[����d	\�85�MiPգ�E�xpV4�Ɯ�����B������W���+�ʄ{Fk�8�1�ѪW�F�����:V8��ϣ�&Jvyz3����⡽����:ŰL9T:����H��5�|�v:���l��X
���:/{K�w�-/!x��]|R����K	�C�"t�Q�W����u��j���Ύ�jg��Ǯ��9I�TmtG��j&͖��С;z`�-2�O��Z�#�6&���ɭ�*�	����蘫|q���G>��Y�e�I��;��y�Q���;�Nc��;�����&:�׃j�Y��/�A�`c�����^&_nJ��|$7�i�8���a\8Ir5�i䞅/���� k��,tS{�d}�#+e_�^G߭�˨.�c	T;�Wy%�;�p�>�Y���0 �^V �,�7+h��e)����~�sP�� cy�����,��*�1rj���C��dT���K~��=�4=ZؑK��@�OSD�L7��>��:��^k�z��17��ڠ���pe��<�Vo&WNmy�$ �=4v��^�2��
D> ��j�%ܾ��Y�*;����Ot�_�W"2��D	�i�M�����V�A;����q�`i�==T�(Nh�i��+&�����5���IWl!2jj�����_��R����CU�Ώ�>���]�cۓ�cI�"�|���� c�0(��H��@�C���mQB��%��Z[���Tw��ɝ��q:XH�b���ó���",����H��YJ�߼wb�9Ǝ�+Fe�����油�%��-KVn5�7`Y���R�O��^�O����3R��d�;��1'E������'U�=�qp1�|5�y�����{���o���gT�b7�ގ3�$�p�L�S�KI�6�ǖ$a�Ķ����8/�.y��b�%�������J�T����U-.�+on̮�u$�D�h�?9    5:tU}G1���V��F'U9�a�R��k ]o<���q�ܠ�u�{J�U:�f�+��?ptv� �U�)"[)��6���B?nl��)h����Z�n�s�u�N���ՁUK�'�oa\��<�`������Z��*��:_,(�P?�:+�|G�Ǆ�&Q�ME���uK��i����;�u9�_���-NF�	|��4Z�+*���u��eh�0��l�k�����f�!d���+3���e�0�uIG���P�Ҋ�H��-t����}Y%�XGQp����(S��^Q.��R:7և���͙��1�:#��vo��Z�C����T�:��t���I�7$�]��b�C����Y����y��efL̟��-L9�V0�͟�	c�n�W�nLK���`<[c���M�^㠨�����s
s��g�:�Rl(+�L)EBu' �">�B�S�1Ũ�6�]�w�}�j�LY-*V���A�����׍ke��m�H��n����Bed�ݵwHq�b0������u��eHu:��̓y����sfzA6Ӊ1��d%8y���5�s������U5�-wP�!� ���9��٠p3�º`����A2�j��7��+k�^����g��-���G��@%=1��� �A�{�U�`��5O�>ˡ��2&������գM���5��=f�`e�h'k?z`��ȵ��(��0񈊚2����zF�����bd�è]�Y��콝�l�c2�*HV��zK+z6bW'���n5�f�(�_��������h[��z	,t|~�8���n���"|�L$��,*��mU2�W�@�̓ٵy�K���P�V���ϼ�Y(]��_ɐ�F��m����f�l9*g�|FYV��NϷ�z%"CF���1�����8YE�#S'ޙ �{���s�<
�B�UEj
�D6���^�ͦ�A*�ʂ�~���i3�����7���F_q8:B H��Q���Yl��a,[��{��A5����`x��ڋ{g�����Wy�o�y��͔����Qe��n~ȫ��0�̩�ƨ]x���J�QQB�:	�~��PD�RF��>����:�A�(�T_��N����|�^R�^偭�t� ��CE���R�4E�`�=�?~�U⫕��F���mb]�Z�`��:��
�R�S�m�C���
�7m�e	�֜����<��D�)`�u���Ct�c!��ֆ����8��>�2�����qb�J{$t��Y@<M��ܨBh������c[7�ey�m�'��w���!n���n[���K���0���!J�H�>QF��v��@��b���A)�_-�BH����嬔�gY��{5t�߯5ZPɊ�c*a���vf�1���ã�#F֮f��O���>����E�y7�	>�,�ky���k� ���̂�ˍ�C��~����؟�-��)?���=��o1���:F����}ocI��L���t s��LR6�I�Ont�1�F
i�5C��4|�n�x4��v.ꇆ	�g%��&�>7uV�P���5�̱���O=�K;�,]g	�\���!�{vP�8LU���V��
aX�Ũ�$��zЧyX-�@�T�jn��p-i��eV���rq3�����/oz��rT�#F�s}[¼k�0L�k%U(-׫^��LK��#���XA`�}�j3>�#uY	f��v�::�rr^O�	s��QR�f��HRl�?;��ǸD��j����G&M��f�SЈZE�z��k��*)a���6󛕛0��!3�F�S/\z�~㕘�X�T���l�w��`�6r�.Z��!I��,ƗKC�z���
�����M��������,AӚ�ā���R8�	(y��!�u��z�勷3���*��D}j��o�j�,����U�
R���n��/��NN���1�Y��j[�2c���֣�Y�Eȇ#�}�Lʬq²���+�Ʌ�%_�Z��o��r����w}��8�2	&�`����|���r	�.�L�|Q�Z�U�EG�K5h�t�Z��S]BF�D�ͦ?�K���8����9YKͧ����?���%�E�����ڇ���8ݠ���\�q6 P�����P�Ǟ�Y�S^e�w�ٽUo�:C�%�ȴ7�0ѱ@� B��?�&�(6J�7�H�P�փU[D����72��0R�-��\�I���m�n=':.+��Ǘ4e�a�
6��tt����Q�;1��àkvk���K[nz�21�LwmgT�"_�E?Ÿ�NF�<6	Y�
='^E
e�#=�q�����L�Yq97�.�N<aH��cv�^�Q!d�M��^k	��nf���M��{ĂŴj���Pb�ߞ��F�rJD ����y�� ���b1Ͻ��ꕘ*.�G'.�
����/�y��05��騚��2Ҿ{�������Φ��
����J$>��'Z>:4ӵ��M���{�!�~,$��*R&%f��������7�tX��ª�~�'�i}���%i~��ר ��&��Q�Ɖ{����i#0�&������dFe57.�Xc��KƔg��;�%�����E>҈�;� y���5�l���Xf�j�z����-��蘳)v��r����n�_ȑ k�wKe��	�K���~-�)��*�Z� ��.�j����}�P��L'����s'�u��`'�Ծ�'���W���^��Z��ާ����m嵍�8�Y29APa�^�&Un9�,L'�L�Ʌ�q���ݑO���]���ҋ
Va�,o����ή�#xs8�/]�q*S���ݫ� m���Ƥt���K�G�.r��l��n��X}�j�A�����f��R�������t�&6j��#}mr�
���{qn]mcϋ����L�?���4�
7]�v5e�������M�}��\Қ��q��T��S �m<{���od��bG����ƪ6 P$��^Ap�8Gt�hԕ>A��UN�̱<lP�&����xԥ+!��3��|Dy�O��(�Ƚ���Cg��Z�ո�x���`И�q�g��1���,��@��?)L������N���Ʒ
0�6		C���w�9[�U���&���4c�ͅYh"�V�����q*އ�7n�'�ȿ���2�%��ؑ0�8)>�^�+$�ʇs��0�4ٚ�Ԭ�MH6܍͘e,H/�X����nK��#��嫖��$
D;>��ٍ�Zd<?���-��r�ƞB��)�4��\�C3(���?W��`���^�hT�b�d#�����.泟�傕����2_b��T�e��ÿk'��"��}S�]rkFk�ׁ��
,�{�zV�����?�{�iO|7g���v�n:�+����z���E�噻��;<�B�x��?�20;;E�/�:��U�h98~ ��W����C�VE����p���&a�q�6��}�$��暙V�#�,h�=8ܑ����M�o`t�ѻ\�i�n`�z�1w{�Ew
�g���e�{��t͂����G;��GWӇ��^��
{�!*�B��l�ßr27���|�]��)U��z����
;��6*�fP�IiV9�����D�P�b/Ey8�����^���չ~F 9��b9d��[���ƶ��~?�
K�
S'����l�>1�����-�BWw�m(�N=Ql���jr���%D�n6�C5Sc��ێӰJ�/�g�k���q��sҭT����8�����@i[��}P����*��X��G��\V���7���ut�����J�\_?VʶM�p��Y/��J��ǈ�u���������4����-����VjS]'U� ^�d^��:�=�!]��O��^T���(t����7K&d��i���To��v�����(��37��+[���D�m=���楓/��f���4g*N\�N�<z�Z_��^?����m���B�\�ba�m�cZ����{�H�g��u�:������צ���V��\`�Ğk/KJmG2�	�̾Jm�՝)�lZ�,;0ǦZ��,M    h^ό����G���&�VWܿs��@��
hׄ�F't�����(�n#����P���H�A|]~:y򯋍�CU�ʺ��A���o��" z�_�κ�z�� MR��l�����4N�"��������l��r��&�!<喲�Ǵ�,xq��mb�,��&��nV*m���|l
��~�V������H[�t?>���
�'��k��0؎�LE�:3� G4����5���4���᫥�p+�,)������ej27�e�s5f�)��\13�4������Y��i��i ���6���1~h*��<��a��r�M!c3l&n@�2o�_mԏT@�#ؘ�лƦZG�ΫGC��JC�6H�	���SZF�H�Q��6���F��#xg@|4�X�?Ր�����쭍�<R#�٨#�b�yq�uw�-f�[ �ێ����C2K`ԡF�xž�C��^�y�8���Pe欰'�T1�umz�aL��D���{?0bȨ�F�;��n`��L�,��n ���~D&��e��D���n�cͳ�I;�Y��W�$��� q/��Y�߶ajp���N���l;-2��zrJe�V #�)�7͌����*����1��1�+d��]��u����d��E�u��3�� �����Y�t���!��u�D{��>G�¾�K/�G��O<�Snn��N��r?�|S���>CS���G��R�X��R3��"�%ٮ1������v.'�^:���Vq�>�BT判��������*1�L��h����� 7yn���"}�	b�
��BE�ܽR���j"�X���*ܲ�TI���	�395�<��=`�YJMQ�H�0��W��.f&�u����Cj����KF�=��v�����)��fx�}d&��gk���K�>|�t�,W<C���_ �6���s������fƒ��j��F��ݺk��^��K�h��+<gt��JS
R�bw���D_�էʇ�/��1B��6݋�|[�(�p�˯Vc,�:�V���.:%�%�E�]��|V*���A'f��G�ļ6i�7s�1i�~l
� S�`y��@B�@����8�b������ٜ䜞��k+x�kWy���z�:>��}~�E�OGV�-�[EQ�Gz��,Pe_����h��z��et�iV��Ĕ}U�c� �L(	ݰ�6=�K���d#g��s�e����#��!}�+:�@Tؒ��2��`F@���x���C�u�;=�2~����b� �d����A>�}7~(Nr�]5�UA�d2�h������,��a�(S�N1?0O�q 	���T{c��֓o���yWcDrQ�܁,����-
�I��o
͡�O��+�}=;� �k�z<z7e��l�m�ث���{�Q�y�.���1���>_}l^�:�I� �YG!�{���,̉��.�Nm�?�7���I3sZ��8���$1����Q��hH*��&����eEy$�@g�kY����`�7�e�4Q��pM�X���T�׃m��(���O+l:�B���8'o�w�As��kY$͖������v�Y��sYV��ֻ�~Yњ)ST���)�X=�b	(�#L>4?~p12=�������L9$CD��5m�&��"%_/:��or��4��I�8b��Y�8����TOQUH�l)�F������K@��3�Eh����{=�_
H�z��6��z�U��ȃ�MG��9(���;���	�r�p�7�S�8u���c��ȝ;��ڀ�֢���U<;�;�b�3y\'�*�W�{	_o��)�v�#�q + �I��h�'�ִ�*��I�Ts`P�Q�`E�x�VU��9����Iu���7L��E����N�{zu�4(��n�O��e�FQ�E�o�O�AževQY�0Tǡy��l	07C����KdUx����}�'�e
}j��k��T�f�`ٲ�@>� �[��8�o�����Q����V̍�Ŕ^�j#��y�����< v�Ib�K�Wo�i꼶�p���ۦ�	��cS6ʨ(��Z��[,� �D5!�)�`��S�`_X��p�/+�$yY�w3�X]�3x%`��նz~�9����;K:�_����^c��V=zr��J�%!䚇[Ġ��C�F�$�����(���������P�gO��N/�]��4��%-��@��c2$BW)Ϳ�#�*��=����^F��	 ���k*�g�eC��}k%�A�(F:�?U�3+���&h1��e�F�lǠrm�#��>j�8"U�v�[D�V�6�:8�e���f�z���u�nv���K�$3ft�R����:P��zG���(���]�H��nd2��O$L�26h��¦E��w=���.n��=��-gdj`43�m/m� D���Z#�P�������2P��܀��k3��02N"n0�ͧp�g��C��\5.��{��ʗx_)�n��~:]��&�><��3<�ͯ��F�e��^"�!�K����2L��kF�WW7���̰P��Nc��-)�2��jww�l^5~g4>5K�/����0�x�ډ��rE�jh>6�7>�l�QD��`��5����\Q3-|�.�
I�� �|����a��!��S������ˀ����l?�'�rTr],W���qݴHbW������`�-)F1�.����NNۙIA�L�5�gc�X�e�0Y�O��� 
�Pf;}����c�����&�V:y�EE)|��#������#��ELMb'�;A���M�<ҿ�����	�b	S�.F�k꼩2f��������b`�Am�:��6c�2�-����N�_*[��>�n*��c��y)b3@b�U���m�{i�=Fů�z���»�:-�1Z�T�[��hqղ%f7��9�c�8�|4�T��k��@��_�u[�0��o@�
�<hV�^�l�����T���mP�2��Ԇ�
�Ȅ���Ø�rG���-�1a���
d�8�oZFe��x�Ԝ���tf�J�p�J0n�6�j�.�Cs����*�t��Bjv�^�s�Q��Bb"�z9X� �Uj��NM���r/v1I#���@���0\oz5[X�Ii`^x*�B��P��M��DNq��bS���f�ӄ��S<�e��=E��
HL�t�m�:��FU<�ԡzȿ����� ��m<�R��z��Uɵ=N��0��+�I�����g���*K����n���~X ����0��I�9��X`F򫽟\�7�?�v��I����x�hݼ@����fNH�Zk�ľ�ԃ6�Xs�I� �B\��p�iڊ����Ĝj���=6{��2f�TS����x���
�V}�r���M�:v��yyu�	�3#Eakڎ�
~p�	�Ja����z����br�@}N�4�H�~�v6r�[S�����O������鑻����b��]���1%AG #M�`��s����*U� I� *�B�˧�'*�eQ*P�ܹz�7�1�	��޽���+��@yi{A}����վ΀a��]��ӏ=��4I���$r�?���W�&Gu�Vmܵ�`�3b� �l����9��-��?�W7&S~d
K9����8��&|�[M-7�;�^ָ&�<���H%���ˁwA�kX��E�	H{z�m��y�1ik���rG3�]���0l]�ab�d$��i|����Xaby0s�
-?�(l������z�/���+}|Wz4�h�I�XXp�ޫY��@`;���().x���8�)m� X�ę��?��{��XVi���=
"�H�<�݊Ba�A�
B���:��q��ց��@Lyen��?3�@����W�+�W"XV�H^2��F�a�bPn����:�����^Ri���EUf{HMٙ6��q�N���E>��%��D�G�]'=�I�я�B�8*CM��e�H��q|[���̿7��zl� ����z�S�?Met5onVm�{�,b�f�zSms����쒀?(li>��\='�bd�5�ǴOb<tﴀu�b��Ѯ
��    z��h{�� :�v���O�MFWϿB`�s;�&-t�g�	��Q�������'e�m�Ǣ��&eX��P�D5��+P�O�\�^�YP(iFr�Չ`@�TR��k܆;��n
{1�7��Z:"�����0���ԣ�75{�W����Uu�q�JZ,6�lj�uQa��L׋�P���٧B?un�g�Q�X����Qꪭ�FA)d��u;C�Q�U7�Hk��F�,I�)nkt����cV�NuGOf�^6�y��#GT�@�jj�	�9���Xy�=��:1W%����{��9Lp5��ǔ���R
��|6A�V�S�4N%��`|���� v�Q�qM��m���yw{����Ϧ�$�'D$����9|�>�Om�@��~IU�S
��c�tسsF���z!�ξ]�a���zf���{݌�pp�\_�ʫ����ͅ��߈�9�S��:}+-Է8k̂��֦�m�x����"G@G�B��E�뽁��,��=ؗ<ǈ XJvG�6�z�^�yc(q�^Mޠ��σ�R3jc��F��{��2�)*6nq�~��l0����Og�*���-�shh��ݰ���9���N#�$�ZA+��t�G�x�ySԹȽ��Q
���Į�� ��T1r�*����b[ NۡN�sع�PR�y��o�(�C<a6�d�e��b�h�Op�`Ԭ���]L�s?���m�ȽP����� �]�(�J��a���O�[_�Q]�T�L��e�n{���%M����ZGf���V��	�9�S�!�fL)8S��[��ʘy��-jO`�ӝ�[+P�W]�X������~΀�;�l;e8;��A��XS��nk�g#�K�6�T?)��4vmR܎l�p5�X'yR�U�U�՗)�VB� ����BuJi�iVy����c��=��QX(.	��������M}$�)-T��ޅ��[�P2s��tyo��Ϗ0L�^TN��f8�Q��Lt�|9*ӡeq�������u����l���>�>£��X�o[�zX �j�eeƻ�g@�K$�잾��aF�}��4�\�n�{�he�F��F못��^��I�0v�R�F�r_�������Wo[�Z����-��I��u�(�ER��a��A[�B�.�f57���eV/!��'��>����ĳb��Pam۰"�+䤂�ln�K0�"�]_-�����%2ɡ��C�#�u��М����3�7�kF��	���f�����F�q%�Ǿ�dɻv}����PU>s�*�=���-������hk�_jUk��ݸ���MD�	" �R��|�(��o:{V��ﮝ�Y��;D�6��>�D��|Ű����T����fU�a��bR���r̎�> 2�*��LI���kk���E�<��1�7Ağ�t�.z���I��ĉ��^3;�"3�O��<X�A=���Su�΀�� �^�c�g�Qw�ޠ�2�}��	�n������5w����G.%�{�Ԍ��RǅvV�	q�w���O����x#X�i5��t|�r����*��m1M��Q/�(:�3�긨�?�T0	T��x5��A�M�yp�0D�u7|9�an�O{Ʈ|�'|���� �M�㾭-�ۊ'G�YnՓ���K�Lu��������N(�'^��]�}�/��	�"��]g��@�fA�� Kl58l�+MRj'�;�7�G��Lh�ϻ?7��U3��:�( %�"TO�x�̐�(�KK�@1IF�M���;�u77���e)�i�-o�|�͇�ƘQY��kx>���~���jlc
�:�e�ABҰ_7�>"Q���h��S1�CQ�����W���oMr.���� C,em7�n;v�~l���{7�"|�8�C�`ʤw9�)��2^��z�^�O���A���j�� �0�%��XE	��w�o�MN��i再n�����*1�y�Q��z$�23��[*�t A��q�ޑ�A��)��fm�J�ױ�ԣ�"�U �xrg���sN��7W�K3�@���3��>� �1�`����C����P6�	���v7؎1���V��6�ǋ2�2�
ձ�Dw�
�Ӡ���j��k)��F*�#���6�� =p�p���)�>�<ё��1�k���T<>���]�i=ð��?Z�ilF�/&4���j����jve�׎e�3�_�:eE��^������v�y�ԘRK? ��0m�w�k���������`�꽫2D��r�B~�X_����1�/���Tl"���
����A�EL��K�*wm`~��5>=��A�9~`��+ج�c�M���P(�P[��0�m��bx�H:P����ufR�*����..�y�������&*��=�\-��#;�yi�T�zE���l�G�	a(Թ�8\t�ZF9�Ū����;�ݎU�2gT�do▦:�s]�6�1��,=�Ԧ�b�kn�Ӏ��'Pɣ�s����g�%�hE#D�:P���W��� a��Js��o��������@�/�!�gq��A�R?��|l����Fhd :��������;�)��;H�Y�N
��ˑ2+�z�C�T��Ύ�׺q=c���+��0�^e��@'�v��/�xXEj1
n�3z<�WBo�cvc���UQ�2BS�Q 6�/0�$��I%�4۫��&��+�ڴbǶ i����r�3H�غ���OxKʜ����`�S����/v nUe� �m�E_��3�C���%T��ܔ\��������zܚ�̽�����aqa�+%�7�tcQ�g�����C(�ʔ�p��0z�.MZ�U5A�d��_�j��[�����9Kn�AEN�t^��#Xs��~��"4��Iu��4�K���(T�AVm�]�ryP�J�=���ͣ���]eTK�e��La��x�r��dۃ����������SHf�[�����*�?������Ӧ�:Tݛ�#z�8 ���m�<6�l��Pl#r��GP�ꛔ��{��r��4�,�����۾j~4h������+�P�`4�v�q�X?�c1����%^��,�G|��I���!�V7��3)�.�jH[�̱p\$�lɒ�7׉��?l����Q�s(�S^]�:�jJ��ہh�>hY���
`���j������hu&�7,vX �$#�Q3hs~�3%yI��[Ŗ4��8�V/����t���	B~M�G'�{�D��9�cv�
�s�l��w��S�Ac#�q��9�� ��r�oP34�?�q_M���D�Y�*l38��	�g�t���V��M���֋���jcM����qυ<_-����K����j�·���xP������^�'=�b��	�n.�<��̟ ���t����G�!\��z�\۾ͩ�8	�
)�,��ϻ$k�l�s�Z��[�Xq�*3_R�_mRS"P&L��뉚%q�(~?4��;��W)q̖xs*j+��Xv#��t^�84�
|*60���JlJں5���JYט�.e�nC
ҷ��L�.S' ���԰��[o`kC��S~3��TA��=��z�[���ّ�+��s8��T�}��f��C�������l��Ւ!��ʢ�o�}�yܰ� ��`��ԏu�:v���v���[�{I�U)�~�vm6&����A�OI⊂��t�>9�ü��~ئn�6��H+ޫ�|��k�4�a�z�	pq�����ޡKa�,��j;C��nQk| R$*�7+(�o�zz$_+�fL08�v6��ݽ)6���ݫ��g��A�� �q�n�7�R����bK��>e�=q�b	���0��Pj���%S��3�0�t0����Fm�O���b�RG�����M���s͝,�8*�u.]?a!��������C��!+��46��1��|�5�b�K�Q�8K�w�a.�n�Ȳy���\<��4�N`X��'�5�4�+rp�.�f*���#��i�h���5�C� �ʧ���HJh���Y�?�D�Q��٩d�W��-"�ü{�{?�h��d��ԦXIz�h?�rF�[��Q}{��I��/x�z�iÜ�B�Y�p���09c󚈳Ҭ��NV@��bo��/    h�( �la7����޴��@}:=�7���D� 
VF�7`��f���ۚȷ�	��H���͢�c��!VA�PlU�Ե�/�D���o�TI�|6{9z�H')�|1+�stT*Ǜ�������C�`���VQ�6O���=���ᶠ��|PE*ƨ��LT�.n�ˡ?�N����g��i�1��եW.7�����`���u0��2�޾|*�T�;ƌ��3��2�J�$�r���^x�b�wh���5��D�e��	ݷ�K��خ���Pd�[d{�g���t���-�LU�u�lW�`��o$q�e�Va��3�� [շoQuh@��UJһ�"B����Z�*�����#�mt�X-��o�[oVӟl=D�����c]��,U�+�|1�ttZ�s�����a��R��i�XH Q ��bN���92�Tſ���D6�!2�_��T5,��v@�T̶���Zeo���n\@��*t�e�D����_'�TÒ���˼�y���S�����鯓40�B����huǨ8�ڴ�%���ѻejr��+ɞZ|4=t5Ok�0�[P��E�p����a9`L�-�����F��c���_����������D�
V��F���=��J8Y�F��W|��y��"��k�X�ȼ%���僧��~�҅^m�nY�?=��#K�`J���O}k���o�I�r�_~�s�5$�s�yso�Wp�(;�rR$�}��:����lv2
Ѝ�����-�,��ce���^��
m�d����9|��`Zc��2��BW�/�ҭ ��(��R�"��H-��ﭛ�A�v�,�^Pva��S��l���Ƨ����[�g�-np�]���U.��u�%@A��W��<�]�YX1�~�2s�ẩ�[_W#Wn��GZ��䑋�� ��ty;G5��B���)"σ�dONJ����P+WͲ�E	ոn �6^�t1jޥNVAp��z�U~�r`����6��s���P�������0ļ�A1yt��f����A��6VA6��.p�+}+����'C���U�������|c��*�O�kv���kG�r������E8����s� ���nq;�R�kn�?F)+��	NXU�1�6����:4kCG�N�I.�M�H��� ��`E���8�"�� �t�׾B�:�z:��J���}E��^Y��͠C[8 {/s�v���6uUQ�4�x�[O�5��L|�C)��L&ޚ���-�W=�D�,��E��K�d��=��)�Z}��;03�5AF���o�g��S���!���m417Nt��c����V���0��~�e�#���\�s{&:��p`�%��	��Qy�&4��4�Y�z�)�8�2wx��}�t�⿾��,;
r�7��8���P��G��xZ��Y��5m�(?ǥ����-�bnZ(	�&fz�e6{���N���S�Y6 �MY¡����n1%�~��Gȃ�;
�U��H�DͰqHk'���p�����e���(��d��֐٪��x1�y߾��D�ʂ�+���z��e i�|���)�U�1	?Hz���H�eU��l�(�5B�=�h��3q����g��=���F-�e��ẽ�ڴ�&�{;�nŔ���!
�MC�_]q?h5VĨx���N��٫��0�@��{�;?gO��Sge�7�#[��$���󶗗M�#Xa+f�:�(Y���x�H��9��Q?��S�	�P���С���E����g��<�����������[ߵ��'���w��+��]�-5�� ��w���h#�c=�PթJ�{�21��`���Q�)n�D��f��uP��>$͈�q�J'�L�\��GN�xc6����m@;uK�4� ����߶b~��(sP��zBaV�N��m�zj� S=�����NK;w4��F�AOb�R,tI�lT�4��EO�r�ӵ`�!�u�LM	�����ZH�*(�|�d5�����T�Ue���S��>���r�g�|��#~�@�JE���9o��#���j���>���m#HC����<�*@���������̷`%����w�b'�7�9�����<A
mZ�'�x����dG��Y/�،Q� )#���_=�P\��;��
����Y�1���^�d�@�W�k��@c�۴�b&Q|E2��4�#�jο�j��_��?zX?K~tku�yַŇ, (xK=U,����6�z�av)M�����x�����TYO�����Hc���rX+?w[BZ�R��na�v��-�eg`���H��Tӊ���N���A���oDh�a8���1 (�Y���cA���᩿v�����z�+��WzE��\0"�0
>�k��/�
�c9˙�i�L�Ƽ[�����m�Yq�5�!+T�̮J��8�zzgH�]A�O�R���ĔK�S�������xv: N�����$�"#_���3�6���b"����{8���%/�@?�%.��(WM@���]rj	�v���.�G��U�+eT�=[ᝢ2�� ��o]�z4^����6�����IE�v�_�E=���������ǖGpMU{�Y;�X;͹��I�Q���s�����K�z9���5')ʤ;��6)o�������(&e��N�&��aIx���Ǽ���S$љ���1
GK�F;o?�DEYqE7��s�Fn����42q�<��G}']8�rKJ4S4ޛ�Q��!�l�cP��>a�lQ�D�g���*�d7��c��?HR��7�����ۘ& Q��ɷ��̂"`5d�!���?�HU��Yn6�z��ܬZ��ᠽ(v�j��Ӣ�a;ꂻMƙ�PPLN[���)S������&���ݚ�38����*�*`eq��=�ҟ�p�,�d�n'T����t+(��/�e	�_��սS�R �<��O=� nJ&�Oa�P�w&6�M�/��1��yq��Y��H�M)��:��a����"}��q�Uh�� (`�ԏ���5C��Z�:��f���	�4󸭕/�N��A.�H2B3N�J/�o�X#*���UoU�����}?u�3�c�gt���ee���P4+�6&|{Q]���<P�(�wl��ahE9Mԣ�I�I\��L�0-��h&�=^ڋo-�RR�#��\z���n�ޠ�'��3�a�Uę�?�)�u����!�X���ٲ�t;]�c��T]m�$`��n_Z@SKw�觎\�X]ž$,'�@�VU���f�8Э�����0ogj�5y�?��ЪX��,��&+R�6�q� ��1LQ�꛷�(�\Ob���a`��#��M!�G,��]�iߚH��ѩ@�'=N]���j�1�"N�J;�G��>��x�Mx#s;>� 7fn*FXπZ�I�y����_��%�@^#Jn�?�e*�����:I�������jT���C�0���K���x�����̎�g<љP��[w���<v������n����V�nfP�bS6\��(H�H�F��߽��jk͸��|����#+-*/�+���l�JV�؉,�K� ���JeR`X�ZcQ�G��n�vk���"#�m�����V��v?�e�_*�ʁ�Z���
���q��D9�~������	eS���h���V�����x����s࿄�w�6����/�z�J�ްb^U�.����[ @ę� ��<Z���0@9��Ɍ�Z�$�{�Y���VD2�1ެ�����r������R�t,����t�������x�L��a&�j5���KxK3k��(rd�w6�p ��6��!2.�j�^�'{'�����d&U�i��T���N�~@��PFa�XZ/�E �������B�
J�;Ӌt8����v��MyR;�lU�r����6��ڱ�g=�8�#��]�� wNx�K���R���i��c{$'B�L�lV�q����07@������g�(*q���#c�?�	�}���G��ԏ8Uq��rZ���
N���
s�fu�H�)b�qjFr��o�,q�����~ �Q��LP�Ѥ�ݺ%�iˊ�n    ���9N̝
�=@CL
�NA	�����`v���V�ub����SA��Uc�o��OY}�r��'�dՋ��-#��!P6jυ�b�9�	n6��0�՘�w�O�(���M����m����=��C=[X�A�qx�|;l;�K�1�z =��
�Q�
�y~�yFzq�^0��CV*@�tQ"I��	N������W#�`�
�*/]��l�5~��q
�'���8sGe|�ok���VK��/<m�~h��@r�*�Ua����?�'�����{�	���ݺ��� ,)ҍ(�2G@�H�9��d���?6��z�ZS`�����l{���c�Z��������]��dw���Λ�8ܶ�V���s��}Ŀn�i��9 Dl�MX��ï��^��|�8��OU.����H�]��,�P#��,�0 �kv륓\>�VG2�����|��Ս�]gs�����=�]�d�w�^uvfW�W}����e�>���A��{�Y��{
�,.���F���{�����^�TsM��+�OT����/BY�]��A.��M��7҇�pJTrs���k�UGE��>��QZ�����l����GN�J�y�ھ�������+Ʃ-1+s/Npζꪃ���G*��c�&`�-�c�y��P���e�`3�d�h���?��8��p��z�����p?'�Tf��A2ש`�?�[�4|@����`îg`�G�FA�?�*�=S�Q4=f�����&k&nӯ�r�l l������z�م�N�\�LU9+�u��/�B}tp2��	�g֗��C���77[����n5��gM�'�Bg��z_��tga�53{t���뙣����o�m��6��<�b@�߫c�v�2u`S�X�Ə&_Q=YS8�=H���jV�U%�����CC�~,y�,�l���e1��������X�Yo!�����h���_�suh:�W�RmS�F��|�S�d��-������4�]��Q ��*UlZ���q�%��{����Զe	wq��$�/6X�z�|�o�q3O(���<�R���9��[)/-M ��)���V���j��mT`�98���#�;�P�z�=���oȔE�A飵n��X�vE��|zdг(p�ʺ"7TI�3@�.ٺ@?�5a��B�
Κ�v�w�(�����!�lO�;&�quZ��S�y��38K�.�y���M��n�L��w�m%�˖�� ��B�˛�|kX�ٌ#)�0<9`s��3�0�&�!�P< Z;@����}�Q3��]/�<����w�C�X߭�1������U��c%��{��3Ur�Β�����Z��v�BQ�B��ڠ�黒n��Oltl}l)��K�������������7�3R�-*�T@@�6�6��7uVi�����$W�ݵ�+h�;E�"ܸ���=n[�} [�y������2�&ё�3r�ƌ���;��U��:~����M�x�E�R>�+&NV�,�����-�^��:��\9Գ*��SCe�H-�[��D�����,����5�wd������[�$����ٌvU�ũ>Ĵ}0Ùy��m�V����{���v��x��WjZ��P;�T�b��غ&ߡ	�h0:Q)��UjP�[t���^�E�c�]���̪YL���e&5;��������s2.{��y���35+��7�n�W��f`U�0�����E�S�Z7���(t��]u`U��H�w+�j�u��C�S�*���LRU���8��f����m�V{�������mW�7m���B����C�9�c�
�ԩ����=�|�;�c �ð�(�e�����/="g���3���]e���NZD���	�, 
e�n��qފ�b3� ;�L�t:E�����D٫�FP���G�h��FzM���`����t,�{�տkT��Qj���D/��j.�*�$�*�Z�\iQ-�Tu��,�T5m�XGZ}kOe�Օ~;�í-L|�-L�p=� D�r#<�y=_ {l��4��Y���DndQR���i��,�)ûe��d%�	,` �g�W����.�01����T��t��"�����9*D�z����׀03���dgD`Fv�E[��eU��]���jt�g�lΐӈ-���5�=����v����JhF�@K��b6[ �*�==�R�R{�s�}��y:��<C@o1י�=`Q��k� ��8`�W�($��~Z���R��ܲ��?�3�L>��=.̍W	�H�Ui�p�ɞf�U�������9�=�j%�Xm68�%Hh�$9.��y�Z͏5��X+��ݴ����E����)��SЄ:Zk��fw�T��^��#�6O��ƶ�6K��v�X�Wz�U�,�]02Mg�"%�'��]�w��Q(S[C��cT}f%f'��WfGYd�<���g~�!ޘ�<1l5gfehg��_:�C݅Mx���%Ii����KT�Q�x"����̋*/�X� e��LEǓ�3��&8����+��Β�a��֢ƌ���ëz��m�;j#^]��Ψ+R���C�"Hņ��V���r���5t��7�٥��Fr���l���,�"Љ��o�����Ԭ7��Å�D�An��k�7&����ȷ��8_/>��9��E��
Nx���M�yON�Y�h3T��gFb��-�&M��pJy���N��U$��*���J���J��m�){Mp)�2IMEWY��F@�,�~#s��ދfK
�D~���m�\�1�&[�=;��8�j�ʜ]
��8�vi��������I��`�$��TR{�B+
��/��nŉ��p�7�;p�#��o��s�9}�?�n9��4M�ʄ=�^��JQ5$�lb�m����,)�Z�l��)[��Wo\2��Y5��Э����t9@�% �H g���V�`d��h�B{w���].��ᑲ���}�V� >��T��>�����$���M����*�Rt���|�~1���s�;�`�AH]a���[��_y[K9:<�I��zdX���Ϡ�|�5<�o��%�}HC���l|6�v�R5�5Kb.2��������Ċ���9���Lz��{8�'��Yd�@��h��~����F��s^�n���W�%���7���[��Q�,�?)5K�t���������.�A��^���	"4Nf�عT@��[]����
� ��ZU=��4�\���,3
�� N�@�K��l�[�/��[����\�S����q�Е{�&��ˣ�2jG3����3��E7���'FJ-��Y�ȿ4���'y�o�B�Etw����_�!������@+�
�C���B� �7;�̸xGr�A���dڈ:�k��A�5	b�?*t�~��|�T���|iֆ6bqg(����� _/�tv�M��� �U����
���A��!��}�+�u?��Q(���x}Qɭvi��O�v��F=h.S�VM�`����\B	��,nN�yg��N,?��z������j����U�;�<Q�
1�S^����[N�W���?����y{��T6`����&��ȑ�r�-�ߙ0B AUl���[��j����ʾJQ���t��=��E�(��MLaġ:����ʃ�����~=��G�Ou�*�8/�˃\a�x��	P
s�	�
ci�3߶1��^W,ϊk.��Dd4۫L>2�c1:,�&Ș�d�����7ݑ�48h;�:�s@xC��{�������a��*M��L� 4m��~��o�%�*�_D�F�Hq�d�������?����jf?$t�^Y	�D���苫y���BCI���v���-5�Ԥ���F�o���(���gu�w��5�*�QF6']O>���3E���6����D,Ҳ�`�)`�H��Z��pu�0D��p���u�mɜ�[X�%��@cW�C�	E���:��
�P���e�e9�y�G#Q�j?D�� ]֗�w���7�I�];�xO.fo�²q�].�ǈjS��`&���o�E�f����;�No���B���D����Q��U�	6���5���*F��=���(���w�    �T嘞.�͢|���L��U�_�E�s��rtN��f����ܻ?�\� ���H�<�G{�7x����Q���|1��o��=�Cօ�g���Jo���3�L��]2�. 
�b�|Y.ӳ���u����l���IU)��"�m����o���LX�� �O�M?����<ۿ��lvW/��U0í5d������1�N6P�W�)t�<���%��-�����K�AN�Ŏ#f�Yoh���UhT�Gܲ�[��=h��YQV�iQ��m��h�oM�|HKޛbb3?�ƉK���e�I�F&fr�'�X�� �Qk�n�sg�1����l�m,M�=ƾ
^�;0��<��t[�rW�A,�D*v�W���[ $U��訮LI$��7�C���%�D���A��[��*u�J�JP��i�˚��_ɕ����sSդо�A�@�~{i���mk�{<�M��w�H�'E�ZX��X?"��^$19��(�]��$cͰp &��^踐��-$0 ��d����3��T��
�����j�4�n�FѸ�xx�h��DePғy�u�H����u`@���u��3�0�_�r76N��"}�q����;ަP<��[1��b6���� �1��Y���+ ���!���+��e{��igLj����y�g���yP�}:n^�7�/����:pE	i�'
S�("�Hq�8���`��盪�f����1jЪWK�����*�\�o�؛9`�hvط��m�CS�A>��g��bײ*=����ۛ���&�Лԋˢܧ^��N�g����u��
-f��CQ�ݞ)��=���z#�̉�.��G��7����݇�)ҜI�S�H�A skω�<��ч��YTū�����KK;$}=�Ѯ���÷ک�n(�S�G2Z<�)�#��1��B.����6���|����?�2�y�5���,�'A�v� �>ީ�u��$.��?M1����e������S����f���y�Nq��O՜�hx�A�/�����{(�;T8m�{dYe꽷��^��Z�\�T���7�67�k�K�,��)��Jn%x���=�F׼�1(�a���|�z,���̶(������AK� �)��|	�C��G/̤�؂.\;GMW��]�{&��觇�Nt��������|{w�^:����Fv�*�kyv�����fm����=�]�I�]���o��u٬��|�A^��N*�2��\���R5{�������\��[��{}��� �(�Tfϭ�#�ƘK+q~���W�Eg,"�Y�*�>+��'%{�4(���ʃt��<���HN�:lƦ���0������`�6qJ|Uʰ�D�i���@�����t�)>oTf�b�GDqW:Y�v��G�tT��Az� ��_^��FR�l�U;�i ��ʽ����+�ê48W��q'��L������f{� ������Fm�����8>eU����亂�U�6=�g������C�Y��]��̦��Vc{�}"0`�Q�I*?s}�C���`��tufk]�/��l�y`�=��)��uq��FeY����qDq��󝌸��1&�<�0�.�*V�0����I�k[��eg�=���Ω�X��D�I��u�4�W��$��PT��r����f�[ɦ�A�ɡݭRLe�����V�
[�����M7�{3�pћ��O�~y8��趩àu���J��gi\�"dx�z��I|'I����f`�h�,�2�������	g'��6�ĈɛdƆj	�ںk�T����{��}=��9\a��v �8x[_8�U)�87�{#{(�*��U��v�qqt�#u
�F�2�@���Ad(|;C.�Y���{0Ɂ~���U�[fqJ
�����L�6c+��*��oN��u��Gx.�
��t��ffT+�S��;����z��O>7�@�R��f�����/eKq�PT�豹^���SP?��=q��6��8~�J�{N?+��C�@��cmn���60���d�z�m;2	|�8g��y�HFN���me�;^L+f��<$�I�d�[ߗ��][�ξn��^�.1��G���s2��Lr�(�a��
9Q{��(���'��P�̮���L���De��}�.��e(M_R&�ͱ�M��m��A �]_�<x?��� �Q���w{�q���C)��&R@:Ϊbӆݺ�ٴ�*R*�Y_�T������@@yb�$V�4@�x�m�9<�ࢂ�,K�TP�p���z�q�v���6ZqY"���C��
�Z�0�^�u�8��abk�R�sB߄ց�DGKQ��ϱ��*�9���]�
i�ƽh��2)@}���}BVMJ�=L�扺C�y>2�=�+9Oܔ���y�VD������)��(�i�����Ī��B��(V���a���JJ���ģ���)�.�i\��~�VU���F׊W�{[�F�{�~ q���w��?lT��#��ia*�N���{��%^צP�l�0�!x�9,$��K����������Doo�O�)�B���H,nV����]e娴�� �$���e�
ݗ�oe��r9f�������7�)@Q�$c���졇��<��T����i�'=�����Ra�����!�P������j}�e�)�G�0W�.uC�5-��+�	c�_��Z}��N�Wlй!���Kʇ���>��^��H��(Ll����:�"��A��:-�\�RV6̣A���f��|���kq5�{}m���9��x�%�d�A���ʃ�6K�=�����?"֪a�}S9	V��� �tK�������iW���nǫ�Q؝����<2�0s�ѿѮPB�\�h ��<.� Ig�+�M_�F�h�	�/��\��]��e��C5�H���%�mTg3�ϗ�2�L)c}����qO�&U�ӡzA�tW�?,�)���4�A~�y�+ =��y2/��U�N�sar���(9��O��ս��RͨnD���	&wݱ^ZJU�����}Q�/H�dyp��.Ot���Y���v�A?���.��m|&��
e��ęq#�X�����8]ɳ���o�>���Tl�:���t�w�c�����{1�<͜Doif���؎"~�r�^A��ip�BX�1�Jҩ��P�o�E��7������}Q(�h:�������O�G=9K�K�S7Z�죡+"������ե�@��J�	��A���#ћ=�
�jreCPP�����0�vD��-h�S�1�5�y��GfUq�Dgy��qMqr��V�=j�6�2O�Ć�hޣ�������6�v��j��ۣjT�,���.r�p��!b�H��jA6�p@��,��6+Z�� ���d�� �f�f���x���.w�?�Q����.5+r�3F?EB�^x��>�륉$Nq,`J��|tTGG=�"7�si�5Na���ҹj��K��^���e��]-1���Yݚ��=�:C9��N	�l����D�|�������u�y�MDL��í^��:<�a��>Pb
}���#{��|���n�wӑ�
�{/�@�D��9�]��gVͬnε���ԗ�^�<��(#���.��/)����r3��;���E��n�v�J�F)B����2�;* ��d$?��:�%�9��^�td���Ƙ ��Rvb�����Y��/�ং姚�����&Mh�=B��e�)�-�LV��ON[{�q�Iž�/���90�Å�^�}%��c�^s�sk�s��	z<����އ�)�0�PH���/Ԁ�fWƘ��_�A�OyC��B�bsi�\)�9^'`�|��q9�I�s=���5v0-�@�����#̀�5�Tݩ�AgV��vJ~;;_m���wr|X*���|Q_c3~���o�4���u�L:g�[{R1n����0��T-�\x얝�%��}�J)Ҡ%=r{��*8�䨒��[g�\zbH�ح�<L�HP��5P�>wKXL�pb���<������l3��W*	~��EK�n��ʪ����e�Ņ�����    ��uvv��C?�d�
%p=��Ԃ��F����� 3�0;��Nb4�+��'z��k�2Ԗ\�ח�	*�7��$�^'�˝�����ĳ߬��No�,������Q���p�Ì�q�R�~���M=�����ȝ2��`��V�&mx�x�p����c�zuDH
�ط��uf����zt������Դk&ӧ�Q6��fu��/Q_ԋ(}�1�0s-i��
ME��B@eO3��
F��3oT����f���NN�
���f�^}�@�����t,��P��ND[_w�Ak�AB��\Xp:�M�R`GXU�\bJ�kg�nOOX��E�\׿�;op�?&Bf�`]�p*_���p��C33u�U�۷��sD�˨������W�*d8��vc_jAء�؇���r���ͅ%7�-m�P ��A{j�v��a�}���\n����Kѧ�3���[�P����v�Px���H�׏a[�� �xְ$#iD�R�z]p蛏�J;}��`L�ڨ=l�o�4�|�W+'46nǞX_!z E|�Tal�ի��mP�SG�� �=����7��� ���wzh��uk����Q�g���֣�m���uoV#)l���AH��E�ȩ�!����'x��a:�}��<c��T�Nm������q �T���H�p��t��<A�Cy���F��(�C���Y��0`�>t��R���!�:s��1���m����ּt�Uz�
���.n�	;:�M�ׄ�������j��[���0��8M��?6��j��Tq-�C=i�\���P�$)ܧz�V�wj��OA/�ײ^"�k���m}�D=lx�B�&��wl%�u���ځ��I��V��e�/����F�"�!��R�\x7���Ԇrj�WN6'4��]c�h5��]����;����I����g�A�5% /���*�Sip�u�Q��陙]~��hj��.0�0Գ3��O�2*2�I6e�9���|�O�I����;�m(�*�,�"�4>�T���9{�B�ЄP��+%P��75Y�r����3ǚX��pi{+��~{��\Lvu�����Epn��J�F��Hg�*����u�p������h9�L_=��0]V^�L6���%݋R#\y8��0��FҼJ�tV������5��@�K�%�Ss��s���H%��
'q%�Iю��k�WErҹo�0�$G�QJ��_�_+l�����6�:����4 C(������k�V��*x)���b�tp��
�O�K�wSﮖ����ˤ�w)�L혪;�Vn����A�|�Jq}v��H��X4TM��lu��s,�Ԝ�cu��}[�^��ۮ���]��d"V\��cL��D׻�k��z��Y���W�W}�A%��b�l�l�X��]�W(9��?��Y��n~��ෞ%�Di�f�ހiS�th'b�9:s�E9�U �Z��I�#���մ�b�aizd7:M�t������+��R���5��;5����%�	�6�F}@��U��"sI>1l: #7�	X����^�b���e�L��487 ڻI	(3���9鐧aV$�d��6h�����f��2wG���!ﻌ�?8���-nW��m1	�A�������3�7��bJ�g؏L�FU�!Lft��G��;n>P�`�+s`#���.M��mQD�-[���?�a 1&G8��vmbm���n�!(F�FX��U��u�V�ɉ�V�<���83t��ohǨ�L��C��
�@���]��(G�ѧ"Xj6
������7�k����8,	��<5 ���l��:�jf�/5����=�BH�b��@<�Χ�@VFa���O�N�ݲ��VAJ���m�U}�5��g���=A�k^�}��N��t��!KO9:��S�,,MI���f��z�: ���n�!������*|�
l03
'���#ovU �歧U�ˍ+(�$���0o��F(�]^�F�O	���y��,��?���-��Rl�3�'��!�b�[3Q����օ0ZVa^y�fޙ�Ti��X���oNRי73�r��He����̔��ls��d ���R��S�������<���ܴ�+Sg��_��_�mp���Ԧx�C�:I'��Խ+%�$���%)[�P�S�y��6]����Q��[	-�ض�Til,�n��I���[Z%��g+e��m~���1�F�A�^� �~(;+���������f��X�
�y�+�|�t������n���F-�=nO�7̬�FTgՋ�;��Ŵd!���B�5]TL7��j��!�L�gJ����3�nT��Squc��ڬ���x���n����]�������R���Z��j�k�wrw�`{�,6� J<�Nk8�N��IuVLn��$��91�K�0	KpH�歑��{����}�/���_�	�2u;7bP�J{M;��K����$g� �}�mھr�'Og.JD������N��/┍���qb�>�"6J�N��㐢�az2S-jZ�l:Q��Н��ce�0��ߍ"��o����^y�0��B<������C� Id2��ػ�ѻ����8���(�Rc�!�SC�����h����dLR�
0h�K��V�q�'EQ��#�z�A��g��W��p���!ܯ0�Tg@`}��׼`�P}��&�i��&]h^�F��Ii2�
�b'?k#Y��GSh�#�ŉ�Z %k'N�u�&n;*�l�ۮa���e�᧒���q�h+�wCQ��g���60;kﬂ�y�b|^�+��)�G�Y�T�o��鋢��f-��N��2,����[۬	��Íˊh�y�f�$�>���-�r��q�Wu�Q�:��voq��
hf|;6��%�%4o��W{����Ѣ���m�c��WnI���ڒ�z�/�=�'�hs5|U�8X��k��rk����"2�);�7x���3�������ٟ/?.�2f�xڱ@��7�x�Ȅ��/����u���u(m=�l��l����έ�_��M�_6��|��"�a2�yQ�s��\|To�#�/�ƅL��
ܹ�>�2�����x��6b��i�������U����"ȃҖf�Y�[j���Rk\$���H�I�p��_�7v��#l�Y�m��%Je0s��B�u���V�a����0>�Mg��)�dY1���|w{g�u M	)�[01�/[W|��8�3|�n�[�E���YRN{���&8\�
�쮣�:;6V�S���R~H�Zu���f5�p�.�^N�f�ren�+�7fu��������������\9�}c����b	��7vq��X�(Y��pu�*�Ty�!��z*Pq��#K�*��#ª\Xm�h��\�x̊9I�'`�t�x�����8�8��rD��̕iq������(��iV&�3[,��e�4�
P��;�b��P�?�
3���d{à�Ѐ��ŀH�U÷��������=���>p�TG�L{�ߏxV�Sİ�9^0_l�4��l�%�)��68����1��ޢbs��
C�ɾ�Q�
�
���(��+�7��48�Ϧ^��l����zw�� -����\]lz��D�VYGR9������,�����&�ψ�	��7��(�]+��ު1)R���xm�KU���>�-�*RA��n��vߓj�z,Eq��s��T�̰����9��v��#��\zqP����3	�o�~������� �������P$�А���f�û�8��c�8'4I��0�1���M�l��x���OO.�h��]N�R�O����.����6����g�YЬ�J����k��F��O�N�E!Q��[�T&N�Mgߚ���1t�l���#�㷝i�C������BI�U��qwX����ؔ[�lvA2U�ʤ����{^eH�
M6�l��NܿuT�;�׭>訽߫�'�.\��{x˜�V�R2��9W2���~;�q�_GB�TJ�q+�<��ߪ�3O%]I���CS�=��x ��vN�a�K�Z�ĉss}�8�&���a����KV�Li    k��.���X����O�&Ա�9�N�~h|���X����Q0"^�XLQ���6d�=ڡHu��D�c>(�� ��Wݯqr��k�2�Qr̬�&��LLe+=��ªK��{HU5G&��=h�<#H���I`gb~�)�(��ާݥ�R�޵:�'�j�F�ڴ �����-�� m]� ��hT��G�&�!-;>3�9:ݏ6� D�[�y��K��CZq��N�d��h�rT�g\��
u^l����͓��G;W��~(2Q�]ĂI}�ܱ��;�ܳ��S�n�3�UN��Z~nZ��:Jo�iS\d�/��7.�'`�?����+'�SW�堌u.�Y�����U�j����{Ք�3���#C�H	�qPė���P��3��ƨ���
�L��yh*?V&A�����oS�W� ����
lD�Yo��<�J�|���)�0�Bc&��@��*��,<�1��,Ҙ����&\�m u��>�	�+$REnD�@Y�L
�����_�â�*=�~AJ��l&��_�}�����zUl�<2�C���s�Z��ݿs�â��'���m�4�mE���<�fe�3�RN�߶��AkL�[�d�(�L$��J��
��B5�[�h�4˙��童+�}X3�e�ظ�����HC�"�=��*^���5�=��0tT�{ڷ��
��;����➕n��S�UD�Y֔c��5��(rXK��_�i�G�N���"��,*�I���৊�e��&W>���1|�G�FEdJ�0��	r�Q�jD�����V�N��y�.;���f%��i�U�-�$z�Z[5�z�
kg�����~�b��z�VߍP�ad�4*fJ�1��~7[��x�5�'�X�x�a�h��s���	g��ڤ��[�X�C�-aѣ������c���R�B��C�R��X�=h=�`����r,ZT����g�X�Yd��z��`'T��z?i�����ިk�2��F���'	wd{/�?٪�Lrȅ~B�^�M���m���8`TjI5@8�7+~�A9@�L��ɚ�Pc7x�L_�UF���<������S������v�>U�U�/c4��
�	� ���܏��O�����,�"�{\0��)��v�h��u �_�����;�C��> �6C�D�p��Hmn�k]���hz�����5�\���Fge8�0�R��l���Mh�(Wu~���"}�<UV	\���r��\����P�ܷZ�kS����#��?�X/:⺚t��!
/�N��5�I]ّ�����Vb:8}�_h7~7��ib Ρ��O<�� ��j����+&�_��E�D�s�VM����S���1�C �8.�����w��fՁʭfN��ED��a��P����w���u7�:[�sV1�PU����o��F����)��3�X��\-�~��ӥ �i�.�Ŏ�E6!�-*mF�vJ��֌R����`3�lH�L5�ukZ��h#�2g�}+��y��ƕ=��/%�cu�<S��ex�y	��%�3f(Y���Ȍ
>o�r[|�z@��H����&�[_,���Y`iU�=�=�ɏ����C���ə5pH�*���@`J	�LP32�@/��,�-��g��b��Tٔ�q?|��!�ԹlV7��~�������~m�IQC�g��x���cpQ�������*���X�X.�A<-	���u?2N�_�Ů�
l�˔I�\����^7�f�u�̂R=N��;��%���Y�B�����ce�qr:���,*�,���{�������&����4Ύ�Q�*�}��p��5*Tδ"a+d2�~����Og��|���lG%	�ى79>� �8���rB�X�5x� ��v�gJ4Ǆ�����9�l ��Ύ\4Gy��;���;�A�/�zf#���Z��� y3�ۍ8mH�-������qi2��q�䡖 ,��Hib%>��z���&�7}���#�M��n}p@�U�L�hݗz4�I���������ሂZWw��ɋ��4F�O��$�E�)d�y�QzE����K0@�Fs�o���X)q|��i-���ٟ���c�-P��*�j�7̋��y���czo�+yp���`�K�mVh���G�q���7u��U1]ݙMZ/���v�aSkv����Ϣ�Y�9l0kW6L�e��Q���e�td��������
Y��A�����p�<A�R󄅶���ۦgJ��2i��#>2z��ªH����w��l�2M|��S��B�x4=eb�+�#����X��;NfEa�0Uy��j�q�5��-:��N����Lё`;�$�\e�98e�ãYzxm�[��'�����Y�'�a1m�ޡ�� ��{��]�b胖*I�c�c��o�i��%��)�Ɯ-�b��?�W��TfJaPN�����z���3��G%vLL����C�c�͍T��9��""͓A�ߴk��u�׻=�K)����;�}�͎i o�Kj���}NT�<P��f����赪�����������שG�cp{0$(����>@3HL�������9z{���<'%Ą;�g6�sî\�M����}������'���mw	�J������BLP�c��m���+����[[s�q��$��k�ꔟԊ.��Jo�(�s=�NaTL=� ܋ٕ�:1a�IS�OB~��pUj�Ȏ7e~�e�2$�ޘ�Z�� 8�RI�A�՝o�ڹ����ȕ=cMh��0ݯƹoY�T����o�\��+ Q&z
jAWy4�|N�R��Ba�swS���)'l0�J�MƜ�}�
�jb�+�!���Ϫ:�ٹu���G̖�puT��'��/�*ٱqHt�|��a�j��H��xCվ��ġ;��_��X���0f���ȶ��3策�kf4��g>�\�(ɫB+��t�:��)�ߵ)z}�(�˫�U Y�Xe��I��-&����B��Łm+^�n8�e(�+�3q���^g�b{x�J�$E&���}w��/�'��W��j��LT�{������8��C�T��������*�ϗ@��3�f>���p#3��$S�\V�`�l#F� �>�#)�����xM�#tQRf)l��׫9���j�Qc%��aTU����*��-Ǔ��<T���^Y����8�H#4;�j��c(�Rs$+��ʨԲ�%���1FUЦ�{����L7�.�����I
��>�P?�S-i����ZP�G�	be��z�� ��E� �1�*.������z��Ջ	KfS���������O���6���gح�\$6h��"���@��H)ZcUj*|�z�Q��U�eu�Ȧ�q@/�-��PѥC7m�A�"T�,
op��c�������T_Z;�Wk��L�\gl��=B�"҉��>;��Hֵ�'�l�2P����DO��<��&w|Z:`�_<&T�TETB�uB ���f�9{3�.��j��U٪�9L�8���/ݨ[uP� 1è֍�j��zgCS��!��H��o�L��>�a6F *�h��B�p>)���SE����VipT��"ʃO�j��|�^��*h��pDhU	�7SW�tr?)v�3C2c����>��z��W� ����g]8�U�s���N88�J�֊��]C 32�^�E�������qd��B���`.u��>57�E�8Dh�VkC��
�Ҿ�qC1�*X�ꥶVc���G��G*w<��^��^ҫn{�P�gc��͠��=��p&]�B$��;k�7�zp�Y=�r�'�W�Y�2G��)	��`HEq��pX)6K��	��2�����#�2Gx��\NSdF���gt�n]5�#���F���0E���9q}�Ww�O^Y�#����=�֌G���n�D#"�/rƨ
�9��P�~�̯I=L�fg�#��>	0x�c��w�LE9sJ���4�Y�5�%�T��NwH#���#I*�ɱ�{�9�D����{u�<*X�W"��I�9�#�s���ژ=�������L?U����U",�5�� D-ꍻ�I�T�Z��#��b�]*�eQiJ?7u��Nՠ��ӥ����( s�    F�@3��~�?A���t���ĥ�>�&�[T7����Fdv�Y�W��k
�٩:�"�v��RF��5��ib�����1C�!�*ޡ!MM��g>�Q�g��������?Q̈lm����˯7���Uk�GG-|Y��pT���gT��(�zU<zT�{�FU1�CE�VF�Ya�aO	`N-�iS��7�M˨��qN�-�|lQN�ҝ_��۳�?�,��qs��� ֻ���/չ��5� �%6�D�WLn`�rI�]�3�2ڌ&x冋�biqʆ����L�'�ٕu�}Pn�u���@�G������+\�ڸa�t� L�0�y�`mJ���f��\����l�,�M�R�Oun�U^ g��Ța���)FOSؼ���v��ݬ:X%��*��g�O��6h�j�^Q�쳿ՀWh�1t�껺��f�T�Ei�L�'�ts��hw���x��oȾ�ԂΠ;�x �#U����
�����V[�Ľ@A���L�GEl�'	�� ��(�s�a4n����c�'�̪��Qc
�,�>� F\�.��/t� 9t`�Z$e��
h�n�*Do���InbP_b��0W�b�Of'P�AX�۸�O��R]�*7iE���jذ�c��sՉ���:	��q�HE/��3��2�O����$ �m0䉐	��Օq��UV̻���tO{%ي���pm�?o�#��I#�'��%f<�^�)��z��c��)��FB�O���@���������⹧�7�1D�0?�ײ����.�~?���ڟ=腊�2Hx�`���v�m� �P�����p�oT&�Jվ.�F0&{���g�'�C"j@@T�����
��������w��r�l��wY�:�C�(!��Ϛ��I�( n����F���*�%h�HkƐ|!�$E���T�fg�5��5��?�ۻ������r��׈4���\�ض2�ݤ�Q����,Ľ ����^ߘ(	�vԇ0������̨0N_�j��v;�͊{�b�{2P��LE�Q�f��4_]� ����0�Ć�*��@���J�͛9�I@c\����]�8���/�xF�Y�:�W�K�k�<l�e�*
n��z�p"�Ao��Ϧ�N,1"s�(�WAprq�2�.ZR��}�3^�>�ȭ��8��V�}�lo-]�&�,yf�S{�d��,H��������@U����`!��&N)U8��8�2�/j����実M�HF��#qUdN�w�Q���f#<E,4�$g�]
OW����ˡɿO����8�}��W�F;BE��j���''��mq��r���0@>����@��\��d��d��8~��ѿ�j�Z�ٽ>,�RT���hT-O!f���mɽ�F����.M�3t#T�<��il`>/�p��y�����F��y��z���/��� ��9�=8T�.R�9�����큩��<`�<��D<w��~���dc��-�BS>�ή�Q��	�Lݔj�m��^=�j�]A���@�t997�4"Q��ԀGW���÷_=k:M{��|e�ID(h?�m��|�^��Bi�鸲����H�,遖�!��i%U	��E����"��@�0�ԣ��)`m$����BӻmXD��FN_���tzcd�ϙ�8�F��m�����N���� �\-�/�?���N��Vq$e�:_��8ts�1�\j����s;4�?��6�`p���
�C���5�y
�~�nw�v��Nl���2��;��L��)9�&��&9%�>��ߙI�y�;`�h��o��fi���k*�-~/K�2,{���a���$1�(������ʴ�_~2�"�9)���~�ʖͼ�^�AA+��%Z��5����Hp@N�+���F���ڟ�J�DSU^���ߵs�"u��&`�\�F��f���u�+���ol��w�4
��Y�[V�u0]"�W�`F�Tr2C�����i�Mh)�w���%��nT�O�BP8ń�W�'�o��+�� ���N�o,��iV���Cx��#�h��8����\���Ɓ� �s}��C��%��f����{��i2��
=<��lY��[��9�:c�*֨ht�}�L�pB�< �<�?L��=;��iڼ����*7��͒�Q��U�����e�Sz_׼�����~r!eI(�B��us=��] ��)�c�`wkR�����+���<x�Dҭ��C�t���w��=ƸaV�4�P>|������!���0�����d�
,�W�I�`Ҧ��
�P~(2�}�<�uUO�$ 2!�ﺜ���X�TNpv�N5`���:rr��X���s�#&�S�h#
^�ٝ��w��� �\t��%�}1,C=IxY�����N�T�0	%~9�ˈ��d��b��`W�bL�_� �{Q��@���'�9��(w�X/QK5�a���#�7�]�,�=��Z�G�Q�gHn�ZG��^�Ƌ s�U`ΤlYctk�K�f�<H��}�\h؂F��$z��H����s�*�w���r[���k���M
u�K#������B�$�[�w�c��_�rEҋ@(�[��.�oT�m�G�*5TB�8k�p/��SGx�IO�s?���e�޻y]� |���4��j�C�@Y���a���D��[�	������U B�]�ۃɠ�Q?��A�C6TA�[���q�Y�T�֍�V"]�<Ç�VL�-dS-����\��������f�nUU�5nX9���B�-��3��rG�<�<����3��y}�\��KO��G�ߴ4���8��>��D��w����ӱ�Oj��3����j#
�ԕF<U��Pp2���f����+Ċ�2	����v���%]C�B��8D��/H���u�0�B\�j�7���3����X!�0{�Ѥ����y�7x��X���6ڰj�`�$���HG��;�P�S�GU'�M�J�R������8�M�k�YѪ��̂��o˙�ݖ�n�������c:��
�,� S����~��f$S��ʜg�0[9w�躄�
����o&�j*�YUQ�x2t����f�[�{,`������:�N�gf�z�sH� �zDZJ��(���o�ǥ���m�$��&���`�2e��ǰ�KO��17RW�0?�N�@��<,���^����ȆE���~��M��>R:���5-��)����*��� �J�Qd������lVQ�<�s4B��W��z4��ٛ����]��i�EP+�0����\��4OT�Lyn�����N)$��k���rusaI��	:f?\V��Ms1��zՊǤJ���Op�]�����s���G�V�#��,��w&�w4M��UsbE��poL��KZ<�8��w����M�EP16��(�;�#i�n�;��:[�S������u@�r���Z89n`�R���5���X�����U�P��
��H���x�����EE�[�����J���"0m��5�m(���y���ߧp�*D]<��� A gl�W�x�u����Sdj�<F�Гm�f~�
y����E����w|�� ii�Y6����m7x&<kB���Ќ�7�}���/8�9�u�O�P{�����f�&r�I3�m�����=���/��6�zj&�
AU4Щ�vn?�m�4��
�~G�U����~��aX�1� �؁���&)Lq���ud����?7J�+�qo�Q����k�D9 �~u�����p%�̢��jv7J�W�R�su���Zm�
^�e� k�+�+��&Ug��j7��7^��B�ɧ�ĺ��j�u3f
�
��� (&u	l�㤎��(�����	������V���������Y���}�B�bX�}���-lm�uV�X�
c=J�R�g{9o�����<z�(�(C���'W��n`����o�7�g�-Цh�)z�vyϷ�����e�h!5=�E!S���)������[?Y�ӌZg���teJ�%�:�V���I(M7�Iq= ,��̟ \ŏ�`!���z]��"�-�2��-��U#��?���*��T0[%���%�����SaqV1ODG    �0���pJ��ݲ;hi��V�t�z�j����t�P�4����T�Y`�P��5T�E
m��)6Y%V(!�F��6�y�\��-�� �~�He5�y66PI�p���-�`�حP_�����U�\3�ج��/���BB����E:���5
cC�G&����!!u��6(��@�����}���f,� f��|�E��cX�����Av��&r��y�Dh�Q���r�ƣ>�Ͱ]k?-Ke�U%�/UA��d43o���� =.�*�L����F�[�y�N=`�%c�/Ц��cPɥ��j�Zs�Y��T�����%�P��W��ؑ]8$B���\y"�Q��Jާ?�6�4/�Ȏaj�H��&[�F^5v�F
�d� �E2ɯ;�S��rsu7�v�f�����o�0ʭ3.�bF�
߶w�T1��&����!7�ŏ�z(�ݮr$D����`�'��dR�eHh���W��������+O�B�: Uu�����M���!�����
lr�PX��G�Z��1�Ő��jHټ5��ϗ�-�����=��I�,��,�3�H�/�5x���0-G�l���X��E�E�붹Q	� �)N`Į��Ԋ	��6o9�ÆǯJ�,��a�w	�a�{8��A�=�=E���<���2��u�{����c�^���<����@Xf&��S6��m=����CEQ�Ȉ9�gur(�%]�K���.B�@�	��������ς�5E��B%�IT�m�s�F�k�)�W��q�|�V����2����a���$	z�ݍ�a-��{�EHm��7
ͧ0O�Rfw�;���ĥ������ŶB�?����'�����~�Yu�a�������@D��1�m=�����W=d�osJɱ��������fs���|��~g��xY�:<J�=+KE �)C̚�"�tjj�朽�}Ĥ�u��p����bW���M7�{�������Ҿx�$��L+�c��nМ�n�||�vb�ˡ��@>��Ps�;���͏�I���4�)�a~�Z(�F��f>T}O�~�c��R�㯾w.�In,�G��A(��<."6�X�ZgPsĆ�K;�dO>W������,�
^m�=��1xb�w �P$@��4�ݗ �"�L��Q#���!ϻ�ܹ���}����f�D sK��'� *-`��to����߈��B+�`<e47���T���3l*�vj��>ua� #X:���F$��.;�˛+��A�X��P������m��G-�H:ee��t�-6�+�]�x^���Q"�r��|n7G:tIŶ����:���aL����	+���ܘ�E�;��?in�j���^70��)��c`�hG�Kv�����^aw��t��X�F#��Z����*���4>��Q�rGa�(9��������c�Xl��%��No+��������&&e��-��#�+�1`@8d;{���yi��?��w5J��$T$R� K�R���O��Z�}���>*�Di�[e��D�	dqR�y����ٴ0�dڗ�!tV����2�z�	�e�&�iU���j��u4���6�<�[G�������e����]��	�*E�l|,bs�3����.�"AV��A��+���s�%0'َL��,��+��}����:��ۀ���������6�w&�n.�_ua$EU*�G둭�7�ruNV�R�!8h�*J!,�&�`v�ؙ�.j�K����:)��h�8�B�T�ػ��B%��D��)�[t�R�_4�[v�)�O�-LQE��m}�[�cD�T桄S����<s�Ƃ�������ق &y�܀D6���OԜhmhT�*� k�#��)���e	Zc�o��<�TgN1^$z$�M3w�9��aY�8S�)qC�w
��yk@�J��oY���D��������4��_;�����H�j�0	����p��ؼ�s��~�I��
䶲�5��H�F��_/��$�,B��z^`�R7v�����[�O�Ww������q�����|�h�ښ9�QR|�s�����(�$���������sGH��y���j@�)��&sj��3hɂ����a�w�9	1�L'���-��׸�쥷�޳��O��U�:J��z�H��}LG�H�����%��i/���3�U{�[8��}�D���ı:�z$S���'	�4T�;���Y}��yuJ��$:��G��V<�Ϙte OЯ�Э6Mj=�Ez�$ՈY4`��Z�&���\�6�#�̾����v�o���,��"z�T�*+�}����32͢uK|�bm��K�{|�H
�,I`|�I������m�[��GV?T(��w�&F]Q��6�B:�A�6h�������id��&�|���;�`)�׀�(-vu&g�f���Tw���.�,1�55;��^�w�q�(����G������f�jF�g�K���Qԃ�s��|��>(�ܡ</�F�����>X<��'!J*�>˛�ʴ.ٷ�i���\E�ί�8Q��no����M*t�U��e�j��)|i~YW4�3�}{3e���Ǭ�v:{����i�NK�[��DƕΫ(��=����̺R�m�#���妰�05Jo;�X�3全ϋK�j��	^#�-�,i��E"g�<`�zL��-S��N볜4sS�Zr���խ��8����-�6�3U1��X�����7�N��d�p��-�U��c���D�5�J��	�3��$��J�S����BQ=�=E[��9�>�<��N�ʙ^h�'��;�Q�g��
��͠{������>(�i��߀���sm�S��ͨ��3��5��PA���{]1��ؐ��j{a�aC~4m���Go�n��sZy�Y�t�����BI�֣��'0���t�����][H	j�T�(��]�zk{�ظj<�;�_N
�[�P� -����G��q�*$������ID������_��e��=�'�6�׵^�{:@.����.��q�v�ъB�\�#�B��%p#�*���7�����E
���\���O�7-íi��oW��h�%�^���D�#t���^=;���V�͘|�I�1����(�U�׳�?`g������m<�h7q�D�b����26�B��bl����¶6�m�z!?�*�je�z��E�1���	�{`:���ҎOzj��!~��!��a���)hP�l燬�����w�_]$̀�6��rC��[لAq���M�?�w:�E8,��Q�3l$�u�	#�0���D�7���ӧ�!��#�'1캞��0�De���
�r�Xy(������Պ.$,��恧��4�%W��F%̴���u��o=��q�ׅ�:�D�����R�D�F�	��7su �X��W����rǈa�^��0?/�F׆ߌ+��d2����ϩ�Kb�ר[��F�e�Λ�{gѰ��t�Kj
�� l�X�����β�����1?���W���=��_�~�]����♁X�>�>&&y����>����f�y�ށGV���,�����Z��h�c�O����y�`u�A���z�
�`�ݙ7��{'��q�����S��
c�v��~T=VY���_����OC΁!j?}��%U[��h�*����Ϋ� l�Lo�(59t��P2cV������|�m�c)IS�ݘt݁�����)ѝ�)�����)�A��	���Eq�c����=8,�YUe�����i�o@T�\�70���q�[*�A+�n����S9.�BU}n���bZ��ӃGe�!��Czl�.��l֛�gt:B��y�5~�����_��a^�O�e`Zn׷��@�Vγ>�?����b�Y�ηW�q�X:�I徰��������F���懔���y��x�N��p�T2�E�0�`����MDbC�&C������� 9b
�U�O��W��a�^����F��Ռc`�ӹ	�Ʈ,P�օa���I��Hs$�Bi�5g��TE<>GX1����:@��8�q�HI�R�{���$| }��a�QӺ�E�"�=�q    ԟ�]���Z� e_C5.�����A����v;-����HƺFO�slQ�?���W�=�۝A{����XK�IO�䖡�V�����3{�\*H����Y�׋����L@U@ܝ*���Xי�id���ם��5*��
�aё��%>t�mw_�h��8`	KP����Y�~�}��<�1��0��j꫃��"%���w}���,Ra���>5���v��߫�6I��^�hX<B�u�ᜳ�puЄ	�_��/���!�_��e���L�Q���wXD6զ�;܉��d�D6�X�5���n��	~-������XT�Vpv#�%��R�(L6˂z~��[��B�,�����e�C��R���Yg������2������0�� Ü_f0��M`8�O*`~5�������6�r䵓�e�ޗ��E��	|Xb  ^��F���A�N
���W��3������������U�Fn�8�ahЎ�Q$.�S��`���2=��F��#{���$G'&���[���.T��fE�Y#.N��d&��^���J�����~�����u���+�II )�2*jXB�n�(f���/��ҡAU�!���8������Av���MU��q��MO��E\��e&���DU������vfC�k�M}#�+��a��?�oU�3]4W�;5�qa��`U�Po��W�<��C����#H��A|7��a-����S?�63�RZ�t�ȷ#3q�z�l�zQg,���bkHX�ݲ������}z��g_��.:�����2?�_f�ۜ<w�m�ә*�pg���>�i�E	T�.'3������*����닡r@u���u�7i������Ui2�t�k_RO�c���t��l�բ]��_����:M6���0?�֎r����`f{=�c�2"�89���j��*�3�8��j {�+Ӓ&�V�7?�4�'�z�����hR�X�f`�&1�j�$cD�VHX�C��� ��k՚/��FÉ��k<���$8�.ou��~��ߦg�#����<�.0R�5*-�9!��ǽ�w��� z`��`pi�B\`��V���3�W��0@��"��!���������(�G��K#��� t��i~OEf{��I\�X��v�w���Y��������?���l�D���l�߀�*�ިf���'Y�l����d���yjl:��!�e��We�|��y�rm���=��L����j-��\��<t��k�^���2�-�W��j�ԛ������p�%q_%�N�D_�N���4�WY)dN��d�c�Bb�kC�?'��~���)>&�/OY�f��^��^Y/=�#peyŅ�}UB�mW��O��d14�w>
�9�c\}���S����bH�_�v&�r��v�wbZ�h@�kPL;��I��A��J�N�Z�R8y��U�ܪ.��,.�o������>o�]� �gAfa�Vl���:6������l���n�V�a4Ė�s��UW��|Wc� C\��Srw1��hGW7V}���o��B����Dpa��H+��*ô���IykseYQ������a��?�>dF'QY��0tc�5b�����9����J�az�U�;Ѽn>4���qZ{� I�0L�k	��rq ��5���d�]���Dc�,��@���r��s�k*}�l�Sۿ.����`�G�^�wf���m^t����+�Ir� �*�	��s3%d�ϐ�G�w_�?m[p���"�z�Y ���.(s�Wc?���a�?fM��dy�`����>zo��j���N���$����������W�P�����k���wX%����������]>����٬��:�HIeca/�7n��Bࢧ��ws务�W�e�F��\Ü�z���a�XdIqDV��7m��ɇ��)=�4)����A��*xc������i�ss+�3[8uI��z'�NW�9��`V�#�Wwc14(�P{��Õ�>K���j����ƫ-��ϑ%o�)b\�m�"/_t�]�l�Bt����|�<��Ȳ�����9%�����?��KUM%f��+ �����
�%Worݭ� 1����[*��p��*	>8�'jÇC�#X��)��P'Y�n��>%W���`0A݌h
{n�!F�֏�6�{�_�;���e{��I{��Ub�&_�M�vn0� �������\�z���Ι�ĺaQl5'�|�O��F�L��f��|0�5�"��)t�U����굳�����q�ٖq %w�^�k���z-�5n����nh�|��Ya�5�7+U�5>��sV�|2�����=^��� 䐌h���������>��f$�Q`��R�-"%u�J�rq�~�6��&?Cb�$�2A�m����A��p��H��]07ʳ@1�_%#�V��1}0��ƗQ=�z껻� pz���*���I�����d���ݦE
��£����J*jUs���P;P)��cu���M�����i�V-�ߑ���˰y�Zuw�(��91�}���
����_t3���Ԅ��FP�ѐ
N6l��]���(}||�Dy)��)2y�������/u�A���Ꙝ���]!+n����6�X�1��z��X����V�G����d$ٚN�M�߲]��MKwEMR`8�Os5t�}�����;#����F�-�"/�U�Ӭ{==5If9�G����Օ���;�+U�+"�U�i�m�T������txߵ#O�D`�S�vQMZ����i��r��l�[�>��Q�̀ա)�:���>}��bp܄Uq������N�<P�j�K���FD��欯g_ڿ
����Q��(��<�M��*.6*!�b{1��=cݰ28�u~��a��k���1m̊G DghΝ�_�ke�I,?��R��T�c�J|�^٨3N�fA�g�a�&iZ����W_bV�S||�T�X���-r$��������Qp�cilz��zS���ߙ��(���w��^.B���֋N���+����n��^>B��>M��>V Q��5,k���+uH���r�Y�3�C� 5? z� �?�؝#Z���(HK���i�Z_���<5����M�,R?	xjL�g�J�T�X�@Q����Tp���0��U������`׺�l�<����T��K���W���.]��������h�>{�viՠ��6�����k�9]v��Z��g�E{�����u��`��{��z���F�8����^��6�P�Z���t��Mi��r�����є�U�H�8��cԙq��n��M��'W�����ސ�t�к�i�F��/W��@/ss&Ő�G��k�E������I�giƊ�o�j�����՜��y�Ƴ����YY��յ	�S����X������k/x]��,�U�S�旮��R.�{/���e��x�d�]dk���5��gCի��3#u�����3���y���疂b�\wӿ�N}�(R���[p�g�|a��{H�&������h���B��f%ZV��e�2� hM��U��n.6���� ��O�/7?�L^�n��j��`yXa��
K7[U�˰йj�LvJTaU5�;�Ï��̘��3�K-���o���k�^9Ҷ?<�3��2K�6ئz����^�u�k�~�lV��ݽe;{s}=oܡxAFNA�2C�Ϣ(���N�|	Wq^O�*ƀ,�0���>�_�4*i��D��Q:픊`��K_����S���S|���-�yi��5��J���ڐm(IƳ�v1b�����T��PT�@�a��rf��)$\l^�0��9vi����k�=r��p ����P� �8W:�p뾌@7O����Fݬ^�$`l���W�ٴ���%���pV�ʬc�	�hdE�,��O_+ִS7������~�텱1�pF�O�reŴZ���>]1�~E�ƁqV�������?������T�|���k\l��ī�a���=QJf[����X�c���Tl�N����3�7w�r����G��/���_�x}�v�h���s�&��4�~ֽN��cӮ�[rH�+7E��=�y˫Y�j�X�{ƯY;    �����خ������R���R�pM����ɟ�ʯ�2NX�S]�wÁ=��᪀���89e�\�3�V_�\��۳H3Z'�$���C��R_��b<�݃�L�L���7ӢW�w���\���a�X`���Hf.2��06�Lf��7���e�Iҳ�w�ν$�o���C!�S�7uѳyW�P�G����I�����;��%KS�����ct<��gJߥz'#����_ڦ� ��I�u�}�`���~�=��D��/Jn�h7�/�FV�kBFe��%8�W�:E��l	Ƣ�{���cp6@�8Fs��wl�=���\��u;���2����Ԫڎ@�5N�й���T����2d��,Z�)�:��D��]��(܄Rrx��+���QP|�f��'!��Ò�l�ʜ�����9��ׇ�s[YU��Q�k��g���멒�-�Y���}R�مK�ZȞ��^_6H�Y\�ł?H�`o
�YZU(�����.:�@�9K��b���S䁕$���.W0�u��ARZ�o���$�4�,��:�+zw��C�D����f��O���rU'���M*�o�v,�ИQ�@h�*/�H*ᩞO�B�5^��J:��a���Fs�]�k�t��R~p�u�H�a���k5�4u�0���f�����A�n�^�����Hj,թ�U8��V��T����{p&��+J佊��ze��XT�|2���Ҿ�lQ��=��ٱO
�%rTjgJ�[���zsۚ>QPD��"#���D��Ɋ�z):#����e�Y�Ȑc, ��/'f�6��A�|5֪��ɡ�����5��m���pÚ�'��V98_Ҋ�>����J��q�ؿV����W3�Za�VV��vzm ,K|V��+1�jq9�{�B��0km]7QsvV{-¸Q�*�*�^Z�A�{�F�3|�}�w����j��@DG�\�j~�-%u���eE�P�Ӛ�;����A7��:A}��͂��@M�V�Ū;�:w�����a�f��
��у5Tް:	�Nf���ٍ��9��,*��ߏx-O���L�a]?�l��N����7�=��O+�W+RT�bdc�#_�^���{���`������e?�S^�l�n��� s�nh�$���*��s1෫*W��|N��cܛN�G�L�R�)ΔN6��)�2��W=8nO�u���J;�2�s��4���g<��1�	g��?pcǐ|�gPnx� �8����@t]��r"D;�S�T?l��:�ym!�@�H����ٙPJ}�Г'�@�����?�ז(�@�e[�^ߌ7�Q�ͼu�`Jj�bz�ae�nh���;n�s٨�ۋ�6谂8$f���K!�Z%��~�>9wv fU������`�Dȴ�g�.~Y�.yf��a�SU��mހ\/�,<yyʘ����W��K�w��Aǋ��E�_��n'i^���(�0����)�h�A�v��usg��c�y�X9&��ߺU Gz���%}f�F��7��4�h�g0 ,Oǁx�( �_k�6���G���=��رe`�R�5�f�o���t�}X��=(f��z	�-/À���ڄ�� �"��F�>��QL��ĽB}m��+�)���\���/��:Shx����J6[����6�SNyJ�0�'M�K�H��f���mutwh�f�5���8��OЇ�Q�������Ԭ��N����n�$��,�҈dLc��5D�{*��;���Xr�P��[.���5�t���t[��?�0a��9�ŷ D��/k�p��,s�S�=P7���g�C���#�
�PY�lsw׮���I^A��c�D��1ً��b�Ku#�+�=7 �ɧ�ψ{L�Sv�8����<v]��}��4���F;&�;�V�����GO,PCt"lD*����#V���On=D�h/��:0�����i�%��_��U���n�P�}������Z�{<�g(H$X9�DQAR����vTPN([G�;�m�U��;�/������v��7���?T�:_��tF�ܕ�Rն��=z_�bh� ���7��eU�����[&ũi(�m0����Y�|=�����:���I��_�
]��ޝOy�T�J�q6�w�P�B����68�rg���} s�­���۔%�������-h�.3�fB�g�ƭi ��^�����:�������s\h�	 ��^��<�9�R6�2e�>��$�ޞ��]�)�1�1nk�=�owg縆��F����rz�h&�����KC����Q��Qj��2Slb+ݵ���ߤ
sǔq�4�ߺ�E��J=:CS������m�9��lJߪ6���HL˝���_,יz-K�����=�eY��'(��&1��!p��5��Q`.�'H�5��e7�s�-�.��>P7dQ��c�>!^�y�t�	�|ޔ�8>뎼��V
G�>��&�p�d1��h��Z�$k�G�͆�@�����;T��LUB�C�l�9T��;3��CsN :�
�hQ�ď��&�^>��^�Kt^Y��B)��T�@����<p�t^�|)����i�R��u������o3k��l���4Wt�HȔY��U'���rv�^�&g�/��t��/���j�V�c��CZ�>f�f���b�VL#��j�?m�������.b���^R������5��٣�:~[@:�(�0�0yp��+�n�w��y*���ݪ[�Skd�Ϸ�v�i����)��$�#�e�gIf�o&����nN�of�W�
�L��\���4�t�뽗Z���
�� ���r��Fa �f'��ɲs��)��N�2	M�k$���0�8b#���J�)�g����D��wp�ӛ�����""E�F�����2l��*R�J��%��0(�j�髢64[�����`�IQ0�/ ��� �pzW��i#z�n۲��m��9t�S��E�P��ө-0ؔ���댡�4���Ce?ڐ�[��>4N����ի��2��9��[�e�mG�%S�T��G��;�dL	�����.z����i�R]n��-r5�7K���T.�>)�f*_���[��� �&���H�����D��q�u�N�!g�/!"�n�q�h�L@��݅��g�z����s@���&���mk��ڛ&��YeЫ�\g��0pʱ
��璙�,���/N�v�.՟�j���M;��#��"�.��	��n~�X��:��[�b� �tNm��J_���+���{'g�V�{��&�w`����lp�T��j��;���.ȫ�pbx�c��}�-7�"�e^��b>��U5S�79b��]y�f���Sj�6�,~��L��f��Բ�*X���X�V���kCD`��&��r_a�Ę�&���
p�>1�~�?����릹�w~���d��
��X�����b���f�5�1�n�s��3��8�V�2�ΒveRUjU:��q��J���1D��7�]�|� �\����=��/q�J�����s��0��'"�5t�L�|���z�T�bKlD&�j4%��_�{�?u�P['�bO�R:xE����]=t��]�r��ǧ1�J�)�=���>�k�ju%�S��+����y��֖'mz�p�
��B򹾮�[Tv�>�v}W�w�ZӉK�p�������n������f��>���~t�N]�zy�,ց�55okӨܥ�eg yb$J���΅A�O���iK@�nİ�7�LK��C<��d=3or���T�8�]*�ņ4�=̕X�ڟ-�IioZ=F�q�5���̋���3[n�Z��1�*xae[��)j����H�%D$�M�V��������]}л:�H"�����:1�`�q�����%?g:4�P�q�0&�dɘ���+�[x>
} ��Mr��������~�{�dbn���<$�<\��H|R<����W�����>���rB,�TfgF�D8hvw���ܶA���vX�'�3�Je��vZ/���t�1}�*"u	���50�0���$��[�(�_9	����B�9 ��C���3�W�/    ����f�3���	r�-N�2���h�DHѨ*�������WkC��~�ib�J*S�j�(�̙{�<Ζ{؉h+R��`h�����wE����@�L{��K�ª�������ǀ�s�\�;��D3"@�)\������[�<�dU=T�1��r��R�s3?^�+�����'k`����=����
+�� �*����,�����2����g2V���P'�4V��?�%�)p���Z���jуB�L��2������	�Ci�%	�/P�˴H����Z���HZ�	��4���t˸�!�������y�C������%3P`�U,��Y;5j�+��]�G��V6�?���WQ�d���qe~���d췛���hAi�L$��"SñޘM�m7��;t"M��(������ۉ�#R1�� ���իhu��KuD�6xM#wHb�ș���	���Z���sUC��o���¸�TQW�K<6�t�tM��2�`UR�K�a[�w�9�$en����|�x�ѭ6�ѹ���1^�>V�O�̕ى�eV3��9R�qG�ty�- ��x�䃊��,݃5�0�[o�㐸�T�!�PGl�y����	�F�<-܄~_��bU���L�-4fK�?o0p�)�+�@�%���f���d��]kn_���&|�p��~蘴[U)y��O�lЀ��bƋX����v�/va'-c��d��6��W���Qԟ=�(�]|����-l�������P�

��{6�>k�_h��'�W	S�a�ƀ��YsJzXE�m��;G�-��[Cr���S;|@=�銌K�������v�����h8�����E����������+SE �Qm}���[`W;�E���mtt�ݲ��U6������v�g-�zYm[$�]�����E!m[���랳��pUg-fU^�02Xl?SDVQ^�8�7�d�/���^���T��0 &�	�I���ϟ���(fe[l	��F�e}��/Rra1���&liB�ex���H�0�_����)H���n%�*L�\��bk��g+��UF��g�h_���g��ڦ�fR���|�mN�%����+{�&l�2ܴC\M	�Otq��FZ/�=	0؄�\�2t��qP�+'���KF-�a'�97
̜ST�*b�lk��K�B�V�C�Iݶ�5�ޟ���D�>x��A�܅T�
QK�'8���L`���z�1y�}c���Be9�oy�����_w�A�暈�&�i�LRΑ:y!N�����U����0-��P�2;<@����-�R���A�I�Yg�7#\��4� 6�?p+n�12��-�*�S�P=]o�N���(zof1��[t�o~y�"��1�uD:����&ـ�nFf1{@�Ƥϳ�X���M�.��,Hu�߭f���w��	�����I�XTy�-t �B6�������	L��#�\�?P�5������:v4^���1�U (4\�r��$}9URu��'5��*_H��ߜ����ÈnZ�e`5����-q>BT�^2��
|^L��&�K�2�#��Q=���i)����&��zm��iQ~��S�������'��8��9Zef��fe��[s���#���Ю��ʊɱ�w�p�Ѓ^��h���Y?�R81EY_��o'�"��Ħ^�[�d��Wd6/����f m<���qfiЫ(F����H@֞,�TU�D��ă���&i�a���8ρ���o���8��?�*�%�����ov"��м�<-���z����m+aC�(T�B��j���:�$g d2U�����26b���rH�Q����n�:���W�(��n��y�C�yI�X��/�Sm�`�������`���;&e���H�mm���Lz0���.��Ι�q;�c-C���;3T��Z ��}k@���=�i��y����T�L�(r69��O�� l�Y�to�jZy�#^|�p7���~d�]f$agUO��]� Y7ɻ��1t(��--s�����.�wE��b�p��댨o�}��M��U�����(��"O.��#�K�S-gY��c�m틘����nlR�m�+��4qz	m���<+HUK�/m�k�� HpY�:$�`}��4�^b���V�Q��v좫����TSȶ���0�D!���ty�y�V�b4��҇���ȍ��ĝ|S�+H�h+��И;�S��\YD��!^�Wf𲽥&�W#U���h��_>��ʪ��WA�1�1<_���z~�,���9}��L�}���{TR�U��o�' ���>�����ja��Q��A%��Q�����F�@cȘ�4��J�@����b��x�����50���{�.�Cڨ����{�5)�%�.K���W��F'��umdaw�NHdY�S�Yw%���=�}�Q��aKo8
�@0�܉Ѵgw+�b��楠x�)r9ͼ����F9�_C�rk��)%�����ь��B����/�����y ������hS��6{L'&�7��ɇ�/F�]:G0�@K�Y݂2����ݷ16�������:���F'��-C�]��c�_3:����R��zb�E�~�t��W�6?�8�����J����r��J���U�����<~��1{��4DS17*��.W:Z��:��/ RX������W0����a�I�P��i�.S�g�V�Y���C��뼥Xz 	p��f�p�����ʱ&�Jã��u���N����;1w���Y×��'��6G~}���r�(�l�]�ZZԋ�zV�M.��P/�QU�}c:�n0�0��*��A����s��ןlX҉S�I� H�Q8.����#� �Dd7Sr�^���<DD��1;ؤ�`�5�+��q��~�E`��^�LrmY��7�%�"�	웬B�++0����+�@я�d!�)���3�6�*bq`1�~���{�^��K��o�~�sc���I�Yg���Bc�D���{�����E������}�ЀS��QB�I����8d�3>v�l�K����f���-� ����gx��k7\���z�|��=l��=[���T�,�8�+	��,��L:���mI��>G��iL- �F�o�����7�;�d�+�s}ʅ��l�*�b�Hn���tZ�IZE��Ûj豑3��ןjmU���r6�B��0�w�5��m誴0l�Pے�l��@�M���%�;#��f�o���N/<��σx�!�o�N)*�P���a� �Ko�\��M!s�b���ӝ�u(f/�������If���9Y#9e*�eh�H��rx�RU���O/:t�.���pН��^�N�˄��ɴ�5Yy��J�-}g �-A�p����w �,�G�`��J	���J��d�X���a�ymF�U&�*3�V��fЃK�zpB췆e#��E���
��I�E������ɗy�-Û��t�sN�H? ��5��u��[��^߷��l�]%)Vʞ�੠ �J`��=�� �:Fw�� <ƪ�jm�+ym� �V���
+�&q�s�Wd(4�*�S�xmx鯋]��)C��T���=�5P�d�9��H��F�˒,g�f�y<s�m�}�zyq�L�P����h�M�������XSTE��7��qNN����83���̺ͬ�P*��������&�*�󆽿W�5w���^̷\��*����~�Wu�k Cc�,�K[�4ww����6zB'��Ճ�M�4pd�k��z7��DmD��"+�GdS�����lFORi�m�e�o`|�0�Kc��g�{� wJwJΊ�j��ܵ ��~��#�i��2@���]����V���~6K3���-!ue�j�[�u�������(K���{k�%�:���~�{���',����%������3��t@�֣�߯����6��9e�v�J�M�|h��P�w��Y��1?��J_�#v2���)S11V�e �:s��ʉ�����-�>�q��Rɒ8�������/�@���qA���EW�ߺ���$���G�ʮ�C���e��y�>��x    N �,<�u�=���R��٘�T���v<6��(+u񃿺�dA������f��2%ҹU�Z�����eƠ���?��A�K��4�rh�E�g8���Ǣ3.���$��h��J��V|noo�KvL8�ҏM����{���yrl�l�Yo���*�jjN�i�z�� �c�C��oPgt2ϝ���(ʨ�J@�'����~�A�QUZ��om��:�(��λmGFwO���f�7��J7gx/���X��E	G)I�z<���iso~6 @z��[*FR|�LJ���9�P�;������d�|cY��`ؕW[Z��Q;���t��"�q�)�|b���ޙM	f�H;�0+���B�޶�1ҹo�prr���!�P�*���\X)��֪Zj�Jҙ728�ih�!�$Bvི	�O��q��xF�������~�Q6�}�8n�v�]�0J	YI_�o�G�W����PEX�-6���}g�>l0l�:L���F[}T@Z�"�1)Z]���j�*G«�^��dz��U���I��eA�Ʊ���"�W4,�����/� ��mas�����Q������AڝpO�ý��2=�e��cP��?<I�;"�|� h��>�;/��~g\�_�-�"�l��^�ZD$K�s��*��@^q���b�bN
&[�pU��c��t �
+0	{�kP�7�i&���Uee1<�Bәu���7�QI�ÍZ�3(���
�m9�']�y�9�p
�-����ﮮ�v��v����!�'�����5�N(v�?�`;\-f*VOf��Ҿ��H��,��������f��YY���/B���_�VUian�G�;�TY�q�l��h=7�K�e]���qBms�!��f2��-�X���32�Y����/�E3��^�5D6�W�Q�N��u�)b~mfw�22ѡxj;�#����=+_`S�J�dV����|��c+�{E�Ѧs^�Fh��0�p�>Z>�2Y��v�PU�����v\�O����F��=hzR�1�x�������]�ƽid���6�z�9h{�HU��u8����JsO�������c��s.m�5��*yV`(3��"���̍�+�*I|;q6Ҿݥ١;�A�I��@w��yҕ�Z�,�Rxs�<`��C�>y�P}v�.;=�2���*�2�D�;��εW�����}���W��ޟ"�I�`'�z�������?|u����3�wצ�
Ӓ�!#JB%������[]:�!�b��Ge,�s>�g�Ws�j�-�G�(���.���[���C�Y=��(����"�h����+�����e��fa����u�'Pң��.�5�]��-�_hT����������(E�.ܓ��T��`��>D�ʇ�5��R_�X�z &�+c�c{�����1PMF���je�鸅|�l44w������\�t�^5��X�>cx����B�m}M��zE�y�i����ܨ��54����\���~�D����D��F��gcW�]]��)��MN!�3岪p�������R�������V黋�5U�G¬*T���O?���o�2�?���G��2t�p�g��R�!T�2�����Ux��Pݐ����5-y���W��/�{B��E�G�UW��*<ϯ�+?G5�Y�'(��N%�塗��7��Z�Ѩgy"g��_�����������j���P�.v�|��O��A�P����I<H>n�{�7q�W��Od˙3��1�.{�:O�#?���U��	��ף �q�O�-m�*8lPP4����'-7U����\�>�WW/d��ᚧqZ��?� �~'Qn���Qn�h��@�pd�Z%Γ,/7��FkX�\_v����z��I���h�uݲ�W��#�3�E�QۑJ?��H	#p>%�7�����=�BW8@�zϾ�Ig(�V�օ�ޝN�� d$]����|��f P�REVZT����>]>`��Y(�IY4V��	V���I�����99I� U��LB��EeLʣU����`���h�z�V�d�h�0dP��}ml���jy�D{�p8dܗ��tD�̌(.���R.�hi|ER&=�� C���([L�jɦ�PUôp�"A�F�*M�ƶ�/c�9���+����&*A�ї�*��Y����[|��e(2�FE�d�)D�S���������z��L�QϽ �"O��y�ⱏ뛠T+�k}�7n$�&P�'�.h')%f���0�*�`_���D����g!KU�˒e�}��.0�f1�5� �=�L����uHQ�^O����bf:W���YW����挆�[��#�_�k�l��M�?Rp&�<& ol{�>R%��g���2>h�i�J�y��Y�DB�W�T��z��"�<.Kl�O����2ȇ�˯�g�B���^G9(*Q��a������b��f��r"A��w�jT��H���$3�zx�f:ڜ��Xť,����Ng���>�㴏�ڑ����>����5F�p����0��iP2�)6E��I:�/��G��ٝ%jaP����� jٱ����=�7ʩ
Tݙ*$�Tx���� 	#:կ�B�8�\�� �*���3��)�b<f�\�g9���J��}:8��M��8���{K�]�A�de١�1�ja�U�a��p�-��P��P}d楗T�tV��|�[j<�=m��Q���V\ �[��$�I6w���Eth��x ��9��߫�[�))0_��ӗw���Y���)}�Tmf���(E�\i�w��:���,��
N֍M�V��J����U�R�;�cћY����L�&��p�2D#zz�?u3��6;F)��k��o����U��;��G����Ne�i������Q�A��]m����ť�(�%ZigVũ��]E��T�@���( �akO!8���8�/Z1�����/�:g��(A�蜌m�*=��h�Oy��+~2G0'���=Sc5E�i��Q��T�O��+�\.4��̬%��`Ƃ����.��d�my��'1�9_]�c'�c�qWX��JY���ݕ�����$1����NUάl(��������������y�Eς׋������j��%.!T�fv��&�$Bz!�����M�����:W=�i����e	;�e�T����H���S����=�j㧠ģ6����fq��0��K��_o�ܦ�J��������E�]> ����<|�v���[2�Q����^c��ԇ�m
T%
��/����&;��Q��VƑ�>Y=���n��OZ0ΧE��ީ��E��tVM{΄�O�Of�=(��S������\,Gj���F�,�흴Q��"�ejd�}ù�^,�F��O���UU���f3���9�RNSF�*`��iŐ�J�(V%<���P���Ut3�v7o��ق�jB����G�s��mfU���p��ZGH|1}�'���Ph�d����s���E��vt3�Y�d��+�����)(a�s:�G�wԹS��y�ؘ8�R���e�0zq��0ƛ�ӓ�J�`���u��<`Ћj�
�A%�k�%�1��r��8�}��T�ү�lec�c��&���
�o�|�;E���@{9�<{���*'�ed��0
��T��{��f�u��pRF�Y��6�]���@&Q�����0X�R�.��KoؘfŘ��4	>?�w�S�⃐2|-�$	���?u`b�C��z��r#l�ݪ@U�@<N��e�7+
Ф*L���潐�� �f�V*<$��֪~�`e�KW�l��X��/KШ�����~V�wZ'�n�[�(E\;$Y\��h��9!��6��Ð�~��Ք'[�A򀩛�S�T���oQ���B�4�6_f�������h�k��{/@�1Ձ��| ΧP��ي�<'3��s��ưqow�f�����vV�tS�{b�]ҧŘ�>�H�zP�Q�X�쨾��C�
݀\}�S�z�bЎNK<��U%`�?6��v���7�nXC���    ?���#�C��A�~�zt����|��/�1|�0*Bӳ�Q��я��_-ݿ�T����܌�w��%*)}��JE���)�����=3o>��ߨ��j��1 �:��/x�Zv��-�%Vd'����+��B���X=��GJ��~�9���9U:�w1��\�gs~��H��Z��F�*�� 3����r9�%|*�	H�\qj��<�c������;�s*�¨��͌�sZ$��^�n���'��@	�:��x�\��+}cl��%�\?�1ʂ��O�Tf��K�F
�n��J��B
`Q*HF�����c~ԙ���b��ʔ�����e��GH�f�;�'�7�?�_�{ r�(�+�UIO��Mify�gv˯t:�
[^[��^M�1��jw~����L������#)��b9b2	B4����K���V�����qy�e��X���J���^�����З�+������mӤB֞12���p�۩C�����e���4aq�?�/��.&�����>n�Sn�Jz�旯a@����B5�;]\�:ֳ�)�� d�wǋ�;{r6@ �Մ<%5Ņ�g��:SW�?���RW���Q��ib����N6�v�t2&��Mr����Mc��b%u7Tiy�tU�YL`T��4�����.�6I�ƜI�)�b�K�*�$I:��~>�:`'�' ���M����3P�R�\��+��9�yX��A�ű>�W�Eu�'���ҟ�(��P���Il��hzg_ɖ�GT3@�W��
�^=�(���o�'l8������c�D�r+sEd����Ϧ���k{���DB�М0 z]@zPB�a�)�>��!k{_tF�@'� �|_6XR��,{����,tԩ��捱�� ���K�ZF�~>C�6��J̛5�ÈB}����_} �?�T=�qOT@�����Nq8  eo%9�B��p��"cc����B=@�?72�.�D���
3�&�Ν��y׼�yuZ�{����<>�O�
��6x[��~~�����IR�4<��a��'�ȕ�����Ҍ��3y!�A��T����U�����~5Sk[����2�=Q*�e�	�B����]�d&��x����e���z�a?U���h���Υ"����Y D��-�7 p{i=�T��a��u`���2f���*U�~�0Z��O}i.�l�i:S�;e!n��nF�t�+�,�h����A�!�Fv!���T��T��Yd4�1�*L��8Ł<.&�3w�$ V��kǩ��� AC�y�|����L}�u���{���g��O�A�s���n5��������VU���>�`�>ܠ�yH��4+g�wen��p*<��eJުI���W�;"�ԎU8���@�ܩ_�|��ǘ�sc�-V�;SD���+�m=��2���K��U�"�77�.Q�7*��})�K�����Ii8�F(�/b�Rb����zEWn�]ňJ\a*��g��˩�<��AWm��Dʲ24_�s S�TX����~�����c�1�2h�G@��I��X�ː	1��Q58z��~C`����}@b�l]�X���M0��_N��Yڻ����f���%F���)�۠���27Eh6&{��V���aY:Ǆ{�S9n����6�T�GJë
Z�TL�|`�}��� bQ�1S�1K���@�4ՙ��<� Lk$�m��pp�"�{�U,l�z�h�������$a{������f:�{�jl�fa=�cy��D5�R�UJ_�3���O���·�Ol����9��񃽨��p�j>�{ő� K��Y�3"�BV������U;U��%��=��-�N%��"N��g��sv�)��U*�4�a���b�1��ĄacfQF?�L��~��g�;�35�Y�!�򪻸`I��Ӛ���K[o���\����V���%8�Q:[�I��bw�;sğ#]�-��R�����X���NA/�y�~4�o�l�0� �/��T������zD7ͱbj���2�ot�oLS���:��j=H�/εA����q;*��0k�Ϸc��lX1M���"�v@Y2}2�0��aU<]�4Qo
��j�q�=�zq\ǀ��i4��ʣAUpDTf�9% k�����
S�Jѳ:�j� ����^c:��\D
�Pq��E���JY�4vY�Y�eU��.h=�Z�k-�6�K��KI�<��B�6�zQ+JGy�YpXr�c�j�V*������	S�5&�mv�sφ��*�|V
�0���u�iv1�Y㡙/�:��bq7�͚)Kq��9vdI�����c�������A{��~%꧘ )���wu6����Ӄ�����R�ʀ��p<5ɟ"��ٸ�>�M��[�X���*i/#��.�k�+'(9�G۶�Ȩ�i
P�7��g�1�''q���K��Km�?�z�䤦�I���R�̋J���d#�}�&�}��	r�>+��l�kE}�*b�~�JfNΩ*����v�sO4Aߊ��j�X��ɂ�20<p8��c}�?�9o���	\��q��q�!���q��$�=�����7;��@��b��t�)긗�K�C��ٶ/Gj*��
W�+�\�`�t���0v�F�C�xE��F5ݲ���<L����Q��O*���c��,(g��4��B¶����C���d��m�����-�-�s��X�	l7ڢO� 4Shm�Y?|��2�":�(�x���ڔ���ⷝ�6�*gV��"�e���X���a�[�[�y��Ar|�Y�(����҄���2�z ǧV����~�G!�J���J���@���p�,����P���~3hMŶ���Va��'a�7W���w�
�;���l�~`���QPj�rNIu/`���Ð0VCfSގ5�l�P�U��-+m�ꤩ�fM�6n��
�����F��0:/W����V�w�Ժ�,���i��Ir�6�.�@W^4�!��qb���B�z��뮛],����A�A���ft\�����Ҝ��L�[���q��]���B���E��jaT|Reh�َ�Q�E:|!��"e%�$�_\�9T��a��-0�DcAEy|�)��u�.��a�g�Y����[�e�0&V�.Q�(�˕o��W͖�T�^i��HI�rQ95+�$6�4���~��>�΢��k���^�z�
qZ���X�d�0�C����9��_�x;ƍ����Z~��Dy<�4�̗'ν���K֚ô��zv�^�����86��:��\/Bnd_�N�Cl��2$~fE�5�6)���n^�C���E�$Pl��/�g��ʱʭ�Lj9���`�;^*"h�=��P��3F�IN�4}�������TL70��fo
�yY��w�oU��ꩧ�زW�{!b�l�78���I�ǖ�[Xe���	ĺ��C�����"A����~)v��OT���y������~�t2tN�V�ئɗ۲ش��46�j'3���/��u2̢�V�eb���7���!�"8d>w���p^�{�2��I^v����'�;ε��'0l�W�mэ�f�4����W~��G,���f*4���z�w=��`����d�B _��T����!��Ɗ�Z���Õ�%P���2����G�A��E����3j�o(�-�RDd�"�8�@�T��z�:��G�gG���Aa.�T���V|�-�8�
էӰN9Y\��������t��-����aR)��ƅ$���JTE�k��{�*�0-D02(��f0օ��@ �GC[X��W�0|�u;����<~{����/*����*bE�#�r='�è�*T��q�f��� 3_��Ek;̲��=��f��l��� �^�`�5i�������.C���
����7V���vE&Ո�=k���Mz�z�A��I���c�Ж,�ng�W���?�k4^�QG>x6NY{�Qѳ�(��n��b�/ǐ�)"47ϣ�L��ˠ��{[��S(��^Dp�	=o1z�CE��Pf��7X}���y_/9M����S�r�H��`�u��	�N(?����zk;�X�n�M혭���� �	  v)[�SBd�&K�R�l=�	�"�������n3W䌵��a��T�$~Tl�_��׿/��0j �1��T'���ZI�����]���A� �e�����U+�`��RqĴ��W�0�'� ,�X��č��)�%�"������f�	e֓�{xU�ip�1#�s��c�jMoY�`�>�f���U��F�W?�+��G�7�1���4�?~��ڧ"�ۂSS(�:��S��,2$�D=��Y����nȴO����#��������r�mG���#��ԋ*�Ћ�PN]���YL�$��m��w��z ��̴}����CEU�������b
Qj��Wm�N`=t~�7�ۃJ�|5�e���z��Bw�'˃|L�a�0H������.�'?���\kL~e:�80`g���E)��T�18��>�0'!j6�����	9D�����z�#r�u��G���m_����3s�)�
C޷����7pQl�\�Un���*J`��+��H�4q���Ge-�[<���{7o�X���X �2>�µ֕�A��7s�Xo�,�wn��f� iu㫱���UX�i���)�����$��u���&�^��ɝ���'�0)�nvwϮ��*NA�������=�c��BM?�3��P�9J���R��W��8�{ݽ���s�ja��1�͡i��S�����=�^���}E0�8ִ��Ζ�`y�fII���α���{RD ���f�i��ͬ��C�v�A^��֛
�;�
%敧�O��=u_���_^Fϩ�Z�������;Tm+w�'ыL��bjj�pк�A�ԥ`6���(��lz�T⪧�J�-����|Ξ/*'�,���gx�*!_v��#}HS%�$cl)�:�*�@Oz9��}���Y�X�	3P�E�9	}�a����S��4$(e�
E��Ĺ���LA�Kt~�[s��0��W���Ug�������s��SG�B���^k��DU*I��b/�^���]�]Ւ��ޗ��N!�.$�he�ؕ���lm��d�L�dc�Ŭ��Qu�7�� ��_��wPKөq_#���d�� � �q�j�<�WA�����,@)��#7d�'�����\��u�<ds��r�c���dY?�]�qseZ��9'y�y��K��ߪ#�/j,E��|�pE�sQ})X�`Й�$y�L���W�H����N�S��,KK,^�U��k,^chs�q��$�}Z	Y�ϯOL+o���EP1ݿrC@�sTQꈟR�+�,���oe��3Ҹ��$�S7y_/�Pt�u�*�*!�A5 ��*������G('%�2ӒM����R
Ӱ��3JX��h��c���i�Df���a��3��0�ɽ�"�*n֘H�\��Y�C-���M}Ǩa�����B�-TQlx�j�t��WW��[��nQ������f��M��WU��E8�0�^M�x|E��޿�m���`BLS
�\��=��>!T!�G�Zw��4βDݪ5��c�%�	S����0r��B5����^`ӈb7֠ߍl�����"�+��;H��x��;��rUf:�iZ��|��L�e���S��*En��1�|}{��{͇��)�.��<nxǄ�y�����R�����6d�$�N�j/��ҙ��7<����������2]0�d#^GlP�f�c8��E�&�Y�n�8/��˕~3�t���T�˛�� �Q�ل[d�i����?C��n�~�<�DU̾rކ����.���B$I�
޶ȷ,X��������꒜|�7�Fu�U����M�bt�SOR���O����g���V%�@s���yr>�sԲ�W�
�g��=��I6hd�j�Οa�����l[hgXh3n|�[_��Mp�*�����&�.?�$P;�GZ�v�[�fKj˪J�UQ��5�%��P��a-*�y�����)lsm*�Y�B�H�r���=���k�b�^Mf���5=cCl���m�=�""P��(i����tMY���Xa>�T;���t.2�uh �X�or~�]��c�åa��ͥF
���(��Y�!��b�f��VQqZdf��h����& ��LHC�_�@���U��J���3�-rEe㒋f�>�����n7 in�]��������h9�0q��(�8��pY|!�����sȞ2v�A�a���*��0��~���^܂����jaEn���2 ��W��Y���,;T��p��p��to�ؽ+0�+�D�ٲ�#XUG��q���J���m���9�����*d�5����B���N�)����y��6��
ba�F�b�,�kf��$*�M4�}J�G��������/��-M�7���!�;�� ��M0_��yI�6�ցF.R�T�	�¸A�{�A�G��I���o�B\w��9�&��knL\�?2��ح^�g�.8�X���o��\�6Lj:.Z�䡓���ԽagsU��7��-O���������f[      m   I  x�uQ�N�@�������J(h(��) RDI�
�6��������<%
k}3���s;��РDm��
ԒJ�R.Q�5�����]�G
U� �D����L$�D�
G�[��*Mx�F��BO�S�FiGO*�����^�A�t�yM����#X�r�R�xӡ��e���L�2�.��.L�%�9,t`�&t�2�8�8���eed>���7��;�Z&�V��=�8LW�������0�-�R��=�8��H&�uI]L<�y�Pi؄\G��1j��C�똳>M����$%17�������r�7u�9�㡵��̀�      v   t   x����	�0���.`�u���zq�,�X]�e#�������̑������(�/G�6٩���(�Kx���Sm�3η�ʼ1��\m�'_[�QW[(�V�4h"z �Q      g   �  x�m��v�6���S�	z�?[^�I&�$Nr�t�����5M���������h:]�E���Szb�h�6��u�4�薭�U[ �+�_�V��Z����{�akկ����eII[sdmY�Z�0�U�����6v�COy��'F9�w ݍ���w~g�T$KZ���Q]�LcW��3z�W?j�i',��6�Qϭ��ee�ft�&x��;���ӽ���Nm'i��}��j��IZ�w���`�m��\cX}	�?X�%;�oH쌲�i���Lײ����������pc�N7LU��P�Ѣ��>�PH��v�N��ARX&YFWx+�q�8��/����bG��9�t�d%��[��.����t�;��m�0\Ѝ�>���B��6�M���W�>�%�;IMvo��|FWV�ziM�G�,�S��!�N���,��{���5Z�y����w�|4�E�iu��w�G��%]�9d��E2�[�ע���,�-�q��h�$��7�~T��
\B�?Q�]�ԣL��y� �o((Z.�'EJW݋Zv����2�^}��9�=	���Zn*蛩q9���6Ғ��~Dl�8��H
$��P���]aL}T;������g�#rV|���%5���H������Y��u#�
�J%�S[[ B�У=�5ަt����� ��	P���t�]�E B�@��v?P_�fI9�]-"�=D����$�@k� ��_#���"�Y;F��u٩;���ך�4��hg����I
���;���1��s�I/A��}ݢC����5��Y=馑�X�c�=2���0h=�J0�`��H<�!��NV�~pbmx�dI�ъ��4t�z����{��nq.a):�Q�/~�z��������7Q<b$4X�{�W^_94��L4�����ɢ�cA7^����0RB��3f8^
��kӹ0��V�E+w�F�i��u��s��ʤ����zc�L4E=�t����Z4�9k2K�D�KW�N����Z�=��:F;]*��I�p���	Z�<�"A>A��R�'��l�T�m�|ך�AZ5b�%�8�:#Z���ۓ9���E�D˙i����!��Gd5~G�1`Y�,Ł��C�W� ������q��t�e�E����G8��^��#]���R�������\�<L�*�n8�髰g8����S�K!C��j�ޏGg���sbR�~��lFV����Mf�f/��ve>-?o���h@9�֣N[|��<�h;1���\���Y�Iv�f�9a���p�����O0��N,��x��^t�� ex�ѵV���~����_�41����cuz"��J�8Aת;�@*Xw�l��4��fFh6�d�y�N�-K�]B����#�a�؎2*��E��o���o��iO� ��%I� �$ؠ      b   �   x�=�1k�0�g�W���Kv<ʩ�K)�J���iDk0q�eh�}EZ:o���'Um�kQ%u�J�2�֘�k��q�H���z��iAx��
��9Q��1��,sFC�#-	�^=kg4ī� T���d��q�j�^��y��{�+�9�i��_��!;^rXsrU���u��6�oV�Z������-I8��O��5��;�� �l�ކ4��R���I�      x   ;   x�3�4443714762�4B##c]#]CIԔ39�(���(?9��85�+F��� ς�      e     x����M�@E��UPA�Y�z�%@ р�0
�Z�툹y|��Fƒ{F�ɱ�w]�.��A׺q�ۓ1��v{4��JB�]����Aw�}l�/|n��C�pnu�l��!̏��I{;��O��OS���Q0٨F{l� �QW"J9�K�$fE��VqA�t>�U�LתQ��� �kq�brE�b��Z,����#Mh`	���.���mx<W�@����� w��]�X����䨏WB_I,��Xj%񠩕�gY���w�      i   C   x�u˱ !C��r�q�6�?GE$���5Q������fP��킿�c������X�a�      r      x������ � �      p   �  x�M�K��0Eѱk1�(��%����諸G�3�h�H�5/�l������h�r�Z�ūD��P�jԯ6گl��ߗv=��P9�P=���,��,��������lCU�!R5�*����&T�t�����f@Ǘ��U5�jn�*"U��gr��-�*�*O�*/�*o�*�PUk@U-�Z�:\U��PU+��VAU���Z�*TU��L0Tu&U�*�CO��(��h���PU9��RUg�9��k��PU���2��2!ﯠ����rCUՀ�*�*U�	�CUՂ��������������U���Uu&ت:l���U�U�	U�U��V��T�Vՙ��W���v�����v@U턪�U��joȾ�5j�٣�	�E:�I�¬��]:�LGa��h�:�g�g&����8��g�g����Ya��1}�1}s`����\m>}���{��7�o�o&�o�o6�onL�L��|�\}q���������ya��1}�1}k`������g�]���2}�!��)L�}
d��[ �w�������@���O_���>�1}�0}��HL_�/�ӗӗ����T��}�c�ra�20}��|�/ӗ�W�W����z�~��rL_-L_���W���Zc�jc�z`�����O_���vL_/L_���ׅ����sr��=90}�d����|>��~��      k   1   x�3�,�,H5�4�2��8����,cNc.0�(f
f�r�p��qqq ���      n   @   x��� 1��e�J�����?G��v��!�p��i��f�i��Zh�7���˿�����-���     