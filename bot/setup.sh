#!/data/data/com.termux/files/usr/bin/sh
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename 'setup.sh' encrypted at Mon Apr 22 18:12:10 WIB 2024
# I try invoking the compressed executable with the original name
# (for programs looking at their name).  We also try to retain the original
# file permissions on the compressed file.  For safety reasons, bzsh will
# not create setuid or setgid shell scripts.
#
# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5
#
# Don't forget to follow me on <https://github.com/FajarKim>
skip=76
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

bztmpdir=
trap 'res=$?
  test -n "$bztmpdir" && rm -fr "$bztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  bztmpdir=`mktemp -d "${TMPDIR}bztmpXXXXXXXXX"`
else
  bztmpdir=${TMPDIR}bztmp$$; mkdir $bztmpdir
fi || { (exit 127); exit 127; }

bztmp=$bztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$bztmp" && rm -r "$bztmp";;
*/*) bztmp=$bztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | bzip2 -cd > "$bztmp"; then
  umask $umask
  chmod 700 "$bztmp"
  (sleep 5; rm -fr "$bztmpdir") 2>/dev/null &
  "$bztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <fajarrkim@gmail.com>."
  (exit 127); res=127
fi; exit $res
BZh91AY&SY|�| `_�t0�����������b�� 0 `)���{oY���}k�ϲ�M���w�N�����<�e>���ϧ����n�����۔�tڲ�wd��6z�;��=�{nՙga��V�m����Km�ѵ�m�2R�m�6�gh%M�2	�1 I����xDz��5=Ljhz��h 	��&L�D�ze6�<��   z�� �1�I?D	��OHɠh�Hbd�A� &�A ML�2)��h��e=L�� h h   �B&!��i�O&�I��2d�OjySڦ'���S�G��F�4� z�oT$  �A@��<�=)�&ҞCQ�j444b 6$�t�Uf̈*ADD �$y\]r�:����an��P���GO{��[�q~/L-ւʥ"�=�a���E��� �"	��ӧ��.̳�u�o�L\��jI^�]lQ#��ƛ�Z_y�,ؒ���N�x���yo���;�;ذ��+�	J��P04��C[L��D��Z{�9Y�z���巂{�n�I��l=���;�/��J"�CS~��9�31`d��c�`nq�JS{��pr8�SS�Ƞͬc�.��VrR6r`)Lb�7kj�g�k����=�/��P�V)�c$��TY��
,.��z��=K�V��qB.H:��J�X�,,�L@AS��ӎ�o�a��u��gC������=��-)�����VH����4�dN|������MJ�+Z�_{��Eh0q�r��v�8~���������1ҷ#jq#=����$!��~�=㢷3]k�6�:�M�9Y�`�3#�k�����$�e[�'[��S���`���{'�1�A�ʈ�7 �a���p�f�zT1�e�㟓O��.����v�bý�6E�ѻk[��n}�ʪ�wwڴ��۫���s�Ӷ�G>��@�I�u;'x�'o����K��PK��<�=vr��!Ŏ�b�t9��􏟟t�5���>�E#ׁ���`*�:��镀�6��wت����u�j�&	�s�=%�ط*�H��A��2$C��h\呵�h-z�9����&�h�!�ܷ'6;�uW-gnvLVZ��%4~@�m��d��� �/�S�����̱��l����j�l� $RӋ����������gI�%�+�Ux�WȎP�X�J����)p,Ѡ�K�@<�W�&�j�W$jsB"�K"F"��xC�8h-�\n�:���Z\����ZC��`rJO��pZ*aM(��׍��*t�]��L3�_&�j��ل_z�n�a����*�6�~$��qé1��=�� &��<�
X��C���٥�ٚ�r�٥N�Ww�����$Z�܂
o���l�%Y%���O[j�̮0����WU@H�)����w��a�DzyToq@0�N�Ԋ��t�x��lA hc˹��3?�0x˚�Gx{��Z�1H��Ȝ�Km���uC�mç���n
����Rňe�oT0�f��Z�U��d�"�J|��脒xa���Bη����sd(`}��IlƗH����2{��s�� a���<��Gk��i;�e��������Z&^��B;_p�o���s�F^7m�õ;��C �i�R�:�/��b�� ����TDk�(=z<l�����Z$�v�S�![��C��jkﬨ�^��;/P��L��0��ڇe�nC��\ɘ��Q�~#���2����no��<����5x�$<R�{�Lq��FRҚ,A	'X�5���u��3�n$���g�����~�[^Ȇ�ʝ����%����c��-ty�%�|kv7���{�#[(6u�,�Di�]����m��h��@�5�r�儴���E�*��b�,�T�/�)����禘N��������ЉA�MQ,�-�-�z��UW����O,���2��g1Zu$3Izi��ڦO�Q�Ny_*��$喑���
�B"D
c� j���+n�p��+�JLN���}�y�#߳����m��hu0��>��	|����Q�{���9����w�]��Tag�������>4�������t����h;f^�փ!�o�W����v]}F\�r�H�|F��a@�CL�,���T�ab�;Z|RG_'��].�|�Z��zo�m�#]��.�zxBhx���Kh܇?=Z�9Yx1��t�vv�I�G_����~�(��#w���)�M�-L������.{�6j�y{�?�Y^���M��y��d�$
d���F��,��Nz���L>��W���|g@�.҂��%U6� ���!��z�t�4Z�2�P{�^�/�%\X4�cj��]0mj
cG[h
6r��tT>?�Ay�!���y̧o���ALD��ʛ�1P�R����檐C]��EF�[D�<,��t�e��P�������@naZ�]{U��n�Έ�`J}���8^b�^,5��w�rOL����_fx�#�f��Ot ��%G�Țq�/L�:Nce6�#�0����\�ٶ/y^[Y<v��)=8{K*FuD(�����D?�� ���m?�H�Q���4���
����C�4i��>�8���#�|jX����%�o��v�CTī<�_u���~YvJ��nш�~�ކ��[�9o�����|��u�kT�$(��J����c4�A�	+YX+�R��l`4���)��ں�y[��K�ӂ!0DA��/�Y��<�$>%6�P��05Ǌ�Z�%ƒ�˛�%�)�T�<K*i41�;�lQ�F�j��G�O�m ��� ��	��'��J=w�+�2�O1 ̒ÎD��P�N�7�ek�Bd�n:�0h%�<h��ò	Z^&#a��4j�\$����p217^P>��2�s��u+�߄�>�	UeB%�7��6M�s��n0<h����ŋmb]����x2��ˁ����m|Q" �GJ1�e�Q�-�r��F��`[V	K��$��B�0l{&\h1��k�`e�Ddd���B����B`	TU"*
"�E�dۦh�mLs��t���.n��l�e��u���Ӆ�v�}5�M�����EL@AB㚪
V�]�B�T��p&��W����iҙq�c2�T�ӆۍ��y�cPs�c�Y���#�Xqh]41��7H�D��\�a2c��MCx�o���ιP��Q�`���6ۚW<�[vA"֩O�-R�%ֶ{J+��H1��PB����3�wH�Ql�H���' �L�@�9��#1ǭ�R#���y��,���`�e���.�:��7 ����=�t�� �r�}~d�k"�Tu�6�̀ͦC
����1�A��s3S��3�a'�Е�0�٭v�A�bTI�7Rh�N+/��P���9j�x/r�t1Ì���yؠ��ȫ�4tl5�3նS�̭���hu%#���1i���i�p��<��}�����/��`�s�Hl�:�̸	��i>g�Ke*����n��܁}���|qp�_��������H+��[ƈ�#�G�#���u}\kKt�}wb!��
'����=�G�^��[�;_����=�w��E���o7_���{X,+���\���L��x�6G�?�op�� ć��I0�Y�Cg�e���r���A�ߟ"5�Wb�Tͮ@9��'��E%I�HT��к+`��!�Q���_{�TjD:�o����AO�@u����A�m'���i���N�ᘚ�!����%V�P��u�A�0��Z����OQY���9l���F~��I�Hx�l�Hv8iD�/8P����E�8���Ą\�iH:����û���|�	����x��~� �{�%�"�m�D�|7>���F�v��7�7�����с��A*��2�EN��e2��C��;H��>2&�A�*lrZG��D%����y���0�rN
�/٢;	 Gc��g,�7�V+o�h�a0��Ź����̍��K�\��+*�%����sD64^�'y����K�&a�d�:�&+�J{z�y!#�������d��,�m�/����D�n DI�3�Y,�Ac��s�
y�ƨ�W��Ǟ�CB�:�ی�$M&ܪH��~��G3bБ��,��D�6W�EE2�B��e=�:�q�������'����{���=�ù���C2�H���}^�����@��x���w�!w)������v=	�Xc��b�gZ/N�j�I��Uu�T7 ��0�$V1�\[�Z�c;�I��򺅈����x��%ML�12�\�xwS��T����Ȉ�s�r��J��Q9(ĘD%�`UZ�W��qP�eS^��F�٢(�����z��6]����ݍi�5ެ
�z�\y���J67a��xa����=&G����C�T��*�A��0�����Oj�ta��<�J�B�GG��o�����T�$��ў̣�-9wpCpn���:O���ŞQ=},����c��d������0�L���w��R��Աs��� ����B����|[}�,��!���;x|%SaE�:	,!���;��U��j���A�	0~$u�U#^ߪ�3�\
jf��n�>��i�j���Ӡ����r(�	E�Lҽ2��N��� r��-5�U_����HpU����X�݄rT�$�J
�R�K-�����hLέ'؜�0�Y��B���x�4I2#)����zV|�QS�����;�	��w�(�*�!�^���ŕN����<��%L�5@���?�F�CީPDa@�����(���� d��JC
�>��j'-��`��ӄ4��GgGF��=$��Kd�@�H�L�u����a�R���{@����~�R������Kk��׍���<D��g�(8�C�1FH��H��&�
UJ>uB�`7��]���E�1SdA��߰��md���,�E�I|�K��"�����5r�UL��hF�DHY�ѣ�r��>������2�,s:ܙp�dq�!�����+ Z*a�g%��/\^�j"D6I0G��o�AƤaU˟�ѥb��DDD��'���U��I��c�5yA�R�G�R�2�7�τ�dB�fW��G�  b1�N���P�:�өpm�A� �l)����A#jM*�B� h*+{�]c<�j$Prg/$K�F	�4 ��qnb2�b��-��[�����4	��ܦ�B<�I���g=��-y��B����V v^��%0�儧iQ�h�`-�3:̊�=:�&�q���&A� �T���~�J[����V:�Ȁf6�l��E�g���w�\xN$χ9j��G�/3|��^	 �9O��pNy<�Dԛ4��`����È�ڶK�/Ͷ���-�U�ō4�"ؗٖ�v���@��ҤH-sj�ee��-2�"�0� ���eQP�5[K�١�@l���� �a���9�ۜ� g
��|,P`EX�s�*��������w�ְ��!��M�
A2F�DJ��bf٬G!���ZPBLD��vJR�[&�WHYq����1h�|�KX.�T�i(��"�.�l�m�Q�w%�3����D}eyD� ��,
����$`���ϒV5%���=-�1t)�\¦*��0���n.���vY�͋Z���V��^�r!�p��C)���dW��������_v�ct,|
; D{�l�Q�Tb�!^s�n�:G�S�e��&6����_''d�Csu�-eZ
��;�����(0��R�Up��^���FJ��Dh��H���@<1)0�D��@��yk����ǉ�����āth~v��¨唓�UP�$�b�:� Ɂ3�YZ�7�Y�W�tQ��Â����40!����jh`� *CI���=#B�����P��$����\yh����Q���.�Y�P�1h�ш�zq H�.�w�ƀ`3�0lW�l���Ju�|����	�-�ء��mc6�$�Gφ9�"ce3��i9�؈,���s�O
����N�I�A�CE(�:�'jɬ��eVHU%@����� !Jr�LV|cEbUtSH+�V֢����T/�Wk!T�ؐ"��p�T�qAuHr�wC�E0<n:ᳯ�
g���w�x���/X �����2�.�篽ȿY��[Ҽ�� ���o�Ud���a�yym�ѐX��m�A�D��
a�{or(\@b �(� ��?��S��7�J2�J,6v��|���	!� ����ت����qc0�>�S	�e�5	���N�۶h l;��r�V,��
 dv�F��<�4���M��qUލD�J�n$���𻼑�̡9��Ɲ ����dN���n;�8�"���?��"g�V����2W*��>j/7l��;P���:Ե�����˴�Ξ�
 ���3+�G[�1E��h�����a0θ��\s�$���bFA�U�� �5���J�򿄈�	(@E���B�s!`���Of�Ib�
�(�6�1�cSRe�;1˕Kl�C�f�Y`a��0TRp`R�6L!���sJ
9\j�c!a�r�9;3H�E�A)���]z�N5Ďgi��66�0R2zJ��FE��EOY����J�D�T��d���'��p-o�g�e�q�ND4���A���-3��`�U�x@�F0���+���`~/J��2�ܫ]�g&�V	K�v�*E�=�f
�r�tjtG�ߏǂYʷ��{"<��#�6 Zh�/�u�C�����r�&���	i�blAf� "���=|M�[�����hhV�z-Pʎ�~��Z�~���A� �va"fe�ك�+�6Z9EB�X}��i�I%�&����0�T	���QYZ��Y��9 �K��{"���QQ��A�ŗu Z�!+M	AB!@��\d18�*%���"d�U�	P�aB��$����ګ��V�9ˣ��^�(�C�@���BA� k"Pr\p����5Ѹ�mɢ�� {Itx���!�=��{p���I��_��2� U	�Rw��@z1K�V!�
Y
�������	q^sQ��v*[��2nR�O$�X�˗.�F�Ĕɤ`���!��Y�D�&X�����qT0h�w�J��U��v���R� �B��E�
���
 �<�0ez��ژC=�B�d�Č&�Yp�܈�(�P�ѱV��i0��.[_����j���h���Pݤ�F��y�Cx�O��!- I9N��"W�m	��} ��R�Z��x�*�Wj?B�12�h@.+r-�
_���8��D`# ���8��!�`	�sxIl���P����I���FI�8}���(Q����Y@�]%P�dhf�f�(�bda.Ճ܂8Ñ`�<�ˌE��nWq[ɬFA`��L����PU��tE�2�|D����R	m;׍<A��	���'q�E�eGW"�j�������W W��//2f�͔���#�mD��Z,+Z�S��:��k�������@NT�#E�4�Q�K�יr�g�I��[���a����Y0Z�5ўI.�ӂ���P��U񫳱�K4��T �h|���/"�R)B�p���ǔ��.Ҩqv����$���Ϡ-14�r��
c�}e3�/�s�`��e�x��M��2L�CQ�4"yo/'�~s�r�!�견���n3�r)"�1��4�s����3a���d�"�1��)tL�)E1C�Ѩ_�/xM��o�A� �D�19	��٭�a�%Ӹ�%�ن�6.�Td[�j�@h�
�q̧�ī�uR�ak�����<�C"���d���݀����U�a�HU�ꇈ�ٖ��l��B���B�%�_El��-oe*�&,5�&
 M���4J8�/.J NƵ�!G���p"��iYu[�h�l�� �0.�ݼJ�Μ���I#*�D
ը�F1�<�Q�1�P%�d$�g&��A��s�M�R����c�jp�iD�LM�N�i,1ͩ
�TZtV��A�j1ؑ0�P��L$��F���]�7G-�Ŧv%�@ϐ��̗�u���$�1�U	�(R�[�;u(Q'�\=�܆Z:�Q��HBW��$qa�ό�R���!�X\7i���H����I-���P�Muf���^"�ȱ,홖ۉ��Є� �1�!�.G!�jjoղ��@�m��ּ^��ÁDpˎ@e� ���B�Ȓ����Ʋ��n�厩{��IҀ��KIe��'�`VW"� Z�+Ƒ'��8��ɳ�,�6b�Vf(6j�@%b�hم�'h�LF&��d8�}E�%6"�U��r
 X�X^���T0��d\L�*\�2Wb���E��S!L��&2ɐ�V@����~+�<
�!�@�����-�!tƑ��D46��H�,P���u�������B����@$������ +�����5��"�*3&Ү�_���h<�^���B5�H�,�D� Ko����%��c���].���D2����f�
��f�\�a�PBC3;�,�ML�x�����y�j���k��й���%�٨a���k7����^�;���"�"�p�"�t�%��s�g��}��!ͱR:��-8�筧yT��=?=J��°5��m��@������"$��Y 3�U��9��+�S�7{�w�0��\�X�l��&�B;mm:M���*���N-�܃����v*� �P�kl�7~{A���U-�lz*U������LM0��:r�`�R���V��@pH{ pm�I�Rx��f��⨢�X�qX�P��6\iQ�eԇ�۶ҍ�C�?`��M�
2�פ���2�T�S?/xƁ�z����*<�!aV��6�+�.v	� g�ѱd���8�,^DI\2��v�D��a�;��AN��ZQA�!1T��ޢ�ĝi �.$I�X�%��1�$���⾽7sGHfp>�Te\����� ��� G�hҀ��O"�&�����_l�	�aBZ�U)�ZɄ������d*�|z�����I�c2��))�=(48s���� ��T=Ϲ��������Q>���a ~���ܑN$1�@