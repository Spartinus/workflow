FasdUAS 1.101.10   ��   ��    k             l      ��  ��    � �

2104/09/20 v2.00 by Frederiko

credits to:
Carsten Bl�m �  www.bluem.net/en/mac/pashua/ for Pashua and the example scripts this is based upon
korm - for the Devonthink guts of the script and all the good ideas

     � 	 	� 
 
 2 1 0 4 / 0 9 / 2 0   v 2 . 0 0   b y   F r e d e r i k o 
 
 c r e d i t s   t o : 
 C a r s t e n   B l � m        w w w . b l u e m . n e t / e n / m a c / p a s h u a /   f o r   P a s h u a   a n d   t h e   e x a m p l e   s c r i p t s   t h i s   i s   b a s e d   u p o n 
 k o r m   -   f o r   t h e   D e v o n t h i n k   g u t s   o f   t h e   s c r i p t   a n d   a l l   t h e   g o o d   i d e a s 
 
   
  
 l     ��������  ��  ��        l     ��  ��    S M set these two properties to names of the two speicifically identified groups     �   �   s e t   t h e s e   t w o   p r o p e r t i e s   t o   n a m e s   o f   t h e   t w o   s p e i c i f i c a l l y   i d e n t i f i e d   g r o u p s      j     �� �� 0 	grouptag1 	groupTag1  m        �    I s s u e s      j    �� �� 0 	grouptag2 	groupTag2  m       �    P e o p l e      j    �� �� 0 nodecoration noDecoration  m       �   < "   s t y l e = " t e x t - d e c o r a t i o n : n o n e ;     !   j   	 �� "�� 0 	preferrtf 	preferRTF " m   	 
��
�� boovtrue !  # $ # j    �� %�� 0 	tagsource 	tagSource % m    ��
�� boovfals $  & ' & j    �� (�� 0 filelink fileLink ( m    ��
�� boovfals '  ) * ) l     ��������  ��  ��   *  + , + l   j -���� - O    j . / . k   i 0 0  1 2 1 l   �� 3 4��   3 k eset theChildren to children of (parent named "Inbox" in current database) whose name is "annotations"    4 � 5 5 � s e t   t h e C h i l d r e n   t o   c h i l d r e n   o f   ( p a r e n t   n a m e d   " I n b o x "   i n   c u r r e n t   d a t a b a s e )   w h o s e   n a m e   i s   " a n n o t a t i o n s " 2  6 7 6 l   �� 8 9��   8 1 +set theChild to (first item of theChildren)    9 � : : V s e t   t h e C h i l d   t o   ( f i r s t   i t e m   o f   t h e C h i l d r e n ) 7  ; < ; r     = > = l    ?���� ? I   �� @��
�� .DTpacd52DTrc       utxt @ m    	 A A � B B $ / I n b o x / a n n o t a t i o n s��  ��  ��   > o      ���� 0 thechild theChild <  C D C l   ��������  ��  ��   D  E F E l   �� G H��   G k e More reliable to use the frontmost window than the selected item because they might not always match    H � I I �   M o r e   r e l i a b l e   t o   u s e   t h e   f r o n t m o s t   w i n d o w   t h a n   t h e   s e l e c t e d   i t e m   b e c a u s e   t h e y   m i g h t   n o t   a l w a y s   m a t c h F  J K J r     L M L n     N O N 1    ��
�� 
DTdr O 4    �� P
�� 
thwi P m    ����  M o      ����  0 sourcedocument sourceDocument K  Q R Q r      S T S c     U V U l    W���� W n     X Y X 1    ��
�� 
UUID Y o    ����  0 sourcedocument sourceDocument��  ��   V m    ��
�� 
TEXT T o      ���� 0 
sourceuuid 
sourceUUID R  Z [ Z r   ! & \ ] \ n   ! $ ^ _ ^ 1   " $��
�� 
DTcr _ o   ! "����  0 sourcedocument sourceDocument ] o      ���� 0 thedate theDate [  ` a ` r   ' , b c b n   ' * d e d 1   ( *��
�� 
year e o   ' (���� 0 thedate theDate c o      ���� 0 yearname yearName a  f g f r   - : h i h c   - 6 j k j l  - 2 l���� l n   - 2 m n m m   . 2��
�� 
mnth n o   - .���� 0 thedate theDate��  ��   k m   2 5��
�� 
long i o      ���� 0 	yearmonth 	yearMonth g  o p o r   ; D q r q n   ; @ s t s 1   < @��
�� 
day  t o   ; <���� 0 thedate theDate r o      ���� 0 yeardate yearDate p  u v u r   E N w x w l  E J y���� y n   E J z { z 1   F J��
�� 
tstr { o   E F���� 0 thedate theDate��  ��   x o      ���� 0 yeartime yearTime v  | } | l  O O�� ~ ��   ~ 5 /set sourceDate to sourceDate & " " & sourceTime     � � � ^ s e t   s o u r c e D a t e   t o   s o u r c e D a t e   &   "   "   &   s o u r c e T i m e }  � � � l  O O�� � ���   � � �if (sourceDocument is {} or (kind of sourceDocument is in {"Group", "Smart Group", "Tag"})) then error "Please select a document, not a group"    � � � � i f   ( s o u r c e D o c u m e n t   i s   { }   o r   ( k i n d   o f   s o u r c e D o c u m e n t   i s   i n   { " G r o u p " ,   " S m a r t   G r o u p " ,   " T a g " } ) )   t h e n   e r r o r   " P l e a s e   s e l e c t   a   d o c u m e n t ,   n o t   a   g r o u p " �  � � � l  O O��������  ��  ��   �  � � � r   O ] � � � l  O Y ����� � l  O Y ����� � c   O Y � � � n   O W � � � m   S W��
�� 
subs � 4   O S�� �
�� 
thwi � m   Q R����  � m   W X��
�� 
TEXT��  ��  ��  ��   � o      ���� &0 originalcitedtext originalcitedText �  � � � r   ^ g � � � l  ^ c ����� � n   ^ c � � � 1   _ c��
�� 
pnam � o   ^ _����  0 sourcedocument sourceDocument��  ��   � o      ����  0 annotationname annotationName �  � � � r   h q � � � c   h m � � � l  h k ����� � n   h k � � � 1   i k��
�� 
UUID � o   h i����  0 sourcedocument sourceDocument��  ��   � m   k l��
�� 
TEXT � o      ���� &0 annotationtagname annotationTagname �  � � � I  r ��� ���
�� .DTpacd52DTrc       utxt � b   r  � � � b   r { � � � m   r u � � � � �  / T a g s / � o   u z���� 0 	grouptag1 	groupTag1 � m   { ~ � � � � � 
 / N o n e��   �  � � � I  � ��� ���
�� .DTpacd52DTrc       utxt � b   � � � � � b   � � � � � m   � � � � � � �  / T a g s / � o   � ����� 0 	grouptag2 	groupTag2 � m   � � � � � � � 
 / N o n e��   �  � � � r   � � � � � n   � � � � � 2  � ���
�� 
DTch � l  � � ����� � I  � ��� ���
�� .DTpacd52DTrc       utxt � b   � � � � � m   � � � � � � �  / T a g s / � o   � ����� 0 	grouptag1 	groupTag1��  ��  ��   � o      ���� 0 theissueslist theIssueslist �  � � � r   � � � � � n   � � � � � 2  � ���
�� 
DTch � l  � � ����� � I  � ��� ���
�� .DTpacd52DTrc       utxt � b   � � � � � m   � � � � � � �  / T a g s / � o   � ����� 0 	grouptag2 	groupTag2��  ��  ��   � o      ���� 0 thepeoplelist thePeoplelist �  � � � r   � � � � � n   � � � � � 2  � ���
�� 
DTch � l  � � ����� � I  � ��� ���
�� .DTpacd52DTrc       utxt � m   � � � � � � � 
 / T a g s��  ��  ��   � o      ���� 0 alltagslist allTagslist �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � ; 5 get names of tags in list in preparation for sorting    � � � � j   g e t   n a m e s   o f   t a g s   i n   l i s t   i n   p r e p a r a t i o n   f o r   s o r t i n g �  � � � r   � � � � � J   � �����   � o      ���� 0 	theissues 	theIssues �  � � � X   � ��� � � r   � � � � � b   � � � � � o   � ����� 0 	theissues 	theIssues � l  � � ����� � c   � � � � � n   � � � � � 1   � ���
�� 
pnam � o   � ����� 0 theissue theIssue � m   � ���
�� 
TEXT��  ��   � o      ���� 0 	theissues 	theIssues�� 0 theissue theIssue � l  � � ����� � o   � ��� 0 theissueslist theIssueslist��  ��   �  � � � l �~�}�|�~  �}  �|   �  � � � r  
 � � � J  �{�{   � o      �z�z 0 	thepeople 	thePeople �  � � � X  5 ��y � � r  !0 � � � b  !,   o  !$�x�x 0 	thepeople 	thePeople l $+�w�v c  $+ n  $) 1  %)�u
