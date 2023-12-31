PGDMP  0    &                {            celltechproyecto    16.1    16.1 4               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    49248    celltechproyecto    DATABASE     �   CREATE DATABASE celltechproyecto WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Ecuador.1252';
     DROP DATABASE celltechproyecto;
                postgres    false                        3079    49249 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false                       0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            �            1259    49306 
   comentario    TABLE     �   CREATE TABLE public.comentario (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    comentario character varying(50) NOT NULL
);
    DROP TABLE public.comentario;
       public         heap    postgres    false            �            1259    49305    comentario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comentario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.comentario_id_seq;
       public          postgres    false    225                       0    0    comentario_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.comentario_id_seq OWNED BY public.comentario.id;
          public          postgres    false    224            �            1259    49299    contacto    TABLE     �   CREATE TABLE public.contacto (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    asunto character varying(50) NOT NULL,
    mensage character varying(200) NOT NULL
);
    DROP TABLE public.contacto;
       public         heap    postgres    false            �            1259    49298    contacto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.contacto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.contacto_id_seq;
       public          postgres    false    223                       0    0    contacto_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.contacto_id_seq OWNED BY public.contacto.id;
          public          postgres    false    222            �            1259    49271    ordenes    TABLE     �   CREATE TABLE public.ordenes (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    adress character varying(50) NOT NULL,
    price numeric(8,2) NOT NULL,
    date character varying(25) NOT NULL,
    "userId" uuid NOT NULL
);
    DROP TABLE public.ordenes;
       public         heap    postgres    false    2            �            1259    49266    ordenes-productos    TABLE     �   CREATE TABLE public."ordenes-productos" (
    "orderId" uuid NOT NULL,
    "productId" uuid NOT NULL,
    quantity integer NOT NULL
);
 '   DROP TABLE public."ordenes-productos";
       public         heap    postgres    false            �            1259    49260    producto    TABLE     �   CREATE TABLE public.producto (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    nombre character varying(50) NOT NULL,
    precio double precision NOT NULL,
    descripcion character varying(200) NOT NULL
);
    DROP TABLE public.producto;
       public         heap    postgres    false    2            �            1259    49290    rol    TABLE     e   CREATE TABLE public.rol (
    id integer NOT NULL,
    "rolNombre" character varying(10) NOT NULL
);
    DROP TABLE public.rol;
       public         heap    postgres    false            �            1259    49289 
   rol_id_seq    SEQUENCE     �   CREATE SEQUENCE public.rol_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.rol_id_seq;
       public          postgres    false    221            	           0    0 
   rol_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.rol_id_seq OWNED BY public.rol.id;
          public          postgres    false    220            �            1259    49277    usuario    TABLE     �   CREATE TABLE public.usuario (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "nombreUsuario" character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    postgres    false    2            �            1259    49312    usuario_rol    TABLE     _   CREATE TABLE public.usuario_rol (
    usuario_id uuid NOT NULL,
    rol_id integer NOT NULL
);
    DROP TABLE public.usuario_rol;
       public         heap    postgres    false            H           2604    49309    comentario id    DEFAULT     n   ALTER TABLE ONLY public.comentario ALTER COLUMN id SET DEFAULT nextval('public.comentario_id_seq'::regclass);
 <   ALTER TABLE public.comentario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            G           2604    49302    contacto id    DEFAULT     j   ALTER TABLE ONLY public.contacto ALTER COLUMN id SET DEFAULT nextval('public.contacto_id_seq'::regclass);
 :   ALTER TABLE public.contacto ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            F           2604    49293    rol id    DEFAULT     `   ALTER TABLE ONLY public.rol ALTER COLUMN id SET DEFAULT nextval('public.rol_id_seq'::regclass);
 5   ALTER TABLE public.rol ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �          0    49306 
   comentario 
   TABLE DATA           C   COPY public.comentario (id, nombre, email, comentario) FROM stdin;
    public          postgres    false    225   O=       �          0    49299    contacto 
   TABLE DATA           F   COPY public.contacto (id, nombre, email, asunto, mensage) FROM stdin;
    public          postgres    false    223   �=       �          0    49271    ordenes 
   TABLE DATA           D   COPY public.ordenes (id, adress, price, date, "userId") FROM stdin;
    public          postgres    false    218   �=       �          0    49266    ordenes-productos 
   TABLE DATA           O   COPY public."ordenes-productos" ("orderId", "productId", quantity) FROM stdin;
    public          postgres    false    217   
>       �          0    49260    producto 
   TABLE DATA           C   COPY public.producto (id, nombre, precio, descripcion) FROM stdin;
    public          postgres    false    216   '>       �          0    49290    rol 
   TABLE DATA           .   COPY public.rol (id, "rolNombre") FROM stdin;
    public          postgres    false    221   D>       �          0    49277    usuario 
   TABLE DATA           G   COPY public.usuario (id, "nombreUsuario", email, password) FROM stdin;
    public          postgres    false    219   p>       �          0    49312    usuario_rol 
   TABLE DATA           9   COPY public.usuario_rol (usuario_id, rol_id) FROM stdin;
    public          postgres    false    226    ?       
           0    0    comentario_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.comentario_id_seq', 1, true);
          public          postgres    false    224                       0    0    contacto_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.contacto_id_seq', 1, true);
          public          postgres    false    222                       0    0 
   rol_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.rol_id_seq', 1, false);
          public          postgres    false    220            `           2606    49316 *   usuario_rol PK_40b321ebb932d588934043a2639 
   CONSTRAINT     z   ALTER TABLE ONLY public.usuario_rol
    ADD CONSTRAINT "PK_40b321ebb932d588934043a2639" PRIMARY KEY (usuario_id, rol_id);
 V   ALTER TABLE ONLY public.usuario_rol DROP CONSTRAINT "PK_40b321ebb932d588934043a2639";
       public            postgres    false    226    226            N           2606    49276 &   ordenes PK_58713affeb8e3b7b30b9eeeee7a 
   CONSTRAINT     f   ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT "PK_58713affeb8e3b7b30b9eeeee7a" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.ordenes DROP CONSTRAINT "PK_58713affeb8e3b7b30b9eeeee7a";
       public            postgres    false    218            J           2606    49265 '   producto PK_5be023b11909fe103e24c740c7d 
   CONSTRAINT     g   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT "PK_5be023b11909fe103e24c740c7d" PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.producto DROP CONSTRAINT "PK_5be023b11909fe103e24c740c7d";
       public            postgres    false    216            P           2606    49284 &   usuario PK_a56c58e5cabaa04fb2c98d2d7e2 
   CONSTRAINT     f   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT "PK_a56c58e5cabaa04fb2c98d2d7e2" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.usuario DROP CONSTRAINT "PK_a56c58e5cabaa04fb2c98d2d7e2";
       public            postgres    false    219            \           2606    49311 )   comentario PK_c9014211e5fbf491b9e3543bb19 
   CONSTRAINT     i   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT "PK_c9014211e5fbf491b9e3543bb19" PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.comentario DROP CONSTRAINT "PK_c9014211e5fbf491b9e3543bb19";
       public            postgres    false    225            V           2606    49295 "   rol PK_c93a22388638fac311781c7f2dd 
   CONSTRAINT     b   ALTER TABLE ONLY public.rol
    ADD CONSTRAINT "PK_c93a22388638fac311781c7f2dd" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.rol DROP CONSTRAINT "PK_c93a22388638fac311781c7f2dd";
       public            postgres    false    221            L           2606    49270 0   ordenes-productos PK_f7344e04d85653182876bd7c455 
   CONSTRAINT     �   ALTER TABLE ONLY public."ordenes-productos"
    ADD CONSTRAINT "PK_f7344e04d85653182876bd7c455" PRIMARY KEY ("orderId", "productId");
 ^   ALTER TABLE ONLY public."ordenes-productos" DROP CONSTRAINT "PK_f7344e04d85653182876bd7c455";
       public            postgres    false    217    217            Z           2606    49304 '   contacto PK_fcab8128cce0aac92da26cf1883 
   CONSTRAINT     g   ALTER TABLE ONLY public.contacto
    ADD CONSTRAINT "PK_fcab8128cce0aac92da26cf1883" PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.contacto DROP CONSTRAINT "PK_fcab8128cce0aac92da26cf1883";
       public            postgres    false    223            X           2606    49297 "   rol UQ_219757a66cff5ac7898e2ad9a86 
   CONSTRAINT     f   ALTER TABLE ONLY public.rol
    ADD CONSTRAINT "UQ_219757a66cff5ac7898e2ad9a86" UNIQUE ("rolNombre");
 N   ALTER TABLE ONLY public.rol DROP CONSTRAINT "UQ_219757a66cff5ac7898e2ad9a86";
       public            postgres    false    221            R           2606    49288 &   usuario UQ_2863682842e688ca198eb25c124 
   CONSTRAINT     d   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT "UQ_2863682842e688ca198eb25c124" UNIQUE (email);
 R   ALTER TABLE ONLY public.usuario DROP CONSTRAINT "UQ_2863682842e688ca198eb25c124";
       public            postgres    false    219            T           2606    49286 &   usuario UQ_7ea57d693272b94228192c612bf 
   CONSTRAINT     n   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT "UQ_7ea57d693272b94228192c612bf" UNIQUE ("nombreUsuario");
 R   ALTER TABLE ONLY public.usuario DROP CONSTRAINT "UQ_7ea57d693272b94228192c612bf";
       public            postgres    false    219            ]           1259    49317    IDX_29e9a9079c7ba01c1b301cf555    INDEX     ^   CREATE INDEX "IDX_29e9a9079c7ba01c1b301cf555" ON public.usuario_rol USING btree (usuario_id);
 4   DROP INDEX public."IDX_29e9a9079c7ba01c1b301cf555";
       public            postgres    false    226            ^           1259    49318    IDX_ac8911cd54a61461c992654140    INDEX     Z   CREATE INDEX "IDX_ac8911cd54a61461c992654140" ON public.usuario_rol USING btree (rol_id);
 4   DROP INDEX public."IDX_ac8911cd54a61461c992654140";
       public            postgres    false    226            d           2606    49334 *   usuario_rol FK_29e9a9079c7ba01c1b301cf5555    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_rol
    ADD CONSTRAINT "FK_29e9a9079c7ba01c1b301cf5555" FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.usuario_rol DROP CONSTRAINT "FK_29e9a9079c7ba01c1b301cf5555";
       public          postgres    false    219    4688    226            a           2606    49319 0   ordenes-productos FK_7c20bda85621d2ea83acf033b9a    FK CONSTRAINT     �   ALTER TABLE ONLY public."ordenes-productos"
    ADD CONSTRAINT "FK_7c20bda85621d2ea83acf033b9a" FOREIGN KEY ("orderId") REFERENCES public.ordenes(id);
 ^   ALTER TABLE ONLY public."ordenes-productos" DROP CONSTRAINT "FK_7c20bda85621d2ea83acf033b9a";
       public          postgres    false    217    4686    218            e           2606    49339 *   usuario_rol FK_ac8911cd54a61461c9926541401    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_rol
    ADD CONSTRAINT "FK_ac8911cd54a61461c9926541401" FOREIGN KEY (rol_id) REFERENCES public.rol(id);
 V   ALTER TABLE ONLY public.usuario_rol DROP CONSTRAINT "FK_ac8911cd54a61461c9926541401";
       public          postgres    false    4694    226    221            c           2606    49329 &   ordenes FK_c0ec3c873dff0860bd8d4767def    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT "FK_c0ec3c873dff0860bd8d4767def" FOREIGN KEY ("userId") REFERENCES public.usuario(id);
 R   ALTER TABLE ONLY public.ordenes DROP CONSTRAINT "FK_c0ec3c873dff0860bd8d4767def";
       public          postgres    false    218    219    4688            b           2606    49324 0   ordenes-productos FK_e041d31050b1ef88652d38e42da    FK CONSTRAINT     �   ALTER TABLE ONLY public."ordenes-productos"
    ADD CONSTRAINT "FK_e041d31050b1ef88652d38e42da" FOREIGN KEY ("productId") REFERENCES public.producto(id);
 ^   ALTER TABLE ONLY public."ordenes-productos" DROP CONSTRAINT "FK_e041d31050b1ef88652d38e42da";
       public          postgres    false    217    216    4682            �   2   x�3�LM)M,Jɇ�鹉�9z����Y�9�@�$�sRA�D�=... �      �   L   x����0 �7L�M��A��bCJ�������@����w�k�����P���\�A]h��_	�z
��x<�%D� ��W      �      x������ � �      �      x������ � �      �      x������ � �      �      x�3�LL����2�,-N-����� : �      �   �   x��A�0 ���;vݘs��-�DP
��=�Bh.�����;|�.30%�̆BZ(	���P�`g" V��������Rd ȴ�bl�:��q'��7��m�T7U���}�m<���8��>���8�?��$�      �   9   x�3507�02��54I3�51�H�M�HI�5JJ40�0IMJ���4�2%F�W� ?#f     