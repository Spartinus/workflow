FasdUAS 1.101.10   ��   ��    k             l      ��  ��   	�	� 
Script library for upcasing and downcasing characters in a string.

'Public' routines (all return a string):

	uppercase(theString)
		Upcase all unprotected characters of the string.
		
	lowercase(theString)
		Downcase all unprotected characters of the string.
		
	capitalize(theString)
		Capitalize all unprotected words in the string, 
		unless in nonCapitalizedWords.
		
	uncapitalize(theString)
		Capitalize only the first letters of a sentence, 
		and downcase all other unprotected characters.
	
	capitalizeOrProtect(theString)
		Capitalize all unprotected words in the string, 
		unless in nonCapitalizedWords.
		Automatically protect all words not at the start 
		of a sentence that were already capitalized.
		
	removeProtectChars(theString)
		Remove all occurences of the protect characters, 
		startProtectChar and endProtectChar, from the string. 

Other routines (change AppleScript's text item delimiters):

	makeCapitalized(theString, capitalizeAll, autoProtect)
		This does the work for (un)capitalize.
	
	upperCharacters(theString)
		Returns a list of upcased characters.
		
	lowerCharacters(theString)
		Returns a list of downcased characters.
	
	textItemsWithDelimiters(theStrings, theDelimiters)
		Splits a string using a list of delimiters, 
		returns a list of alternatively text items and delimiters. 

	shouldNotBeCapitalized(theWord)
		Checks if a word should not be capitalized.
	
Properties:
	
	nonCapitalizedWords
		List of words which should not be capitalized, 
		unless at the beginning of a sentence.
	
	uppercaseLetters
	lowercaseLetters
		All uppercase and lowercase letters that we know how to convert.
	
	wordDelimiterCharacters
		List of characters separating words to be capitalized, 
		such as spaces, brackets, and quotes.
	
	newSentenceCharacters
		List of characters indicating the start of a new sentence.
	
	startProtectChar
	endProtectChar
		Characters between the corresponding characters 
		will be protected from changing case. 

Example:

-- load the Capitalize script library
set capitalizeLib to (load script file �
	((path to home folder as string) & "Library:ScriptingAdditions:Capitalize.scpt"))

set theSentence to �
	"(this is ONLY an example.) it, {IMHO},  Is A sTUpid senTENCE. "

tell capitalizeLib
	set its startProtectChar to "{"
	set its endProtectChar to "}"
	removeProtectChars(capitalize(theSentence))
end tell

-- returns:
-- "(This is only an Example.) It, IMHO, is a Stupid Sentence."
     � 	 	.   
 S c r i p t   l i b r a r y   f o r   u p c a s i n g   a n d   d o w n c a s i n g   c h a r a c t e r s   i n   a   s t r i n g . 
 
 ' P u b l i c '   r o u t i n e s   ( a l l   r e t u r n   a   s t r i n g ) : 
 
 	 u p p e r c a s e ( t h e S t r i n g ) 
 	 	 U p c a s e   a l l   u n p r o t e c t e d   c h a r a c t e r s   o f   t h e   s t r i n g . 
 	 	 
 	 l o w e r c a s e ( t h e S t r i n g ) 
 	 	 D o w n c a s e   a l l   u n p r o t e c t e d   c h a r a c t e r s   o f   t h e   s t r i n g . 
 	 	 
 	 c a p i t a l i z e ( t h e S t r i n g ) 
 	 	 C a p i t a l i z e   a l l   u n p r o t e c t e d   w o r d s   i n   t h e   s t r i n g ,   
 	 	 u n l e s s   i n   n o n C a p i t a l i z e d W o r d s . 
 	 	 
 	 u n c a p i t a l i z e ( t h e S t r i n g ) 
 	 	 C a p i t a l i z e   o n l y   t h e   f i r s t   l e t t e r s   o f   a   s e n t e n c e ,   
 	 	 a n d   d o w n c a s e   a l l   o t h e r   u n p r o t e c t e d   c h a r a c t e r s . 
 	 
 	 c a p i t a l i z e O r P r o t e c t ( t h e S t r i n g ) 
 	 	 C a p i t a l i z e   a l l   u n p r o t e c t e d   w o r d s   i n   t h e   s t r i n g ,   
 	 	 u n l e s s   i n   n o n C a p i t a l i z e d W o r d s . 
 	 	 A u t o m a t i c a l l y   p r o t e c t   a l l   w o r d s   n o t   a t   t h e   s t a r t   
 	 	 o f   a   s e n t e n c e   t h a t   w e r e   a l r e a d y   c a p i t a l i z e d . 
 	 	 
 	 r e m o v e P r o t e c t C h a r s ( t h e S t r i n g ) 
 	 	 R e m o v e   a l l   o c c u r e n c e s   o f   t h e   p r o t e c t   c h a r a c t e r s ,   
 	 	 s t a r t P r o t e c t C h a r   a n d   e n d P r o t e c t C h a r ,   f r o m   t h e   s t r i n g .   
 
 O t h e r   r o u t i n e s   ( c h a n g e   A p p l e S c r i p t ' s   t e x t   i t e m   d e l i m i t e r s ) : 
 
 	 m a k e C a p i t a l i z e d ( t h e S t r i n g ,   c a p i t a l i z e A l l ,   a u t o P r o t e c t ) 
 	 	 T h i s   d o e s   t h e   w o r k   f o r   ( u n ) c a p i t a l i z e . 
 	 
 	 u p p e r C h a r a c t e r s ( t h e S t r i n g ) 
 	 	 R e t u r n s   a   l i s t   o f   u p c a s e d   c h a r a c t e r s . 
 	 	 
 	 l o w e r C h a r a c t e r s ( t h e S t r i n g ) 
 	 	 R e t u r n s   a   l i s t   o f   d o w n c a s e d   c h a r a c t e r s . 
 	 
 	 t e x t I t e m s W i t h D e l i m i t e r s ( t h e S t r i n g s ,   t h e D e l i m i t e r s ) 
 	 	 S p l i t s   a   s t r i n g   u s i n g   a   l i s t   o f   d e l i m i t e r s ,   
 	 	 r e t u r n s   a   l i s t   o f   a l t e r n a t i v e l y   t e x t   i t e m s   a n d   d e l i m i t e r s .   
 
 	 s h o u l d N o t B e C a p i t a l i z e d ( t h e W o r d ) 
 	 	 C h e c k s   i f   a   w o r d   s h o u l d   n o t   b e   c a p i t a l i z e d . 
 	 
 P r o p e r t i e s : 
 	 
 	 n o n C a p i t a l i z e d W o r d s 
 	 	 L i s t   o f   w o r d s   w h i c h   s h o u l d   n o t   b e   c a p i t a l i z e d ,   
 	 	 u n l e s s   a t   t h e   b e g i n n i n g   o f   a   s e n t e n c e . 
 	 
 	 u p p e r c a s e L e t t e r s 
 	 l o w e r c a s e L e t t e r s 
 	 	 A l l   u p p e r c a s e   a n d   l o w e r c a s e   l e t t e r s   t h a t   w e   k n o w   h o w   t o   c o n v e r t . 
 	 
 	 w o r d D e l i m i t e r C h a r a c t e r s 
 	 	 L i s t   o f   c h a r a c t e r s   s e p a r a t i n g   w o r d s   t o   b e   c a p i t a l i z e d ,   
 	 	 s u c h   a s   s p a c e s ,   b r a c k e t s ,   a n d   q u o t e s . 
 	 
 	 n e w S e n t e n c e C h a r a c t e r s 
 	 	 L i s t   o f   c h a r a c t e r s   i n d i c a t i n g   t h e   s t a r t   o f   a   n e w   s e n t e n c e . 
 	 
 	 s t a r t P r o t e c t C h a r 
 	 e n d P r o t e c t C h a r 
 	 	 C h a r a c t e r s   b e t w e e n   t h e   c o r r e s p o n d i n g   c h a r a c t e r s   
 	 	 w i l l   b e   p r o t e c t e d   f r o m   c h a n g i n g   c a s e .   
 
 E x a m p l e : 
 
 - -   l o a d   t h e   C a p i t a l i z e   s c r i p t   l i b r a r y 
 s e t   c a p i t a l i z e L i b   t o   ( l o a d   s c r i p t   f i l e   � 
 	 ( ( p a t h   t o   h o m e   f o l d e r   a s   s t r i n g )   &   " L i b r a r y : S c r i p t i n g A d d i t i o n s : C a p i t a l i z e . s c p t " ) ) 
 
 s e t   t h e S e n t e n c e   t o   � 
 	 " ( t h i s   i s   O N L Y   a n   e x a m p l e . )   i t ,   { I M H O } ,     I s   A   s T U p i d   s e n T E N C E .   " 
 
 t e l l   c a p i t a l i z e L i b 
 	 s e t   i t s   s t a r t P r o t e c t C h a r   t o   " { " 
 	 s e t   i t s   e n d P r o t e c t C h a r   t o   " } " 
 	 r e m o v e P r o t e c t C h a r s ( c a p i t a l i z e ( t h e S e n t e n c e ) ) 
 e n d   t e l l 
 
 - -   r e t u r n s : 
 - -   " ( T h i s   i s   o n l y   a n   E x a m p l e . )   I t ,   I M H O ,   i s   a   S t u p i d   S e n t e n c e . " 
   
  
 l     ��������  ��  ��        j     ��� �� *0 noncapitalizedwords nonCapitalizedWords  J     �       m        �    a      m       �   
 a b o u t      m       �   
 a b o v e      m       �    a c c o r d i n g     !   m     " " � # #  a c r o s s !  $ % $ m     & & � ' ' 
 a f t e r %  ( ) ( m     * * � + +  a g a i n s t )  , - , m     . . � / / 
 a l o n g -  0 1 0 m    	 2 2 � 3 3  a m i d 1  4 5 4 m   	 
 6 6 � 7 7 
 a m o n g 5  8 9 8 m   
  : : � ; ;  a n 9  < = < m     > > � ? ?  a n d =  @ A @ m     B B � C C  a r o u n d A  D E D m     F F � G G  a s E  H I H m     J J � K K  a t I  L M L m     N N � O O  a t h w a r t M  P Q P m     R R � S S  b e Q  T U T m     V V � W W  b e f o r e U  X Y X m     Z Z � [ [  b e h i n d Y  \ ] \ m     ^ ^ � _ _ 
 b e l o w ]  ` a ` m     b b � c c  b e n e a t h a  d e d m    " f f � g g  b e s i d e e  h i h m   " % j j � k k  b e t w e e n i  l m l m   % ( n n � o o  b e y o n d m  p q p m   ( + r r � s s  b u t q  t u t m   + . v v � w w  b y u  x y x m   . 1 z z � { {  c o n c e r n i n g y  | } | m   1 4 ~ ~ �    d u r i n g }  � � � m   4 7 � � � � �  e i t h e r �  � � � m   7 : � � � � �  e x c e p t �  � � � m   : = � � � � �  e x c e p t i n g �  � � � m   = @ � � � � �  f o r �  � � � m   @ C � � � � �  f r o m �  � � � m   C F � � � � �  i n �  � � � m   F I � � � � �  i n s i d e �  � � � m   I L � � � � �  i n t o �  � � � m   L O � � � � �  i s �  � � � m   O R � � � � �  i t �  � � � m   R U � � � � �  l i k e �  � � � m   U X � � � � �  n e i t h e r �  � � � m   X [ � � � � �  n o r �  � � � m   [ ^ � � � � �  o f �  � � � m   ^ a � � � � �  o f f �  � � � m   a d � � � � �  o n �  � � � m   d g � � � � �  o n l y �  � � � m   g j � � � � �  o n t o �  � � � m   j m � � � � �  o r �  � � � m   m p � � � � �  o u t �  � � � m   p s � � � � �  o u t s i d e �  � � � m   s v � � � � �  o v e r �  � � � m   v y � � � � �  p a s t �  � � � m   y | � � � � �  p e n d i n g �  � � � m   |  � � � � �  r e g a r d i n g �  � � � m    � � � � � �  r e s p e c t i n g �  � � � m   � � � � � � � 
 r o u n d �  � � � m   � � � � � � � 
 s i n c e �  � � � m   � � � � � � �  s o �  � � � m   � � � � � � �  t h a t �  � � � m   � � � � � � �  t h e �  � � � m   � � � � � � �  t h e n �    m   � � �  t h i s  m   � � �  t h o u g h 	 m   � �

 �  t h r o u g h	  m   � � �  t h r o u g h o u t  m   � � �  t i l l  m   � � �  t o  m   � � �  t o w a r d  m   � � � 
 u n d e r  !  m   � �"" �##  u n d e r n e a t h! $%$ m   � �&& �'' 
 u n t i l% ()( m   � �** �++  u n t o) ,-, m   � �.. �//  u p- 010 m   � �22 �33  u p o n1 454 m   � �66 �77  w h e n5 898 m   � �:: �;; 
 w h e r e9 <=< m   � �>> �??  w h e t h e r= @A@ m   � �BB �CC 
 w h i c hA DED m   � �FF �GG  w h oE HIH m   � �JJ �KK 
 w h o s eI LML m   � �NN �OO  w i t hM PQP m   � �RR �SS  w i t h i nQ TUT m   � �VV �WW  w i t h o u tU X��X m   � �YY �ZZ  y e t��    [\[ j   � ���]�� $0 uppercaseletters uppercaseLetters] m   � �^^ �__ n A B C D E F G H I J K L M N O P Q R S T U V W X Y Z �R � � � � � � � � � � � � � � � � � � � � � � � � � �x\ `a` j   � ���b�� $0 lowercaseletters lowercaseLettersb m   � �cc �dd n a b c d e f g h i j k l m n o p q r s t u v w x y z �S � � � � � � � � � � � � � � � � � � � � � � � � � � �a efe j   ���g�� 20 worddelimitercharacters wordDelimiterCharactersg J   �hh iji 1   � ���
�� 
spacj klk 1   � ���
�� 
tab l mnm o   � ���
�� 
ret n opo m   � �qq �rr  -p sts m   � �uu �vv  /t wxw m   � �yy �zz  (x {|{ m   � }} �~~  )| � m   �� ���  `� ��� m  �� ���  '� ��� m  	�� ���  �� ��� m  	�� ���  �� ��� m  �� ���  9� ��� m  �� ���  :� ���� m  �� ���  "��  f ��� j  ,����� .0 newsentencecharacters newSentenceCharacters� J  +�� ��� m  �� ���  .� ��� m  !�� ���  !� ��� m  !$�� ���  ?� ���� m  $'�� ���  :��  � ��� j  -1����� $0 startprotectchar startProtectChar� m  -0�� ���  � ��� j  26�����  0 endprotectchar endProtectChar� m  25�� ���  � ��� l     ��������  ��  ��  � ��� p  77�� ������  0 protectnesting protectNesting��  � ��� l     ��������  ��  ��  � ��� i  7:��� I      ������� 0 	uppercase  � ���� o      ���� 0 	thestring 	theString��  ��  � k     %�� ��� r     ��� n    ��� 1    ��
�� 
txdl� 1     ��
�� 
ascr� o      ���� "0 saveddelimiters savedDelimiters� ��� r    ��� J    	�� ���� m    �� ���  ��  � n     ��� 1   
 ��
�� 
txdl� 1   	 
��
�� 
ascr� ��� r    ��� m    ����  � o      ����  0 protectnesting protectNesting� ��� r    ��� c    ��� n   ��� I    ������� "0 uppercharacters upperCharacters� ���� o    ���� 0 	thestring 	theString��  ��  �  f    � m    ��
�� 
TEXT� o      ���� 0 	thestring 	theString� ��� r    "��� o    ���� "0 saveddelimiters savedDelimiters� n     ��� 1    !��
�� 
txdl� 1    ��
�� 
ascr� ���� L   # %�� o   # $���� 0 	thestring 	theString��  � ��� l     ��������  ��  ��  � ��� i  ;>��� I      ������� 0 	lowercase  � ���� o      ���� 0 	thestring 	theString��  ��  � k     %�� ��� r     ��� n    ��� 1    ��
�� 
txdl� 1     ��
�� 
ascr� o      ���� "0 saveddelimiters savedDelimiters� ��� r    ��� J    	�� ���� m       �  ��  � n      1   
 ��
�� 
txdl 1   	 
��
�� 
ascr�  r     m    ����   o      ����  0 protectnesting protectNesting 	 r    

 c     n    I    ������ "0 lowercharacters lowerCharacters �� o    ���� 0 	thestring 	theString��  ��    f     m    ��
�� 
TEXT o      ���� 0 	thestring 	theString	  r    " o    ���� "0 saveddelimiters savedDelimiters n      1    !��
�� 
txdl 1    ��
�� 
ascr �� L   # % o   # $���� 0 	thestring 	theString��  �  l     ��������  ��  ��    i  ?B I      �� ���� 0 
capitalize    !��! o      ���� 0 	thestring 	theString��  ��   k     "" #$# r     %&% n    '(' 1    ��
�� 
txdl( 1     ��
�� 
ascr& o      ���� "0 saveddelimiters savedDelimiters$ )*) r    +,+ n   -.- I    ��/���� "0 makecapitalized makeCapitalized/ 010 o    ���� 0 	thestring 	theString1 232 m    	��
�� boovtrue3 4��4 m   	 
��
�� boovfals��  ��  .  f    , o      ���� 0 	thestring 	theString* 565 r    787 o    ���� "0 saveddelimiters savedDelimiters8 n     9:9 1    ��
�� 
txdl: 1    ��
�� 
ascr6 ;��; L    << o    ���� 0 	thestring 	theString��   =>= l     ��������  ��  ��  > ?@? i  CFABA I      ��C���� 0 uncapitalize  C D��D o      ���� 0 	thestring 	theString��  ��  B k     EE FGF r     HIH n    JKJ 1    ��
�� 
txdlK 1     ��
�� 
ascrI o      ���� "0 saveddelimiters savedDelimitersG LML r    NON n   PQP I    ��R���� "0 makecapitalized makeCapitalizedR STS o    ���� 0 	thestring 	theStringT UVU m    	��
�� boovfalsV W��W m   	 
��
�� boovfals��  ��  Q  f    O o      ���� 0 	thestring 	theStringM XYX r    Z[Z o    ���� "0 saveddelimiters savedDelimiters[ n     \]\ 1    ��
�� 
txdl] 1    ��
�� 
ascrY ^��^ L    __ o    ���� 0 	thestring 	theString��  @ `a` l     ��������  ��  ��  a bcb i  GJded I      ��f���� *0 capitalizeorprotect capitalizeOrProtectf g��g o      ���� 0 	thestring 	theString��  ��  e k     hh iji r     klk n    mnm 1    ��
�� 
txdln 1     ��
�� 
ascrl o      �� "0 saveddelimiters savedDelimitersj opo r    qrq n   sts I    �~u�}�~ "0 makecapitalized makeCapitalizedu vwv o    �|�| 0 	thestring 	theStringw xyx m    	�{
�{ boovtruey z�zz m   	 
�y
�y boovtrue�z  �}  t  f    r o      �x�x 0 	thestring 	theStringp {|{ r    }~} o    �w�w "0 saveddelimiters savedDelimiters~ n     � 1    �v
�v 
txdl� 1    �u
�u 
ascr| ��t� L    �� o    �s�s 0 	thestring 	theString�t  c ��� l     �r�q�p�r  �q  �p  � ��� i  KN��� I      �o��n�o (0 removeprotectchars removeProtectChars� ��m� o      �l�l 0 	thestring 	theString�m  �n  � k     ��� ��� Z     }���k�j� F     +��� l    ��i�h� G     ��� >     ��� o     �g�g $0 startprotectchar startProtectChar� m    �� ���  � >   
 ��� o   
 �f�f  0 endprotectchar endProtectChar� m    �� ���  �i  �h  � l 	  )��e�d� l   )��c�b� G    )��� E    ��� o    �a�a 0 	thestring 	theString� o    �`�` $0 startprotectchar startProtectChar� E     '��� l 	   !��_�^� o     !�]�] 0 	thestring 	theString�_  �^  � o   ! &�\�\  0 endprotectchar endProtectChar�c  �b  �e  �d  � k   . y�� ��� r   . 3��� n  . 1��� 1   / 1�[
�[ 
txdl� 1   . /�Z
�Z 
ascr� o      �Y�Y "0 saveddelimiters savedDelimiters� ��� r   4 ?��� J   4 ;�� ��X� o   4 9�W�W $0 startprotectchar startProtectChar�X  � n     ��� 1   < >�V
�V 
txdl� 1   ; <�U
�U 
ascr� ��� r   @ E��� n   @ C��� 2  A C�T
�T 
citm� o   @ A�S�S 0 	thestring 	theString� o      �R�R 0 thechars theChars� ��� r   F M��� J   F I�� ��Q� m   F G�� ���  �Q  � n     ��� 1   J L�P
�P 
txdl� 1   I J�O
�O 
ascr� ��� r   N S��� c   N Q��� o   N O�N�N 0 thechars theChars� m   O P�M
�M 
TEXT� o      �L�L 0 	thestring 	theString� ��� r   T _��� J   T [�� ��K� o   T Y�J�J  0 endprotectchar endProtectChar�K  � n     ��� 1   \ ^�I
�I 
txdl� 1   [ \�H
�H 
ascr� ��� r   ` e��� n   ` c��� 2  a c�G
�G 
citm� o   ` a�F�F 0 	thestring 	theString� o      �E�E 0 thechars theChars� ��� r   f m��� J   f i�� ��D� m   f g�� ���  �D  � n     ��� 1   j l�C
�C 
txdl� 1   i j�B
�B 
ascr� ��� r   n s��� c   n q��� o   n o�A�A 0 thechars theChars� m   o p�@
�@ 
TEXT� o      �?�? 0 	thestring 	theString� ��>� r   t y��� o   t u�=�= "0 saveddelimiters savedDelimiters� n     ��� 1   v x�<
�< 
txdl� 1   u v�;
�; 
ascr�>  �k  �j  � ��:� L   ~ ��� o   ~ �9�9 0 	thestring 	theString�:  � ��� l     �8�7�6�8  �7  �6  � ��� l     �5���5  �   Internal routines.    � ��� (   I n t e r n a l   r o u t i n e s .  � ��� l     �4���4  � 5 / May change AppleScript's text item delimiters.   � ��� ^   M a y   c h a n g e   A p p l e S c r i p t ' s   t e x t   i t e m   d e l i m i t e r s .� ��� l     �3�2�1�3  �2  �1  � ��� l     �0�/�.�0  �/  �.  �    l     �-�,�+�-  �,  �+    i  OR I      �*�)�* "0 makecapitalized makeCapitalized  o      �(�( 0 	thestring 	theString 	
	 o      �'�' 0 capitalizeall capitalizeAll
 �& o      �%�% 0 autoprotect autoProtect�&  �)   k    �  r      n     I    �$�#�$ 20 textitemswithdelimiters textItemsWithDelimiters  o    �"�" 0 	thestring 	theString �! o    � �  20 worddelimitercharacters wordDelimiterCharacters�!  �#    f      o      �� 0 thewords theWords  l   ����  �  �    l   ��   #  this will hold the new words    � :   t h i s   w i l l   h o l d   t h e   n e w   w o r d s  r     !  J    ��  ! o      �� 0 newwords newWords "#" l   �$%�  $ ( " this keeps track of new sentences   % �&& D   t h i s   k e e p s   t r a c k   o f   n e w   s e n t e n c e s# '(' r    )*) m    �
� boovtrue* o      �� "0 startofsentence startOfSentence( +,+ r    -.- m    ��  . o      ��  0 protectnesting protectNesting, /0/ r    121 m    33 �44  2 o      �� 0 sepchar sepChar0 565 r    &787 J    "99 :�: m     ;; �<<  �  8 n     =>= 1   # %�
� 
txdl> 1   " #�
� 
ascr6 ?@? r   ' *ABA m   ' (�� B o      �� 0 i  @ CDC r   + 2EFE I  + 0�G�
� .corecnte****       ****G o   + ,�� 0 thewords theWords�  F o      �
�
 0 numwords numWordsD HIH V   3JKJ k   ;zLL MNM r   ; AOPO n   ; ?QRQ 4   < ?�	S
�	 
cobjS o   = >�� 0 i  R o   ; <�� 0 thewords theWordsP o      �� 0 theword theWordN TUT Z   BXVW��V ?   B GXYX n   B EZ[Z 1   C E�
� 
leng[ o   B C�� 0 theword theWordY m   E F��  W k   JT\\ ]^] Z   JG_`� a_ l  J Lb����b H   J Lcc o   J K���� "0 startofsentence startOfSentence��  ��  ` k   Odd efe Z   O ugh��ig l  O Pj����j o   O P���� 0 autoprotect autoProtect��  ��  h k   S okk lml r   S Ynon n   S Wpqp 4   T W��r
�� 
cha r m   U V���� q o   S T���� 0 theword theWordo o      ���� 0 	firstchar 	firstCharm s��s P   Z otu��t r   _ nvwv I  _ l����x
�� .sysooffslong    ��� null��  x ��yz
�� 
psofy o   a b���� 0 	firstchar 	firstCharz ��{��
�� 
psin{ o   c h���� $0 uppercaseletters uppercaseLetters��  w o      ���� 0 j  u ����
�� conscase��  ��  ��  ��  i r   r u|}| m   r s����  } o      ���� 0 j  f ~��~ Z   v��� ?   v y��� o   v w���� 0 j  � m   w x����  � r   | ���� b   | ���� b   | ��� m   | }�� ���  {� o   } ~���� 0 theword theWord� m    ��� ���  }� n      ���  ;   � �� o   � ����� 0 newwords newWords� ��� l  � ������� G   � ���� H   � ��� o   � ����� 0 capitalizeall capitalizeAll� n  � ���� I   � �������� 00 shouldnotbecapitalized shouldNotBeCapitalized� ���� o   � ����� 0 theword theWord��  ��  �  f   � ���  ��  � ��� k   � ��� ��� l  � �������  �    we should not capitalize    � ��� 4   w e   s h o u l d   n o t   c a p i t a l i z e  � ���� r   � ���� c   � ���� n  � ���� I   � �������� "0 lowercharacters lowerCharacters� ���� o   � ����� 0 theword theWord��  ��  �  f   � �� m   � ���
�� 
TEXT� n      ���  ;   � �� o   � ����� 0 newwords newWords��  � ��� ?   � ���� n   � ���� 1   � ���
�� 
leng� o   � ����� 0 theword theWord� m   � ����� � ���� k   � ��� ��� l  � �������  �   we should capitalize   � ��� *   w e   s h o u l d   c a p i t a l i z e� ���� r   � ���� c   � ���� b   � ���� n  � ���� I   � �������� "0 uppercharacters upperCharacters� ���� n   � ���� 4   � ����
�� 
cha � m   � ����� � o   � ����� 0 theword theWord��  ��  �  f   � �� n  � ���� I   � �������� "0 lowercharacters lowerCharacters� ���� n   � ���� 7  � �����
�� 
ctxt� m   � ����� �  ;   � �� o   � ����� 0 theword theWord��  ��  �  f   � �� m   � ���
�� 
TEXT� n      ���  ;   � �� o   � ����� 0 newwords newWords��  ��  � k   ��� ��� l  � �������  �   capitalize 1-letter word   � ��� 2   c a p i t a l i z e   1 - l e t t e r   w o r d� ���� P   ������ Z   ������� F   � ���� =   � ���� o   � ����� 0 sepchar sepChar� m   � ��� ���  '� =   � ���� o   � ����� 0 theword theWord� m   � ��� ���  s� r   � ���� m   � ��� ���  s� n      ���  ;   � �� o   � ����� 0 newwords newWords��  � r   ���� c   ���� n  � ��� I   � ������� "0 uppercharacters upperCharacters� ���� o   � ����� 0 theword theWord��  ��  �  f   � �� m   ��
�� 
TEXT� n      ���  ;  � o  ���� 0 newwords newWords��  � ����
�� conscase��  ��  ��  �   a k  G�� ��� Z  E������ ?  � � n   1  ��
�� 
leng o  ���� 0 theword theWord  m  ���� � r  5 c  2 b  . n 	
	 I  ������ "0 uppercharacters upperCharacters �� n   4  ��
�� 
cha  m  ����  o  ���� 0 theword theWord��  ��  
  f   n - I  -������ "0 lowercharacters lowerCharacters �� n  ) 7 )��
�� 
ctxt m  $&����   ;  '( o  ���� 0 theword theWord��  ��    f   m  .1��
�� 
TEXT n        ;  34 o  23���� 0 newwords newWords��  � k  8E  l 88����     capitalize 1-letter word    � 2   c a p i t a l i z e   1 - l e t t e r   w o r d  ��  r  8E!"! c  8B#$# n 8>%&% I  9>��'���� "0 uppercharacters upperCharacters' (��( o  9:���� 0 theword theWord��  ��  &  f  89$ m  >A��
�� 
TEXT" n      )*)  ;  CD* o  BC���� 0 newwords newWords��  � +��+ l FF��������  ��  ��  ��  ^ ,-, l HH��./��  . "  do we start a new sentence?   / �00 8   d o   w e   s t a r t   a   n e w   s e n t e n c e ?- 1��1 r  HT232 l HR4����4 E HR565 o  HM���� .0 newsentencecharacters newSentenceCharacters6 n  MQ787 4 NQ��9
�� 
cha 9 m  OP������8 o  MN���� 0 theword theWord��  ��  3 o      ���� "0 startofsentence startOfSentence��  �  �  U :;: r  Y^<=< [  Y\>?> o  YZ���� 0 i  ? m  Z[���� = o      ���� 0 i  ; @A@ l __��BC��  B   add separator   C �DD    a d d   s e p a r a t o rA EFE Z  _tGH����G A  _bIJI o  _`���� 0 i  J o  `a���� 0 numwords numWordsH k  epKK LML r  ekNON n  eiPQP 4  fi��R
�� 
cobjR o  gh�� 0 i  Q o  ef�~�~ 0 thewords theWordsO o      �}�} 0 sepchar sepCharM S�|S r  lpTUT o  lm�{�{ 0 sepchar sepCharU n      VWV  ;  noW o  mn�z�z 0 newwords newWords�|  ��  ��  F X�yX r  uzYZY [  ux[\[ o  uv�x�x 0 i  \ m  vw�w�w Z o      �v�v 0 i  �y  K B   7 :]^] o   7 8�u�u 0 i  ^ o   8 9�t�t 0 numwords numWordsI _`_ l ���sab�s  a $  return the capitalized string   b �cc <   r e t u r n   t h e   c a p i t a l i z e d   s t r i n g` ded r  ��fgf J  ��hh i�ri m  ��jj �kk  �r  g n     lml 1  ���q
�q 
txdlm 1  ���p
�p 
ascre non r  ��pqp c  ��rsr o  ���o�o 0 newwords newWordss m  ���n
�n 
TEXTq o      �m�m 0 	thestring 	theStringo t�lt L  ��uu o  ���k�k 0 	thestring 	theString�l   vwv l     �j�i�h�j  �i  �h  w xyx l     �g�f�e�g  �f  �e  y z{z i  SV|}| I      �d~�c�d "0 uppercharacters upperCharacters~ �b o      �a�a 0 	thestring 	theString�b  �c  } k     ~�� ��� l     �`���`  �    make a list of characters   � ��� 4   m a k e   a   l i s t   o f   c h a r a c t e r s� ��� r     ��� n     ��� 2   �_
�_ 
cha � o     �^�^ 0 	thestring 	theString� o      �]�] 0 thechars theChars� ��� r    
��� J    �\�\  � o      �[�[ 0 newchars newChars� ��� Y    {��Z���Y� k    v�� ��� r     ��� l   ��X�W� e    �� n    ��� 4    �V�
�V 
cobj� o    �U�U 0 i  � o    �T�T 0 thechars theChars�X  �W  � o      �S�S 0 thechar theChar� ��� l  ! !�R���R  � %  make lowercase letters capital   � ��� >   m a k e   l o w e r c a s e   l e t t e r s   c a p i t a l� ��Q� Z   ! v����P� =   ! (��� o   ! "�O�O 0 thechar theChar� o   " '�N�N $0 startprotectchar startProtectChar� r   + 0��� [   + .��� o   + ,�M�M  0 protectnesting protectNesting� m   , -�L�L � o      �K�K  0 protectnesting protectNesting� ��� =   3 :��� o   3 4�J�J 0 thechar theChar� o   4 9�I�I  0 endprotectchar endProtectChar� ��� r   = B��� \   = @��� o   = >�H�H  0 protectnesting protectNesting� m   > ?�G�G � o      �F�F  0 protectnesting protectNesting� ��� B   E H��� o   E F�E�E  0 protectnesting protectNesting� m   F G�D�D  � ��C� k   K r�� ��� r   K Z��� I  K X�B�A�
�B .sysooffslong    ��� null�A  � �@��
�@ 
psof� o   M N�?�? 0 thechar theChar� �>��=
�> 
psin� o   O T�<�< $0 lowercaseletters lowercaseLetters�=  � o      �;�; 0 j  � ��:� Z   [ r���9�8� ?   [ ^��� o   [ \�7�7 0 j  � m   \ ]�6�6  � r   a n��� n   a i��� 4   f i�5�
�5 
cha � o   g h�4�4 0 j  � o   a f�3�3 $0 uppercaseletters uppercaseLetters� n      ��� 4   j m�2�
�2 
cobj� o   k l�1�1 0 i  � o   i j�0�0 0 thechars theChars�9  �8  �:  �C  �P  �Q  �Z 0 i  � m    �/�/ � I   �.��-
�. .corecnte****       ****� o    �,�, 0 thechars theChars�-  �Y  � ��� l  | |�+���+  � ' ! return the uppercased characters   � ��� B   r e t u r n   t h e   u p p e r c a s e d   c h a r a c t e r s� ��*� L   | ~�� o   | }�)�) 0 thechars theChars�*  { ��� l     �(�'�&�(  �'  �&  � ��� i  WZ��� I      �%��$�% "0 lowercharacters lowerCharacters� ��#� o      �"�" 0 	thestring 	theString�#  �$  � k     y�� ��� l     �!���!  �    make a list of characters   � ��� 4   m a k e   a   l i s t   o f   c h a r a c t e r s� ��� r     ��� n     ��� 2   � 
�  
cha � o     �� 0 	thestring 	theString� o      �� 0 thechars theChars� ��� Y    v������ k    q�� ��� r    ��� l   ���� e    �� n    ��� 4    ��
� 
cobj� o    �� 0 i  � o    �� 0 thechars theChars�  �  � o      �� 0 thechar theChar� ��� l   � �    %  make capital letters lowercase    � >   m a k e   c a p i t a l   l e t t e r s   l o w e r c a s e� � Z    q� =    # o    �� 0 thechar theChar o    "�� $0 startprotectchar startProtectChar r   & +	
	 [   & ) o   & '��  0 protectnesting protectNesting m   ' (�� 
 o      ��  0 protectnesting protectNesting  =   . 5 o   . /�� 0 thechar theChar o   / 4��  0 endprotectchar endProtectChar  r   8 = \   8 ; o   8 9��  0 protectnesting protectNesting m   9 :�
�
  o      �	�	  0 protectnesting protectNesting  B   @ C o   @ A��  0 protectnesting protectNesting m   A B��   � k   F m  r   F U  I  F S��!
� .sysooffslong    ��� null�  ! �"#
� 
psof" o   H I�� 0 thechar theChar# �$� 
� 
psin$ o   J O���� $0 uppercaseletters uppercaseLetters�     o      ���� 0 j   %��% Z   V m&'����& ?   V Y()( o   V W���� 0 j  ) m   W X����  ' r   \ i*+* n   \ d,-, 4   a d��.
�� 
cha . o   b c���� 0 j  - o   \ a���� $0 lowercaseletters lowercaseLetters+ n      /0/ 4   e h��1
�� 
cobj1 o   f g���� 0 i  0 o   d e���� 0 thechars theChars��  ��  ��  �  �  �  � 0 i  � m   	 
���� � I  
 ��2��
�� .corecnte****       ****2 o   
 ���� 0 thechars theChars��  �  � 343 l  w w��56��  5 ' ! return the lowercased characters   6 �77 B   r e t u r n   t h e   l o w e r c a s e d   c h a r a c t e r s4 8��8 L   w y99 o   w x���� 0 thechars theChars��  � :;: l     ��������  ��  ��  ; <=< i  [^>?> I      ��@���� 00 shouldnotbecapitalized shouldNotBeCapitalized@ A��A o      ���� 0 theword theWord��  ��  ? P     B��CB L    DD E    EFE o    
���� *0 noncapitalizedwords nonCapitalizedWordsF l 	 
 G����G l  
 H����H c   
 IJI n  
 KLK I    ��M���� (0 removeprotectchars removeProtectCharsM N��N o    ���� 0 theword theWord��  ��  L  f   
 J m    ��
�� 
TEXT��  ��  ��  ��  ��  C ��O
�� conspuncO ����
�� conscase��  = PQP l     ��������  ��  ��  Q RSR i  _bTUT I      ��V���� 20 textitemswithdelimiters textItemsWithDelimitersV WXW o      ���� 0 
thestrings 
theStringsX Y��Y o      ���� 0 thedelimiters theDelimiters��  ��  U k     �ZZ [\[ Z    ]^����] >    _`_ n     aba m    ��
�� 
pclsb o     ���� 0 thedelimiters theDelimiters` m    ��
�� 
list^ l 	  c����c r    ded J    ff g��g c    hih o    	���� 0 thedelimiters theDelimitersi m   	 
��
�� 
TEXT��  e o      ���� 0 thedelimiters theDelimiters��  ��  ��  ��  \ jkj l   ��������  ��  ��  k lml Z   'no����n >   pqp n    rsr m    ��
�� 
pclss o    ���� 0 
thestrings 
theStringsq m    ��
�� 
listo l 	  #t����t r    #uvu J    !ww x��x c    yzy o    ���� 0 
thestrings 
theStringsz m    ��
�� 
TEXT��  v o      ���� 0 
thestrings 
theStrings��  ��  ��  ��  m {|{ l  ( (��������  ��  ��  | }~} l  ( ��� X   ( ������ k   8 ��� ��� r   8 =��� o   8 9���� 0 thedelimiter theDelimiter� n     ��� 1   : <��
�� 
txdl� 1   9 :��
�� 
ascr� ��� r   > B��� J   > @����  � o      ���� 0 
newstrings 
newStrings� ��� r   C F��� m   C D���� � o      ���� 0 i  � ��� l  G ����� V   G ���� k   S ��� ��� Z   S l������� ?   S V��� o   S T���� 0 i  � m   T U���� � k   Y h�� ��� r   Y b��� c   Y _��� n   Y ]��� 4   Z ]���
�� 
cobj� o   [ \���� 0 i  � o   Y Z���� 0 
thestrings 
theStrings� m   ] ^��
�� 
TEXT� n      ���  ;   ` a� o   _ `���� 0 
newstrings 
newStrings� ���� r   c h��� [   c f��� o   c d���� 0 i  � m   d e���� � o      ���� 0 i  ��  ��  ��  � ��� r   m s��� n   m q��� 4   n q���
�� 
cobj� o   o p���� 0 i  � o   m n���� 0 
thestrings 
theStrings� o      ���� 0 
nextstring 
nextString� ��� Z   t ������� E   t w��� o   t u���� 0 
nextstring 
nextString� o   u v���� 0 thedelimiter theDelimiter� k   z ��� ��� r   z ��� n   z }��� 2  { }��
�� 
citm� o   z {���� 0 
nextstring 
nextString� o      ���� 0 theparts theParts� ���� Y   � ��������� k   � ��� ��� Z  � �������� ?   � ���� o   � ����� 0 j  � m   � ����� � l 	 � ������� r   � ���� c   � ���� o   � ����� 0 thedelimiter theDelimiter� m   � ���
�� 
TEXT� n      ���  ;   � �� o   � ����� 0 
newstrings 
newStrings��  ��  ��  ��  � ���� r   � ���� c   � ���� n   � ���� 4   � ����
�� 
cobj� o   � ����� 0 j  � o   � ����� 0 theparts theParts� m   � ���
�� 
TEXT� n      ���  ;   � �� o   � ����� 0 
newstrings 
newStrings��  �� 0 j  � m   � ����� � I  � �����
�� .corecnte****       ****� o   � ��~�~ 0 theparts theParts�  ��  ��  ��  � r   � ���� o   � ��}�} 0 
nextstring 
nextString� n      ���  ;   � �� o   � ��|�| 0 
newstrings 
newStrings� ��{� r   � ���� [   � ���� o   � ��z�z 0 i  � m   � ��y�y � o      �x�x 0 i  �{  � B   K R��� o   K L�w�w 0 i  � l  L Q��v�u� I  L Q�t��s
�t .corecnte****       ****� o   L M�r�r 0 
thestrings 
theStrings�s  �v  �u  �   theStrings   � ���    t h e S t r i n g s� ��� l  � ��q�p�o�q  �p  �o  � ��n� r   � ���� o   � ��m�m 0 
newstrings 
newStrings� o      �l�l 0 
thestrings 
theStrings�n  �� 0 thedelimiter theDelimiter� o   + ,�k�k 0 thedelimiters theDelimiters�   theDelimiters   � ���    t h e D e l i m i t e r s~ ��� l  � ��j�i�h�j  �i  �h  � ��g� L   � ��� o   � ��f�f 0 
thestrings 
theStrings�g  S ��e� l     �d�c�b�d  �c  �b  �e       �a��^c� ��	
�a  � �`�_�^�]�\�[�Z�Y�X�W�V�U�T�S�R�Q�P�O�` *0 noncapitalizedwords nonCapitalizedWords�_ $0 uppercaseletters uppercaseLetters�^ $0 lowercaseletters lowercaseLetters�] 20 worddelimitercharacters wordDelimiterCharacters�\ .0 newsentencecharacters newSentenceCharacters�[ $0 startprotectchar startProtectChar�Z  0 endprotectchar endProtectChar�Y 0 	uppercase  �X 0 	lowercase  �W 0 
capitalize  �V 0 uncapitalize  �U *0 capitalizeorprotect capitalizeOrProtect�T (0 removeprotectchars removeProtectChars�S "0 makecapitalized makeCapitalized�R "0 uppercharacters upperCharacters�Q "0 lowercharacters lowerCharacters�P 00 shouldnotbecapitalized shouldNotBeCapitalized�O 20 textitemswithdelimiters textItemsWithDelimiters� �N�N S S      " & * . 2 6 : > B F J N R V Z ^ b f j n r v z ~ � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �
"&*.26:>BFJNRVY� �M�M   quy}������� �    �  	 �    �L�L   ���� �K��J�I�H�K 0 	uppercase  �J �G�G   �F�F 0 	thestring 	theString�I   �E�D�E 0 	thestring 	theString�D "0 saveddelimiters savedDelimiters �C�B��A�@�?
�C 
ascr
�B 
txdl�A  0 protectnesting protectNesting�@ "0 uppercharacters upperCharacters
�? 
TEXT�H &��,E�O�kv��,FOjE�O)�k+ �&E�O���,FO� �>��=�<�;�> 0 	lowercase  �= �:�:   �9�9 0 	thestring 	theString�<   �8�7�8 0 	thestring 	theString�7 "0 saveddelimiters savedDelimiters �6�5 �4�3�2
�6 
ascr
�5 
txdl�4  0 protectnesting protectNesting�3 "0 lowercharacters lowerCharacters
�2 
TEXT�; &��,E�O�kv��,FOjE�O)�k+ �&E�O���,FO� �1�0�/�.�1 0 
capitalize  �0 �-�-   �,�, 0 	thestring 	theString�/   �+�*�+ 0 	thestring 	theString�* "0 saveddelimiters savedDelimiters �)�(�'
�) 
ascr
�( 
txdl�' "0 makecapitalized makeCapitalized�. ��,E�O)�efm+ E�O���,FO� �&B�%�$�#�& 0 uncapitalize  �% �" �"    �!�! 0 	thestring 	theString�$   � ��  0 	thestring 	theString� "0 saveddelimiters savedDelimiters ���
� 
ascr
� 
txdl� "0 makecapitalized makeCapitalized�# ��,E�O)�ffm+ E�O���,FO� �e��!"�� *0 capitalizeorprotect capitalizeOrProtect� �#� #  �� 0 	thestring 	theString�  ! ��� 0 	thestring 	theString� "0 saveddelimiters savedDelimiters" ���
� 
ascr
� 
txdl� "0 makecapitalized makeCapitalized� ��,E�O)�eem+ E�O���,FO� ����$%�� (0 removeprotectchars removeProtectChars� �&� &  �� 0 	thestring 	theString�  $ �
�	��
 0 	thestring 	theString�	 "0 saveddelimiters savedDelimiters� 0 thechars theChars% 	���������
� 
bool
� 
ascr
� 
txdl
� 
citm
� 
TEXT� �b  �
 b  ��&	 �b  
 �b  �&�& P��,E�Ob  kv��,FO��-E�O�kv��,FO��&E�Ob  kv��,FO��-E�O�kv��,FO��&E�O���,FY hO� ��� '(��� "0 makecapitalized makeCapitalized� ��)�� )  �������� 0 	thestring 	theString�� 0 capitalizeall capitalizeAll�� 0 autoprotect autoProtect�   ' �������������������������� 0 	thestring 	theString�� 0 capitalizeall capitalizeAll�� 0 autoprotect autoProtect�� 0 thewords theWords�� 0 newwords newWords�� "0 startofsentence startOfSentence�� 0 sepchar sepChar�� 0 i  �� 0 numwords numWords�� 0 theword theWord�� 0 	firstchar 	firstChar�� 0 j  ( ����3;������������u�������������������������j�� 20 textitemswithdelimiters textItemsWithDelimiters��  0 protectnesting protectNesting
�� 
ascr
�� 
txdl
�� .corecnte****       ****
�� 
cobj
�� 
leng
�� 
cha 
�� 
psof
�� 
psin�� 
�� .sysooffslong    ��� null�� 00 shouldnotbecapitalized shouldNotBeCapitalized
�� 
bool�� "0 lowercharacters lowerCharacters
�� 
TEXT�� "0 uppercharacters upperCharacters
�� 
ctxt���)�b  l+  E�OjvE�OeE�OjE�O�E�O�kv��,FOkE�O�j E�OKh����/E�O��,j� �� !��k/E�O�g *��b  � E�VY jE�O�j �%a %�6FY ��
 )�k+ a & )�k+ a &�6FY _��,k ')��k/k+ )�[a \[Zl\62k+ %a &�6FY 2g� -�a  	 �a  a & a �6FY )�k+ a &�6FVY >��,k ')��k/k+ )�[a \[Zl\62k+ %a &�6FY )�k+ a &�6FOPOb  ��i/E�Y hO�kE�O�� ��/E�O��6FY hO�kE�[OY��Oa kv��,FO�a &E�O� ��}����*+���� "0 uppercharacters upperCharacters�� ��,�� ,  ���� 0 	thestring 	theString��  * �������������� 0 	thestring 	theString�� 0 thechars theChars�� 0 newchars newChars�� 0 i  �� 0 thechar theChar�� 0 j  + ����������������
�� 
cha 
�� .corecnte****       ****
�� 
cobj��  0 protectnesting protectNesting
�� 
psof
�� 
psin�� 
�� .sysooffslong    ��� null�� ��-E�OjvE�O ok�j kh ��/EE�O�b    
�kE�Y E�b    
�kE�Y 3�j ,*��b  � E�O�j b  �/��/FY hY h[OY��O�	 �������-.���� "0 lowercharacters lowerCharacters�� ��/�� /  ���� 0 	thestring 	theString��  - ������������ 0 	thestring 	theString�� 0 thechars theChars�� 0 i  �� 0 thechar theChar�� 0 j  . ����������������
�� 
cha 
�� .corecnte****       ****
�� 
cobj��  0 protectnesting protectNesting
�� 
psof
�� 
psin�� 
�� .sysooffslong    ��� null�� z��-E�O ok�j kh ��/EE�O�b    
�kE�Y E�b    
�kE�Y 3�j ,*��b  � E�O�j b  �/��/FY hY h[OY��O�
 ��?����01���� 00 shouldnotbecapitalized shouldNotBeCapitalized�� ��2�� 2  ���� 0 theword theWord��  0 ���� 0 theword theWord1 C������ (0 removeprotectchars removeProtectChars
�� 
TEXT�� g� b   )�k+ �&V ��U����34���� 20 textitemswithdelimiters textItemsWithDelimiters�� ��5�� 5  ������ 0 
thestrings 
theStrings�� 0 thedelimiters theDelimiters��  3 ������������������ 0 
thestrings 
theStrings�� 0 thedelimiters theDelimiters�� 0 thedelimiter theDelimiter�� 0 
newstrings 
newStrings�� 0 i  �� 0 
nextstring 
nextString�� 0 theparts theParts�� 0 j  4 	������������������
�� 
pcls
�� 
list
�� 
TEXT
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
ascr
�� 
txdl
�� 
citm�� ̡�,� ��&kvE�Y hO��,� ��&kvE�Y hO ��[��l kh ���,FOjvE�OkE�O wh��j �k ��/�&�6FO�kE�Y hO��/E�O�� 8��-E�O ,k�j kh �k ��&�6FY hO��/�&�6F[OY��Y ��6FO�kE�[OY��O�E�[OY�oO�ascr  ��ޭ