�u 
pnam o  $%�t�t 0 theissue theIssue m  )*�s
�s 
TEXT�w  �v   � o      �r�r 0 	thepeople 	thePeople�y 0 theissue theIssue � l �q�p o  �o�o 0 thepeoplelist thePeoplelist�q  �p   � 	 l 66�n�m�l�n  �m  �l  	 

 r  6< J  68�k�k   o      �j�j 0 alltags allTags  X  =g�i r  Sb b  S^ o  SV�h�h 0 alltags allTags l V]�g�f c  V] n  V[ 1  W[�e
�e 
pnam o  VW�d�d 0 theissue theIssue m  [\�c
�c 
TEXT�g  �f   o      �b�b 0 alltags allTags�i 0 theissue theIssue l @C�a�` o  @C�_�_ 0 alltagslist allTagslist�a  �`   �^ l hh�]�\�[�]  �\  �[  �^   / 5     �Z�Y
�Z 
capp m     �  D N t p
�Y kfrmID  ��  ��   ,  !  l     �X�W�V�X  �W  �V  ! "#" l     �U$%�U  $   sort the tag groups   % �&& (   s o r t   t h e   t a g   g r o u p s# '(' l kz)�T�S) r  kz*+* J  kt,, -�R- I kr�Q.�P
�Q .sysontocTEXT       shor. m  kn�O�O 
�P  �R  + 1  ty�N
�N 
txdl�T  �S  ( /0/ l {�1�M�L1 r  {�232 c  {�454 o  {~�K�K 0 	theissues 	theIssues5 m  ~�J
�J 
TEXT3 o      �I�I 0 	theissues 	theIssues�M  �L  0 676 l ��8�H�G8 r  ��9:9 c  ��;<; o  ���F�F 0 	thepeople 	thePeople< m  ���E
�E 
TEXT: o      �D�D 0 	thepeople 	thePeople�H  �G  7 =>= l ��?�C�B? r  ��@A@ c  ��BCB o  ���A�A 0 alltags allTagsC m  ���@
�@ 
TEXTA o      �?�? 0 alltags allTags�C  �B  > DED l     �>�=�<�>  �=  �<  E FGF l ��H�;�:H r  ��IJI n  ��KLK 2 ���9
�9 
cparL l ��M�8�7M I ���6N�5
�6 .sysoexecTEXT���     TEXTN b  ��OPO b  ��QRQ m  ��SS �TT 
 e c h o  R n  ��UVU 1  ���4
�4 
strqV l ��W�3�2W o  ���1�1 0 	theissues 	theIssues�3  �2  P m  ��XX �YY    |   s o r t   - f�5  �8  �7  J o      �0�0 0 	theissues 	theIssues�;  �:  G Z[Z l ��\�/�.\ r  ��]^] n  ��_`_ 2 ���-
�- 
cpar` l ��a�,�+a I ���*b�)
�* .sysoexecTEXT���     TEXTb b  ��cdc b  ��efe m  ��gg �hh 
 e c h o  f n  ��iji 1  ���(
�( 
strqj l ��k�'�&k o  ���%�% 0 	thepeople 	thePeople�'  �&  d m  ��ll �mm    |   s o r t   - f�)  �,  �+  ^ o      �$�$ 0 	thepeople 	thePeople�/  �.  [ non l ��p�#�"p r  ��qrq n  ��sts 2 ���!
�! 
cpart l ��u� �u I ���v�
� .sysoexecTEXT���     TEXTv b  ��wxw b  ��yzy m  ��{{ �|| 
 e c h o  z n  ��}~} 1  ���
� 
strq~ l ���� o  ���� 0 alltags allTags�  �  x m  ���� ���    |   s o r t   - f�  �   �  r o      �� 0 alltags allTags�#  �"  o ��� l ������ r  ����� m  ���� ���  � 1  ���
� 
txdl�  �  � ��� l     ����  �  �  � ��� l     ����  � J D clean the selected text of linefeeds or Pashua will throw an error.   � ��� �   c l e a n   t h e   s e l e c t e d   t e x t   o f   l i n e f e e d s   o r   P a s h u a   w i l l   t h r o w   a n   e r r o r .� ��� l     ����  � X R also cleans other none alphanumeric characters that copying from pdf can throw up   � ��� �   a l s o   c l e a n s   o t h e r   n o n e   a l p h a n u m e r i c   c h a r a c t e r s   t h a t   c o p y i n g   f r o m   p d f   c a n   t h r o w   u p� ��� l     ����  �  �  � ��� l     ����  � � ~set citedText to (do shell script "echo " & quoted form of originalcitedText & "|sed \"s/[^[:alnum:][:space:][:punct:]]//g\"")   � ��� � s e t   c i t e d T e x t   t o   ( d o   s h e l l   s c r i p t   " e c h o   "   &   q u o t e d   f o r m   o f   o r i g i n a l c i t e d T e x t   &   " | s e d   \ " s / [ ^ [ : a l n u m : ] [ : s p a c e : ] [ : p u n c t : ] ] / / g \ " " )� ��� l ����
� r  ���� l �
��	�� I �
���
� .sysoexecTEXT���     TEXT� b  ���� b  ���� m  ���� ��� 
 e c h o  � n  ���� 1  ��
� 
strq� o  ���� &0 originalcitedtext originalcitedText� m  �� ��� �   |   t e x t u t i l   - s t d i n   - s t d o u t   - i n p u t e n c o d i n g   u t f - 8   - f o r m a t   t x t   - c o n v e r t   t x t�  �	  �  � o      �� 0 	citedtext 	citedText�  �
  � ��� l ���� r  ��� o  � 
�  
ret � 1  ��
�� 
txdl�  �  � ��� l $������ r  $��� n   ��� 2  ��
�� 
citm� o  ���� 0 	citedtext 	citedText� o      ���� 0 	citedtext 	citedText��  ��  � ��� l %.������ r  %.��� m  %(�� ���  [ r e t u r n ]� 1  (-��
�� 
txdl��  ��  � ��� l /8������ r  /8��� c  /4��� o  /2���� 0 	citedtext 	citedText� m  23��
�� 
TEXT� o      ���� 0 	citedtext 	citedText��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �   the Pashua configuration   � ��� 2   t h e   P a s h u a   c o n f i g u r a t i o n� ��� l 9f������ r  9f��� b  9b��� b  9^��� b  9Z��� b  9V��� b  9R��� b  9N��� b  9J��� b  9F��� b  9D��� b  9@��� m  9<�� ���� 
 #   S e t   t r a n s p a r e n c y :   0   i s   t r a n s p a r e n t ,   1   i s   o p a q u e 
 * . t r a n s p a r e n c y = 0 . 9 5 
 
 #   S e t   w i n d o w   t i t l e 
 * . t i t l e   =   Q u i c k   A n n o t a t i o n 
 
 
 #   A d d   a   t e x t   f i e l d 
 a n n o t a t i o n N a m e . t y p e   =   t e x t f i e l d 
 a n n o t a t i o n N a m e . l a b e l   =   A n n o t a t i o n   n a m e 
 a n n o t a t i o n N a m e . d e f a u l t   =  � o  <?����  0 annotationname annotationName� m  @C�� ���t 
 a n n o t a t i o n N a m e . w i d t h   =   3 1 0 
 a n n o t a t i o n N a m e . t o o l t i p   =   T i t l e   o f   a n n o t a t i o n 
 a n n o t a t i o n N a m e . r e l y   =   - 1 0 
 
 #   A d d   a   t e x t   f i e l d 
 y e a r N a m e . t y p e   =   t e x t f i e l d 
 y e a r N a m e . l a b e l   =   D a t e 
 y e a r N a m e . d e f a u l t   =  � o  DE���� 0 yearname yearName� m  FI�� ��� � 
 y e a r N a m e . w i d t h   =   5 0 
 y e a r N a m e . r e l y   =   - 1 0 
 
 #   A d d   a   t e x t   f i e l d 
 y e a r M o n t h . t y p e   =   t e x t f i e l d 
 y e a r M o n t h . l a b e l   =   
 y e a r M o n t h . d e f a u l t   =  � o  JM���� 0 	yearmonth 	yearMonth� m  NQ�� ��� 	 
 y e a r M o n t h . w i d t h   =   2 5 
 y e a r M o n t h . x   =   5 4 
 y e a r M o n t h . y =   3 0 1 
 
 #   A d d   a   t e x t   f i e l d 
 y e a r D a t e . t y p e   =   t e x t f i e l d 
 y e a r D a t e . l a b e l   =   
 y e a r D a t e . d e f a u l t   =  � o  RU���� 0 yeardate yearDate� m  VY�� ��� 
 y e a r D a t e . w i d t h   =   2 5 
 y e a r D a t e . x   =   8 4 
 y e a r D a t e . y =   3 0 1 
 
 #   A d d   a   t e x t   f i e l d 
 y e a r T i m e . t y p e   =   t e x t f i e l d 
 y e a r T i m e . l a b e l   =   T i m e 
 y e a r T i m e . d e f a u l t   =  � o  Z]���� 0 yeartime yearTime� m  ^a�� ���� 	 
 y e a r T i m e . w i d t h   =   1 0 0 
 y e a r T i m e . x   =   1 3 0 
 y e a r T i m e . y =   3 0 1 
 
 l a b l e V a l u e . t y p e   =   p o p u p 
 l a b l e V a l u e . l a b e l   =   L a b e l 
 l a b l e V a l u e . w i d t h   =   5 0 
 l a b l e V a l u e . o p t i o n   =   0 
 l a b l e V a l u e . o p t i o n   =   1 
 l a b l e V a l u e . o p t i o n   =   2 
 l a b l e V a l u e . o p t i o n   =   3 
 l a b l e V a l u e . o p t i o n   =   4 
 l a b l e V a l u e . o p t i o n   =   5 
 l a b l e V a l u e . o p t i o n   =   6 
 l a b l e V a l u e . o p t i o n   =   7 
 l a b l e V a l u e . d e f a u l t   =   0 
 l a b l e V a l u e . x   =   2 6 0 
 l a b l e V a l u e . y = 2 9 9 
 
 #   A d d   a   t e x t   f i e l d 
 a n n o t a t i o n T a g s . t y p e   =   c o m b o b o x 
 a n n o t a t i o n T a g s . l a b e l   =   A n n o t a t i o n   T a g s   ( s e p a r a t e   w i t h   s e m i - c o l o n ) 
 a n n o t a t i o n T a g s . c o m p l e t i o n   = 2 
� o      ���� 
0 config  ��  ��  � ��� l g������� X  g������ k  }��� ��� l }}��������  ��  ��  � ���� Z  }�������� H  }��� E }�� � J  }�  m  }� �  A n n o t a t i o n s  o  ������ 0 	grouptag1 	groupTag1 �� o  ������ 0 	grouptag2 	groupTag2��    o  ������ 0 theissue theIssue� r  ��	
	 l ������ b  �� b  �� b  �� o  ������ 
0 config   m  �� � 0 a n n o t a t i o n T a g s . o p t i o n   =   l ������ c  �� o  ������ 0 theissue theIssue m  ����
�� 
TEXT��  ��   o  ����
�� 
ret ��  ��  
 o      ���� 
0 config  ��  ��  ��  �� 0 theissue theIssue� o  jm���� 0 alltags allTags��  ��  �  l ������ I ������
�� .ascrcmnt****      � **** o  ������ 
0 config  ��  ��  ��    l ������ r  �� b  �� !  b  ��"#" b  ��$%$ o  ������ 
0 config  % m  ��&& �'' � a n n o t a t i o n T a g s . w i d t h   =   3 1 0 
 a n n o t a t i o n T a g s . r e l y   =   - 1 0 
 
 i s s u e 1 . t y p e   =   c o m b o b o x 
 i s s u e 1 . l a b e l   =  # o  ������ 0 	grouptag1 	groupTag1! m  ��(( �)) . 
 i s s u e 1 . c o m p l e t i o n   =   2 
 o      ���� 
0 config  ��  ��   *+* l     ��������  ��  ��  + ,-, l ��.����. X  ��/��0/ r  ��121 l ��3����3 b  ��454 b  ��676 b  ��898 o  ������ 
0 config  9 m  ��:: �;;   i s s u e 1 . o p t i o n   =  7 l ��<����< c  ��=>= o  ������ 0 theissue theIssue> m  ����
�� 
TEXT��  ��  5 o  ����
�� 
ret ��  ��  2 o      ���� 
0 config  �� 0 theissue theIssue0 l ��?����? o  ������ 0 	theissues 	theIssues��  ��  ��  ��  - @A@ l     ��������  ��  ��  A BCB l �D����D r  �EFE b  �GHG b  �	IJI b  �KLK o  ������ 
0 config  L m  �MM �NN � i s s u e 1 . w i d t h   =   1 5 0 
 i s s u e 1 . r e l y   =   - 2 0 
 
 n a m e 1 . t y p e   =   c o m b o b o x 
 n a m e 1 . l a b e l   =  J o  ���� 0 	grouptag2 	groupTag2H m  	OO �PP , 
 n a m e 1 . c o m p l e t i o n   =   2 
F o      ���� 
0 config  ��  ��  C QRQ l     ��������  ��  ��  R STS l @U����U X  @V��WV r  (;XYX l (7Z����Z b  (7[\[ b  (3]^] b  (/_`_ o  (+���� 
0 config  ` m  +.aa �bb  n a m e 1 . o p t i o n   =  ^ l /2c����c c  /2ded o  /0���� 0 theissue theIssuee m  01��
�� 
TEXT��  ��  \ o  36��
�� 
ret ��  ��  Y o      ���� 
0 config  �� 0 theissue theIssueW l f����f o  ���� 0 	thepeople 	thePeople��  ��  ��  ��  T ghg l     ��������  ��  ��  h iji l ALk����k r  ALlml b  AHnon o  AD���� 
0 config  o m  DGpp �qq � n a m e 1 . w i d t h   =   1 5 0 
 n a m e 1 . x   =   1 6 0 
 n a m e 1 . y   =   1 8 3 
 
 i s s u e 2 . t y p e   =   c o m b o b o x 
 i s s u e 2 . l a b e l   =   
 i s s u e 2 . c o m p l e t i o n   =   2 
m o      ���� 
0 config  ��  ��  j rsr l M{t����t X  M{u��vu r  cvwxw l cry����y b  crz{z b  cn|}| b  cj~~ o  cf���� 
0 config   m  fi�� ���   i s s u e 2 . o p t i o n   =  } l jm������ c  jm��� o  jk���� 0 theissue theIssue� m  kl��
�� 
TEXT��  ��  { o  nq��
�� 
ret ��  ��  x o      ���� 
0 config  �� 0 theissue theIssuev l PS������ o  PS���� 0 	theissues 	theIssues��  ��  ��  ��  s ��� l     ��������  ��  ��  � ��� l |����~� r  |���� b  |���� o  |�}�} 
0 config  � m  ��� ��� � i s s u e 2 . w i d t h   =   1 5 0 
 i s s u e 2 . r e l y   =   - 2 0 
 
 n a m e 2 . t y p e   =   c o m b o b o x 
 n a m e 2 . l a b e l   =   
 n a m e 2 . c o m p l e t i o n   =   2 
� o      �|�| 
0 config  �  �~  � ��� l ����{�z� X  ����y�� r  ����� l ����x�w� b  ����� b  ����� b  ����� o  ���v�v 
0 config  � m  ���� ���  n a m e 2 . o p t i o n   =  � l ����u�t� c  ����� o  ���s�s 0 theissue theIssue� m  ���r
�r 
TEXT�u  �t  � o  ���q
�q 
ret �x  �w  � o      �p�p 
0 config  �y 0 theissue theIssue� l ����o�n� o  ���m�m 0 	thepeople 	thePeople�o  �n  �{  �z  � ��� l     �l�k�j�l  �k  �j  � ��� l ����i�h� r  ����� b  ����� o  ���g�g 
0 config  � m  ���� ��� � n a m e 2 . w i d t h   =   1 5 0 
 n a m e 2 . x   =   1 6 0 
 n a m e 2 . y   =   1 3 4 
 
 i s s u e 3 . t y p e   =   c o m b o b o x 
 i s s u e 3 . l a b e l   =   
 i s s u e 3 . c o m p l e t i o n   =   2 
� o      �f�f 
0 config  �i  �h  � ��� l ����e�d� X  ����c�� r  ����� l ����b�a� b  ����� b  ����� b  ����� o  ���`�` 
0 config  � m  ���� ���   i s s u e 3 . o p t i o n   =  � l ����_�^� c  ����� o  ���]�] 0 theissue theIssue� m  ���\
�\ 
TEXT�_  �^  � o  ���[
�[ 
ret �b  �a  � o      �Z�Z 
0 config  �c 0 theissue theIssue� l ����Y�X� o  ���W�W 0 	theissues 	theIssues�Y  �X  �e  �d  � ��� l     �V�U�T�V  �U  �T  � ��� l ����S�R� r  ����� b  ����� o  ���Q�Q 
0 config  � m  ���� ��� � i s s u e 3 . w i d t h   =   1 5 0 
 
 
 n a m e 3 . t y p e   =   c o m b o b o x 
 n a m e 3 . l a b e l   =   
 n a m e 3 . c o m p l e t i o n   =   2 
� o      �P�P 
0 config  �S  �R  � ��� l �,��O�N� X  �,��M�� r  '��� l #��L�K� b  #��� b  ��� b  ��� o  �J�J 
0 config  � m  �� ���  n a m e 3 . o p t i o n   =  � l ��I�H� c  ��� o  �G�G 0 theissue theIssue� m  �F
�F 
TEXT�I  �H  � o  "�E
�E 
ret �L  �K  � o      �D�D 
0 config  �M 0 theissue theIssue� l ��C�B� o  �A�A 0 	thepeople 	thePeople�C  �B  �O  �N  � ��� l     �@�?�>�@  �?  �>  � ��� l -@��=�<� r  -@��� b  -<��� b  -8��� b  -4��� o  -0�;�; 
0 config  � m  03�� ���� n a m e 3 . w i d t h   =   1 5 0 
 n a m e 3 . x   =   1 6 0 
 n a m e 3 . y   =   8 5 
 
 #   A d d   a   c h e c k b o x 
 # o p e n A n n o t a t i o n . r e l y   =   - 1 8 
 o p e n A n n o t a t i o n . t y p e   =   c h e c k b o x 
 o p e n A n n o t a t i o n . l a b e l   =   O p e n   a n n o t a t i o n 
 o p e n A n n o t a t i o n . d e f a u l t   =   0 
 o p e n A n n o t a t i o n . t o o l t i p   =   O p e n s   a n n o t a t i o n   i n   s e p a r a t e   w i n d o w 
 o p e n A n n o t a t i o n . r e l y   =   - 1 8 
 
 #   A d d   a   c h e c k b o x 
 c o p y T o s p o t l i g h t . r e l y   =   - 1 8 
 c o p y T o s p o t l i g h t . t y p e   =   c h e c k b o x 
 c o p y T o s p o t l i g h t . l a b e l   =   N o t e s   i n   c o m m e n t 
 c o p y T o s p o t l i g h t . d e f a u l t   =   0 
 c o p y T o s p o t l i g h t . t o o l t i p   =   C o p i e s   t h e   n o t e s   t o   t h e   s p o t l i g h t   c o m m e n t 
 
 #   A d d   a   c h e c k b o x 
 a d j u s t D a t e . t y p e   =   c h e c k b o x 
 a d j u s t D a t e . l a b e l   =   S e t   a n n o t a t i o n   d a t e 
 a d j u s t D a t e . d e f a u l t   =   1 
 a d j u s t D a t e . t o o l t i p   =   S e t s   a n n o t a t i o n   d a t e 
 a d j u s t D a t e . x = 1 6 0 
 a d j u s t D a t e . y =   4 6 
 
 #   A d d   a   c h e c k b o x 
 a n n o t a t i o n L o c a t i o n . t y p e   =   c h e c k b o x 
 a n n o t a t i o n L o c a t i o n . l a b e l   =   S e t   a n n o t a t i o n   l o c a t i o n 
 a n n o t a t i o n L o c a t i o n . d e f a u l t   =   0 
 a n n o t a t i o n L o c a t i o n . t o o l t i p   =   S e t s   f o l d e r   t o   s t o r e   a n n o t a t i o n 
 a n n o t a t i o n L o c a t i o n . x = 1 6 0 
 a n n o t a t i o n L o c a t i o n . y =   2 7 
 
 
 #   C i t a t i o n   t e x t 
 c i t e d T e x t . t y p e   =   t e x t b o x 
 c i t e d T e x t . l a b e l   =   C i t a t i o n 
 c i t e d T e x t . d e f a u l t   =� o  47�:�: 0 	citedtext 	citedText� m  8;�� ���� 
 c i t e d T e x t . h e i g h t   =   1 5 0 
 c i t e d T e x t . w i d t h   =   3 1 0 
 c i t e d T e x t . x   =   3 3 7 
 c i t e d T e x t . y   =   2 3 0 
 
 #   N o t e s   t e x t 
 a n n o t a t i o n N o t e . t y p e   =   t e x t b o x 
 a n n o t a t i o n N o t e . l a b e l   =   N o t e s 
 a n n o t a t i o n N o t e . d e f a u l t   =   
 a n n o t a t i o n N o t e . h e i g h t   =   1 5 0 
 a n n o t a t i o n N o t e . w i d t h   =   3 1 0 
 a n n o t a t i o n N o t e . x   =   3 4 0 
 a n n o t a t i o n N o t e . y   =   4 5 	 
 
 
 #   A d d   a   c a n c e l   b u t t o n   w i t h   d e f a u l t   l a b e l 
 c b . t y p e = c a n c e l b u t t o n 
� o      �9�9 
0 config  �=  �<  � ��� l     �8�7�6�8  �7  �6  � ��� l     �5�4�3�5  �4  �3  � ��� l     �2���2  � @ : Call Pashua and save the resulting record in pashuaResult   � ��� t   C a l l   P a s h u a   a n d   s a v e   t h e   r e s u l t i n g   r e c o r d   i n   p a s h u a R e s u l t� ��� l AS��1�0� r  AS   I  AO�/�.�/ 0 
pashua_run    o  BE�-�- 
0 config    m  EH �   	�,	 m  HK

 �  �,  �.   o      �+�+ 0 pashuaresult pashuaResult�1  �0  �  l TY�*�) I TY�(�'�&
�( .miscactvnull��� ��� null�'  �&  �*  �)    l     �%�$�#�%  �$  �#    l     �"�!� �"  �!  �     l Z	��� Z  Z	�� > Ze n  Za o  ]a�� 0 cb   o  Z]�� 0 pashuaresult pashuaResult m  ad �  1 k  h	�  !  l hh�"#�  " K E clean what comes back from pashua and convert [return] to </br> tags   # �$$ �   c l e a n   w h a t   c o m e s   b a c k   f r o m   p a s h u a   a n d   c o n v e r t   [ r e t u r n ]   t o   < / b r >   t a g s! %&% l hh�'(�  ' / ) must specifically allow for [ ] in regex   ( �)) R   m u s t   s p e c i f i c a l l y   a l l o w   f o r   [   ]   i n   r e g e x& *+* l hh�,-�  , � � set annotationNote to (do shell script "echo " & quoted form of (annotationNote of pashuaResult) & "|sed \"s/[^[:alnum:][:space:][\\[\\]]//g\"")   - �.."   s e t   a n n o t a t i o n N o t e   t o   ( d o   s h e l l   s c r i p t   " e c h o   "   &   q u o t e d   f o r m   o f   ( a n n o t a t i o n N o t e   o f   p a s h u a R e s u l t )   &   " | s e d   \ " s / [ ^ [ : a l n u m : ] [ : s p a c e : ] [ \ \ [ \ \ ] ] / / g \ " " )+ /0/ l hh����  �  �  0 121 l hh�34�  3 � �set citedText to (do shell script "echo " & quoted form of (citedText of pashuaResult) & "|sed \"s/[^[:alnum:][:space:][:punct:]]//g\"")   4 �55 s e t   c i t e d T e x t   t o   ( d o   s h e l l   s c r i p t   " e c h o   "   &   q u o t e d   f o r m   o f   ( c i t e d T e x t   o f   p a s h u a R e s u l t )   &   " | s e d   \ " s / [ ^ [ : a l n u m : ] [ : s p a c e : ] [ : p u n c t : ] ] / / g \ " " )2 676 r  hs898 l ho:��: n  ho;<; o  ko�� 0 	citedtext 	citedText< o  hk�� 0 pashuaresult pashuaResult�  �  9 o      �� 0 	citedtext 	citedText7 =>= r  t?@? l t{A��A n  t{BCB o  w{��  0 annotationnote annotationNoteC o  tw�� 0 pashuaresult pashuaResult�  �  @ o      �
�
  0 annotationnote annotationNote> DED r  ��FGF v  ��HH I�	I m  ��JJ �KK  [ r e t u r n ]�	  G 1  ���
� 
txdlE LML r  ��NON n  ��PQP 2 ���
� 
citmQ o  ����  0 annotationnote annotationNoteO o      ��  0 annotationnote annotationNoteM RSR r  ��TUT n  ��VWV 2 ���
� 
citmW o  ���� 0 	citedtext 	citedTextU o      �� 0 	citedtext 	citedTextS XYX r  ��Z[Z m  ��\\ �]]  < b r >[ 1  ���
� 
txdlY ^_^ r  ��`a` c  ��bcb o  ��� �   0 annotationnote annotationNotec m  ����
�� 
TEXTa o      ����  0 annotationnote annotationNote_ ded r  ��fgf c  ��hih o  ������ 0 	citedtext 	citedTexti m  ����
�� 
TEXTg o      ���� 0 	citedtext 	citedTexte jkj r  ��lml m  ��nn �oo  m 1  ����
�� 
txdlk pqp l ����������  ��  ��  q rsr l ����tu��  t @ :set annotationPrefix to (annotationPrefix of pashuaResult)   u �vv t s e t   a n n o t a t i o n P r e f i x   t o   ( a n n o t a t i o n P r e f i x   o f   p a s h u a R e s u l t )s wxw r  ��yzy l ��{����{ n  ��|}| o  ������  0 annotationname annotationName} o  ������ 0 pashuaresult pashuaResult��  ��  z o      ����  0 annotationname annotationNamex ~~ l ��������  � < 6set replicatetoTag to (replicatetoTag of pashuaResult)   � ��� l s e t   r e p l i c a t e t o T a g   t o   ( r e p l i c a t e t o T a g   o f   p a s h u a R e s u l t ) ��� r  �-��� c  �)��� l �'������ b  �'��� b  ���� b  ���� b  ���� b  ���� b  ���� b  ���� b  ����� b  ����� b  ����� b  ����� b  ����� l �������� n  ����� o  ������  0 annotationtags annotationTags� o  ������ 0 pashuaresult pashuaResult��  ��  � m  ���� ���  ;� l �������� n  ����� o  ������ 
0 issue1  � o  ������ 0 pashuaresult pashuaResult��  ��  � m  ���� ���  ;� l �������� n  ����� o  ������ 
0 issue2  � o  ������ 0 pashuaresult pashuaResult��  ��  � m  ���� ���  ;� l ������� n  ���� o  ����� 
0 issue3  � o  ������ 0 pashuaresult pashuaResult��  ��  � m  �� ���  ;� l ������ n  ��� o  
���� 	0 name1  � o  
���� 0 pashuaresult pashuaResult��  ��  � m  �� ���  ;� l ������ n  ��� o  ���� 	0 name2  � o  ���� 0 pashuaresult pashuaResult��  ��  � m  �� ���  ;� l &������ n  &��� o  "&���� 	0 name3  � o  "���� 0 pashuaresult pashuaResult��  ��  ��  ��  � m  '(��
�� 
TEXT� o      ����  0 annotationtags annotationTags� ��� l ..������  � B <set annotationTagname to (annotationTagname of pashuaResult)   � ��� x s e t   a n n o t a t i o n T a g n a m e   t o   ( a n n o t a t i o n T a g n a m e   o f   p a s h u a R e s u l t )� ��� r  .9��� l .5������ n  .5��� o  15����  0 openannotation openAnnotation� o  .1���� 0 pashuaresult pashuaResult��  ��  � o      ����  0 openannotation openAnnotation� ��� r  :E��� l :A������ n  :A��� o  =A���� 0 
adjustdate 
adjustDate� o  :=���� 0 pashuaresult pashuaResult��  ��  � o      ���� 0 
adjustdate 
adjustDate� ��� r  Fx��� 4  Ft���
�� 
ldt � l Js������ b  Js��� b  Jk��� b  Jg��� b  J_��� b  J[��� b  JS��� l JO������ n  JO��� o  MO���� 0 yearname yearName� o  JM���� 0 pashuaresult pashuaResult��  ��  � m  OR�� ���  /� l SZ������ n  SZ��� o  VZ���� 0 	yearmonth 	yearMonth� o  SV���� 0 pashuaresult pashuaResult��  ��  � m  [^�� ���  /� l _f������ n  _f��� o  bf���� 0 yeardate yearDate� o  _b���� 0 pashuaresult pashuaResult��  ��  � m  gj�� ���   � l kr������ n  kr��� o  nr���� 0 yeartime yearTime� o  kn���� 0 pashuaresult pashuaResult��  ��  ��  ��  � o      ����  0 annotationdate annotationDate� ��� r  y���� l y������� n  y�� � o  |����� "0 copytospotlight copyTospotlight  o  y|���� 0 pashuaresult pashuaResult��  ��  � o      ���� "0 copytospotlight copyTospotlight�  r  �� l ������ n  �� o  ������ (0 annotationlocation annotationLocation o  ������ 0 pashuaresult pashuaResult��  ��   o      ���� (0 annotationlocation annotationLocation 	 r  ��

 l ������ n  �� o  ������ 0 
lablevalue 
lableValue o  ������ 0 pashuaresult pashuaResult��  ��   o      ���� 0 
lablevalue 
lableValue	  l ������     mostly korm's code    � &   m o s t l y   k o r m ' s   c o d e  l ����������  ��  ��    l ����������  ��  ��    O  �	� k  �	�  I ������
�� .DTpacd52DTrc       utxt b  �� !  b  ��"#" b  ��$%$ m  ��&& �''  / T a g s /% o  ������ 0 	grouptag1 	groupTag1# m  ��(( �))  /! l ��*����* n  ��+,+ o  ������ 
0 issue1  , o  ������ 0 pashuaresult pashuaResult��  ��  ��   -.- I ����/��
�� .DTpacd52DTrc       utxt/ l ��0����0 b  ��121 b  ��343 b  ��565 m  ��77 �88  / T a g s /6 o  ������ 0 	grouptag1 	groupTag14 m  ��99 �::  /2 l ��;����; n  ��<=< o  ������ 
0 issue2  = o  ������ 0 pashuaresult pashuaResult��  ��  ��  ��  ��  . >?> I ����@��
�� .DTpacd52DTrc       utxt@ l ��A����A b  ��BCB b  ��DED b  ��FGF m  ��HH �II  / T a g s /G o  ������ 0 	grouptag1 	groupTag1E m  ��JJ �KK  /C l ��L����L n  ��MNM o  ������ 
0 issue3  N o  ������ 0 pashuaresult pashuaResult��  ��  ��  ��  ��  ? OPO I ���Q��
�� .DTpacd52DTrc       utxtQ l �
R��~R b  �
STS b  �UVU b  ��WXW m  ��YY �ZZ  / T a g s /X o  ���}�} 0 	grouptag2 	groupTag2V m  �[[ �\\  /T l 	]�|�{] n  	^_^ o  	�z�z 	0 name1  _ o  �y�y 0 pashuaresult pashuaResult�|  �{  �  �~  ��  P `a` I (�xb�w
�x .DTpacd52DTrc       utxtb l $c�v�uc b  $ded b  fgf b  hih m  jj �kk  / T a g s /i o  �t�t 0 	grouptag2 	groupTag2g m  ll �mm  /e l #n�s�rn n  #opo o  #�q�q 	0 name2  p o  �p�p 0 pashuaresult pashuaResult�s  �r  �v  �u  �w  a qrq I )B�os�n
�o .DTpacd52DTrc       utxts l )>t�m�lt b  )>uvu b  )6wxw b  )2yzy m  ),{{ �||  / T a g s /z o  ,1�k�k 0 	grouptag2 	groupTag2x m  25}} �~~  /v l 6=�j�i n  6=��� o  9=�h�h 	0 name3  � o  69�g�g 0 pashuaresult pashuaResult�j  �i  �m  �l  �n  r ��� l CC�f���f  � 5 /set the clipboard to (annotationPrefix as text)   � ��� ^ s e t   t h e   c l i p b o a r d   t o   ( a n n o t a t i o n P r e f i x   a s   t e x t )� ��� l CC�e�d�c�e  �d  �c  � ��� l CC�b�a�`�b  �a  �`  � ��� r  CN��� I CJ�_��^
�_ .DTpacd52DTrc       utxt� m  CF�� ��� " / T a g s / A n n o t a t i o n s�^  � o      �]�] &0 annotationsmaster annotationsMaster� ��� r  O^��� I OZ�\��[
�\ .DTpacd52DTrc       utxt� b  OV��� m  OR�� ��� $ / T a g s / A n n o t a t i o n s /� o  RU�Z�Z &0 annotationtagname annotationTagname�[  � o      �Y�Y (0 annotationtaggroup annotationTagGroup� ��� r  _j��� l _f��X�W� n  _f��� 1  bf�V
�V 
rURL� o  _b�U�U (0 annotationtaggroup annotationTagGroup�X  �W  � o      �T�T 0 tagurl tagURL� ��� l kk�S�R�Q�S  �R  �Q  � ��� l kk�P�O�N�P  �O  �N  � ��� r  kt��� n  kp��� 1  lp�M
�M 
rURL� o  kl�L�L  0 sourcedocument sourceDocument� o      �K�K 0 	sourceurl 	sourceURL� ��� l uu�J�I�H�J  �I  �H  � ��� Z  u����G�� ? u���� n  u���� m  |��F
�F 
nmbr� n  u|��� 2 x|�E
�E 
cwor� o  ux�D�D &0 originalcitedtext originalcitedText� m  ���C�C � r  ����� m  ���B�B � o      �A�A 0 maxwords maxWords�G  � r  ����� n  ����� m  ���@
�@ 
nmbr� n  ����� 2 ���?
�? 
cwor� o  ���>�> &0 originalcitedtext originalcitedText� o      �=�= 0 maxwords maxWords� ��� l ���<�;�:�<  �;  �:  � ��� r  ����� m  ���9�9 � o      �8�8 0 thisword thisWord� ��� r  ����� m  ���� ���  � o      �7�7 0 citedtexttext citedTextText� ��� l ���6�5�4�6  �5  �4  � ��� V  ����� k  ���� ��� r  ����� b  ����� o  ���3�3 0 citedtexttext citedTextText� n  ����� 4  ���2�
�2 
cwor� o  ���1�1 0 thisword thisWord� o  ���0�0 &0 originalcitedtext originalcitedText� o      �/�/ 0 citedtexttext citedTextText� ��� r  ����� [  ����� o  ���.�. 0 thisword thisWord� m  ���-�- � o      �,�, 0 thisword thisWord� ��+� Z  �����*�)� B ����� o  ���(�( 0 thisword thisWord� o  ���'�' 0 maxwords maxWords� r  ����� b  ����� o  ���&�& 0 citedtexttext citedTextText� m  ���� ���  % 2 0� o      �%�% 0 citedtexttext citedTextText�*  �)  �+  � B ����� o  ���$�$ 0 thisword thisWord� o  ���#�# 0 maxwords maxWords� ��� l ���"�!� �"  �!  �   � ��� r  � ��� b  ���� b  ���� b  ���� b  ���� b  �
��� b  �   b  � m  �� �    ( < a   h r e f = " l ��� c  � l ��	��	 n  ��

 1  ���
� 
rURL o  ����  0 sourcedocument sourceDocument�  �   m  � �
� 
TEXT�  �   m   �  ? s e a r c h =� o  	�� 0 citedtexttext citedTextText� o  
�� 0 nodecoration noDecoration� m   �  " >� m   �    T e x t  � m   � 
 < / a > )� o      �� (0 searchcitationlink searchCitationLink�  l !!����  �  �    Z  !R� o  !&�� 0 filelink fileLink r  )H b  )D b  )@  b  )<!"! b  )8#$# b  )2%&% m  ),'' �(( $   ( < a   h r e f = " f i l e : / /& l ,1)��) n  ,1*+* 1  -1�
� 
ppth+ o  ,-��  0 sourcedocument sourceDocument�  �  $ o  27�� 0 nodecoration noDecoration" m  8;,, �--  " >  m  <?.. �//    F i l e   m  @C00 �11 
 < / a > ) o      �� 0 thepathlink thePathLink�   r  KR232 m  KN44 �55  3 o      �
�
 0 thepathlink thePathLink 676 l SS�	���	  �  �  7 898 Z  S�:;�<: >  S]=>= l S[?��? n  S[@A@ 1  W[�
� 
DTpeA 4  SW�B
� 
thwiB m  UV�� �  �  > m  [\� � ��; k  `�CC DED r  `nFGF l `jH����H c  `jIJI l `hK����K l `hL����L n  `hMNM 1  dh��
�� 
DTpeN 4  `d��O
�� 
thwiO m  bc���� ��  ��  ��  ��  J m  hi��
�� 
TEXT��  ��  G o      ���� 0 
pagenumber 
pageNumberE PQP r  o�RSR b  o�TUT b  oVWV m  orXX �YY    ( P g .  W l r~Z����Z c  r~[\[ l r|]����] [  r|^_^ l rz`����` l rza����a n  rzbcb 1  vz��
�� 
DTpec 4  rv��d
�� 
thwid m  tu���� ��  ��  ��  ��  _ m  z{���� ��  ��  \ m  |}��
�� 
TEXT��  ��  U m  �ee �ff  )S o      ���� "0 printpagenumber printPageNumberQ ghg r  ��iji b  ��klk m  ��mm �nn  ? p a g e =l o  ������ 0 
pagenumber 
pageNumberj o      ���� 0 thepage thePageh o��o r  ��pqp b  ��rsr b  ��tut m  ��vv �ww  |   P a g e  u o  ������ 0 
pagenumber 
pageNumbers m  ��xx �yy 
   l i n kq o      ���� 0 	clickhere 	clickHere��  �  < k  ��zz {|{ r  ��}~} m  �� ���  ~ o      ���� 0 thepage thePage| ��� r  ����� m  ���� ���  |   P a g e   L i n k  � o      ���� 0 	clickhere 	clickHere� ���� r  ����� m  ���� ��� X < b > < i >   ( n o   p a g e   -   s o u r c e   i s   n o t   P D F ) < / i > < / b >� o      ���� "0 printpagenumber printPageNumber��  9 ��� l ����������  ��  ��  � ��� r  ����� b  ����� l �������� c  ����� l �������� n  ����� 1  ����
�� 
rURL� o  ������  0 sourcedocument sourceDocument��  ��  � m  ����
�� 
TEXT��  ��  � o  ������ 0 thepage thePage� o      ���� 0 theurl theURL� ��� r  ����� b  ����� b  ����� b  ����� b  ����� b  ����� m  ���� ���    ( < a   h r e f = "� o  ������ 0 theurl theURL� o  ������ 0 nodecoration noDecoration� m  ���� ���  " >� m  ���� ���    P a g e  � m  ���� ��� 
 < / a > )� o      ���� 0 thepagelink thePageLink� ��� l ����������  ��  ��  � ��� r  �K��� b  �G��� b  �C��� b  �?��� b  �;��� b  �7��� b  �3��� b  �/��� b  �+��� b  �'��� b  �!��� b  ���� b  ���� b  ���� b  ���� b  ���� b  ���� b  ���� b  ����� b  ����� b  ����� b  ����� m  ���� ���  < p > < b >� o  ������  0 annotationname annotationName� m  ���� ��� 
 < / b >  � o  ������ 0 thepagelink thePageLink� o  ������ (0 searchcitationlink searchCitationLink� o  ����� 0 thepathlink thePathLink� m  �� ���  < / p >� m  
�� ���  < p > S o u r c e :  � l ������ n  ��� 1  ��
�� 
pnam� o  ����  0 sourcedocument sourceDocument��  ��  � m  �� ���  < / p > < p >� o  ���� 0 	citedtext 	citedText� m  �� ���  & n b s p < a   h r e f = "� o   ���� 0 theurl theURL� o  !&���� 0 nodecoration noDecoration� m  '*�� ���  " >� o  +.���� "0 printpagenumber printPageNumber� m  /2�� ���  < / a > & n b s p� m  36�� ���  < / p >� m  7:�� ��� 0 < b > < i > N o t e s : < / i > < / b > < b r >� m  ;>�� ���  < p >� o  ?B����  0 annotationnote annotationNote� m  CF�� ���  < / p >� o      ���� 0 theannotation theAnnotation� ��� l LL��������  ��  ��  � ��� Z  Lu� ��� o  LQ���� 0 	preferrtf 	preferRTF  r  Tk l Tg���� I Tg����
�� .sysoexecTEXT���     TEXT b  Tc b  T_	 m  TW

 � 
 e c h o  	 n  W^ 1  Z^��
�� 
strq o  WZ���� 0 theannotation theAnnotation m  _b � h   |   t e x t u t i l   - f o r m a t   h t m l   - c o n v e r t   r t f   - s t d i n   - s t d o u t��  ��  ��   o      ���� "0 o_theannotation o_theAnnotation��   r  nu o  nq���� 0 theannotation theAnnotation o      ���� "0 o_theannotation o_theAnnotation�  l vv��������  ��  ��    I v�����
�� .ascrcmnt****      � **** b  v} m  vy � & a n n o t a t i o n   l o c a t i o n o  y|���� (0 annotationlocation annotationLocation��    Z  ���� =  �� !  o  ������ (0 annotationlocation annotationLocation! m  ��"" �##  0 r  ��$%$ I ����&'
�� .DTpacd08DTrc       reco& K  ��(( ��)*
�� 
pURL) o  ������ 0 theurl theURL* ��+,
�� 
pnam+ o  ������  0 annotationname annotationName, ��-.
�� 
conT- o  ������ "0 o_theannotation o_theAnnotation. ��/��
�� 
DTty/ m  ����
�� Dtyprtf ��  ' ��0��
�� 
DTin0 o  ������ 0 thechild theChild��  % o      ���� .0 theannotationdocument theAnnotationDocument��   r  ��121 I ����34
�� .DTpacd08DTrc       reco3 K  ��55 ��67
�� 
pURL6 o  ������ 0 theurl theURL7 ��89
�� 
pnam8 o  ������  0 annotationname annotationName9 ��:;
�� 
conT: o  ������ "0 o_theannotation o_theAnnotation; ��<��
�� 
DTty< m  ����
�� Dtyprtf ��  4 ��=��
�� 
DTin= I ��������
�� .DTpacd39DTrc    ��� utxt��  ��  ��  2 o      ���� .0 theannotationdocument theAnnotationDocument >?> l ����������  ��  ��  ? @A@ r  �	BCB J  ��DD EFE n ��GHG 1  ����
�� 
txdlH 1  ����
�� 
ascrF I��I m  ��JJ �KK  ;��  C J      LL MNM o      ���� 0 od  N O��O n     PQP 1  			��
�� 
txdlQ 1  		��
�� 
ascr��  A RSR l 		��~�}�  �~  �}  S TUT l 		�|�{�z�|  �{  �z  U VWV r  		XYX b  		Z[Z l 		\�y�x\ n  		]^] 2 		�w
�w 
citm^ o  		�v�v  0 annotationtags annotationTags�y  �x  [ l 		_�u�t_ n  		`a` 1  		�s
�s 
pnama o  		�r�r (0 annotationtaggroup annotationTagGroup�u  �t  Y o      �q�q 0 thetags theTagsW bcb l 	 	 �p�o�n�p  �o  �n  c ded r  	 	3fgf b  	 	+hih l 	 	'j�m�lj n  	 	'klk 2 	#	'�k
�k 
DTprl o  	 	#�j�j .0 theannotationdocument theAnnotationDocument�m  �l  i o  	'	*�i�i 0 thetags theTagsg n      mnm 1  	.	2�h
�h 
tagsn o  	+	.�g�g .0 theannotationdocument theAnnotationDocumente opo r  	4	?qrq o  	4	7�f�f 0 od  r n     sts 1  	:	>�e
�e 
txdlt 1  	7	:�d
�d 
ascrp uvu l 	@	@�c�b�a�c  �b  �a  v wxw l 	@	@�`�_�^�`  �_  �^  x yzy r  	@	I{|{ o  	@	C�]�] 0 tagurl tagURL| n      }~} 1  	D	H�\
�\ 
pURL~ o  	C	D�[�[  0 sourcedocument sourceDocumentz � Z 	J	i���Z�Y� o  	J	O�X�X 0 	tagsource 	tagSource� r  	R	e��� b  	R	_��� l 	R	W��W�V� n  	R	W��� 1  	S	W�U
�U 
tags� o  	R	S�T�T  0 sourcedocument sourceDocument�W  �V  � l 	W	^��S�R� n  	W	^��� 1  	Z	^�Q
�Q 
pnam� o  	W	Z�P�P (0 annotationtaggroup annotationTagGroup�S  �R  � n      ��� 1  	`	d�O
�O 
tags� o  	_	`�N�N  0 sourcedocument sourceDocument�Z  �Y  � ��� l 	j	j�M�L�K�M  �L  �K  � ��� l 	j	j�J�I�H�J  �I  �H  � ��� Z  	j	����G�F� =  	j	q��� o  	j	m�E�E 0 
adjustdate 
adjustDate� m  	m	p�� ���  1� r  	t	}��� o  	t	w�D�D  0 annotationdate annotationDate� n      ��� 1  	z	|�C
�C 
DTcr� o  	w	z�B�B .0 theannotationdocument theAnnotationDocument�G  �F  � ��� l 	�	��A�@�?�A  �@  �?  � ��� Z  	�	����>�=� =  	�	���� o  	�	��<�< "0 copytospotlight copyTospotlight� m  	�	��� ���  1� r  	�	���� o  	�	��;�;  0 annotationnote annotationNote� n      ��� 1  	�	��:
�: 
DTco� o  	�	��9�9 .0 theannotationdocument theAnnotationDocument�>  �=  � ��� l 	�	��8�7�6�8  �7  �6  � ��� l 	�	��5�4�3�5  �4  �3  � ��� Z  	�	����2�1� =  	�	���� o  	�	��0�0  0 openannotation openAnnotation� m  	�	��� ���  1� I 	�	��/�.�
�/ .DTpacd75thwi    ��� null�.  � �-��,
�- 
DTrc� o  	�	��+�+ .0 theannotationdocument theAnnotationDocument�,  �2  �1  � ��� I 	�	��*��)
�* .ascrcmnt****      � ****� o  	�	��(�( 0 
lablevalue 
lableValue�)  � ��'� r  	�	���� l 	�	���&�%� c  	�	���� o  	�	��$�$ 0 
lablevalue 
lableValue� m  	�	��#
�# 
long�&  �%  � n      ��� 1  	�	��"
�" 
DTla� o  	�	��!�! .0 theannotationdocument theAnnotationDocument�'   5  ��� ��
�  
capp� m  ���� ���  D N t p
� kfrmID   ��� l 	�	�����  �  �  � ��� l  	�	�����  � � � need to put back error handling
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink Pro" message error_message as warning
		
	end try   � ���~   n e e d   t o   p u t   b a c k   e r r o r   h a n d l i n g 
 	 o n   e r r o r   e r r o r _ m e s s a g e   n u m b e r   e r r o r _ n u m b e r 
 	 	 i f   t h e   e r r o r _ n u m b e r   i s   n o t   - 1 2 8   t h e n   d i s p l a y   a l e r t   " D E V O N t h i n k   P r o "   m e s s a g e   e r r o r _ m e s s a g e   a s   w a r n i n g 
 	 	 
 	 e n d   t r y� ��� l 	�	�����  �  �  �  �   k  	�	��� ��� l 	�	�����  � I C The cancelbutton (named "cancel" in the config string) was pressed   � ��� �   T h e   c a n c e l b u t t o n   ( n a m e d   " c a n c e l "   i n   t h e   c o n f i g   s t r i n g )   w a s   p r e s s e d� ��� I 	�	����
� .sysodlogaskr        TEXT� m  	�	��� ��� f T h e   d i a l o g   w a s   c l o s e d   w i t h o u t   s u b m i t t i n g   t h e   v a l u e s�  �  �  �   ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     ����  � G A Glue code for interfacing from AppleScript to Pashua. Written by   � ��� �   G l u e   c o d e   f o r   i n t e r f a c i n g   f r o m   A p p l e S c r i p t   t o   P a s h u a .   W r i t t e n   b y� ��� l     ����  � K E Carsten Bl�m <carsten@bluem.net>, 10/2003-01/2006, with improvements   � ��� �   C a r s t e n   B l � m   < c a r s t e n @ b l u e m . n e t > ,   1 0 / 2 0 0 3 - 0 1 / 2 0 0 6 ,   w i t h   i m p r o v e m e n t s� ��� l     �
���
  � J D contributed by Eddy Roosnek and Hans Haesler. You can use or modify   � ��� �   c o n t r i b u t e d   b y   E d d y   R o o s n e k   a n d   H a n s   H a e s l e r .   Y o u   c a n   u s e   o r   m o d i f y� ��� l     �	���	  � 9 3 this handler any way you like in your own scripts.   � ��� f   t h i s   h a n d l e r   a n y   w a y   y o u   l i k e   i n   y o u r   o w n   s c r i p t s .� ��� l     ����  � < 6 Argument 1: Configuration string / window description   � ��� l   A r g u m e n t   1 :   C o n f i g u r a t i o n   s t r i n g   /   w i n d o w   d e s c r i p t i o n� ��� l     ����  � G A Argument 2: Encoding to use; if empty, Pashua assumes "macroman"   � ��� �   A r g u m e n t   2 :   E n c o d i n g   t o   u s e ;   i f   e m p t y ,   P a s h u a   a s s u m e s   " m a c r o m a n "� ��� l     �� �  � \ V Argument 3: Folder that contains Pashua.app; if empty, default locations are searched     � �   A r g u m e n t   3 :   F o l d e r   t h a t   c o n t a i n s   P a s h u a . a p p ;   i f   e m p t y ,   d e f a u l t   l o c a t i o n s   a r e   s e a r c h e d�  i     I      ��� 0 
pashua_run    o      �� 
0 config   	
	 o      �� 0 encoding  
 � o      � �  
0 appdir  �  �   k    �  l     ��������  ��  ��    l     ����   %  Create path for temporary file    � >   C r e a t e   p a t h   f o r   t e m p o r a r y   f i l e  r      m      �   n      1    ��
�� 
txdl 1    ��
�� 
ascr  r    $ l   " ����  c    "!"! b     #$# b    %&% l   '����' I   ��()
�� .earsffdralis        afdr( m    ��
�� afdmtemp) ��*��
�� 
rtyp* m    	��
�� 
TEXT��  ��  ��  & m    ++ �,,  P a s h u a _$ l   -����- n    ./. 7   ��01
�� 
cha 0 m    ���� 1  ;    / l   2����2 c    343 l   5����5 I   ������
�� .sysorandnmbr    ��� nmbr��  ��  ��  ��  4 m    ��
�� 
TEXT��  ��  ��  ��  " m     !��
�� 
TEXT��  ��   o      ���� 0 tmpfile   676 l  % %��������  ��  ��  7 898 l  % %��:;��  : E ? Write temporary file and fill it with the configuration string   ; �<< ~   W r i t e   t e m p o r a r y   f i l e   a n d   f i l l   i t   w i t h   t h e   c o n f i g u r a t i o n   s t r i n g9 =>= r   % .?@? I  % ,��AB
�� .rdwropenshor       fileA o   % &���� 0 tmpfile  B ��C��
�� 
permC m   ' (��
�� boovtrue��  @ o      ���� 0 fhandle  > DED I  / 8��FG
�� .rdwrwritnull���     ****F l  / 2H����H c   / 2IJI o   / 0���� 
0 config  J m   0 1��
�� 
TEXT��  ��  G ��K��
�� 
refnK o   3 4���� 0 fhandle  ��  E LML I  9 >��N��
�� .rdwrclosnull���     ****N o   9 :���� 0 fhandle  ��  M OPO l  ? ?��������  ��  ��  P QRQ l  ? ?��ST��  S &   Get temporary file's POSIX path   T �UU @   G e t   t e m p o r a r y   f i l e ' s   P O S I X   p a t hR VWV r   ? DXYX n   ? BZ[Z 1   @ B��
�� 
psxp[ o   ? @���� 0 tmpfile  Y o      ���� 0 posixtmpfile  W \]\ l  E E��������  ��  ��  ] ^_^ r   E P`a` l  E Nb����b I  E N��cd
�� .earsffdralis        afdrc m   E H��
�� afdrbootd ��e��
�� 
rtype m   I J��
�� 
TEXT��  ��  ��  a o      ���� 0 diskpath diskPath_ fgf r   Q \hih I  Q Z��jk
�� .earsffdralis        afdrj m   Q Tll �mm  c u s rk ��n��
�� 
rtypn m   U V��
�� 
TEXT��  i o      ���� 0 userpath userPathg opo r   ] fqrq l  ] ds����s I  ] d��tu
�� .earsffdralis        afdrt  f   ] ^u ��v��
�� 
rtypv m   _ `��
�� 
TEXT��  ��  ��  r o      ���� 
0 myself  p wxw O  g |yzy r   m {{|{ l  m y}����} c   m y~~ n   m w��� m   s w��
�� 
ctnr� 4   m s���
�� 
alis� o   q r���� 
0 myself   m   w x��
�� 
TEXT��  ��  | o      ���� 0 myparentpath myParentPathz m   g j���                                                                                  MACS  alis    b  Mac HD                     �)��H+   ��z
Finder.app                                                      ���``9        ����  	                CoreServices    �)��      �`D     ��z ��w ��v  0Mac HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c   H D  &System/Library/CoreServices/Finder.app  / ��  x ��� l  } }��������  ��  ��  � ��� l  } }������  � %  Try to find Pashua application   � ��� >   T r y   t o   f i n d   P a s h u a   a p p l i c a t i o n� ��� O   }^��� k   �]�� ��� l  � �������  � K E Try to find it in the directory supplied as argument to this handler   � ��� �   T r y   t o   f i n d   i t   i n   t h e   d i r e c t o r y   s u p p l i e d   a s   a r g u m e n t   t o   t h i s   h a n d l e r� ���� Z   �]����� >  � ���� o   � ����� 
0 appdir  � m   � ��� ���  � k   � ��� ��� Z   � ������� =   � ���� n   � ���� 4  � ����
�� 
cha � m   � �������� o   � ����� 
0 appdir  � m   � ��� ���  :� r   � ���� m   � ��� ���  � o      ���� 
0 dirsep  ��  � r   � ���� m   � ��� ���  :� o      ���� 
0 dirsep  � ��� Z   � �������� I  � ������
�� .coredoexbool        obj � 4   � ����
�� 
cobj� l  � ������� b   � ���� b   � ���� o   � ����� 
0 appdir  � o   � ����� 
0 dirsep  � m   � ��� ���  P a s h u a . a p p��  ��  ��  � r   � ���� b   � ���� b   � ���� o   � ����� 
0 appdir  � o   � ����� 
0 dirsep  � m   � ��� ���  P a s h u a . a p p :� o      ���� 
0 pashua  ��  ��  � ���� l  � �������  � 7 1 Try to find it in this script application bundle   � ��� b   T r y   t o   f i n d   i t   i n   t h i s   s c r i p t   a p p l i c a t i o n   b u n d l e��  � ��� I  � ������
�� .coredoexbool        obj � 4   � ����
�� 
cobj� l  � ������� b   � ���� o   � ����� 
0 myself  � m   � ��� ��� 2 C o n t e n t s : M a c O S : P a s h u a . a p p��  ��  ��  � ��� k   � ��� ��� r   � ���� o   � ����� 
0 myself  � o      ���� 
0 pashua  � ���� l  � �������  � 4 . Try to find it in this script's parent's path   � ��� \   T r y   t o   f i n d   i t   i n   t h i s   s c r i p t ' s   p a r e n t ' s   p a t h��  � ��� I  � ������
�� .coredoexbool        obj � 4   � ����
�� 
cobj� l  � ������ b   � ���� o   � ��~�~ 0 myparentpath myParentPath� m   � ��� ���  P a s h u a . a p p��  �  ��  � ��� k   � ��� ��� r   � ���� l  � ���}�|� b   � ���� o   � ��{�{ 0 myparentpath myParentPath� m   � ��� ���  P a s h u a . a p p :�}  �|  � o      �z�z 
0 pashua  � ��y� l  � ��x���x  � 2 , Try to find it in global application folder   � ��� X   T r y   t o   f i n d   i t   i n   g l o b a l   a p p l i c a t i o n   f o l d e r�y  � ��� I  ��w��v
�w .coredoexbool        obj � 4   �	�u�
�u 
cobj� l ��t�s� b  ��� o  �r�r 0 diskpath diskPath� m     � . A p p l i c a t i o n s : P a s h u a . a p p�t  �s  �v  �  k    r   l 	�q�p	 b  

 o  �o�o 0 diskpath diskPath m   � 0 A p p l i c a t i o n s : P a s h u a . a p p :�q  �p   o      �n�n 
0 pashua   �m l �l�l   2 , Try to find it in user's application folder    � X   T r y   t o   f i n d   i t   i n   u s e r ' s   a p p l i c a t i o n   f o l d e r�m    I *�k�j
�k .coredoexbool        obj  4  &�i
�i 
cobj l  %�h�g b   % o   !�f�f 0 userpath userPath m  !$ � . A p p l i c a t i o n s : P a s h u a . a p p�h  �g  �j   �e r  -4 l -2�d�c b  -2  o  -.�b�b 0 userpath userPath  m  .1!! �"" 0 A p p l i c a t i o n s : P a s h u a . a p p :�d  �c   o      �a�a 
0 pashua  �e  � k  7]## $%$ I 7Z�`&'
�` .sysodlogaskr        TEXT& b  7B()( b  7>*+* m  7:,, �-- H I   c a n ' t   f i n d   t h e   P a s h u a   a p p l i c a t i o n .+ o  :=�_
�_ 
ret ) m  >A.. �// � I t   l o o k s   l i k e   P a s h u a   i s   n e i t h e r   i n   o n e   o f   t h e   s t a n d a r d   l o c a t i o n s   n o r   i n   t h e   f o l d e r   t h i s   A p p l e S c r i p t   i s   i n .' �^01
�^ 
btns0 J  EJ22 3�]3 m  EH44 �55  O K�]  1 �\67
�\ 
dflt6 m  MN�[�[ 7 �Z8�Y
�Z 
disp8 m  QT�X
�X stic    �Y  % 9�W9 L  []:: m  [\�V�V���W  ��  � m   } �;;�                                                                                  MACS  alis    b  Mac HD                     �)��H+   ��z
Finder.app                                                      ���``9        ����  	                CoreServices    �)��      �`D     ��z ��w ��v  0Mac HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c   H D  &System/Library/CoreServices/Finder.app  / ��  � <=< l __�U�T�S�U  �T  �S  = >?> l __�R@A�R  @ A ; Append binary position inside app bundle to "regular" path   A �BB v   A p p e n d   b i n a r y   p o s i t i o n   i n s i d e   a p p   b u n d l e   t o   " r e g u l a r "   p a t h? CDC l __�QEF�Q  E 8 2 and convert path from HFS to POSIX representation   F �GG d   a n d   c o n v e r t   p a t h   f r o m   H F S   t o   P O S I X   r e p r e s e n t a t i o nD HIH l __�P�O�N�P  �O  �N  I JKJ l __�MLM�M  L A ; edited by Frederiko to allow pashua to be placed in bundle   M �NN v   e d i t e d   b y   F r e d e r i k o   t o   a l l o w   p a s h u a   t o   b e   p l a c e d   i n   b u n d l eK OPO r  _hQRQ b  _fSTS l _bU�L�KU n  _bVWV 1  `b�J
�J 
psxpW o  _`�I�I 
0 pashua  �L  �K  T m  beXX �YY ^ C o n t e n t s / M a c O S / P a s h u a . a p p / C o n t e n t s / M a c O S / P a s h u aR o      �H�H 0 pashuabinary  P Z[Z I in�G\�F
�G .ascrcmnt****      � ****\ o  ij�E�E 0 pashuabinary  �F  [ ]^] l oo�D�C�B�D  �C  �B  ^ _`_ l oo�Aab�A  a ? 9 Optionally, define the encoding as command-line argument   b �cc r   O p t i o n a l l y ,   d e f i n e   t h e   e n c o d i n g   a s   c o m m a n d - l i n e   a r g u m e n t` ded Z  o�fg�@hf =  otiji o  op�?�? 0 encoding  j m  pskk �ll  g r  w|mnm m  wzoo �pp  n o      �>�> 0 encodingarg encodingArg�@  h r  �qrq b  �sts b  �uvu m  �ww �xx  - e  v o  ���=�= 0 encoding  t m  ��yy �zz   r o      �<�< 0 encodingarg encodingArge {|{ l ���;�:�9�;  �:  �9  | }~} l ���8��8   1 + Execute pashua and get the string returned   � ��� V   E x e c u t e   p a s h u a   a n d   g e t   t h e   s t r i n g   r e t u r n e d~ ��� r  ����� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� m  ���� ���  '� o  ���7�7 0 pashuabinary  � m  ���� ���  '  � o  ���6�6 0 encodingarg encodingArg� m  ���� ���  '� o  ���5�5 0 posixtmpfile  � m  ���� ���  '� o      �4�4 0 
pashuacall 
pashuaCall� ��� r  ����� I ���3��2
�3 .sysoexecTEXT���     TEXT� l ����1�0� o  ���/�/ 0 
pashuacall 
pashuaCall�1  �0  �2  � o      �.�. 0 pashuaresult pashuaResult� ��� l ���-�,�+�-  �,  �+  � ��� l ���*���*  �    Delete the temporary file   � ��� 4   D e l e t e   t h e   t e m p o r a r y   f i l e� ��� O ����� I ���)��(
�) .coredeloobj        obj � o  ���'�' 0 tmpfile  �(  � m  �����                                                                                  MACS  alis    b  Mac HD                     �)��H+   ��z
Finder.app                                                      ���``9        ����  	                CoreServices    �)��      �`D     ��z ��w ��v  0Mac HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c   H D  &System/Library/CoreServices/Finder.app  / ��  � ��� l ���&�%�$�&  �%  �$  � ��� l ���#���#  � 5 / Check whether the dialog was submitted at all.   � ��� ^   C h e c k   w h e t h e r   t h e   d i a l o g   w a s   s u b m i t t e d   a t   a l l .� ��� l ���"���"  � 4 . If this is not the case, return an empty list   � ��� \   I f   t h i s   i s   n o t   t h e   c a s e ,   r e t u r n   a n   e m p t y   l i s t� ��� Z  �����!� � =  ����� o  ���� 0 pashuaresult pashuaResult� m  ���� ���  � L  ���� J  ����  �!  �   � ��� l ������  �  �  � ��� l ������  �   Parse the result   � ��� "   P a r s e   t h e   r e s u l t� ��� r  ����� o  ���
� 
ret � n     ��� 1  ���
� 
txdl� 1  ���
� 
ascr� ��� r  ����� n  ����� 2 ���
� 
citm� o  ���� 0 pashuaresult pashuaResult� o      �� 0 resultlines resultLines� ��� r  ����� m  ���� ���  � n     ��� 1  ���
� 
txdl� 1  ���
� 
ascr� ��� r  ����� J  ����  � o      �� $0 recordcomponents recordComponents� ��� X  ������ k  ���� ��� r  ���� I ����
� .sysooffslong    ��� null�  � ���
� 
psof� m  �� ���  =� ���

� 
psin� o  	�	�	 0 currentline currentLine�
  � o      �� 	0 eqpos  � ��� Z  ������ > ��� o  �� 	0 eqpos  � m  ��  � k  ��� ��� r  +��� n  '��� 4  "'��
� 
cwor� m  %&�� � o  "� �  0 currentline currentLine� o      ���� 0 varkey varKey� ��� Q  ,��	 	� k  /s		 			 r  /E			 l /A	����	 n  /A				 7 2A��	
	
�� 
ctxt	
 l 8>	����	 [  8>			 o  9<���� 	0 eqpos  	 m  <=���� ��  ��  	  ;  ?@		 o  /2���� 0 currentline currentLine��  ��  	 o      ���� 0 varvalue varValue	 			 l FF��		��  	 > 8 Quote any quotation marks in varValue with a backslash.   	 �		 p   Q u o t e   a n y   q u o t a t i o n   m a r k s   i n   v a r V a l u e   w i t h   a   b a c k s l a s h .	 			 l FF��		��  	 ; 5 The proper way to do this would be a handler, but as   	 �		 j   T h e   p r o p e r   w a y   t o   d o   t h i s   w o u l d   b e   a   h a n d l e r ,   b u t   a s	 			 l FF��		��  	 > 8 all code for interfacing to Pashua should be as compact   	 �		 p   a l l   c o d e   f o r   i n t e r f a c i n g   t o   P a s h u a   s h o u l d   b e   a s   c o m p a c t	 			 l FF��	 	!��  	  * $ as possible, we rather do it inline   	! �	"	" H   a s   p o s s i b l e ,   w e   r a t h e r   d o   i t   i n l i n e	 	#	$	# r  FM	%	&	% m  FI	'	' �	(	(  "	& n     	)	*	) 1  JL��
�� 
txdl	* 1  IJ��
�� 
ascr	$ 	+	,	+ r  NY	-	.	- n  NU	/	0	/ 2  QU��
�� 
citm	0 o  NQ���� 0 varvalue varValue	. o      ���� 0 	textitems 	textItems	, 	1	2	1 r  Za	3	4	3 m  Z]	5	5 �	6	6  \ "	4 n     	7	8	7 1  ^`��
�� 
txdl	8 1  ]^��
�� 
ascr	2 	9	:	9 r  bk	;	<	; c  bg	=	>	= o  be���� 0 	textitems 	textItems	> m  ef��
�� 
TEXT	< o      ���� 0 varvalue varValue	: 	?��	? r  ls	@	A	@ m  lo	B	B �	C	C  	A n     	D	E	D 1  pr��
�� 
txdl	E 1  op��
�� 
ascr��  	  R      ������
�� .ascrerr ****      � ****��  ��  	 r  {�	F	G	F m  {~	H	H �	I	I  	G o      ���� 0 varvalue varValue� 	J��	J s  ��	K	L	K l ��	M����	M b  ��	N	O	N b  ��	P	Q	P b  ��	R	S	R o  ������ 0 varkey varKey	S m  ��	T	T �	U	U  : "	Q o  ������ 0 varvalue varValue	O m  ��	V	V �	W	W  "��  ��  	L n      	X	Y	X  ;  ��	Y o  ������ $0 recordcomponents recordComponents��  �  �  �  � 0 currentline currentLine� o  ������ 0 resultlines resultLines� 	Z	[	Z l ����������  ��  ��  	[ 	\	]	\ l ����	^	_��  	^ 1 + Return the record we read from the tmpfile   	_ �	`	` V   R e t u r n   t h e   r e c o r d   w e   r e a d   f r o m   t h e   t m p f i l e	] 	a	b	a r  ��	c	d	c m  ��	e	e �	f	f  ,  	d n     	g	h	g 1  ����
�� 
txdl	h 1  ����
�� 
ascr	b 	i	j	i r  ��	k	l	k l ��	m����	m I ����	n��
�� .sysodsct****        scpt	n b  ��	o	p	o b  ��	q	r	q m  ��	s	s �	t	t  r e t u r n   {	r l ��	u����	u c  ��	v	w	v o  ������ $0 recordcomponents recordComponents	w m  ����
�� 
TEXT��  ��  	p m  ��	x	x �	y	y  }��  ��  ��  	l o      ���� 0 
resultlist 
resultList	j 	z	{	z r  ��	|	}	| J  ��	~	~ 	��	 m  ��	�	� �	�	�  ��  	} n     	�	�	� 1  ����
�� 
txdl	� 1  ����
�� 
ascr	{ 	�	�	� L  ��	�	� o  ������ 0 
resultlist 
resultList	� 	���	� l ����������  ��  ��  ��   	���	� l     ��������  ��  ��  ��       B��	�   ������	�	�	�	�	�	�������	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�����	�	�4	�	�	�	�	�	�	�	�	�n	�������������������  	� @����������������������������������������������������������������������������������������������~�}�|�{�z�y�x�w�v�u�t�s�r�q�p�o�n�� 0 	grouptag1 	groupTag1�� 0 	grouptag2 	groupTag2�� 0 nodecoration noDecoration�� 0 	preferrtf 	preferRTF�� 0 	tagsource 	tagSource�� 0 filelink fileLink�� 0 
pashua_run  
�� .aevtoappnull  �   � ****�� 0 thechild theChild��  0 sourcedocument sourceDocument�� 0 
sourceuuid 
sourceUUID�� 0 thedate theDate�� 0 yearname yearName�� 0 	yearmonth 	yearMonth�� 0 yeardate yearDate�� 0 yeartime yearTime�� &0 originalcitedtext originalcitedText��  0 annotationname annotationName�� &0 annotationtagname annotationTagname�� 0 theissueslist theIssueslist�� 0 thepeoplelist thePeoplelist�� 0 alltagslist allTagslist�� 0 	theissues 	theIssues�� 0 	thepeople 	thePeople�� 0 alltags allTags�� 0 	citedtext 	citedText�� 
0 config  �� 0 pashuaresult pashuaResult��  0 annotationnote annotationNote��  0 annotationtags annotationTags��  0 openannotation openAnnotation�� 0 
adjustdate 
adjustDate��  0 annotationdate annotationDate�� "0 copytospotlight copyTospotlight�� (0 annotationlocation annotationLocation�� 0 
lablevalue 
lableValue�� &0 annotationsmaster annotationsMaster�� (0 annotationtaggroup annotationTagGroup�� 0 tagurl tagURL�� 0 	sourceurl 	sourceURL�� 0 maxwords maxWords�� 0 thisword thisWord�� 0 citedtexttext citedTextText�� (0 searchcitationlink searchCitationLink�� 0 thepathlink thePathLink�� 0 
pagenumber 
pageNumber� "0 printpagenumber printPageNumber�~ 0 thepage thePage�} 0 	clickhere 	clickHere�| 0 theurl theURL�{ 0 thepagelink thePageLink�z 0 theannotation theAnnotation�y "0 o_theannotation o_theAnnotation�x .0 theannotationdocument theAnnotationDocument�w 0 od  �v 0 thetags theTags�u  �t  �s  �r  �q  �p  �o  �n  
�� boovtrue
�� boovfals
�� boovfals	� �m�l�k	�	��j�m 0 
pashua_run  �l �i	��i 	�  �h�g�f�h 
0 config  �g 0 encoding  �f 
0 appdir  �k  	� �e�d�c�b�a�`�_�^�]�\�[�Z�Y�X�W�V�U�T�S�R�Q�P�O�N�e 
0 config  �d 0 encoding  �c 
0 appdir  �b 0 tmpfile  �a 0 fhandle  �` 0 posixtmpfile  �_ 0 diskpath diskPath�^ 0 userpath userPath�] 
0 myself  �\ 0 myparentpath myParentPath�[ 
0 dirsep  �Z 
0 pashua  �Y 0 pashuabinary  �X 0 encodingarg encodingArg�W 0 
pashuacall 
pashuaCall�V 0 pashuaresult pashuaResult�U 0 resultlines resultLines�T $0 recordcomponents recordComponents�S 0 currentline currentLine�R 	0 eqpos  �Q 0 varkey varKey�P 0 varvalue varValue�O 0 	textitems 	textItems�N 0 
resultlist 
resultList	� S�M�L�K�J�I�H+�G�F�E�D�C�B�A�@�?l��>�=�����<��;���� !,�:.�94�8�7�6�5�4X�3kowy�����2�1��0��/�.�-��,�+�*�)�(	'	5	B�'�&	H	T	V	e	s	x�%	�
�M 
ascr
�L 
txdl
�K afdmtemp
�J 
rtyp
�I 
TEXT
�H .earsffdralis        afdr
�G .sysorandnmbr    ��� nmbr
�F 
cha 
�E 
perm
�D .rdwropenshor       file
�C 
refn
�B .rdwrwritnull���     ****
�A .rdwrclosnull���     ****
�@ 
psxp
�? afdrboot
�> 
alis
�= 
ctnr
�< 
cobj
�; .coredoexbool        obj 
�: 
ret 
�9 
btns
�8 
dflt
�7 
disp
�6 stic    �5 
�4 .sysodlogaskr        TEXT
�3 .ascrcmnt****      � ****
�2 .sysoexecTEXT���     TEXT
�1 .coredeloobj        obj 
�0 
citm
�/ 
kocl
�. .corecnte****       ****
�- 
psof
�, 
psin�+ 
�* .sysooffslong    ��� null
�) 
cwor
�( 
ctxt�'  �&  
�% .sysodsct****        scpt�j����,FO���l �%*j �&[�\[Zm\62%�&E�O��el E�O��&�l O�j O��,E�Oa ��l E�Oa ��l E�O)��l E�Oa  *a �/a ,�&E�UOa  ܢa  @��i/a   
a E�Y a E�O*a ��%a %/j  ��%a %E�Y hOPY �*a �a %/j  
�E�OPY }*a �a %/j  �a %E�OPY `*a �a  %/j  �a !%E�OPY C*a �a "%/j  �a #%E�Y (a $_ %%a &%a 'a (kva )ka *a +a , -OiUO��,a .%E�O�j /O�a 0  
a 1E�Y a 2�%a 3%E�Oa 4�%a 5%�%a 6%�%a 7%E�O�j 8E�Oa  �j 9UO�a :  jvY hO_ %��,FO�a ;-E^ Oa <��,FOjvE^ O �] [a =a l >kh *a ?a @a A] a B CE^ O] j }] a Dk/E^ O I] [a E\[Z] k\62E^ Oa F��,FO] a ;-E^ Oa G��,FO] �&E^ Oa H��,FW X I Ja KE^ O] a L%] %a M%] 6GY h[OY�^Oa N��,FOa O] �&%a P%j QE^ Oa Rkv��,FO] OP	� �$	��#�"	�	��!
�$ .aevtoappnull  �   � ****	� k    	�	�	�  +	�	� '	�	� /	�	� 6	�	� =	�	� F	�	� Z	�	� n	�	� �	�	� �	�	� �	�	� �	�	� �	�	� �	�	� �	�	� �	�	� 	�	� 	�	� ,	�	� B	�	� S	�	� i	�	� r	�	� �	�	� �	�	� �	�	� �	�	� �	�	� �	�	� �	�	� �	�	� 	�	� � �   �#  �"  	� �� 0 theissue theIssue	� ��� A�������������������
�	���� � � � � ��� �� ��� ����������������S��X����gl{���������������������&(:MOap���������
����������J\n��������������������������������������&(79HJY[jl{}����������������������������'��,.0��4����Xe��m��vx��������������������������
��"��������������������J����������������������
� 
capp
� kfrmID  
� .DTpacd52DTrc       utxt� 0 thechild theChild
� 
thwi
� 
DTdr�  0 sourcedocument sourceDocument
� 
UUID
� 
TEXT� 0 
sourceuuid 
sourceUUID
� 
DTcr� 0 thedate theDate
� 
year� 0 yearname yearName
� 
mnth
� 
long� 0 	yearmonth 	yearMonth
� 
day � 0 yeardate yearDate
� 
tstr�
 0 yeartime yearTime
�	 
subs� &0 originalcitedtext originalcitedText
� 
pnam�  0 annotationname annotationName� &0 annotationtagname annotationTagname
� 
DTch� 0 theissueslist theIssueslist� 0 thepeoplelist thePeoplelist� 0 alltagslist allTagslist�  0 	theissues 	theIssues
�� 
kocl
�� 
cobj
�� .corecnte****       ****�� 0 	thepeople 	thePeople�� 0 alltags allTags�� 

�� .sysontocTEXT       shor
�� 
txdl
�� 
strq
�� .sysoexecTEXT���     TEXT
�� 
cpar�� 0 	citedtext 	citedText
�� 
ret 
�� 
citm�� 
0 config  
�� .ascrcmnt****      � ****�� 0 
pashua_run  �� 0 pashuaresult pashuaResult
�� .miscactvnull��� ��� null�� 0 cb  ��  0 annotationnote annotationNote��  0 annotationtags annotationTags�� 
0 issue1  �� 
0 issue2  �� 
0 issue3  �� 	0 name1  �� 	0 name2  �� 	0 name3  ��  0 openannotation openAnnotation�� 0 
adjustdate 
adjustDate
�� 
ldt ��  0 annotationdate annotationDate�� "0 copytospotlight copyTospotlight�� (0 annotationlocation annotationLocation�� 0 
lablevalue 
lableValue�� &0 annotationsmaster annotationsMaster�� (0 annotationtaggroup annotationTagGroup
�� 
rURL�� 0 tagurl tagURL�� 0 	sourceurl 	sourceURL
�� 
cwor
�� 
nmbr�� �� 0 maxwords maxWords�� 0 thisword thisWord�� 0 citedtexttext citedTextText�� (0 searchcitationlink searchCitationLink
�� 
ppth�� 0 thepathlink thePathLink
�� 
DTpe�� 0 
pagenumber 
pageNumber�� "0 printpagenumber printPageNumber�� 0 thepage thePage�� 0 	clickhere 	clickHere�� 0 theurl theURL�� 0 thepagelink thePageLink�� 0 theannotation theAnnotation�� "0 o_theannotation o_theAnnotation
�� 
pURL
�� 
conT
�� 
DTty
�� Dtyprtf �� 
�� 
DTin
�� .DTpacd08DTrc       reco�� .0 theannotationdocument theAnnotationDocument
�� .DTpacd39DTrc    ��� utxt
�� 
ascr�� 0 od  �� 0 thetags theTags
�� 
DTpr
�� 
tags
�� 
DTco
�� 
DTrc
�� .DTpacd75thwi    ��� null
�� 
DTla
�� .sysodlogaskr        TEXT�!	�)���0c�j E�O*�k/�,E�O��,�&E�O��,E�O��,E�O�a ,a &E` O�a ,E` O�a ,E` O*�k/a ,�&E` O�a ,E` O��,�&E` Oa b   %a %j Oa b  %a %j Oa  b   %j a !-E` "Oa #b  %j a !-E` $Oa %j a !-E` &OjvE` 'O )_ "[a (a )l *kh  _ '�a ,�&%E` '[OY��OjvE` +O )_ $[a (a )l *kh  _ +�a ,�&%E` +[OY��OjvE` ,O )_ &[a (a )l *kh  _ ,�a ,�&%E` ,[OY��OPUOa -j .kv*a /,FO_ '�&E` 'O_ +�&E` +O_ ,�&E` ,Oa 0_ 'a 1,%a 2%j 3a 4-E` 'Oa 5_ +a 1,%a 6%j 3a 4-E` +Oa 7_ ,a 1,%a 8%j 3a 4-E` ,Oa 9*a /,FOa :_ a 1,%a ;%j 3E` <O_ =*a /,FO_ <a >-E` <Oa ?*a /,FO_ <�&E` <Oa @_ %a A%�%a B%_ %a C%_ %a D%_ %a E%E` FO F_ ,[a (a )l *kh  a Gb   b  mv� _ Fa H%��&%_ =%E` FY h[OY��O_ Fj IO_ Fa J%b   %a K%E` FO -_ '[a (a )l *kh  _ Fa L%��&%_ =%E` F[OY��O_ Fa M%b  %a N%E` FO -_ +[a (a )l *kh  _ Fa O%��&%_ =%E` F[OY��O_ Fa P%E` FO -_ '[a (a )l *kh  _ Fa Q%��&%_ =%E` F[OY��O_ Fa R%E` FO -_ +[a (a )l *kh  _ Fa S%��&%_ =%E` F[OY��O_ Fa T%E` FO -_ '[a (a )l *kh  _ Fa U%��&%_ =%E` F[OY��O_ Fa V%E` FO -_ +[a (a )l *kh  _ Fa W%��&%_ =%E` F[OY��O_ Fa X%_ <%a Y%E` FO*_ Fa Za [m+ \E` ]O*j ^O_ ]a _,a `m_ ]a <,E` <O_ ]a a,E` aOa bk*a /,FO_ aa >-E` aO_ <a >-E` <Oa c*a /,FO_ a�&E` aO_ <�&E` <Oa d*a /,FO_ ]a ,E` O_ ]a e,a f%_ ]a g,%a h%_ ]a i,%a j%_ ]a k,%a l%_ ]a m,%a n%_ ]a o,%a p%_ ]a q,%�&E` eO_ ]a r,E` rO_ ]a s,E` sO*a t_ ]�,a u%_ ]a ,%a v%_ ]a ,%a w%_ ]a ,%/E` xO_ ]a y,E` yO_ ]a z,E` zO_ ]a {,E` {O)�a |�0(a }b   %a ~%_ ]a g,%j Oa b   %a �%_ ]a i,%j Oa �b   %a �%_ ]a k,%j Oa �b  %a �%_ ]a m,%j Oa �b  %a �%_ ]a o,%j Oa �b  %a �%_ ]a q,%j Oa �j E` �Oa �_ %j E` �O_ �a �,E` �O�a �,E` �O_ a �-a �,a � a �E` �Y _ a �-a �,E` �OkE` �Oa �E` �O Fh_ �_ �_ �_ a �_ �/%E` �O_ �kE` �O_ �_ � _ �a �%E` �Y h[OY��Oa ��a �,�&%a �%_ �%b  %a �%a �%a �%E` �Ob   $a ��a �,%b  %a �%a �%a �%E` �Y 	a �E` �O*�k/a �,i H*�k/a �,�&E` �Oa �*�k/a �,k�&%a �%E` �Oa �_ �%E` �Oa �_ �%a �%E` �Y a �E` �Oa �E` �Oa �E` �O�a �,�&_ �%E` �Oa �_ �%b  %a �%a �%a �%E` �Oa �_ %a �%_ �%_ �%_ �%a �%a �%�a ,%a �%_ <%a �%_ �%b  %a �%_ �%a �%a �%a �%a �%_ a%a �%E` �Ob   a �_ �a 1,%a �%j 3E` �Y 	_ �E` �Oa �_ z%j IO_ za �  -a �_ �a _ a �_ �a �a �a �a ��l �E` �Y .a �_ �a _ a �_ �a �a �a �a �*j �l �E` �O_ �a /,a �lvE[a )k/E` �Z[a )l/_ �a /,FZO_ ea >-_ �a ,%E` �O_ �a �-_ �%_ �a �,FO_ �_ �a /,FO_ ��a �,FOb   �a �,_ �a ,%�a �,FY hO_ sa �  _ x_ ��,FY hO_ ya �  _ a_ �a �,FY hO_ ra �  *a �_ �l �Y hO_ {j IO_ {a &_ �a �,FUOPY 	a �j �	� 	�	� 	�������	� 	�������	��                                                                                  DNtp  alis    \  Mac HD                     �)��H+   ��DEVONthink Pro.app                                             p���        ����  	                Applications    �)��      ��d     ��  'Mac HD:Applications: DEVONthink Pro.app   &  D E V O N t h i n k   P r o . a p p    M a c   H D  Applications/DEVONthink Pro.app   / ��  
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��  
�� kfrmID  	� 	�	� 	�������	� 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTcn��   �T
�� kfrmID  	� �	�	� H 3 9 F 9 7 E 2 7 - 0 1 5 8 - 4 8 C D - B 8 8 B - 0 4 6 F 5 5 A 5 E C F 0	� ldt     �>b^����� 	�� 	� �	�	�  9 : 5 5 : 4 2   P M	� �	�	�  .  &  4 .	� �	�	� 
 n a m e w	� �	�	� H 3 9 F 9 7 E 2 7 - 0 1 5 8 - 4 8 C D - B 8 8 B - 0 4 6 F 5 5 A 5 E C F 0	� ��	��� 	�  	�	�	�	�	� 	�	� 	�������	� 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��  T
�� kfrmID  	� 	�	� 	�������	� 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��  TN
�� kfrmID  	� 	�	� 	�������	� 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��  V�
�� kfrmID  	� 	�	� 	�������	� 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��  WQ
�� kfrmID  	� ��	��� 	�  	�	�	�	�	�	�	�	�	�	�	�	�
 
	� 

 
������
 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��  T
�� kfrmID  	� 

 
������
 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��  T
�� kfrmID  	� 

 
����~
 	��}�|�{
�} 
DTkb�| 
�{ kfrmID  
�� 
DTpr�  T
�~ kfrmID  	� 

 
	�z�y�x
	 	��w�v�u
�w 
DTkb�v 
�u kfrmID  
�z 
DTpr�y  TQ
�x kfrmID  	� 



 
�t�s�r
 	��q�p�o
�q 
DTkb�p 
�o kfrmID  
�t 
DTpr�s  TV
�r kfrmID  	� 

 
�n�m�l
 	��k�j�i
�k 
DTkb�j 
�i kfrmID  
�n 
DTpr�m  T�
�l kfrmID  	� 

 
�h�g�f
 	��e�d�c
�e 
DTkb�d 
�c kfrmID  
�h 
DTpr�g  T�
�f kfrmID  	� 

 
�b�a�`
 	��_�^�]
�_ 
DTkb�^ 
�] kfrmID  
�b 
DTpr�a  T�
�` kfrmID  	� 

 
�\�[�Z
 	��Y�X�W
�Y 
DTkb�X 
�W kfrmID  
�\ 
DTpr�[  T�
�Z kfrmID  	� 

 
�V�U�T
 	��S�R�Q
�S 
DTkb�R 
�Q kfrmID  
�V 
DTpr�U  UN
�T kfrmID  	� 

 
�P�O�N
 	��M�L�K
�M 
DTkb�L 
�K kfrmID  
�P 
DTpr�O  U�
�N kfrmID  	� 

 
�J�I�H
 	��G�F�E
�G 
DTkb�F 
�E kfrmID  
�J 
DTpr�I  V
�H kfrmID  
  

 
�D�C�B
 	��A�@�?
�A 
DTkb�@ 
�? kfrmID  
�D 
DTpr�C  V+
�B kfrmID  
 

 
�>�=�<
 	��;�:�9
�; 
DTkb�: 
�9 kfrmID  
�> 
DTpr�=  V�
�< kfrmID  	� �8
�8 '
 ' 

 
!
"
#
$
%
&
'
(
)
*
+
,
-
.
/
0
1
2
3
4
5
6
7
8
9
:
;
<
=
>
?
@
A
B
C
D
E
 
F
F 
G�7�6�5
G 	��4�3�2
�4 
DTkb�3 
�2 kfrmID  
�7 
DTpr�6 '
�5 kfrmID  
  
H
H 
I�1�0�/
I 	��.�-�,
�. 
DTkb�- 
�, kfrmID  
�1 
DTpr�0'�
�/ kfrmID  
! 
J
J 
K�+�*�)
K 	��(�'�&
�( 
DTkb�' 
�& kfrmID  
�+ 
DTpr�*'�
�) kfrmID  
" 
L
L 
M�%�$�#
M 	��"�!� 
�" 
DTkb�! 
�  kfrmID  
�% 
DTpr�$<�
�# kfrmID  
# 
N
N 
O���
O 	����
� 
DTkb� 
� kfrmID  
� 
DTpr�<�
� kfrmID  
$ 
P
P 
Q���
Q 	����
� 
DTkb� 
� kfrmID  
� 
DTpr�   ��
� kfrmID  
% 
R
R 
S���
S 	����
� 
DTkb� 
� kfrmID  
� 
DTpr�   �/
� kfrmID  
& 
T
T 
U���
U 	��
�	�
�
 
DTkb�	 
� kfrmID  
� 
DTpr�   ��
� kfrmID  
' 
V
V 
W���
W 	����
� 
DTkb� 
� kfrmID  
� 
DTpr�   �Z
� kfrmID  
( 
X
X 
Y�� ��
Y 	�������
�� 
DTkb�� 
�� kfrmID  
� 
DTpr�    ��
�� kfrmID  
) 
Z
Z 
[������
[ 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��   ��
�� kfrmID  
* 
\
\ 
]������
] 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��   ��
�� kfrmID  
+ 
^
^ 
_������
_ 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��   �0
�� kfrmID  
, 
`
` 
a������
a 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��   Đ
�� kfrmID  
- 
b
b 
c������
c 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��   ��
�� kfrmID  
. 
d
d 
e������
e 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��   ��
�� kfrmID  
/ 
f
f 
g������
g 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��   ��
�� kfrmID  
0 
h
h 
i������
i 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��   �3
�� kfrmID  
1 
j
j 
k������
k 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��   ��
�� kfrmID  
2 
l
l 
m������
m 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��   �
�� kfrmID  
3 
n
n 
o������
o 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��   �$
�� kfrmID  
4 
p
p 
q������
q 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��   �&
�� kfrmID  
5 
r
r 
s������
s 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��   ��
�� kfrmID  
6 
t
t 
u������
u 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��   ާ
�� kfrmID  
7 
v
v 
w������
w 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��   �u
�� kfrmID  
8 
x
x 
y������
y 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��   �D
�� kfrmID  
9 
z
z 
{������
{ 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��   �U
�� kfrmID  
: 
|
| 
}������
} 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��   �m
�� kfrmID  
; 
~
~ 
������
 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��   ��
�� kfrmID  
< 
�
� 
�������
� 	�������
�� 
DTkb�� 
�� kfrmID  
�� 
DTpr��   �
�� kfrmID  
= 
�
� 
�������
� 	�����~
�� 
DTkb� 
�~ kfrmID  
�� 
DTpr��   ��
�� kfrmID  
> 
�
� 
��}�|�{
� 	��z�y�x
�z 
DTkb�y 
�x kfrmID  
�} 
DTpr�|   ��
�{ kfrmID  
? 
�
� 
��w�v�u
� 	��t�s�r
�t 
DTkb�s 
�r kfrmID  
�w 
DTpr�v  L�
�u kfrmID  
@ 
�
� 
��q�p�o
� 	��n�m�l
�n 
DTkb�m 
�l kfrmID  
�q 
DTpr�p  T	
�o kfrmID  
A 
�
� 
��k�j�i
� 	��h�g�f
�h 
DTkb�g 
�f kfrmID  
�k 
DTpr�j  T
�i kfrmID  
B 
�
� 
��e�d�c
� 	��b�a�`
�b 
DTkb�a 
�` kfrmID  
�e 
DTpr�d  Ti
�c kfrmID  
C 
�
� 
��_�^�]
� 	��\�[�Z
�\ 
DTkb�[ 
�Z kfrmID  
�_ 
DTpr�^  T�
�] kfrmID  
D 
�
� 
��Y�X�W
� 	��V�U�T
�V 
DTkb�U 
�T kfrmID  
�Y 
DTpr�X  U�
�W kfrmID  
E 
�
� 
��S�R�Q
� 	��P�O�N
�P 
DTkb�O 
�N kfrmID  
�S 
DTpr�R  U�
�Q kfrmID  	� �M
��M 
�  
�
�
�
��L�K�J�I�H�G�F�E�D�C�B�A
� �
�
�  C e s s i o n
� �
�
�  N o n e
� �
�
�   S h a r e h o l d e r   l o a n
� �
�
�  U n k n o w n�L  �K  �J  �I  �H  �G  �F  �E  �D  �C  �B  �A  	� �@
��@ 
�  
�
�
�
�
�
�
�
�
�
�
�
�
�
��?�>
� �
�
� " A r c h i e   R u t h e r f o r d
� �
�
�  A r n o l d   S a g o n d a
� �
�
�  C o b u s   B e k k e r
� �
�
� " D i e g o   J o s e   D o m e n e
� �
�
� * G e r h a r d   v a n   S c h a l k w y k
� �
�
�  J u a n   G a m e z
� �
�
�  K a l l e n   P i l l a y
� �
�
�  L i z e l l e   S t r a u s s
� �
�
� * M a r t a   A l v a r e z   T e l e n t i
� �
�
�  N o n e
� �
�
�  P e t e r   C h o w n
� �
�
� " S e r g i o   C a m p o   M a t a
� �
�
�  S t e p h e n   P h a k i s i
� �
�
�  T h y s   N o l t e�?  �>  	� �=
��= '
� 0 
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
��<�;�:�9�8�7�6�5�4
� �
�
�  A n n o t a t i o n s
� �
�
�  a n n o t a t i o n s
� �
�
�  a n s
� �
�
�  a t t
� �
�
� 
 a u d i t
� �
�
�  c a s h   f l o w
� �
�
� 
 c e r t 1
� �
�
� 
 c e r t 2
� �
�
� 
 c e r t 3
� �
�
� 
 c e r t 4
� �
�
� 
 c e r t 5
� �
�
� 
 c e r t 6
� �
�
� 
 c e r t 7
� �
�
� 
 c e r t 9
� �
�
� 
 c e r t i
� �
�
�  c h
� �
�
� 
 c h e c k
� �
�
�  c o l l u s i o n
� �
�
�  d i r e c t o r s
� �
�
�  e m l
� �
�
�  E P C   f o r m a l   c e r t
� �
�
�  F A 3
� �
�
� 
 f a c t s
� �
�
� & f a i l u r e   t o   c o m p l e t e
� �
�
�  f o l l o w u p
� �
�
� 
 i s s u e
� �
�
�  I s s u e s
� �
�
�  l a t e   p a y m e n t
� �
�
�  m i s s i n g
� �
�
�  n b
� �    n o   p e n a l t i e s
� �  p a y m e n t b y E P C
� �  p e n a l t i e s
� �  P e o p l e
� �  r e c   i n v o i c e s
� �  r e c - f i n
� � & R u t h e r f o r d - c o n t r a c t
� �  S c h a l k w y k
� �  w a t e r c e r t�<  �;  �:  �9  �8  �7  �6  �5  �4  	� �		  . < b r > & < b r > 4 .	� �

/\ 
 #   S e t   t r a n s p a r e n c y :   0   i s   t r a n s p a r e n t ,   1   i s   o p a q u e 
 * . t r a n s p a r e n c y = 0 . 9 5 
 
 #   S e t   w i n d o w   t i t l e 
 * . t i t l e   =   Q u i c k   A n n o t a t i o n 
 
 
 #   A d d   a   t e x t   f i e l d 
 a n n o t a t i o n N a m e . t y p e   =   t e x t f i e l d 
 a n n o t a t i o n N a m e . l a b e l   =   A n n o t a t i o n   n a m e 
 a n n o t a t i o n N a m e . d e f a u l t   =   u n n a m e d   d o c u m e n t . p d f 
 a n n o t a t i o n N a m e . w i d t h   =   3 1 0 
 a n n o t a t i o n N a m e . t o o l t i p   =   T i t l e   o f   a n n o t a t i o n 
 a n n o t a t i o n N a m e . r e l y   =   - 1 0 
 
 #   A d d   a   t e x t   f i e l d 
 y e a r N a m e . t y p e   =   t e x t f i e l d 
 y e a r N a m e . l a b e l   =   D a t e 
 y e a r N a m e . d e f a u l t   =   2 0 1 4 
 y e a r N a m e . w i d t h   =   5 0 
 y e a r N a m e . r e l y   =   - 1 0 
 
 #   A d d   a   t e x t   f i e l d 
 y e a r M o n t h . t y p e   =   t e x t f i e l d 
 y e a r M o n t h . l a b e l   =   
 y e a r M o n t h . d e f a u l t   =   9 	 
 y e a r M o n t h . w i d t h   =   2 5 
 y e a r M o n t h . x   =   5 4 
 y e a r M o n t h . y =   3 0 1 
 
 #   A d d   a   t e x t   f i e l d 
 y e a r D a t e . t y p e   =   t e x t f i e l d 
 y e a r D a t e . l a b e l   =   
 y e a r D a t e . d e f a u l t   =   1 6 
 y e a r D a t e . w i d t h   =   2 5 
 y e a r D a t e . x   =   8 4 
 y e a r D a t e . y =   3 0 1 
 
 #   A d d   a   t e x t   f i e l d 
 y e a r T i m e . t y p e   =   t e x t f i e l d 
 y e a r T i m e . l a b e l   =   T i m e 
 y e a r T i m e . d e f a u l t   =   9 : 5 5 : 4 2   P M 	 
 y e a r T i m e . w i d t h   =   1 0 0 
 y e a r T i m e . x   =   1 3 0 
 y e a r T i m e . y =   3 0 1 
 
 l a b l e V a l u e . t y p e   =   p o p u p 
 l a b l e V a l u e . l a b e l   =   L a b e l 
 l a b l e V a l u e . w i d t h   =   5 0 
 l a b l e V a l u e . o p t i o n   =   0 
 l a b l e V a l u e . o p t i o n   =   1 
 l a b l e V a l u e . o p t i o n   =   2 
 l a b l e V a l u e . o p t i o n   =   3 
 l a b l e V a l u e . o p t i o n   =   4 
 l a b l e V a l u e . o p t i o n   =   5 
 l a b l e V a l u e . o p t i o n   =   6 
 l a b l e V a l u e . o p t i o n   =   7 
 l a b l e V a l u e . d e f a u l t   =   0 
 l a b l e V a l u e . x   =   2 6 0 
 l a b l e V a l u e . y = 2 9 9 
 
 #   A d d   a   t e x t   f i e l d 
 a n n o t a t i o n T a g s . t y p e   =   c o m b o b o x 
 a n n o t a t i o n T a g s . l a b e l   =   A n n o t a t i o n   T a g s   ( s e p a r a t e   w i t h   s e m i - c o l o n ) 
 a n n o t a t i o n T a g s . c o m p l e t i o n   = 2 
 a n n o t a t i o n T a g s . o p t i o n   =   a n s  a n n o t a t i o n T a g s . o p t i o n   =   a t t  a n n o t a t i o n T a g s . o p t i o n   =   a u d i t  a n n o t a t i o n T a g s . o p t i o n   =   c a s h   f l o w  a n n o t a t i o n T a g s . o p t i o n   =   c e r t 1  a n n o t a t i o n T a g s . o p t i o n   =   c e r t 2  a n n o t a t i o n T a g s . o p t i o n   =   c e r t 3  a n n o t a t i o n T a g s . o p t i o n   =   c e r t 4  a n n o t a t i o n T a g s . o p t i o n   =   c e r t 5  a n n o t a t i o n T a g s . o p t i o n   =   c e r t 6  a n n o t a t i o n T a g s . o p t i o n   =   c e r t 7  a n n o t a t i o n T a g s . o p t i o n   =   c e r t 9  a n n o t a t i o n T a g s . o p t i o n   =   c e r t i  a n n o t a t i o n T a g s . o p t i o n   =   c h  a n n o t a t i o n T a g s . o p t i o n   =   c h e c k  a n n o t a t i o n T a g s . o p t i o n   =   c o l l u s i o n  a n n o t a t i o n T a g s . o p t i o n   =   d i r e c t o r s  a n n o t a t i o n T a g s . o p t i o n   =   e m l  a n n o t a t i o n T a g s . o p t i o n   =   E P C   f o r m a l   c e r t  a n n o t a t i o n T a g s . o p t i o n   =   F A 3  a n n o t a t i o n T a g s . o p t i o n   =   f a c t s  a n n o t a t i o n T a g s . o p t i o n   =   f a i l u r e   t o   c o m p l e t e  a n n o t a t i o n T a g s . o p t i o n   =   f o l l o w u p  a n n o t a t i o n T a g s . o p t i o n   =   i s s u e  a n n o t a t i o n T a g s . o p t i o n   =   l a t e   p a y m e n t  a n n o t a t i o n T a g s . o p t i o n   =   m i s s i n g  a n n o t a t i o n T a g s . o p t i o n   =   n b  a n n o t a t i o n T a g s . o p t i o n   =   n o   p e n a l t i e s  a n n o t a t i o n T a g s . o p t i o n   =   p a y m e n t b y E P C  a n n o t a t i o n T a g s . o p t i o n   =   p e n a l t i e s  a n n o t a t i o n T a g s . o p t i o n   =   r e c   i n v o i c e s  a n n o t a t i o n T a g s . o p t i o n   =   r e c - f i n  a n n o t a t i o n T a g s . o p t i o n   =   R u t h e r f o r d - c o n t r a c t  a n n o t a t i o n T a g s . o p t i o n   =   S c h a l k w y k  a n n o t a t i o n T a g s . o p t i o n   =   w a t e r c e r t  a n n o t a t i o n T a g s . w i d t h   =   3 1 0 
 a n n o t a t i o n T a g s . r e l y   =   - 1 0 
 
 i s s u e 1 . t y p e   =   c o m b o b o x 
 i s s u e 1 . l a b e l   =   I s s u e s 
 i s s u e 1 . c o m p l e t i o n   =   2 
 i s s u e 1 . o p t i o n   =   C e s s i o n  i s s u e 1 . o p t i o n   =   N o n e  i s s u e 1 . o p t i o n   =   S h a r e h o l d e r   l o a n  i s s u e 1 . o p t i o n   =   U n k n o w n  i s s u e 1 . w i d t h   =   1 5 0 
 i s s u e 1 . r e l y   =   - 2 0 
 
 n a m e 1 . t y p e   =   c o m b o b o x 
 n a m e 1 . l a b e l   =   P e o p l e 
 n a m e 1 . c o m p l e t i o n   =   2 
 n a m e 1 . o p t i o n   =   A r c h i e   R u t h e r f o r d  n a m e 1 . o p t i o n   =   A r n o l d   S a g o n d a  n a m e 1 . o p t i o n   =   C o b u s   B e k k e r  n a m e 1 . o p t i o n   =   D i e g o   J o s e   D o m e n e  n a m e 1 . o p t i o n   =   G e r h a r d   v a n   S c h a l k w y k  n a m e 1 . o p t i o n   =   J u a n   G a m e z  n a m e 1 . o p t i o n   =   K a l l e n   P i l l a y  n a m e 1 . o p t i o n   =   L i z e l l e   S t r a u s s  n a m e 1 . o p t i o n   =   M a r t a   A l v a r e z   T e l e n t i  n a m e 1 . o p t i o n   =   N o n e  n a m e 1 . o p t i o n   =   P e t e r   C h o w n  n a m e 1 . o p t i o n   =   S e r g i o   C a m p o   M a t a  n a m e 1 . o p t i o n   =   S t e p h e n   P h a k i s i  n a m e 1 . o p t i o n   =   T h y s   N o l t e  n a m e 1 . w i d t h   =   1 5 0 
 n a m e 1 . x   =   1 6 0 
 n a m e 1 . y   =   1 8 3 
 
 i s s u e 2 . t y p e   =   c o m b o b o x 
 i s s u e 2 . l a b e l   =   
 i s s u e 2 . c o m p l e t i o n   =   2 
 i s s u e 2 . o p t i o n   =   C e s s i o n  i s s u e 2 . o p t i o n   =   N o n e  i s s u e 2 . o p t i o n   =   S h a r e h o l d e r   l o a n  i s s u e 2 . o p t i o n   =   U n k n o w n  i s s u e 2 . w i d t h   =   1 5 0 
 i s s u e 2 . r e l y   =   - 2 0 
 
 n a m e 2 . t y p e   =   c o m b o b o x 
 n a m e 2 . l a b e l   =   
 n a m e 2 . c o m p l e t i o n   =   2 
 n a m e 2 . o p t i o n   =   A r c h i e   R u t h e r f o r d  n a m e 2 . o p t i o n   =   A r n o l d   S a g o n d a  n a m e 2 . o p t i o n   =   C o b u s   B e k k e r  n a m e 2 . o p t i o n   =   D i e g o   J o s e   D o m e n e  n a m e 2 . o p t i o n   =   G e r h a r d   v a n   S c h a l k w y k  n a m e 2 . o p t i o n   =   J u a n   G a m e z  n a m e 2 . o p t i o n   =   K a l l e n   P i l l a y  n a m e 2 . o p t i o n   =   L i z e l l e   S t r a u s s  n a m e 2 . o p t i o n   =   M a r t a   A l v a r e z   T e l e n t i  n a m e 2 . o p t i o n   =   N o n e  n a m e 2 . o p t i o n   =   P e t e r   C h o w n  n a m e 2 . o p t i o n   =   S e r g i o   C a m p o   M a t a  n a m e 2 . o p t i o n   =   S t e p h e n   P h a k i s i  n a m e 2 . o p t i o n   =   T h y s   N o l t e  n a m e 2 . w i d t h   =   1 5 0 
 n a m e 2 . x   =   1 6 0 
 n a m e 2 . y   =   1 3 4 
 
 i s s u e 3 . t y p e   =   c o m b o b o x 
 i s s u e 3 . l a b e l   =   
 i s s u e 3 . c o m p l e t i o n   =   2 
 i s s u e 3 . o p t i o n   =   C e s s i o n  i s s u e 3 . o p t i o n   =   N o n e  i s s u e 3 . o p t i o n   =   S h a r e h o l d e r   l o a n  i s s u e 3 . o p t i o n   =   U n k n o w n  i s s u e 3 . w i d t h   =   1 5 0 
 
 
 n a m e 3 . t y p e   =   c o m b o b o x 
 n a m e 3 . l a b e l   =   
 n a m e 3 . c o m p l e t i o n   =   2 
 n a m e 3 . o p t i o n   =   A r c h i e   R u t h e r f o r d  n a m e 3 . o p t i o n   =   A r n o l d   S a g o n d a  n a m e 3 . o p t i o n   =   C o b u s   B e k k e r  n a m e 3 . o p t i o n   =   D i e g o   J o s e   D o m e n e  n a m e 3 . o p t i o n   =   G e r h a r d   v a n   S c h a l k w y k  n a m e 3 . o p t i o n   =   J u a n   G a m e z  n a m e 3 . o p t i o n   =   K a l l e n   P i l l a y  n a m e 3 . o p t i o n   =   L i z e l l e   S t r a u s s  n a m e 3 . o p t i o n   =   M a r t a   A l v a r e z   T e l e n t i  n a m e 3 . o p t i o n   =   N o n e  n a m e 3 . o p t i o n   =   P e t e r   C h o w n  n a m e 3 . o p t i o n   =   S e r g i o   C a m p o   M a t a  n a m e 3 . o p t i o n   =   S t e p h e n   P h a k i s i  n a m e 3 . o p t i o n   =   T h y s   N o l t e  n a m e 3 . w i d t h   =   1 5 0 
 n a m e 3 . x   =   1 6 0 
 n a m e 3 . y   =   8 5 
 
 #   A d d   a   c h e c k b o x 
 # o p e n A n n o t a t i o n . r e l y   =   - 1 8 
 o p e n A n n o t a t i o n . t y p e   =   c h e c k b o x 
 o p e n A n n o t a t i o n . l a b e l   =   O p e n   a n n o t a t i o n 
 o p e n A n n o t a t i o n . d e f a u l t   =   0 
 o p e n A n n o t a t i o n . t o o l t i p   =   O p e n s   a n n o t a t i o n   i n   s e p a r a t e   w i n d o w 
 o p e n A n n o t a t i o n . r e l y   =   - 1 8 
 
 #   A d d   a   c h e c k b o x 
 c o p y T o s p o t l i g h t . r e l y   =   - 1 8 
 c o p y T o s p o t l i g h t . t y p e   =   c h e c k b o x 
 c o p y T o s p o t l i g h t . l a b e l   =   N o t e s   i n   c o m m e n t 
 c o p y T o s p o t l i g h t . d e f a u l t   =   0 
 c o p y T o s p o t l i g h t . t o o l t i p   =   C o p i e s   t h e   n o t e s   t o   t h e   s p o t l i g h t   c o m m e n t 
 
 #   A d d   a   c h e c k b o x 
 a d j u s t D a t e . t y p e   =   c h e c k b o x 
 a d j u s t D a t e . l a b e l   =   S e t   a n n o t a t i o n   d a t e 
 a d j u s t D a t e . d e f a u l t   =   1 
 a d j u s t D a t e . t o o l t i p   =   S e t s   a n n o t a t i o n   d a t e 
 a d j u s t D a t e . x = 1 6 0 
 a d j u s t D a t e . y =   4 6 
 
 #   A d d   a   c h e c k b o x 
 a n n o t a t i o n L o c a t i o n . t y p e   =   c h e c k b o x 
 a n n o t a t i o n L o c a t i o n . l a b e l   =   S e t   a n n o t a t i o n   l o c a t i o n 
 a n n o t a t i o n L o c a t i o n . d e f a u l t   =   0 
 a n n o t a t i o n L o c a t i o n . t o o l t i p   =   S e t s   f o l d e r   t o   s t o r e   a n n o t a t i o n 
 a n n o t a t i o n L o c a t i o n . x = 1 6 0 
 a n n o t a t i o n L o c a t i o n . y =   2 7 
 
 
 #   C i t a t i o n   t e x t 
 c i t e d T e x t . t y p e   =   t e x t b o x 
 c i t e d T e x t . l a b e l   =   C i t a t i o n 
 c i t e d T e x t . d e f a u l t   = . [ r e t u r n ] & [ r e t u r n ] 4 . 
 c i t e d T e x t . h e i g h t   =   1 5 0 
 c i t e d T e x t . w i d t h   =   3 1 0 
 c i t e d T e x t . x   =   3 3 7 
 c i t e d T e x t . y   =   2 3 0 
 
 #   N o t e s   t e x t 
 a n n o t a t i o n N o t e . t y p e   =   t e x t b o x 
 a n n o t a t i o n N o t e . l a b e l   =   N o t e s 
 a n n o t a t i o n N o t e . d e f a u l t   =   
 a n n o t a t i o n N o t e . h e i g h t   =   1 5 0 
 a n n o t a t i o n N o t e . w i d t h   =   3 1 0 
 a n n o t a t i o n N o t e . x   =   3 4 0 
 a n n o t a t i o n N o t e . y   =   4 5 	 
 
 
 #   A d d   a   c a n c e l   b u t t o n   w i t h   d e f a u l t   l a b e l 
 c b . t y p e = c a n c e l b u t t o n 
	� �3�3  0 annotationtags annotationTags �   �2�2 0 	yearmonth 	yearMonth �  9 �1	��1 (0 annotationlocation annotationLocation	� �  1 �0�0 
0 issue2   �   �/	��/ 0 
adjustdate 
adjustDate	� �  1 �.	��.  0 openannotation openAnnotation	� �  0 �-�- 0 yeardate yearDate �  1 6 �,	��, "0 copytospotlight copyTospotlight	� �  0 �+ �+ 	0 name3   �!!    �*"#�* 
0 issue1  " �$$  # �)%&�) 0 yearname yearName% �''  2 0 1 4& �(()�( 0 	citedtext 	citedText( �** ( . [ r e t u r n ] & [ r e t u r n ] 4 .) �'+,�' 
0 issue3  + �--  , �&./�& 	0 name2  . �00  / �%12�%  0 annotationnote annotationNote1 �33  2 �$	�4�$ 0 
lablevalue 
lableValue	� �55  54 �#	�6�#  0 annotationname annotationName6 �"78�" 	0 name1  7 �99  8 �!:;�! 0 yeartime yearTime: �<<  9 : 5 5 : 4 2   P M; � =��  0 cb  = �>>  0�  	� �??  	� �@@  ; ; ; ; ; ;	� ldt     �>b^	� AA B���B 	����
� 
DTkb� 
� kfrmID  
� 
DTpr�   �&
� kfrmID  	� CC D���D 	����
� 
DTkb� 
� kfrmID  
� 
DTpr�  ^�
� kfrmID  	� �EE p x - d e v o n t h i n k - i t e m : / / C 3 F B B B 9 B - 6 D B 5 - 4 3 4 A - A 7 7 0 - 8 8 F C E 4 7 5 4 1 2 B	� �FF p x - d e v o n t h i n k - i t e m : / / 3 9 F 9 7 E 2 7 - 0 1 5 8 - 4 8 C D - B 8 8 B - 0 4 6 F 5 5 A 5 E C F 0�� �� 	� �GG  4	� �HH �   ( < a   h r e f = " x - d e v o n t h i n k - i t e m : / / 3 9 F 9 7 E 2 7 - 0 1 5 8 - 4 8 C D - B 8 8 B - 0 4 6 F 5 5 A 5 E C F 0 ? s e a r c h = 4 "   s t y l e = " t e x t - d e c o r a t i o n : n o n e ; " >   T e x t   < / a > )	� �II  0	� �JJ    ( P g .   1 )	� �KK  ? p a g e = 0	� �LL  |   P a g e   0   l i n k	� �MM ~ x - d e v o n t h i n k - i t e m : / / 3 9 F 9 7 E 2 7 - 0 1 5 8 - 4 8 C D - B 8 8 B - 0 4 6 F 5 5 A 5 E C F 0 ? p a g e = 0	� �NN �   ( < a   h r e f = " x - d e v o n t h i n k - i t e m : / / 3 9 F 9 7 E 2 7 - 0 1 5 8 - 4 8 C D - B 8 8 B - 0 4 6 F 5 5 A 5 E C F 0 ? p a g e = 0 "   s t y l e = " t e x t - d e c o r a t i o n : n o n e ; " >   P a g e   < / a > )	� �OO� < p > < b > n a m e w < / b >     ( < a   h r e f = " x - d e v o n t h i n k - i t e m : / / 3 9 F 9 7 E 2 7 - 0 1 5 8 - 4 8 C D - B 8 8 B - 0 4 6 F 5 5 A 5 E C F 0 ? p a g e = 0 "   s t y l e = " t e x t - d e c o r a t i o n : n o n e ; " >   P a g e   < / a > )   ( < a   h r e f = " x - d e v o n t h i n k - i t e m : / / 3 9 F 9 7 E 2 7 - 0 1 5 8 - 4 8 C D - B 8 8 B - 0 4 6 F 5 5 A 5 E C F 0 ? s e a r c h = 4 "   s t y l e = " t e x t - d e c o r a t i o n : n o n e ; " >   T e x t   < / a > ) < / p > < p > S o u r c e :   u n n a m e d   d o c u m e n t . p d f < / p > < p > . < b r > & < b r > 4 . & n b s p < a   h r e f = " x - d e v o n t h i n k - i t e m : / / 3 9 F 9 7 E 2 7 - 0 1 5 8 - 4 8 C D - B 8 8 B - 0 4 6 F 5 5 A 5 E C F 0 ? p a g e = 0 "   s t y l e = " t e x t - d e c o r a t i o n : n o n e ; " >   ( P g .   1 ) < / a > & n b s p < / p > < b > < i > N o t e s : < / i > < / b > < b r > < p > < / p >	� �PP� { \ r t f 1 \ a n s i \ a n s i c p g 1 2 5 2 \ c o c o a r t f 1 2 6 5 \ c o c o a s u b r t f 2 1 0  { \ f o n t t b l \ f 0 \ f r o m a n \ f c h a r s e t 0   T i m e s - R o m a n ; }  { \ c o l o r t b l ; \ r e d 2 5 5 \ g r e e n 2 5 5 \ b l u e 2 5 5 ; \ r e d 0 \ g r e e n 0 \ b l u e 2 3 3 ; }  \ d e f t a b 7 2 0  \ p a r d \ p a r d e f t a b 7 2 0 \ s a 2 4 0   \ f 0 \ b \ f s 2 4   \ c f 0   n a m e w  \ b 0     ( { \ f i e l d { \ * \ f l d i n s t { H Y P E R L I N K   " x - d e v o n t h i n k - i t e m : / / 3 9 F 9 7 E 2 7 - 0 1 5 8 - 4 8 C D - B 8 8 B - 0 4 6 F 5 5 A 5 E C F 0 ? p a g e = 0 " } } { \ f l d r s l t   \ c f 2     P a g e   } } )   ( { \ f i e l d { \ * \ f l d i n s t { H Y P E R L I N K   " x - d e v o n t h i n k - i t e m : / / 3 9 F 9 7 E 2 7 - 0 1 5 8 - 4 8 C D - B 8 8 B - 0 4 6 F 5 5 A 5 E C F 0 ? s e a r c h = 4 " } } { \ f l d r s l t   \ c f 2     T e x t   } } ) \  S o u r c e :   u n n a m e d   d o c u m e n t . p d f \  . \ u c 0 \ u 8 2 3 2   & \ u 8 2 3 2   4 . \ ' a 0 { \ f i e l d { \ * \ f l d i n s t { H Y P E R L I N K   " x - d e v o n t h i n k - i t e m : / / 3 9 F 9 7 E 2 7 - 0 1 5 8 - 4 8 C D - B 8 8 B - 0 4 6 F 5 5 A 5 E C F 0 ? p a g e = 0 " } } { \ f l d r s l t   \ c f 2     ( P g .   1 ) } } \ ' a 0 \  \ p a r d \ p a r d e f t a b 7 2 0   \ i \ b   \ c f 0   N o t e s :  \ i 0 \ b 0   \  \ p a r d \ p a r d e f t a b 7 2 0 \ s a 2 4 0  \ c f 0   \  }	� QQ R���R 	����
� 
DTkb� 
� kfrmID  
� 
DTcn�  ^�
� kfrmID  	� �S� S  TUVWXYZ[T �\\  U �]]  V �^^  W �__  X �``  Y �aa  Z �bb  [ �cc H 3 9 F 9 7 E 2 7 - 0 1 5 8 - 4 8 C D - B 8 8 B - 0 4 6 F 5 5 A 5 E C F 0��  ��  ��  ��  ��  ��  ��  ��   ascr  ��ޭ