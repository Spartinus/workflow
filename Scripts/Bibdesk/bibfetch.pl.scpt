FasdUAS 1.101.10   ��   ��    k             l      ��  ��   
This script
  1) For each selected BibDesk publication
  2) Passes the quoted Title to bibfetch.pl
  3) Parses the results of bibfetch.pl for the URL of the PDF
  4) Uses curl to download the PDF
  5) Attaches the PDF to the publication
  6) Auto-files the PDF
  
 In order to get bibfetch.pl working, install it, and install all of the dependencies it needs by typing something similar to the following at the shell prompt:
 
 cpan install App::cpanminus
 and then
 cpanm Foo::Bar
 
 You might need to use "sudo" before cpan and cpanm
     � 	 	2 
 T h i s   s c r i p t 
     1 )   F o r   e a c h   s e l e c t e d   B i b D e s k   p u b l i c a t i o n 
     2 )   P a s s e s   t h e   q u o t e d   T i t l e   t o   b i b f e t c h . p l 
     3 )   P a r s e s   t h e   r e s u l t s   o f   b i b f e t c h . p l   f o r   t h e   U R L   o f   t h e   P D F 
     4 )   U s e s   c u r l   t o   d o w n l o a d   t h e   P D F 
     5 )   A t t a c h e s   t h e   P D F   t o   t h e   p u b l i c a t i o n 
     6 )   A u t o - f i l e s   t h e   P D F 
     
   I n   o r d e r   t o   g e t   b i b f e t c h . p l   w o r k i n g ,   i n s t a l l   i t ,   a n d   i n s t a l l   a l l   o f   t h e   d e p e n d e n c i e s   i t   n e e d s   b y   t y p i n g   s o m e t h i n g   s i m i l a r   t o   t h e   f o l l o w i n g   a t   t h e   s h e l l   p r o m p t : 
   
   c p a n   i n s t a l l   A p p : : c p a n m i n u s 
   a n d   t h e n 
   c p a n m   F o o : : B a r 
   
   Y o u   m i g h t   n e e d   t o   u s e   " s u d o "   b e f o r e   c p a n   a n d   c p a n m 
   
  
 l     ��������  ��  ��        p         ������ 0 perlpath perlPath��        l         r         m        �    / u s r / b i n / p e r l  o      ���� 0 perlpath perlPath    where is perl?     �      w h e r e   i s   p e r l ?      p         ������ 0 bibfetchpath bibfetchPath��        l         r     ! " ! m     # # � $ $ � / V o l u m e s / D r o p b o x / D r o p b o x / g i t R e p o s / S o u r c e s O n G i t H u b / S c r i p t s / P e r l S c r i p t s / b i b f e t c h . p l   - - p d f " o      ���� 0 bibfetchpath bibfetchPath    where is bibfetch.pl?      � % % ,   w h e r e   i s   b i b f e t c h . p l ?   & ' & l     ��������  ��  ��   '  ( ) ( l     ��������  ��  ��   )  *�� * l  a +���� + O   a , - , k   ` . .  / 0 / r     1 2 1 4    �� 3
�� 
docu 3 m    ����  2 o      ���� 0 thedoc theDoc 0  4�� 4 O   ` 5 6 5 k   _ 7 7  8 9 8 r     : ; : 1    ��
�� 
sele ; o      ���� 0 thesel theSel 9  <�� < Z   _ = >�� ? = ?    $ @ A @ l   " B���� B I   "�� C��
�� .corecnte****       **** C o    ���� 0 thesel theSel��  ��  ��   A m   " #����   > X   'U D�� E D O   7P F G F k   ;O H H  I J I r   ; D K L K e   ; B M M n   ; B N O N 1   ? A��
�� 
fldv O 4   ; ?�� P
�� 
bfld P m   = > Q Q � R R  D O I L o      ���� 0 thedoi theDOI J  S T S r   E R U V U e   E N W W n   E N X Y X 1   K M��
�� 
fldv Y 4   E K�� Z
�� 
bfld Z m   G J [ [ � \ \ 
 T i t l e V o      ���� 0 thetitle theTitle T  ] ^ ] Z   S s _ `���� _ F   S f a b a =  S Z c d c o   S V���� 0 thetitle theTitle d m   V Y e e � f f   b =  ] b g h g o   ] ^���� 0 thedoi theDOI h m   ^ a i i � j j   ` R   i o�� k��
�� .ascrerr ****      � **** k m   k n l l � m m , E r r o r :   N o   T i t l e   o r   D O I��  ��  ��   ^  n o n r   t { p q p m   t w r r � s s  c d   / t m p ;   q o      ���� 0 	shellopts 	shellOpts o  t u t r   | � v w v b   | � x y x b   | � z { z b   | � | } | b   | � ~  ~ m   |  � � � � �     o    ����� 0 perlpath perlPath } m   � � � � � � �    { o   � ����� 0 bibfetchpath bibfetchPath y m   � � � � � � �    w o      ���� 0 bibfetchcmd bibFetchCmd u  � � � Z   � � � ��� � � >  � � � � � o   � ����� 0 thedoi theDOI � m   � � � � � � �   � r   � � � � � b   � � � � � m   � � � � � � �  - - d o i   � n   � � � � � 1   � ���
�� 
strq � o   � ����� 0 thedoi theDOI � o      ���� 0 	searchstr 	searchStr��   � r   � � � � � n   � � � � � 1   � ���
�� 
strq � o   � ����� 0 thetitle theTitle � o      ���� 0 	searchstr 	searchStr �  � � � r   � � � � � b   � � � � � b   � � � � � b   � � � � � o   � ����� 0 	shellopts 	shellOpts � o   � ����� 0 bibfetchcmd bibFetchCmd � o   � ����� 0 	searchstr 	searchStr � m   � � � � � � � J | g r e p   - o   ' P D F : \   . * ' | c u t   - c 6 - | h e a d   - n 1 � o      ���� 0 shellcmd shellCmd �  � � � r   � � � � � I  � ��� ���
�� .sysoexecTEXT���     TEXT � o   � ����� 0 shellcmd shellCmd��   � o      ���� 0 shelloutput shellOutput �  � � � l  � ��� � ���   �   display dialog shellOutput    � � � � 4 d i s p l a y   d i a l o g   s h e l l O u t p u t �  ��� � Z   �O � ��� � � =  � � � � � o   � ����� 0 shelloutput shellOutput � m   � � � � � � �   � l  � � � � � � I  � ��� ���
�� .sysodlogaskr        TEXT � b   � � � � � m   � � � � � � � L E r r o r :   P D F   n o t   f o u n d   f o r   p u b l i c a t i o n :   � o   � ����� 0 thetitle theTitle��   �   found a URL!    � � � �    f o u n d   a   U R L !��   � k   �O � �  � � � l  � ���������  ��  ��   �  � � � Z   � � ��� � � E  � � � � � o   � ����� 0 shelloutput shellOutput � m   � � � � � � �  a r x i v . o r g � r   � � � � b   � � � � b   � � � � � m   � � � � � � � 4 c u r l   - o   / t m p / b i b f e t c h . p d f   � o   � ����� 0 shelloutput shellOutput � m   �  � � � � �  . p d f � o      ���� 0 shellcmd shellCmd��   � r   � � � b   � � � m   � � � � � 4 c u r l   - o   / t m p / b i b f e t c h . p d f   � o  ���� 0 shelloutput shellOutput � o      ���� 0 shellcmd shellCmd �  � � � I �� ���
�� .sysoexecTEXT���     TEXT � o  ���� 0 shellcmd shellCmd��   �  � � � r  # � � � m   � � � � � " / t m p / b i b f e t c h . p d f � o      ���� 0 thepath thePath �  � � � I $>���� �
�� .corecrel****      � null��   � �� � �
�� 
kocl � m  &)��
�� 
File � �� � �
�� 
data � o  ,/���� 0 thepath thePath � �� ���
�� 
insh � n  28 � � �  :  78 � 2 27��
�� 
File��   �  � � � O ?I � � � I CH������
�� .BDSKAfilnull���     bibi��  ��   � o  ?@���� 0 thepub thePub �  ��� � I JO�� ���
�� .BDSKshownull���     **** � o  JK���� 0 thepub thePub��  ��  ��   G o   7 8���� 0 thepub thePub�� 0 thepub thePub E o   * +���� 0 thesel theSel��   ? I X_�� ���
�� .sysodlogaskr        TEXT � m  X[ � � � � �   N o t h i n g   S e l e c t e d��  ��   6 o    ���� 0 thedoc theDoc��   - m    	 � ��                                                                                  BDSK  alis    P  Macintosh HD               �u��H+     QBibDesk.app                                                    �?�C        ����  	                Applications    �uz�      �B��       Q  &Macintosh HD:Applications: BibDesk.app    B i b D e s k . a p p    M a c i n t o s h   H D  Applications/BibDesk.app  / ��  ��  ��  ��       �� � ���   � ��
�� .aevtoappnull  �   � **** � �� ����� � ���
�� .aevtoappnull  �   � **** � k    a        *����  ��  ��   � ���� 0 thepub thePub � 5 �� #�� ����������������� Q��� [�~ e i�} l r�| � � ��{ � ��z�y ��x�w�v � ��u � � � � ��t�s�r�q�p�o�n�m ��� 0 perlpath perlPath�� 0 bibfetchpath bibfetchPath
�� 
docu�� 0 thedoc theDoc
�� 
sele�� 0 thesel theSel
�� .corecnte****       ****
�� 
kocl
�� 
cobj
�� 
bfld
�� 
fldv� 0 thedoi theDOI�~ 0 thetitle theTitle
�} 
bool�| 0 	shellopts 	shellOpts�{ 0 bibfetchcmd bibFetchCmd
�z 
strq�y 0 	searchstr 	searchStr�x 0 shellcmd shellCmd
�w .sysoexecTEXT���     TEXT�v 0 shelloutput shellOutput
�u .sysodlogaskr        TEXT�t 0 thepath thePath
�s 
File
�r 
data
�q 
insh�p 
�o .corecrel****      � null
�n .BDSKAfilnull���     bibi
�m .BDSKshownull���     ****��b�E�O�E�O�V*�k/E�O�J*�,E�O�j 	j3-�[��l 	kh  �*��/�,EE�O*�a /�,EE` O_ a  	 �a  a & )ja Y hOa E` Oa �%a %�%a %E` O�a  a �a ,%E` Y _ a ,E` O_ _ %_ %a  %E` !O_ !j "E` #O_ #a $  a %_ %j &Y e_ #a ' a (_ #%a )%E` !Y a *_ #%E` !O_ !j "Oa +E` ,O*�a -a ._ ,a /*a --5a 0 1O� *j 2UO�j 3U[OY��Y 	a 4j &UUascr  ��ޭ