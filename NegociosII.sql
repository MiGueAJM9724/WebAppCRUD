PGDMP     "    -                x           Negocios    11.5    11.5 C    Q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            R           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            S           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            T           1262    90510    Negocios    DATABASE     �   CREATE DATABASE "Negocios" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Mexico.1252' LC_CTYPE = 'Spanish_Mexico.1252';
    DROP DATABASE "Negocios";
             postgres    false                        2615    98820 	   seguridad    SCHEMA        CREATE SCHEMA seguridad;
    DROP SCHEMA seguridad;
             postgres    false                        2615    98821    ventas    SCHEMA        CREATE SCHEMA ventas;
    DROP SCHEMA ventas;
             postgres    false            �            1259    98929    cliente    TABLE     �   CREATE TABLE ventas.cliente (
    idcte integer NOT NULL,
    nomcte character varying(70),
    domcte character varying(70),
    corcte character varying(60),
    telcte character varying(12),
    idsuc integer NOT NULL
);
    DROP TABLE ventas.cliente;
       ventas         postgres    false    7            �            1259    98927    cliente_idcte_seq    SEQUENCE     �   CREATE SEQUENCE ventas.cliente_idcte_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE ventas.cliente_idcte_seq;
       ventas       postgres    false    7    211            U           0    0    cliente_idcte_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE ventas.cliente_idcte_seq OWNED BY ventas.cliente.idcte;
            ventas       postgres    false    210            �            1259    98861    departamento    TABLE     g   CREATE TABLE ventas.departamento (
    iddepto integer NOT NULL,
    nomdepto character varying(50)
);
     DROP TABLE ventas.departamento;
       ventas         postgres    false    7            �            1259    98859    departamento_iddepto_seq    SEQUENCE     �   CREATE SEQUENCE ventas.departamento_iddepto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE ventas.departamento_iddepto_seq;
       ventas       postgres    false    203    7            V           0    0    departamento_iddepto_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE ventas.departamento_iddepto_seq OWNED BY ventas.departamento.iddepto;
            ventas       postgres    false    202            �            1259    115090    detalleventa    TABLE     �   CREATE TABLE ventas.detalleventa (
    idsuc integer NOT NULL,
    foliovta integer NOT NULL,
    idprod integer NOT NULL,
    cantvta integer,
    preciovta numeric(12,2),
    importe numeric(12,2)
);
     DROP TABLE ventas.detalleventa;
       ventas         postgres    false    7            �            1259    98882 
   inventario    TABLE     �   CREATE TABLE ventas.inventario (
    idprod integer NOT NULL,
    precio numeric(12,2),
    existencia integer,
    idsuc integer NOT NULL
);
    DROP TABLE ventas.inventario;
       ventas         postgres    false    7            �            1259    98880    inventario_idprod_seq    SEQUENCE     �   CREATE SEQUENCE ventas.inventario_idprod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE ventas.inventario_idprod_seq;
       ventas       postgres    false    207    7            W           0    0    inventario_idprod_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE ventas.inventario_idprod_seq OWNED BY ventas.inventario.idprod;
            ventas       postgres    false    206            �            1259    98869    producto    TABLE     �   CREATE TABLE ventas.producto (
    idprod integer NOT NULL,
    nomprod character varying(100),
    unidadmed character varying(20),
    iddepto integer NOT NULL
);
    DROP TABLE ventas.producto;
       ventas         postgres    false    7            �            1259    98867    producto_idprod_seq    SEQUENCE     �   CREATE SEQUENCE ventas.producto_idprod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE ventas.producto_idprod_seq;
       ventas       postgres    false    7    205            X           0    0    producto_idprod_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE ventas.producto_idprod_seq OWNED BY ventas.producto.idprod;
            ventas       postgres    false    204            �            1259    98824    region    TABLE     ]   CREATE TABLE ventas.region (
    idreg integer NOT NULL,
    nomreg character varying(40)
);
    DROP TABLE ventas.region;
       ventas         postgres    false    7            �            1259    98822    region_idreg_seq    SEQUENCE     �   CREATE SEQUENCE ventas.region_idreg_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE ventas.region_idreg_seq;
       ventas       postgres    false    199    7            Y           0    0    region_idreg_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE ventas.region_idreg_seq OWNED BY ventas.region.idreg;
            ventas       postgres    false    198            �            1259    98848    sucursal    TABLE     �   CREATE TABLE ventas.sucursal (
    idsuc integer NOT NULL,
    nomsuc character varying(100),
    cp character(5),
    idreg integer NOT NULL
);
    DROP TABLE ventas.sucursal;
       ventas         postgres    false    7            �            1259    98846    sucursal_idsuc_seq    SEQUENCE     �   CREATE SEQUENCE ventas.sucursal_idsuc_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE ventas.sucursal_idsuc_seq;
       ventas       postgres    false    201    7            Z           0    0    sucursal_idsuc_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE ventas.sucursal_idsuc_seq OWNED BY ventas.sucursal.idsuc;
            ventas       postgres    false    200            �            1259    98916    venta    TABLE     �   CREATE TABLE ventas.venta (
    foliovta integer NOT NULL,
    fecvta date,
    totalvta numeric(12,2),
    idsuc integer NOT NULL,
    idcte integer
);
    DROP TABLE ventas.venta;
       ventas         postgres    false    7            �            1259    98914    venta_foliovta_seq    SEQUENCE     �   CREATE SEQUENCE ventas.venta_foliovta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE ventas.venta_foliovta_seq;
       ventas       postgres    false    209    7            [           0    0    venta_foliovta_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE ventas.venta_foliovta_seq OWNED BY ventas.venta.foliovta;
            ventas       postgres    false    208            �
           2604    98932    cliente idcte    DEFAULT     n   ALTER TABLE ONLY ventas.cliente ALTER COLUMN idcte SET DEFAULT nextval('ventas.cliente_idcte_seq'::regclass);
 <   ALTER TABLE ventas.cliente ALTER COLUMN idcte DROP DEFAULT;
       ventas       postgres    false    211    210    211            �
           2604    98864    departamento iddepto    DEFAULT     |   ALTER TABLE ONLY ventas.departamento ALTER COLUMN iddepto SET DEFAULT nextval('ventas.departamento_iddepto_seq'::regclass);
 C   ALTER TABLE ventas.departamento ALTER COLUMN iddepto DROP DEFAULT;
       ventas       postgres    false    203    202    203            �
           2604    98885    inventario idprod    DEFAULT     v   ALTER TABLE ONLY ventas.inventario ALTER COLUMN idprod SET DEFAULT nextval('ventas.inventario_idprod_seq'::regclass);
 @   ALTER TABLE ventas.inventario ALTER COLUMN idprod DROP DEFAULT;
       ventas       postgres    false    207    206    207            �
           2604    98872    producto idprod    DEFAULT     r   ALTER TABLE ONLY ventas.producto ALTER COLUMN idprod SET DEFAULT nextval('ventas.producto_idprod_seq'::regclass);
 >   ALTER TABLE ventas.producto ALTER COLUMN idprod DROP DEFAULT;
       ventas       postgres    false    204    205    205            �
           2604    98827    region idreg    DEFAULT     l   ALTER TABLE ONLY ventas.region ALTER COLUMN idreg SET DEFAULT nextval('ventas.region_idreg_seq'::regclass);
 ;   ALTER TABLE ventas.region ALTER COLUMN idreg DROP DEFAULT;
       ventas       postgres    false    199    198    199            �
           2604    98851    sucursal idsuc    DEFAULT     p   ALTER TABLE ONLY ventas.sucursal ALTER COLUMN idsuc SET DEFAULT nextval('ventas.sucursal_idsuc_seq'::regclass);
 =   ALTER TABLE ventas.sucursal ALTER COLUMN idsuc DROP DEFAULT;
       ventas       postgres    false    200    201    201            �
           2604    98919    venta foliovta    DEFAULT     p   ALTER TABLE ONLY ventas.venta ALTER COLUMN foliovta SET DEFAULT nextval('ventas.venta_foliovta_seq'::regclass);
 =   ALTER TABLE ventas.venta ALTER COLUMN foliovta DROP DEFAULT;
       ventas       postgres    false    208    209    209            M          0    98929    cliente 
   TABLE DATA               O   COPY ventas.cliente (idcte, nomcte, domcte, corcte, telcte, idsuc) FROM stdin;
    ventas       postgres    false    211   �G       E          0    98861    departamento 
   TABLE DATA               9   COPY ventas.departamento (iddepto, nomdepto) FROM stdin;
    ventas       postgres    false    203   �I       N          0    115090    detalleventa 
   TABLE DATA               \   COPY ventas.detalleventa (idsuc, foliovta, idprod, cantvta, preciovta, importe) FROM stdin;
    ventas       postgres    false    212   J       I          0    98882 
   inventario 
   TABLE DATA               G   COPY ventas.inventario (idprod, precio, existencia, idsuc) FROM stdin;
    ventas       postgres    false    207   O       G          0    98869    producto 
   TABLE DATA               G   COPY ventas.producto (idprod, nomprod, unidadmed, iddepto) FROM stdin;
    ventas       postgres    false    205   �O       A          0    98824    region 
   TABLE DATA               /   COPY ventas.region (idreg, nomreg) FROM stdin;
    ventas       postgres    false    199   BP       C          0    98848    sucursal 
   TABLE DATA               <   COPY ventas.sucursal (idsuc, nomsuc, cp, idreg) FROM stdin;
    ventas       postgres    false    201   �P       K          0    98916    venta 
   TABLE DATA               I   COPY ventas.venta (foliovta, fecvta, totalvta, idsuc, idcte) FROM stdin;
    ventas       postgres    false    209   +Q       \           0    0    cliente_idcte_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('ventas.cliente_idcte_seq', 28, true);
            ventas       postgres    false    210            ]           0    0    departamento_iddepto_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('ventas.departamento_iddepto_seq', 8, true);
            ventas       postgres    false    202            ^           0    0    inventario_idprod_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('ventas.inventario_idprod_seq', 1, false);
            ventas       postgres    false    206            _           0    0    producto_idprod_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('ventas.producto_idprod_seq', 9, true);
            ventas       postgres    false    204            `           0    0    region_idreg_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('ventas.region_idreg_seq', 23, true);
            ventas       postgres    false    198            a           0    0    sucursal_idsuc_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('ventas.sucursal_idsuc_seq', 9, true);
            ventas       postgres    false    200            b           0    0    venta_foliovta_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('ventas.venta_foliovta_seq', 54, true);
            ventas       postgres    false    208            �
           2606    98934    cliente pkcte 
   CONSTRAINT     N   ALTER TABLE ONLY ventas.cliente
    ADD CONSTRAINT pkcte PRIMARY KEY (idcte);
 7   ALTER TABLE ONLY ventas.cliente DROP CONSTRAINT pkcte;
       ventas         postgres    false    211            �
           2606    98866    departamento pkdepto 
   CONSTRAINT     W   ALTER TABLE ONLY ventas.departamento
    ADD CONSTRAINT pkdepto PRIMARY KEY (iddepto);
 >   ALTER TABLE ONLY ventas.departamento DROP CONSTRAINT pkdepto;
       ventas         postgres    false    203            �
           2606    115094    detalleventa pkdv 
   CONSTRAINT     d   ALTER TABLE ONLY ventas.detalleventa
    ADD CONSTRAINT pkdv PRIMARY KEY (idsuc, foliovta, idprod);
 ;   ALTER TABLE ONLY ventas.detalleventa DROP CONSTRAINT pkdv;
       ventas         postgres    false    212    212    212            �
           2606    98874    producto pkprod 
   CONSTRAINT     Q   ALTER TABLE ONLY ventas.producto
    ADD CONSTRAINT pkprod PRIMARY KEY (idprod);
 9   ALTER TABLE ONLY ventas.producto DROP CONSTRAINT pkprod;
       ventas         postgres    false    205            �
           2606    115089    inventario pkprodi 
   CONSTRAINT     [   ALTER TABLE ONLY ventas.inventario
    ADD CONSTRAINT pkprodi PRIMARY KEY (idsuc, idprod);
 <   ALTER TABLE ONLY ventas.inventario DROP CONSTRAINT pkprodi;
       ventas         postgres    false    207    207            �
           2606    98829    region pkreg 
   CONSTRAINT     M   ALTER TABLE ONLY ventas.region
    ADD CONSTRAINT pkreg PRIMARY KEY (idreg);
 6   ALTER TABLE ONLY ventas.region DROP CONSTRAINT pkreg;
       ventas         postgres    false    199            �
           2606    98853    sucursal pksuc 
   CONSTRAINT     O   ALTER TABLE ONLY ventas.sucursal
    ADD CONSTRAINT pksuc PRIMARY KEY (idsuc);
 8   ALTER TABLE ONLY ventas.sucursal DROP CONSTRAINT pksuc;
       ventas         postgres    false    201            �
           2606    98921    venta pkvta 
   CONSTRAINT     O   ALTER TABLE ONLY ventas.venta
    ADD CONSTRAINT pkvta PRIMARY KEY (foliovta);
 5   ALTER TABLE ONLY ventas.venta DROP CONSTRAINT pkvta;
       ventas         postgres    false    209            �
           2606    123278    venta fkcte1    FK CONSTRAINT     n   ALTER TABLE ONLY ventas.venta
    ADD CONSTRAINT fkcte1 FOREIGN KEY (idcte) REFERENCES ventas.cliente(idcte);
 6   ALTER TABLE ONLY ventas.venta DROP CONSTRAINT fkcte1;
       ventas       postgres    false    209    211    2747            �
           2606    98875    producto fkdepto    FK CONSTRAINT     {   ALTER TABLE ONLY ventas.producto
    ADD CONSTRAINT fkdepto FOREIGN KEY (iddepto) REFERENCES ventas.departamento(iddepto);
 :   ALTER TABLE ONLY ventas.producto DROP CONSTRAINT fkdepto;
       ventas       postgres    false    2739    205    203            �
           2606    115095    detalleventa fkdt1    FK CONSTRAINT     x   ALTER TABLE ONLY ventas.detalleventa
    ADD CONSTRAINT fkdt1 FOREIGN KEY (foliovta) REFERENCES ventas.venta(foliovta);
 <   ALTER TABLE ONLY ventas.detalleventa DROP CONSTRAINT fkdt1;
       ventas       postgres    false    2745    209    212            �
           2606    115100    detalleventa fkdv2    FK CONSTRAINT     �   ALTER TABLE ONLY ventas.detalleventa
    ADD CONSTRAINT fkdv2 FOREIGN KEY (idsuc, idprod) REFERENCES ventas.inventario(idsuc, idprod);
 <   ALTER TABLE ONLY ventas.detalleventa DROP CONSTRAINT fkdv2;
       ventas       postgres    false    212    207    207    2743    212            �
           2606    98888    inventario fkprodi    FK CONSTRAINT     w   ALTER TABLE ONLY ventas.inventario
    ADD CONSTRAINT fkprodi FOREIGN KEY (idprod) REFERENCES ventas.producto(idprod);
 <   ALTER TABLE ONLY ventas.inventario DROP CONSTRAINT fkprodi;
       ventas       postgres    false    207    205    2741            �
           2606    98854    sucursal fkreg    FK CONSTRAINT     o   ALTER TABLE ONLY ventas.sucursal
    ADD CONSTRAINT fkreg FOREIGN KEY (idreg) REFERENCES ventas.region(idreg);
 8   ALTER TABLE ONLY ventas.sucursal DROP CONSTRAINT fkreg;
       ventas       postgres    false    2735    201    199            �
           2606    98893    inventario fksuc    FK CONSTRAINT     s   ALTER TABLE ONLY ventas.inventario
    ADD CONSTRAINT fksuc FOREIGN KEY (idsuc) REFERENCES ventas.sucursal(idsuc);
 :   ALTER TABLE ONLY ventas.inventario DROP CONSTRAINT fksuc;
       ventas       postgres    false    2737    207    201            �
           2606    98935    cliente fksuk    FK CONSTRAINT     p   ALTER TABLE ONLY ventas.cliente
    ADD CONSTRAINT fksuk FOREIGN KEY (idsuc) REFERENCES ventas.sucursal(idsuc);
 7   ALTER TABLE ONLY ventas.cliente DROP CONSTRAINT fksuk;
       ventas       postgres    false    201    2737    211            �
           2606    98922    venta fksuq    FK CONSTRAINT     n   ALTER TABLE ONLY ventas.venta
    ADD CONSTRAINT fksuq FOREIGN KEY (idsuc) REFERENCES ventas.sucursal(idsuc);
 5   ALTER TABLE ONLY ventas.venta DROP CONSTRAINT fksuq;
       ventas       postgres    false    209    201    2737            M   �  x�u��j�0���O�p�����v���B�7�Z�U*K�d�n��#gI�ʹ�/>�?1��G����9H�˳^���M#js'�u�XS���ý�a:k���Q�t�����	�wmS_���YO�Y-.���u�Z��zSHe�S�Opr��5<�=y|���Kq�R���U����<]��$KӔ]'D������S�1i�Z:����k�;*o��
0�ڻ���_����C��%��>)+5��E-f���I�R�������U:�_Q-ܨ�Q�����>��y�	��-�+è�����=��Y�
=��sp�S�>Q*j���ѕm$*�ce:E��c}S�2^Â���	{������E�vޫa֖�`'O�Wa�0��Ӯd{g��k���0�XhT�8�g��X;��^V}��8�ͣ�I�����_���4��^�d��q[���]�e� ��E�      E   7   x�3�tNLJ��I-��2�tI�M,�2���<�1��˂ӿ�(_!%��$�+F��� ^       N   	  x�mձ�[D�د�jɥ�^~�u|élt�y�z��<�^���=�����m�-�b;loll���9h���9h���y�<h4�̓�A�yмh^4/�͋�E�yѼh.��梹h.��梹h.�͇�C���|h>4��o4���F��o4���F��o4��A��4��A��4��E��_4��E��_4��E��*�Ty��#W��H�G�<��Q�ty���|y	���y����y	�׿����������������������������������������������������������������������������������G�G�G�G�G�G�G�G�G�G�G�G�G�G�G�G�G�G�4h>�|��@����4h>�|��@����4h>�|��@����4h>�|��@����4h>�|��@����4h>�|��@����4h>�|��@����4h>�|��@����4h>�|��@����4h>�|��@����4i>�|��H��#�G��4i>�|��H��#�G��4i>�|��B����/4_h��|��B����/4_h��|��B����/4_h��|��B����/4_h��|��B����/4_h��|��B����/4_h��|��B����/4_h��|��B����/4_h��|��B����/4_h��|��B����/4_h��|��J��+�W��4_i��|��J��+�W��4_i��|��J�������������������������������������������������������������������������������������������������������4?h~����A����4?h~����A����4?h~����A����4?h~����A����4?h~����A����4?h~����A����4?h~����A����4?h~����A����4?h~����A����4?h~����A���O��4?i~����I��'�O��4?i~����I��'�O��4��������
��      I   �   x�U��AC�s�4N�z��:�a�?E�c=Ez�挜q�������<��Cק|&cwD}����k���W��'fڒ�����k�\�<�'���x�xO�	���^�x�x/���7���x�xo���������n����z_o�      G   j   x�3�H�+I���S�I-�,��L�J�4�2�t�H�M,*JT��s:'�f#��p:�"��L9�R�K2S�Bf+�b�9���Í�,0�sYr�+����� �4.      A   N   x�3�tN�+)��2���/�O-.I�2�.-��8�0 ��	g$2�24�D\�Ɯ@! ����Ș���b���� �(i      C   {   x�-�;1Ck�)8��ߦ����f)VJ�H6�gV��OO6��:6�p����E�%V��M�g��aKe��������eT%��QDi�n/9��8J�k���G�}�i��S�>���LD_��#X      K   (  x�e�[��0���h/�x$�������V����Ô��4x�i�k؟�}Z{�@��T��Q�:�S�Q�A�I�G]uQ_�{�������A��S�Bxv6�6b	X������x,��~Z�n.��t���T�g7z���N�;}^7�A_�'�����k{e/��{�鼱�b�gg/�;�؋���`�c/V�Y���גּ����-{Yty+{Y�G���>���,�r+{Y��^�����e��({Y<�>�^�_e���o�+������e�k����[���ˢ{Y*��#"_p��     