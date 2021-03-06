FasdUAS 1.101.10   ��   ��    k             l      ��  ��   y 
Script library for downloading BibTeX information and PDF files from 
the ArXiv, Spires and the UC Davis math archive into BibDesk. 

Notes:

1.	Place this script in the folder ~/Library/ScriptingAdditions/.
	
2.	Add an Eprint field to the publications. You might also want 
	to add this as a default field in the BibDesk preferences. 
	
3.	Save PDF files to a path of the form 
	(papers folder)(archive)(separator)(number).pdf, 
	where 'papers folder' is the AutoFile path of BibDesk, and 
	'separator' is a property of this script.  Note that if 'separator' is 
	equal to "/", files are saved in subdirectories of the papers folder. 

4.	Some subroutines might use the Capitalize script library. 
	This should also be placed in the folder ~/Library/ScriptingAdditions/.

5.	This script requires BibDesk 1.3.14 or higher.

6.	Set the property rotateArxivMirrors to true if you want to rotate 
	between ArXiv mirrors. Note that the ArXiv does not allow large 
	automatic downloads.


Subroutines:

	queryForEprintIdentifiers ()
		Ask user for arXiv identifiers. Returns a list of newly added 
		pubs for them. 
	
	pubEprint ( thePub )
		Try to extract the arXiv identifier from the fields of the 
		publication. First, it looks for a field Eprint, Arxiv, 
		a field with the name of the defaultArchive, or Math. 
		If that cannot be found it analyzes the linked file, 
		which should have the structure described in Notes.
	
	analyzeEprint ( theEprint )
		Analyze the eprint number to extract the archive and number. 
		Returns the list {archive,number}; both are "" if theEprint is 
		not valid. If the archive is not found, defaultArchive is used. 
		If necessary, the number will be completed according to the 
		last weekday. 
	
	downloadBibTeX ( thePub, theURL, theArchive, theNumber )
		Get the BibTeX string and add the downloaded data to 
		the publication. It expects to find the BibTeX string in 
		a preformatted ( <pre> ) tag, as on Spires and the 
		UC Davis math archive. 
			
	downloadBibTeXFromSpires ( thePub, theArchive, theNumber )
		Get the BibTeX string from the Spires database and 
		add the downloaded data to the publication. 
	
	downloadBibTeXFromMath ( thePub, theArchive, theNumber )
		Get the BibTeX string from the UC Davis math archive
		and add the downloaded data to the publication. 
	
	downloadArxivAbs ( thePub, theArchive, theNumber )
		Get the BibTeX info from the arXiv server and add 
		the downloaded data to the publication. 
	
	downloadPDF ( thePub, theArchive, theNumber )
		Download the PDF file from the arXiv server and add 
		the linked file to the publication. The file is saved to a 
		path of the form described in Notes. 
	
	downloadAbstract ( thePub, theArchive, theNumber )
		Download the abstract from the arXiv server and add 
		it to the publication. 

	arxivURL ( thePage )
		Returns the proper URL of the ArXiv. It rotates between 
		the mirror if the property rotateArxivMirrors is true. 
		The argument should be either arxivAbs or arxivPdf. 
	
	linkFile ( thePub, theFile )
		Link a file to the publication, unless it is already linked. 
	
	linkURL ( thePub, theURL )
		Link a URL to the publication, unless it is already linked. 


Properties:

	spiresURL
		URL of Spires for the BibTeX string. 
	
	mathURL
		URL of the UC Davis math archive for the BibTeX string. 
	
	arxivAbs
		Part of the URL of the ArXiv server for bibliography information. 
	
	arxivPdf
		Part of the URL of the ArXiv server for PDF files.
	
	arxivMirrors
		List of mirror sites for the ArXiv.
	
	rotateArxivMirrors
		Boolean determines if a load should rotate between 
		ArXiv mirror sites. If this is set to false, the mirror at index
		arxivMirrorCounter is used. 
	
	arxivMirrorCounter
		Index of the mirror site for the ArXiv to use.
	
	arxivArchives
		Valid archive names for the ArXiv. 
	
	spiresArchives
		Valid archive names for Spires. 
	
	mathArchives
		Valid archive names for the UC Davis math archive. 
	
	defaultArchive
		The default archive, to be used when no archive is found.
	
	separator
		Separator between 'archive' and 'number' to build the path 
		for the PDF file. This is equal to "/" if they are saved in 
		directories according to archive.
	
	capitalizeTitle
		Should the title be capitalized by default?
	
	capitalizeLib
		The (path to the) capitalize script library.


Download Errors:

	Number:		Message:
	711			Failed to download bibTeX info for <eprint>.
	712			Failed to change BibTeX info for <eprint>.
	721			Failed to download abstract info for <eprint>.
	722			Failed to find bibliography info for <eprint>.
	730			Failed to get valid PDF file path for <eprint>.
	731			Failed to download PDF file for <eprint>.
	732			Failed to link file for <eprint>.
     � 	 	$�   
 S c r i p t   l i b r a r y   f o r   d o w n l o a d i n g   B i b T e X   i n f o r m a t i o n   a n d   P D F   f i l e s   f r o m   
 t h e   A r X i v ,   S p i r e s   a n d   t h e   U C   D a v i s   m a t h   a r c h i v e   i n t o   B i b D e s k .   
 
 N o t e s : 
 
 1 . 	 P l a c e   t h i s   s c r i p t   i n   t h e   f o l d e r   ~ / L i b r a r y / S c r i p t i n g A d d i t i o n s / . 
 	 
 2 . 	 A d d   a n   E p r i n t   f i e l d   t o   t h e   p u b l i c a t i o n s .   Y o u   m i g h t   a l s o   w a n t   
 	 t o   a d d   t h i s   a s   a   d e f a u l t   f i e l d   i n   t h e   B i b D e s k   p r e f e r e n c e s .   
 	 
 3 . 	 S a v e   P D F   f i l e s   t o   a   p a t h   o f   t h e   f o r m   
 	 ( p a p e r s   f o l d e r ) ( a r c h i v e ) ( s e p a r a t o r ) ( n u m b e r ) . p d f ,   
 	 w h e r e   ' p a p e r s   f o l d e r '   i s   t h e   A u t o F i l e   p a t h   o f   B i b D e s k ,   a n d   
 	 ' s e p a r a t o r '   i s   a   p r o p e r t y   o f   t h i s   s c r i p t .     N o t e   t h a t   i f   ' s e p a r a t o r '   i s   
 	 e q u a l   t o   " / " ,   f i l e s   a r e   s a v e d   i n   s u b d i r e c t o r i e s   o f   t h e   p a p e r s   f o l d e r .   
 
 4 . 	 S o m e   s u b r o u t i n e s   m i g h t   u s e   t h e   C a p i t a l i z e   s c r i p t   l i b r a r y .   
 	 T h i s   s h o u l d   a l s o   b e   p l a c e d   i n   t h e   f o l d e r   ~ / L i b r a r y / S c r i p t i n g A d d i t i o n s / . 
 
 5 . 	 T h i s   s c r i p t   r e q u i r e s   B i b D e s k   1 . 3 . 1 4   o r   h i g h e r . 
 
 6 . 	 S e t   t h e   p r o p e r t y   r o t a t e A r x i v M i r r o r s   t o   t r u e   i f   y o u   w a n t   t o   r o t a t e   
 	 b e t w e e n   A r X i v   m i r r o r s .   N o t e   t h a t   t h e   A r X i v   d o e s   n o t   a l l o w   l a r g e   
 	 a u t o m a t i c   d o w n l o a d s . 
 
 
 S u b r o u t i n e s : 
 
 	 q u e r y F o r E p r i n t I d e n t i f i e r s   ( ) 
 	 	 A s k   u s e r   f o r   a r X i v   i d e n t i f i e r s .   R e t u r n s   a   l i s t   o f   n e w l y   a d d e d   
 	 	 p u b s   f o r   t h e m .   
 	 
 	 p u b E p r i n t   (   t h e P u b   ) 
 	 	 T r y   t o   e x t r a c t   t h e   a r X i v   i d e n t i f i e r   f r o m   t h e   f i e l d s   o f   t h e   
 	 	 p u b l i c a t i o n .   F i r s t ,   i t   l o o k s   f o r   a   f i e l d   E p r i n t ,   A r x i v ,   
 	 	 a   f i e l d   w i t h   t h e   n a m e   o f   t h e   d e f a u l t A r c h i v e ,   o r   M a t h .   
 	 	 I f   t h a t   c a n n o t   b e   f o u n d   i t   a n a l y z e s   t h e   l i n k e d   f i l e ,   
 	 	 w h i c h   s h o u l d   h a v e   t h e   s t r u c t u r e   d e s c r i b e d   i n   N o t e s . 
 	 
 	 a n a l y z e E p r i n t   (   t h e E p r i n t   ) 
 	 	 A n a l y z e   t h e   e p r i n t   n u m b e r   t o   e x t r a c t   t h e   a r c h i v e   a n d   n u m b e r .   
 	 	 R e t u r n s   t h e   l i s t   { a r c h i v e , n u m b e r } ;   b o t h   a r e   " "   i f   t h e E p r i n t   i s   
 	 	 n o t   v a l i d .   I f   t h e   a r c h i v e   i s   n o t   f o u n d ,   d e f a u l t A r c h i v e   i s   u s e d .   
 	 	 I f   n e c e s s a r y ,   t h e   n u m b e r   w i l l   b e   c o m p l e t e d   a c c o r d i n g   t o   t h e   
 	 	 l a s t   w e e k d a y .   
 	 
 	 d o w n l o a d B i b T e X   (   t h e P u b ,   t h e U R L ,   t h e A r c h i v e ,   t h e N u m b e r   ) 
 	 	 G e t   t h e   B i b T e X   s t r i n g   a n d   a d d   t h e   d o w n l o a d e d   d a t a   t o   
 	 	 t h e   p u b l i c a t i o n .   I t   e x p e c t s   t o   f i n d   t h e   B i b T e X   s t r i n g   i n   
 	 	 a   p r e f o r m a t t e d   (   < p r e >   )   t a g ,   a s   o n   S p i r e s   a n d   t h e   
 	 	 U C   D a v i s   m a t h   a r c h i v e .   
 	 	 	 
 	 d o w n l o a d B i b T e X F r o m S p i r e s   (   t h e P u b ,   t h e A r c h i v e ,   t h e N u m b e r   ) 
 	 	 G e t   t h e   B i b T e X   s t r i n g   f r o m   t h e   S p i r e s   d a t a b a s e   a n d   
 	 	 a d d   t h e   d o w n l o a d e d   d a t a   t o   t h e   p u b l i c a t i o n .   
 	 
 	 d o w n l o a d B i b T e X F r o m M a t h   (   t h e P u b ,   t h e A r c h i v e ,   t h e N u m b e r   ) 
 	 	 G e t   t h e   B i b T e X   s t r i n g   f r o m   t h e   U C   D a v i s   m a t h   a r c h i v e 
 	 	 a n d   a d d   t h e   d o w n l o a d e d   d a t a   t o   t h e   p u b l i c a t i o n .   
 	 
 	 d o w n l o a d A r x i v A b s   (   t h e P u b ,   t h e A r c h i v e ,   t h e N u m b e r   ) 
 	 	 G e t   t h e   B i b T e X   i n f o   f r o m   t h e   a r X i v   s e r v e r   a n d   a d d   
 	 	 t h e   d o w n l o a d e d   d a t a   t o   t h e   p u b l i c a t i o n .   
 	 
 	 d o w n l o a d P D F   (   t h e P u b ,   t h e A r c h i v e ,   t h e N u m b e r   ) 
 	 	 D o w n l o a d   t h e   P D F   f i l e   f r o m   t h e   a r X i v   s e r v e r   a n d   a d d   
 	 	 t h e   l i n k e d   f i l e   t o   t h e   p u b l i c a t i o n .   T h e   f i l e   i s   s a v e d   t o   a   
 	 	 p a t h   o f   t h e   f o r m   d e s c r i b e d   i n   N o t e s .   
 	 
 	 d o w n l o a d A b s t r a c t   (   t h e P u b ,   t h e A r c h i v e ,   t h e N u m b e r   ) 
 	 	 D o w n l o a d   t h e   a b s t r a c t   f r o m   t h e   a r X i v   s e r v e r   a n d   a d d   
 	 	 i t   t o   t h e   p u b l i c a t i o n .   
 
 	 a r x i v U R L   (   t h e P a g e   ) 
 	 	 R e t u r n s   t h e   p r o p e r   U R L   o f   t h e   A r X i v .   I t   r o t a t e s   b e t w e e n   
 	 	 t h e   m i r r o r   i f   t h e   p r o p e r t y   r o t a t e A r x i v M i r r o r s   i s   t r u e .   
 	 	 T h e   a r g u m e n t   s h o u l d   b e   e i t h e r   a r x i v A b s   o r   a r x i v P d f .   
 	 
 	 l i n k F i l e   (   t h e P u b ,   t h e F i l e   ) 
 	 	 L i n k   a   f i l e   t o   t h e   p u b l i c a t i o n ,   u n l e s s   i t   i s   a l r e a d y   l i n k e d .   
 	 
 	 l i n k U R L   (   t h e P u b ,   t h e U R L   ) 
 	 	 L i n k   a   U R L   t o   t h e   p u b l i c a t i o n ,   u n l e s s   i t   i s   a l r e a d y   l i n k e d .   
 
 
 P r o p e r t i e s : 
 
 	 s p i r e s U R L 
 	 	 U R L   o f   S p i r e s   f o r   t h e   B i b T e X   s t r i n g .   
 	 
 	 m a t h U R L 
 	 	 U R L   o f   t h e   U C   D a v i s   m a t h   a r c h i v e   f o r   t h e   B i b T e X   s t r i n g .   
 	 
 	 a r x i v A b s 
 	 	 P a r t   o f   t h e   U R L   o f   t h e   A r X i v   s e r v e r   f o r   b i b l i o g r a p h y   i n f o r m a t i o n .   
 	 
 	 a r x i v P d f 
 	 	 P a r t   o f   t h e   U R L   o f   t h e   A r X i v   s e r v e r   f o r   P D F   f i l e s . 
 	 
 	 a r x i v M i r r o r s 
 	 	 L i s t   o f   m i r r o r   s i t e s   f o r   t h e   A r X i v . 
 	 
 	 r o t a t e A r x i v M i r r o r s 
 	 	 B o o l e a n   d e t e r m i n e s   i f   a   l o a d   s h o u l d   r o t a t e   b e t w e e n   
 	 	 A r X i v   m i r r o r   s i t e s .   I f   t h i s   i s   s e t   t o   f a l s e ,   t h e   m i r r o r   a t   i n d e x 
 	 	 a r x i v M i r r o r C o u n t e r   i s   u s e d .   
 	 
 	 a r x i v M i r r o r C o u n t e r 
 	 	 I n d e x   o f   t h e   m i r r o r   s i t e   f o r   t h e   A r X i v   t o   u s e . 
 	 
 	 a r x i v A r c h i v e s 
 	 	 V a l i d   a r c h i v e   n a m e s   f o r   t h e   A r X i v .   
 	 
 	 s p i r e s A r c h i v e s 
 	 	 V a l i d   a r c h i v e   n a m e s   f o r   S p i r e s .   
 	 
 	 m a t h A r c h i v e s 
 	 	 V a l i d   a r c h i v e   n a m e s   f o r   t h e   U C   D a v i s   m a t h   a r c h i v e .   
 	 
 	 d e f a u l t A r c h i v e 
 	 	 T h e   d e f a u l t   a r c h i v e ,   t o   b e   u s e d   w h e n   n o   a r c h i v e   i s   f o u n d . 
 	 
 	 s e p a r a t o r 
 	 	 S e p a r a t o r   b e t w e e n   ' a r c h i v e '   a n d   ' n u m b e r '   t o   b u i l d   t h e   p a t h   
 	 	 f o r   t h e   P D F   f i l e .   T h i s   i s   e q u a l   t o   " / "   i f   t h e y   a r e   s a v e d   i n   
 	 	 d i r e c t o r i e s   a c c o r d i n g   t o   a r c h i v e . 
 	 
 	 c a p i t a l i z e T i t l e 
 	 	 S h o u l d   t h e   t i t l e   b e   c a p i t a l i z e d   b y   d e f a u l t ? 
 	 
 	 c a p i t a l i z e L i b 
 	 	 T h e   ( p a t h   t o   t h e )   c a p i t a l i z e   s c r i p t   l i b r a r y . 
 
 
 D o w n l o a d   E r r o r s : 
 
 	 N u m b e r : 	 	 M e s s a g e : 
 	 7 1 1 	 	 	 F a i l e d   t o   d o w n l o a d   b i b T e X   i n f o   f o r   < e p r i n t > . 
 	 7 1 2 	 	 	 F a i l e d   t o   c h a n g e   B i b T e X   i n f o   f o r   < e p r i n t > . 
 	 7 2 1 	 	 	 F a i l e d   t o   d o w n l o a d   a b s t r a c t   i n f o   f o r   < e p r i n t > . 
 	 7 2 2 	 	 	 F a i l e d   t o   f i n d   b i b l i o g r a p h y   i n f o   f o r   < e p r i n t > . 
 	 7 3 0 	 	 	 F a i l e d   t o   g e t   v a l i d   P D F   f i l e   p a t h   f o r   < e p r i n t > . 
 	 7 3 1 	 	 	 F a i l e d   t o   d o w n l o a d   P D F   f i l e   f o r   < e p r i n t > . 
 	 7 3 2 	 	 	 F a i l e d   t o   l i n k   f i l e   f o r   < e p r i n t > . 
   
  
 l     ��������  ��  ��        j     �� �� 0 	spiresurl 	spiresURL  m        �   � h t t p : / / w w w . s l a c . s t a n f o r d . e d u / s p i r e s / f i n d / h e p / w w w ? f o r m a t = w w w b r i e f b i b t e x & r a w c m d = f i n d + e p r i n t +      j    �� �� 0 mathurl mathURL  m       �   < h t t p : / / f r o n t . m a t h . u c d a v i s . e d u /      j    �� �� 0 arxivabs arxivAbs  m       �    a r x i v . o r g / a b s /      j   	 �� �� 0 arxivpdf arxivPdf  m   	 
   �    a r x i v . o r g / p d f /     !   j    7�� "�� 0 arxivmirrors arxivMirrors " J    6 # #  $ % $ m     & & � ' '   %  ( ) ( m     * * � + + 
 l a n l . )  , - , m     . . � / /  a p s . -  0 1 0 m     2 2 � 3 3  a u . 1  4 5 4 m     6 6 � 7 7  b r . 5  8 9 8 m     : : � ; ;  c n . 9  < = < m     > > � ? ?  f r . =  @ A @ m     B B � C C  d e . A  D E D m     F F � G G  i n . E  H I H m     J J � K K  i l . I  L M L m     N N � O O  i t . M  P Q P m      R R � S S  j p . Q  T U T m     # V V � W W  r u . U  X Y X m   # & Z Z � [ [  z a . Y  \ ] \ m   & ) ^ ^ � _ _  k r . ]  ` a ` m   ) , b b � c c  e s . a  d e d m   , / f f � g g  t w . e  h�� h m   / 2 i i � j j  u k .��   !  k l k j   8 :�� m�� (0 rotatearxivmirrors rotateArxivMirrors m m   8 9��
�� boovfals l  n o n j   ; =�� p�� (0 arxivmirrorcounter arxivMirrorCounter p m   ; <����  o  q r q j   >��� s�� 0 arxivarchives arxivArchives s J   >� t t  u v u m   > A w w � x x  a s t r o - p h v  y z y m   A D { { � | |  c o n d - m a t z  } ~ } m   D G   � � � 
 g r - q c ~  � � � m   G J � � � � �  h e p - e x �  � � � m   J M � � � � �  h e p - l a t �  � � � m   M P � � � � �  h e p - p h �  � � � m   P S � � � � �  h e p - t h �  � � � m   S V � � � � �  m a t h - p h �  � � � m   V Y � � � � �  n u c l - e x �  � � � m   Y \ � � � � �  n u c l - t h �  � � � m   \ _ � � � � �  p h y s i c s �  � � � m   _ b � � � � �  q u a n t - p h �  � � � m   b e � � � � �  m a t h �  � � � m   e h � � � � �  n l i n �  � � � m   h k � � � � �  c s �  � � � m   k n � � � � � 
 q - b i o �  � � � m   n q � � � � �  a l g - g e o m �  � � � m   q t � � � � � 
 d g - g a �  � � � m   t w � � � � �  f u n c t - a n �  � � � m   w z � � � � � 
 q - a l g �  � � � m   z } � � � � � 
 c s . A R �  � � � m   } � � � � � � 
 c s . A I �  � � � m   � � � � � � � 
 c s . C C �  � � � m   � � � � � � � 
 c s . C G �  � � � m   � � � � � � � 
 c s . C E �  � � � m   � � � � � � � 
 c s . C L �  � � � m   � � � � � � � 
 c s . C V �  � � � m   � � � � � � � 
 c s . C Y �  � � � m   � � � � � � � 
 c s . C R �  � � � m   � � � � � � � 
 c s . D B �  � � � m   � � � � � � � 
 c s . D S �  � � � m   � � � � � � � 
 c s . D L �  � � � m   � � � � � � � 
 c s . D M �  � � � m   � � � � � � � 
 c s . D C �  � � � m   � � � � �   
 c s . G T �  m   � � � 
 c s . G L  m   � � � 
 c s . G R 	
	 m   � � � 
 c s . H C
  m   � � � 
 c s . I R  m   � � � 
 c s . I T  m   � � � 
 c s . L G  m   � � � 
 c s . L O  m   � � �   
 c s . M S !"! m   � �## �$$ 
 c s . M A" %&% m   � �'' �(( 
 c s . M M& )*) m   � �++ �,, 
 c s . N I* -.- m   � �// �00 
 c s . N E. 121 m   � �33 �44 
 c s . N A2 565 m   � �77 �88 
 c s . O S6 9:9 m   � �;; �<< 
 c s . O H: =>= m   � �?? �@@ 
 c s . P F> ABA m   � �CC �DD 
 c s . P LB EFE m   � �GG �HH 
 c s . R OF IJI m   � �KK �LL 
 c s . S EJ MNM m   � �OO �PP 
 c s . S DN QRQ m   � �SS �TT 
 c s . S CR UVU m   � �WW �XX  p h y s i c s . a c c - p hV YZY m   � �[[ �\\  p h y s i c s . a o - p hZ ]^] m   � �__ �``  p h y s i c s . a t o m - p h^ aba m   � �cc �dd   p h y s i c s . a t m - c l u sb efe m   � �gg �hh  p h y s i c s . b i o - p hf iji m   � �kk �ll  p h y s i c s . c h e m - p hj mnm m   � �oo �pp   p h y s i c s . c l a s s - p hn qrq m   � �ss �tt  p h y s i c s . c o m p - p hr uvu m   �ww �xx  p h y s i c s . d a t a - a nv yzy m  {{ �||  p h y s i c s . f l u - d y nz }~} m   ���  p h y s i c s . g e n - p h~ ��� m  
�� ���  p h y s i c s . h i s t - p h� ��� m  
�� ���  p h y s i c s . i n s - d e t� ��� m  �� ���  p h y s i c s . m e d - p h� ��� m  �� ���  p h y s i c s . o p t i c s� ��� m  �� ���  p h y s i c s . e d - p h� ��� m  �� ���  p h y s i c s . s o c - p h� ��� m  �� ��� " p h y s i c s . p l a s m a - p h� ��� m  �� ���  p h y s i c s . p o p - p h� ��� m  "�� ���   p h y s i c s . s p a c e - p h� ��� m  "%�� ���  c o n d - m a t . d i s - n n� ��� m  %(�� ��� " c o n d - m a t . m t r l - s c i� ��� m  (+�� ��� " c o n d - m a t . m e s - h a l l� ��� m  +.�� ���  c o n d - m a t . o t h e r� ��� m  .1�� ���  c o n d - m a t . s o f t� ��� m  14�� ��� $ c o n d - m a t . s t a t - m e c h� ��� m  47�� ���  c o n d - m a t . s t r - e l� ��� m  7:�� ��� " c o n d - m a t . s u p r - c o n� ��� m  :=�� ���  m a t h . A G� ��� m  =@�� ���  m a t h . A T� ��� m  @C�� ���  m a t h . A P� ��� m  CF�� ���  m a t h . C T� ��� m  FI�� ���  m a t h . C A� ��� m  IL�� ���  m a t h . C O� ��� m  LO�� ���  m a t h . A C� ��� m  OR�� ���  m a t h . C V� ��� m  RU�� ���  m a t h . D G� ��� m  UX�� ���  m a t h . D S� ��� m  X[�� ���  m a t h . F A� ��� m  [^�� ���  m a t h . G M� ��� m  ^a�� ���  m a t h . G N� ��� m  ad�� ���  m a t h . G T� ��� m  dg�� �    m a t h . G R�  m  gj �  m a t h . H O  m  jm �  m a t h . K T 	
	 m  mp �  m a t h . L O
  m  ps �  m a t h . M P  m  sv �  m a t h . M G  m  vy �  m a t h . N T  m  y| �  m a t h . N A  m  | �    m a t h . O A !"! m  �## �$$  m a t h . O C" %&% m  ��'' �((  m a t h . P R& )*) m  ��++ �,,  m a t h . Q A* -.- m  ��// �00  m a t h . R T. 121 m  ��33 �44  m a t h . R A2 565 m  ��77 �88  m a t h . S P6 9:9 m  ��;; �<<  m a t h . S T: =>= m  ��?? �@@  m a t h . S G> ABA m  ��CC �DD  q - b i o . B MB EFE m  ��GG �HH  q - b i o . C BF IJI m  ��KK �LL  q - b i o . G NJ MNM m  ��OO �PP  q - b i o . M NN QRQ m  ��SS �TT  q - b i o . N CR UVU m  ��WW �XX  q - b i o . O TV YZY m  ��[[ �\\  q - b i o . P EZ ]^] m  ��__ �``  q - b i o . Q M^ aba m  ��cc �dd  q - b i o . S Cb efe m  ��gg �hh  q - b i o . T Of iji m  ��kk �ll  n l i n . A Oj mnm m  ��oo �pp  n l i n . C Gn qrq m  ��ss �tt  n l i n . C Dr uvu m  ��ww �xx  n l i n . S Iv y��y m  ��zz �{{  n l i n . P S��   r |}| j  ����~��  0 spiresarchives spiresArchives~ J  �� ��� m  ���� ���  h e p - t h� ��� m  ���� ���  h e p - p h� ��� m  ���� ���  h e p - e x� ��� m  ���� ���  h e p - l a t� ��� m  ���� ��� 
 g r - q c� ��� m  ���� ���  n u c l - t h� ��� m  ���� ���  n u c l - e x� ��� m  ���� ���  q u a n t - p h� ���� m  ���� ���  a s t r o - p h��  } ��� j  �\����� 0 matharchives mathArchives� J  �[�� ��� m  ���� ���  m a t h� ��� m  ���� ���  a l g - g e o m� ��� m  ���� ��� 
 d g - g a� ��� m  ���� ��� 
 q - a l g� ��� m  ���� ���  f u n c t - a n� ��� m  ���� ���  m a t h . A G� ��� m  � �� ���  m a t h . A T� ��� m   �� ���  m a t h . A P� ��� m  �� ���  m a t h . C T� ��� m  	�� ���  m a t h . C A� ��� m  	�� ���  m a t h . C O� ��� m  �� ���  m a t h . A C� ��� m  �� ���  m a t h . C V� ��� m  �� ���  m a t h . D G� ��� m  �� ���  m a t h . D S� ��� m  �� ���  m a t h . F A� ��� m  �� ���  m a t h . G M� ��� m  !�� ���  m a t h . G N� ��� m  !$�� ���  m a t h . G T� ��� m  $'�� ���  m a t h . G R� ��� m  '*�� ���  m a t h . H O� ��� m  *-�� ���  m a t h . K T� � � m  -0 �  m a t h . L O   m  03 �  m a t h . M P  m  36		 �

  m a t h . M G  m  69 �  m a t h . N T  m  9< �  m a t h . N A  m  <? �  m a t h . O A  m  ?B �  m a t h . O C  m  BE �  m a t h . P R   m  EH!! �""  m a t h . Q A  #$# m  HK%% �&&  m a t h . R T$ '(' m  KN)) �**  m a t h . R A( +,+ m  NQ-- �..  m a t h . S P, /0/ m  QT11 �22  m a t h . S T0 3��3 m  TW44 �55  m a t h . S G��  � 676 j  ]a��8��  0 defaultarchive defaultArchive8 m  ]`99 �::  h e p - t h7 ;<; j  bf��=�� 0 	separator  = m  be>> �??  /< @A@ j  gi��B�� "0 capitalizetitle capitalizeTitleB m  gh��
�� boovfalsA CDC j  j|��E�� 0 capitalizelib capitalizeLibE b  j{FGF l jwH����H I jw��IJ
�� .earsffdralis        afdrI m  jm��
�� afdrcusrJ ��K��
�� 
rtypK m  ps��
�� 
TEXT��  ��  ��  G m  wzLL �MM T L i b r a r y : S c r i p t i n g A d d i t i o n s : C a p i t a l i z e . s c p tD NON l     ��������  ��  ��  O PQP i  }�RSR I      �������� 60 queryforeprintidentifiers queryForEprintIdentifiers��  ��  S k    	TT UVU l     ��������  ��  ��  V WXW r     YZY J     ����  Z o      ���� 0 	arxivlist 	arxivListX [\[ r    ]^] m    ��
�� boovfals^ o      ���� 0 done  \ _`_ V   	 �aba Q    �cdec k    iff ghg I   &��ij
�� .sysodlogaskr        TEXTi m    kk �ll F E n t e r   a n   a r X i v   i d e n t i f i e r   o r   n u m b e rj ��mn
�� 
dtxtm o    ����  0 defaultarchive defaultArchiven ��op
�� 
btnso J     qq rsr m    tt �uu  C a n c e ls vwv m    xx �yy  M o r e . . .w z��z m    {{ �||  D o n e��  p ��}��
�� 
dflt} m   ! "���� ��  h ~~ s   ' ;��� c   ' *��� l  ' (������ 1   ' (��
�� 
rslt��  ��  � m   ( )��
�� 
list� J      �� ��� o      ���� 0 textreturned textReturned� ���� o      ���� 0 buttonpressed buttonPressed��   ��� Z  < I������� =  < ?��� o   < =���� 0 buttonpressed buttonPressed� m   = >�� ���  D o n e� l 	 B E������ r   B E��� m   B C��
�� boovtrue� o      ���� 0 done  ��  ��  ��  ��  � ��� r   J O��� m   J K�� ���   � n     ��� 1   L N��
�� 
txdl� 1   K L��
�� 
ascr� ��� r   P X��� e   P V�� n   P V��� 2  Q U��
�� 
citm� o   P Q���� 0 textreturned textReturned� o      ���� 	0 parts  � ��� r   Y `��� m   Y \�� ���  � n     ��� 1   ] _��
�� 
txdl� 1   \ ]��
�� 
ascr� ���� r   a i��� c   a f��� o   a b���� 	0 parts  � m   b e��
�� 
TEXT� n      ���  ;   g h� o   f g���� 0 	arxivlist 	arxivList��  d R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� l     ������ o      ���� 0 errornumber errorNumber��  ��  ��  e Z  q �������� =   q v��� l  q r������ o   q r���� 0 errornumber errorNumber��  ��  � m   r u������� l 	 y |������ r   y |��� m   y z��
�� boovtrue� o      ���� 0 done  ��  ��  ��  ��  b H    �� o    ���� 0 done  ` ��� l  � ���������  ��  ��  � ��� Z  � �������� =   � ���� l  � ������� I  � ������
�� .corecnte****       ****� o   � ����� 0 	arxivlist 	arxivList��  ��  ��  � m   � �����  � L   � ��� J   � �����  ��  ��  � ��� l  � ���������  ��  ��  � ��� O   ���� k   ��� ��� l  � ���������  ��  ��  � ��� X   � ������ k   � ��� ��� r   � ���� I  � ������
�� .corecrel****      � null��  � ����
�� 
kocl� m   � ���
�� 
bibi� ����
�� 
prdt� K   � ��� ����
�� 
type� m   � ��� ���  a r t i c l e� �����
�� 
ckey� o   � ����� 0 arxivid arxivId��  � �����
�� 
insh� n   � ����  :   � �� 2  � ���
�� 
bibi��  � o      �� 0 thepub thePub� ��~� r   � ���� o   � ��}�} 0 arxivid arxivId� n      ��� 1   � ��|
�| 
fldv� n   � ���� 4   � ��{�
�{ 
bfld� m   � ��� ���  E p r i n t� o   � ��z�z 0 thepub thePub�~  �� 0 arxivid arxivId� o   � ��y�y 0 	arxivlist 	arxivList� ��� l  � ��x�w�v�x  �w  �v  � ��� L   ��� 7  ��u��
�u 
bibi� m   � ��t�t � l  ���s�r� e   ��� I  ��q��p
�q .corecnte****       ****� o   � ��o�o 0 	arxivlist 	arxivList�p  �s  �r  � ��n� l �m�l�k�m  �l  �k  �n  � n   � ���� 4   � ��j 
�j 
docu  m   � ��i�i � m   � ��                                                                                  BDSK   alis    �  Macintosh HD               ũ��H+   CsBibDesk.app                                                     �}Ǝd        ����  	                Debug     ũ��      Ǝ D     Cs � XR 
��  |S  EMacintosh HD:Users:hofman:Development:BuildProducts:Debug:BibDesk.app     B i b D e s k . a p p    M a c i n t o s h   H D  8Users/hofman/Development/BuildProducts/Debug/BibDesk.app  /    ��  � �h l �g�f�e�g  �f  �e  �h  Q  l     �d�c�b�d  �c  �b    i  �� I      �a	�`�a 0 	pubeprint 	pubEprint	 
�_
 o      �^�^ 0 apub aPub�_  �`   k    n  l     �]�\�[�]  �\  �[    l   l O    l k   k  l   �Z�Y�X�Z  �Y  �X    Q    &�W k      l   �V �V   "  try to find an Eprint field     �!! 8   t r y   t o   f i n d   a n   E p r i n t   f i e l d "#" r    $%$ e    && n    '(' 1    �U
�U 
fldv( n    )*) 4    �T+
�T 
bfld+ m   	 
,, �--  E p r i n t* o    �S�S 0 apub aPub% o      �R�R 0 aneprint anEprint# .�Q. Z   /0�P�O/ >    121 o    �N�N 0 aneprint anEprint2 m    33 �44  0 L    55 o    �M�M 0 aneprint anEprint�P  �O  �Q   R      �L�K�J
�L .ascrerr ****      � ****�K  �J  �W   676 Q   ' I89�I8 k   * @:: ;<; l  * *�H=>�H  = !  try to find an Arxiv field   > �?? 6   t r y   t o   f i n d   a n   A r x i v   f i e l d< @A@ r   * 3BCB e   * 1DD n   * 1EFE 1   . 0�G
�G 
fldvF n   * .GHG 4   + .�FI
�F 
bfldI m   , -JJ �KK 
 A r x i vH o   * +�E�E 0 apub aPubC o      �D�D 0 aneprint anEprintA L�CL Z  4 @MN�B�AM >   4 7OPO o   4 5�@�@ 0 aneprint anEprintP m   5 6QQ �RR  N L   : <SS o   : ;�?�? 0 aneprint anEprint�B  �A  �C  9 R      �>�=�<
�> .ascrerr ****      � ****�=  �<  �I  7 TUT Q   J pVW�;V k   M gXX YZY l  M M�:[\�:  [ ) # try to find a defaultArchive field   \ �]] F   t r y   t o   f i n d   a   d e f a u l t A r c h i v e   f i e l dZ ^_^ r   M Z`a` e   M Xbb n   M Xcdc 1   U W�9
�9 
fldvd n   M Uefe 4   N U�8g
�8 
bfldg o   O T�7�7  0 defaultarchive defaultArchivef o   M N�6�6 0 apub aPuba o      �5�5 0 aneprint anEprint_ h�4h Z  [ gij�3�2i >   [ ^klk o   [ \�1�1 0 aneprint anEprintl m   \ ]mm �nn  j L   a coo o   a b�0�0 0 aneprint anEprint�3  �2  �4  W R      �/�.�-
�/ .ascrerr ****      � ****�.  �-  �;  U pqp Q   q �rs�,r k   t �tt uvu l  t t�+wx�+  w    try to find an Math field   x �yy 4   t r y   t o   f i n d   a n   M a t h   f i e l dv z{z r   t }|}| e   t {~~ n   t {� 1   x z�*
�* 
fldv� n   t x��� 4   u x�)�
�) 
bfld� m   v w�� ���  M a t h� o   t u�(�( 0 apub aPub} o      �'�' 0 aneprint anEprint{ ��&� Z  ~ ����%�$� >   ~ ���� o   ~ �#�# 0 aneprint anEprint� m    ��� ���  � L   � ��� o   � ��"�" 0 aneprint anEprint�%  �$  �&  s R      �!� �
�! .ascrerr ****      � ****�   �  �,  q ��� Q   �d���� k   �[�� ��� l  � �����  � @ : failed to find a dedicated field, analyze the linked file   � ��� t   f a i l e d   t o   f i n d   a   d e d i c a t e d   f i e l d ,   a n a l y z e   t h e   l i n k e d   f i l e� ��� Z   �[����� ?   � ���� l  � ����� I  � ����
� .corecnte****       ****� l  � ����� e   � ��� n   � ���� 2  � ��
� 
File� o   � ��� 0 apub aPub�  �  �  �  �  � m   � ���  � k   �W�� ��� r   � ���� n   � ���� 1   � ��
� 
psxp� n   � ���� 4   � ���
� 
File� m   � ��� � o   � ��� 0 apub aPub� o      �� 0 	localfile 	localFile� ��� Z  � �����
� =   � ���� o   � ��	�	 0 	localfile 	localFile� m   � ��� ���  � L   � ��� m   � ��� ���  �  �
  � ��� r   � ���� m   � ��� ���  /� n     ��� 1   � ��
� 
txdl� 1   � ��
� 
ascr� ��� r   � ���� e   � ��� n   � ���� 2  � ��
� 
citm� o   � ��� 0 	localfile 	localFile� o      �� 	0 parts  � ��� Z   �8����� =   � ���� o   � ��� 0 	separator  � m   � ��� ���  /� r   � ���� n   � ���� 7  � ����
� 
cobj� m   � �� � ��� m   � �������� o   � ����� 	0 parts  � J      �� ��� o      ���� 0 	anarchive 	anArchive� ���� o      ���� 0 anumber aNumber��  �  � k  8�� ��� r  ��� e  	�� n  	��� 4  ���
�� 
cobj� m  ������� o  ���� 	0 parts  � o      ���� 0 	localfile 	localFile� ��� r  ��� o  ���� 0 	separator  � n     ��� 1  ��
�� 
txdl� 1  ��
�� 
ascr� ��� r  .��� e  ,�� c  ,��� n  (��� 7 (����
�� 
citm� m  !%�������  :  &'� o  ���� 0 	localfile 	localFile� m  (+��
�� 
TEXT� o      ���� 0 	anarchive 	anArchive� ���� r  /8��� e  /6�� n  /6��� 4  05���
�� 
citm� m  34������� o  /0���� 0 	localfile 	localFile� o      ���� 0 anumber aNumber��  � ��� r  9D��� m  9<�� �    .� n      1  ?C��
�� 
txdl 1  <?��
�� 
ascr�  r  EN e  EL n  EL	 4  FK��

�� 
citm
 m  IJ���� 	 o  EF���� 0 anumber aNumber o      ���� 0 anumber aNumber �� L  OW b  OV b  OT o  OP���� 0 	anarchive 	anArchive m  PS �  / o  TU���� 0 anumber aNumber��  �  �  �  � R      ������
�� .ascrerr ****      � ****��  ��  �  �  l ee��������  ��  ��    l ee����     failed to find anything    � 0   f a i l e d   t o   f i n d   a n y t h i n g  L  ei m  eh �   �� l jj��������  ��  ��  ��   m       �                                                                                  BDSK   alis    �  Macintosh HD               ũ��H+   CsBibDesk.app                                                     �}Ǝd        ����  	                Debug     ũ��      Ǝ D     Cs � XR 
��  |S  EMacintosh HD:Users:hofman:Development:BuildProducts:Debug:BibDesk.app     B i b D e s k . a p p    M a c i n t o s h   H D  8Users/hofman/Development/BuildProducts/Debug/BibDesk.app  /    ��     Bibdesk    �!!    B i b d e s k "��" l mm��������  ��  ��  ��   #$# l     ��������  ��  ��  $ %&% i  ��'(' I      ��)���� 0 analyzeeprint analyzeEprint) *��* o      ���� 0 aneprint anEprint��  ��  ( k    �++ ,-, l     ��������  ��  ��  - ./. l     ��01��  0   remove spaces   1 �22    r e m o v e   s p a c e s/ 343 X     15��65 k    ,77 898 r    :;: o    ���� 0 	spacechar 	spaceChar; n     <=< 1    ��
�� 
txdl= 1    ��
�� 
ascr9 >?> r     @A@ e    BB n    CDC 2   ��
�� 
citmD o    ���� 0 aneprint anEprintA o      ���� 	0 parts  ? EFE r   ! &GHG m   ! "II �JJ  H n     KLK 1   # %��
�� 
txdlL 1   " #��
�� 
ascrF M��M r   ' ,NON c   ' *PQP o   ' (���� 	0 parts  Q m   ( )��
�� 
TEXTO o      ���� 0 aneprint anEprint��  �� 0 	spacechar 	spaceChar6 J    RR STS 1    ��
�� 
spacT UVU 1    ��
�� 
tab V W��W o    ��
�� 
ret ��  4 XYX l  2 2��������  ��  ��  Y Z[Z l  2 2��\]��  \   strip possible "arxiv:"    ] �^^ 2   s t r i p   p o s s i b l e   " a r x i v : "  [ _`_ P   2 ia��ba Z  7 hcd����c F   7 Refe ?   7 <ghg n   7 :iji 1   8 :��
�� 
lengj o   7 8���� 0 aneprint anEprinth m   : ;���� f =   ? Nklk n   ? Jmnm 7  @ J��op
�� 
ctxto m   D F���� p m   G I���� n o   ? @���� 0 aneprint anEprintl m   J Mqq �rr  a r x i v :d l 	 U ds����s r   U dtut e   U bvv n   U bwxw 7  V a��yz
�� 
ctxty m   Z ^���� z  ;   _ `x o   U V���� 0 aneprint anEprintu o      ���� 0 aneprint anEprint��  ��  ��  ��  ��  b ����
�� conscase��  ` {|{ l  j j��������  ��  ��  | }~} l  j j�����     get archive and number   � ��� .   g e t   a r c h i v e   a n d   n u m b e r~ ��� r   j q��� m   j m�� ���  /� n     ��� 1   n p��
�� 
txdl� 1   m n��
�� 
ascr� ��� r   r x��� e   r v�� n   r v��� 2  s u��
�� 
citm� o   r s���� 0 aneprint anEprint� o      ���� 	0 parts  � ��� Z   y ������� =   y ���� l  y ~������ I  y ~�����
�� .corecnte****       ****� o   y z���� 	0 parts  ��  ��  ��  � m   ~ ���� � k   � ��� ��� r   � ���� o   � ����� 0 aneprint anEprint� o      ���� 0 anumber aNumber� ���� r   � ���� o   � �����  0 defaultarchive defaultArchive� o      ���� 0 	anarchive 	anArchive��  ��  � k   � ��� ��� r   � ���� e   � ��� n   � ���� 4   � ����
�� 
cobj� m   � ����� � o   � ����� 	0 parts  � o      ���� 0 anumber aNumber� ���� r   � ���� e   � ��� n   � ���� 4   � ����
�� 
cobj� m   � ����� � o   � ����� 	0 parts  � o      ���� 0 	anarchive 	anArchive��  � ��� l  � ��������  ��  �  � ��� Z  � ����~�}� =   � ���� o   � ��|�| 0 	anarchive 	anArchive� m   � ��� ���  � l 	 � ���{�z� r   � ���� o   � ��y�y  0 defaultarchive defaultArchive� o      �x�x 0 	anarchive 	anArchive�{  �z  �~  �}  � ��� l  � ��w�v�u�w  �v  �u  � ��� l  � ��t���t  � #  validate and complete number   � ��� :   v a l i d a t e   a n d   c o m p l e t e   n u m b e r� ��� r   � ���� e   � ��� n   � ���� 1   � ��s
�s 
leng� o   � ��r�r 0 anumber aNumber� o      �q�q 0 l  � ��� Z   � ����p�o� ?   � ���� o   � ��n�n 0 l  � m   � ��m�m 	� k   � ��� ��� r   � ���� e   � ��� n   � ���� 7  � ��l��
�l 
ctxt� m   � ��k�k � m   � ��j�j 	� o   � ��i�i 0 anumber aNumber� o      �h�h 0 anumber aNumber� ��g� r   � ���� m   � ��f�f 	� o      �e�e 0 l  �g  �p  �o  � ��� V   � ���� k   � ��� ��� =   � ���� o   � ��d�d 0 anumber aNumber� b   � ���� m   � ��� ���  0� o   � ��c�c 0 anumber aNumber� ��b� r   � ���� [   � ���� o   � ��a�a 0 l  � m   � ��`�` � o      �_�_ 0 l  �b  � A   � ���� o   � ��^�^ 0 l  � m   � ��]�] � ��� Z   ����\�[� =   ���� o   � ��Z�Z 0 l  � m   � �Y�Y � k  �� ��� =  ��� o  �X�X 0 anumber aNumber� b  
� � m   �  .  o  	�W�W 0 anumber aNumber� �V =   o  �U�U 0 l   m  �T�T �V  �\  �[  �  l �S�R�Q�S  �R  �Q   	 Z  �
�P
 =   n   4  �O
�O 
cha  m  �N�N�� o  �M�M 0 anumber aNumber m   �  . k  #�  r  #( m  #& �   o      �L�L 0 	anarchive 	anArchive �K Z  )��J F  )_  n );!"! I  *;�I#�H�I 0 	isinteger 	isInteger# $�G$ e  *7%% n  *7&'& 7 +6�F()
�F 
ctxt( m  /3�E�E��)  ;  45' o  *+�D�D 0 anumber aNumber�G  �H  "  f  )*  l >[*�C�B* G  >[+,+ =  >A-.- o  >?�A�A 0 l  . m  ?@�@�@ , n DW/0/ I  EW�?1�>�? 0 	isinteger 	isInteger1 2�=2 e  ES33 n  ES454 7 FR�<67
�< 
ctxt6 m  JL�;�; 7 m  MQ�:�:��5 o  EF�9�9 0 anumber aNumber�=  �>  0  f  DE�C  �B   Z  b�89�8�78 A  bg:;: o  bc�6�6 0 l  ; m  cf�5�5 	9 k  j�<< =>= l jj�4?@�4  ?   complete the number   @ �AA (   c o m p l e t e   t h e   n u m b e r> BCB r  juDED \  jsFGF l joH�3�2H I jo�1�0�/
�1 .misccurdldt    ��� null�0  �/  �3  �2  G m  or�.�.  Q�E o      �-�- 0 lastday  C IJI V  v�KLK r  ��MNM \  ��OPO o  ���,�, 0 lastday  P m  ���+�+  Q�N o      �*�* 0 lastday  L E z�QRQ J  z�SS TUT m  z}�)
�) 
sun U V�(V m  }��'
�' 
sat �(  R n  ��WXW m  ���&
�& 
wkdyX o  ���%�% 0 lastday  J YZY r  ��[\[ e  ��]] n  ��^_^ 7 ���$`a
�$ 
ctxt` m  ���#�# a m  ���"�" _ l ��b�!� b e  ��cc c  ��ded n  ��fgf 1  ���
� 
yearg o  ���� 0 lastday  e m  ���
� 
TEXT�!  �   \ o      �� 0 yy  Z hih r  ��jkj l ��l��l e  ��mm c  ��non n  ��pqp m  ���
� 
mnthq o  ���� 0 lastday  o m  ���
� 
nmbr�  �  k o      �� 0 mm  i rsr Z ��tu��t A  ��vwv o  ���� 0 mm  w m  ���� 
u r  ��xyx b  ��z{z m  ��|| �}}  0{ o  ���� 0 mm  y o      �� 0 mm  �  �  s ~�~ r  ��� b  ����� l ������ e  ���� n  ����� 7 �����
� 
ctxt� m  ���� � l ����
�	� \  ����� m  ���� 	� o  ���� 0 l  �
  �	  � l ������ b  ����� o  ���� 0 yy  � o  ���� 0 mm  �  �  �  �  � o  ���� 0 anumber aNumber� o      �� 0 anumber aNumber�  �8  �7  �J   r  ����� m  ���� ���  � o      � �  0 anumber aNumber�K  �P   Z  �������� F  ���� n ����� I  ��������� 0 	isinteger 	isInteger� ���� o  ������ 0 anumber aNumber��  ��  �  f  ��� E ���� o  � ���� 0 arxivarchives arxivArchives� o   ���� 0 	anarchive 	anArchive� Z  	������� ?  	��� o  	
���� 0 l  � m  
���� � r  !��� e  �� n  ��� 7 ����
�� 
ctxt� m  ���� � m  ���� � o  ���� 0 anumber aNumber� o      ���� 0 anumber aNumber� ��� A  $)��� o  $%���� 0 l  � m  %(���� � ���� k  ,��� ��� l ,,������  �   complete the number   � ��� (   c o m p l e t e   t h e   n u m b e r� ��� r  ,7��� \  ,5��� l ,1������ I ,1������
�� .misccurdldt    ��� null��  ��  ��  ��  � m  14����  Q�� o      ���� 0 lastday  � ��� V  8W��� r  KR��� \  KP��� o  KL���� 0 lastday  � m  LO����  Q�� o      ���� 0 lastday  � E <J��� J  <D�� ��� m  <?��
�� 
sun � ���� m  ?B��
�� 
sat ��  � n  DI��� m  EI��
�� 
wkdy� o  DE���� 0 lastday  � ��� r  Xn��� e  Xl�� n  Xl��� 7 _k����
�� 
ctxt� m  ce���� � m  fj���� � l X_������ e  X_�� c  X_��� n  X]��� 1  Y]��
�� 
year� o  XY���� 0 lastday  � m  ]^��
�� 
TEXT��  ��  � o      ���� 0 yy  � ��� r  oz��� l ox������ e  ox�� c  ox��� n  ot��� m  pt��
�� 
mnth� o  op���� 0 lastday  � m  tw��
�� 
nmbr��  ��  � o      ���� 0 mm  � ��� Z {�������� A  {���� o  {|���� 0 mm  � m  |���� 
� r  ����� b  ����� m  ���� ���  0� o  ������ 0 mm  � o      ���� 0 mm  ��  ��  � ���� r  ����� b  ����� l �������� e  ���� n  ����� 7 ������
�� 
ctxt� m  ������ � l �������� \  ����� m  ������ � o  ������ 0 l  ��  ��  � l �������� b  ��   b  �� o  ������ 0 yy   o  ������ 0 mm   m  �� �  0 0 1��  ��  ��  ��  � o  ������ 0 anumber aNumber� o      ���� 0 anumber aNumber��  ��  ��  ��  � k  ��  r  ��	
	 m  �� �  
 o      ���� 0 anumber aNumber �� r  �� m  �� �   o      ���� 0 	anarchive 	anArchive��  	  l ����������  ��  ��    l ������      return archive and number    � 4   r e t u r n   a r c h i v e   a n d   n u m b e r  L  �� J  ��  o  ������ 0 	anarchive 	anArchive �� o  ������ 0 anumber aNumber��    ��  l ����������  ��  ��  ��  & !"! l     ��������  ��  ��  " #$# i  ��%&% I      ��'���� 0 	isinteger 	isInteger' (��( o      ���� 0 astring aString��  ��  & k     ;)) *+* l     ��,-��  , . ( see if a string contains only of digits   - �.. P   s e e   i f   a   s t r i n g   c o n t a i n s   o n l y   o f   d i g i t s+ /0/ Z    12����1 =     343 o     ���� 0 astring aString4 m    55 �66  2 L    77 m    ��
�� boovfals��  ��  0 898 X    8:��;: Z   3<=����< G    *>?> ?    "@A@ o     ���� 0 c  A m     !BB �CC  9? A   % (DED o   % &���� 0 c  E m   & 'FF �GG  0= L   - /HH m   - .��
�� boovfals��  ��  �� 0 c  ; n    IJI 2   ��
�� 
cha J o    ���� 0 astring aString9 K��K L   9 ;LL m   9 :��
�� boovtrue��  $ MNM l     ��������  ��  ��  N OPO i  ��QRQ I      ��S����  0 downloadbibtex downloadBibTeXS TUT o      ���� 0 thepub thePubU VWV o      ���� 0 theurl theURLW XYX o      ���� 0 
thearchive 
theArchiveY Z��Z o      ���� 0 	thenumber 	theNumber��  ��  R k    :[[ \]\ l     ��������  ��  ��  ] ^_^ Z     `a��b` =     cdc o     ���� 0 
thearchive 
theArchived m    ee �ff  a r    	ghg o    ���� 0 	thenumber 	theNumberh o      ���� 0 	theeprint 	theEprint��  b r    iji b    klk b    mnm o    ���� 0 
thearchive 
theArchiven m    oo �pp  /l o    ���� 0 	thenumber 	theNumberj o      ���� 0 	theeprint 	theEprint_ qrq Z    Lstu��s F    %vwv =    xyx l   z���z n    {|{ 1    �~
�~ 
pcls| o    �}�} 0 theurl theURL��  �  y m    �|
�| 
listw ?    #}~} l   !�{�z e    !�� I   !�y��x
�y .corecnte****       ****� o    �w�w 0 theurl theURL�x  �{  �z  ~ m   ! "�v�v t r   ( 7��� b   ( 5��� b   ( 0��� l  ( .��u�t� c   ( .��� l  ( ,��s�r� n   ( ,��� 4   ) ,�q�
�q 
cobj� m   * +�p�p � o   ( )�o�o 0 theurl theURL�s  �r  � m   , -�n
�n 
TEXT�u  �t  � o   . /�m�m 0 	theeprint 	theEprint� l  0 4��l�k� n   0 4��� 4   1 4�j�
�j 
cobj� m   2 3�i�i � o   0 1�h�h 0 theurl theURL�l  �k  � o      �g�g 0 theurl theURLu ��� H   : >�� E   : =��� o   : ;�f�f 0 theurl theURL� o   ; <�e�e 0 	theeprint 	theEprint� ��d� r   A H��� b   A F��� l  A D��c�b� c   A D��� o   A B�a�a 0 theurl theURL� m   B C�`
�` 
TEXT�c  �b  � o   D E�_�_ 0 	theeprint 	theEprint� o      �^�^ 0 theurl theURL�d  ��  r ��� l  M M�]�\�[�]  �\  �[  � ��� l  M M�Z���Z  � ? 9 try to find the capitalizeLib and sets its protect chars   � ��� r   t r y   t o   f i n d   t h e   c a p i t a l i z e L i b   a n d   s e t s   i t s   p r o t e c t   c h a r s� ��� Z   M ����Y�X� o   M R�W�W "0 capitalizetitle capitalizeTitle� Q   U ����V� k   X ��� ��� Z   X {���U�T� >   X a��� n   X _��� 1   ] _�S
�S 
pcls� o   X ]�R�R 0 capitalizelib capitalizeLib� m   _ `�Q
�Q 
scpt� k   d w�� ��� I  d o�P��O
�P .sysoloadscpt        alis� l  d k��N�M� c   d k��� o   d i�L�L 0 capitalizelib capitalizeLib� m   i j�K
�K 
alis�N  �M  �O  � ��J� r   p w��� l  p q��I�H� 1   p q�G
�G 
rslt�I  �H  � o      �F�F 0 capitalizelib capitalizeLib�J  �U  �T  � ��E� O   | ���� k   � ��� ��� r   � ���� m   � ��� ���  {� n     ��� o   � ��D�D $0 startprotectchar startProtectChar�  g   � �� ��C� r   � ���� m   � ��� ���  }� n     ��� o   � ��B�B  0 endprotectchar endProtectChar�  g   � ��C  � o   | ��A�A 0 capitalizelib capitalizeLib�E  � R      �@�?�>
�@ .ascrerr ****      � ****�?  �>  �V  �Y  �X  � ��� l  � ��=�<�;�=  �<  �;  � ��� l  � ����� Q   � ����� k   � ��� ��� l  � ��:���:  � !  download the bibtex string   � ��� 6   d o w n l o a d   t h e   b i b t e x   s t r i n g� ��� I  � ��9��8
�9 .sysoexecTEXT���     TEXT� b   � ���� b   � ���� m   � ��� ���  c u r l   "� o   � ��7�7 0 theurl theURL� m   � ��� ��� h "   |   s e d   - e   ' / < p r e > / , / < \ / p r e > / ! d '   - e   ' / < \ / * p r e > / s / / / '�8  � ��� r   � ���� l  � ���6�5� 1   � ��4
�4 
rslt�6  �5  � o      �3�3 "0 thebibtexstring theBibTeXString� ��� Z  � ����2�1� =   � ���� o   � ��0�0 "0 thebibtexstring theBibTeXString� m   � ��� ���  � R   � ��/�.�-
�/ .ascrerr ****      � ****�.  �-  �2  �1  � ��,� l  � ��+�*�)�+  �*  �)  �,  � R      �(�'�&
�( .ascrerr ****      � ****�'  �&  � R   � ��%��
�% .ascrerr ****      � ****� b   � �� � b   � � m   � � � F F a i l e d   t o   d o w n l o a d   b i b T e X   i n f o   f o r   o   � ��$�$ 0 	theeprint 	theEprint  m   � � �  .� �#�"
�# 
errn m   � ��!�!��"  �   BibDesk   � �    B i b D e s k� 	
	 l  � �� ���   �  �  
  l  �8 Q   �8 k   �
  l  � ���   &   now put everything into BibDesk    � @   n o w   p u t   e v e r y t h i n g   i n t o   B i b D e s k  l  � O   � k   �   !"! l  � ��#$�  # B < does this work OK, no overwriting of stuff we want to keep?   $ �%% x   d o e s   t h i s   w o r k   O K ,   n o   o v e r w r i t i n g   o f   s t u f f   w e   w a n t   t o   k e e p ?" &'& l  � ��()�  ( C = only change the relevant fields, this adds them if not there   ) �** z   o n l y   c h a n g e   t h e   r e l e v a n t   f i e l d s ,   t h i s   a d d s   t h e m   i f   n o t   t h e r e' +,+ r   � �-.- I  � ���/
� .BDSKImptnull���     docu�  / �0�
� 
from0 o   � ��� "0 thebibtexstring theBibTeXString�  . o      �� 0 newpubs newPubs, 121 Z   �34��3 ?   �565 l  � �7��7 I  � ��8�
� .corecnte****       ****8 o   � ��� 0 newpubs newPubs�  �  �  6 m   � ��  4 k  99 :;: r  <=< e  	>> n  	?@? 4  �A
� 
cobjA m  �� @ o  �
�
 0 newpubs newPubs= o      �	�	 0 newpub newPub; BCB O  �DED k  �FF GHG X  fI�JI k  7aKK LML r  7>NON n  7<PQP 1  8<�
� 
pcntQ o  78�� 0 	fieldname 	fieldNameO o      �� 0 	fieldname 	fieldNameM R�R Q  ?aST�S r  BXUVU l 	BMW��W l BMX� ��X e  BMYY n  BMZ[Z 1  HL��
�� 
fldv[ n  BH\]\ 4  CH��^
�� 
bfld^ o  FG���� 0 	fieldname 	fieldName] o  BC���� 0 newpub newPub�   ��  �  �  V n      _`_ 1  SW��
�� 
fldv` 4  MS��a
�� 
bflda o  QR���� 0 	fieldname 	fieldNameT R      ������
�� .ascrerr ****      � ****��  ��  �  �  � 0 	fieldname 	fieldNameJ J  )bb cdc m  ee �ff  A u t h o rd ghg m  ii �jj 
 T i t l eh klk m  mm �nn  J o u r n a ll opo m  qq �rr  V o l u m ep sts m  "uu �vv 
 P a g e st w��w m  "%xx �yy  Y e a r��  H z{z r  gu|}| o  gh���� 0 	theeprint 	theEprint} n      ~~ 1  pt��
�� 
fldv 4  hp���
�� 
bfld� m  lo�� ���  E p r i n t{ ��� n v���� I  w�������� 0 linkurl linkURL� ���  g  wx� ���� b  x���� n x���� I  y�������� 0 arxivurl arxivURL� ���� n y~��� o  z~���� 0 arxivabs arxivAbs�  f  yz��  ��  �  f  xy� o  ������ 0 	theeprint 	theEprint��  ��  �  f  vw� ��� l ��������  �   capitalize the title?   � ��� ,   c a p i t a l i z e   t h e   t i t l e ?� ��� Z  ��������� F  ����� o  ������ "0 capitalizetitle capitalizeTitle� =  ����� n  ����� 1  ����
�� 
pcls� o  ������ 0 capitalizelib capitalizeLib� m  ����
�� 
scpt� r  ����� n ����� I  ��������� 0 
capitalize  � ���� e  ���� n  ����� 1  ����
�� 
fldv� n ����� 4  �����
�� 
bfld� m  ���� ��� 
 T i t l e�  g  ����  ��  � l 	�������� o  ������ 0 capitalizelib capitalizeLib��  ��  � n      ��� 1  ����
�� 
fldv� 4  �����
�� 
bfld� m  ���� ��� 
 T i t l e��  ��  � ��� Q  ������� k  ���� ��� l ��������  � 0 * needs a try, as the field might not exist   � ��� T   n e e d s   a   t r y ,   a s   t h e   f i e l d   m i g h t   n o t   e x i s t� ���� r  ����� l �������� e  ���� n  ����� 1  ����
�� 
fldv� n  ����� 4  �����
�� 
bfld� m  ���� ���  S l a c c i t a t i o n� o  ������ 0 newpub newPub��  ��  � n      ��� 1  ����
�� 
fldv� 4  �����
�� 
bfld� m  ���� ���  S l a c c i t a t i o n��  � R      ������
�� .ascrerr ****      � ****��  ��  ��  � ��� l ��������  �   set the cite key   � ��� "   s e t   t h e   c i t e   k e y� ���� r  ����� e  ���� n  ����� 1  ����
�� 
ckey� o  ������ 0 newpub newPub� 1  ����
�� 
ckey��  E o  ���� 0 thepub thePubC ���� I ������
�� .coredelonull���     obj � o  ������ 0 newpubs newPubs��  ��  �  �  2 ���� l ��������  ��  ��  ��   n   � ���� 4   � ����
�� 
docu� m   � ����� � m   � ����                                                                                  BDSK   alis    �  Macintosh HD               ũ��H+   CsBibDesk.app                                                     �}Ǝd        ����  	                Debug     ũ��      Ǝ D     Cs � XR 
��  |S  EMacintosh HD:Users:hofman:Development:BuildProducts:Debug:BibDesk.app     B i b D e s k . a p p    M a c i n t o s h   H D  8Users/hofman/Development/BuildProducts/Debug/BibDesk.app  /    ��     doc 1 of BibDesk    ��� "   d o c   1   o f   B i b D e s k ���� l 		��������  ��  ��  ��   R      �����
�� .ascrerr ****      � ****� o      ���� 0 errormessage errorMessage��   k  8�� ��� Q  #����� I �����
�� .coredelonull���     obj � o  ���� 0 newpub newPub��  � R      ������
�� .ascrerr ****      � ****��  ��  ��  � ���� R  $8����
�� .ascrerr ****      � ****� b  ,7��� b  ,5��� b  ,1��� m  ,/�� ��� B F a i l e d   t o   c h a n g e   B i b T e X   i n f o   f o r  � o  /0���� 0 	theeprint 	theEprint� m  14�� ���  .  � o  56���� 0 errormessage errorMessage� �����
�� 
errn� m  (+�������  ��    	 download    ���    d o w n l o a d ���� l 99��������  ��  ��  ��  P ��� l     ��������  ��  ��  � ��� i  ��	 		  I      ��	���� 40 downloadbibtexfromspires downloadBibTeXFromSpires	 			 o      ���� 0 thepub thePub	 			 o      ���� 0 
thearchive 
theArchive	 	��	 o      ���� 0 	thenumber 	theNumber��  ��  	 n    				 I    ��	
����  0 downloadbibtex downloadBibTeX	
 			 o    ���� 0 thepub thePub	 			 n   			 o    ���� 0 	spiresurl 	spiresURL	  f    	 			 o    ���� 0 
thearchive 
theArchive	 	��	 o    ���� 0 	thenumber 	theNumber��  ��  		  f     � 			 l     ��������  ��  ��  	 			 i  ��			 I      ��	���� 00 downloadbibtexfrommath downloadBibTeXFromMath	 			 o      ���� 0 thepub thePub	 			 o      ���� 0 
thearchive 
theArchive	 	��	 o      ���� 0 	thenumber 	theNumber��  ��  	 n    	 	!	  I    ��	"����  0 downloadbibtex downloadBibTeX	" 	#	$	# o    ���� 0 thepub thePub	$ 	%	&	% n   	'	(	' o    ���� 0 mathurl mathURL	(  f    	& 	)	*	) o    ���� 0 
thearchive 
theArchive	* 	+��	+ o    ���� 0 	thenumber 	theNumber��  ��  	!  f     	 	,	-	, l     �������  ��  �  	- 	.	/	. i  ��	0	1	0 I      �~	2�}�~ $0 downloadarxivabs downloadArxivAbs	2 	3	4	3 o      �|�| 0 thepub thePub	4 	5	6	5 o      �{�{ 0 
thearchive 
theArchive	6 	7�z	7 o      �y�y 0 	thenumber 	theNumber�z  �}  	1 k    E	8	8 	9	:	9 l     �x�w�v�x  �w  �v  	: 	;	<	; l     �u	=	>�u  	= ? 9 try to find the capitalizeLib and sets its protect chars   	> �	?	? r   t r y   t o   f i n d   t h e   c a p i t a l i z e L i b   a n d   s e t s   i t s   p r o t e c t   c h a r s	< 	@	A	@ Z     P	B	C�t�s	B o     �r�r "0 capitalizetitle capitalizeTitle	C Q    L	D	E�q	D k    C	F	F 	G	H	G Z    .	I	J�p�o	I >    	K	L	K n    	M	N	M 1    �n
�n 
pcls	N o    �m�m 0 capitalizelib capitalizeLib	L m    �l
�l 
scpt	J k    *	O	O 	P	Q	P I   "�k	R�j
�k .sysoloadscpt        alis	R l   	S�i�h	S c    	T	U	T o    �g�g 0 capitalizelib capitalizeLib	U m    �f
�f 
alis�i  �h  �j  	Q 	V�e	V r   # *	W	X	W l  # $	Y�d�c	Y 1   # $�b
�b 
rslt�d  �c  	X o      �a�a 0 capitalizelib capitalizeLib�e  �p  �o  	H 	Z�`	Z O   / C	[	\	[ k   7 B	]	] 	^	_	^ r   7 <	`	a	` m   7 8	b	b �	c	c  {	a n     	d	e	d o   9 ;�_�_ $0 startprotectchar startProtectChar	e  g   8 9	_ 	f�^	f r   = B	g	h	g m   = >	i	i �	j	j  }	h n     	k	l	k o   ? A�]�]  0 endprotectchar endProtectChar	l  g   > ?�^  	\ o   / 4�\�\ 0 capitalizelib capitalizeLib�`  	E R      �[�Z�Y
�[ .ascrerr ****      � ****�Z  �Y  �q  �t  �s  	A 	m	n	m l  Q Q�X�W�V�X  �W  �V  	n 	o	p	o l  Q �	q	r	s	q Q   Q �	t	u	v	t k   T �	w	w 	x	y	x l  T T�U	z	{�U  	z !  download the abstract file   	{ �	|	| 6   d o w n l o a d   t h e   a b s t r a c t   f i l e	y 	}	~	} Z   T g		��T	�	 =   T W	�	�	� o   T U�S�S 0 
thearchive 
theArchive	� m   U V	�	� �	�	�  	� r   Z ]	�	�	� o   Z [�R�R 0 	thenumber 	theNumber	� o      �Q�Q 0 	theeprint 	theEprint�T  	� r   ` g	�	�	� b   ` e	�	�	� b   ` c	�	�	� o   ` a�P�P 0 
thearchive 
theArchive	� m   a b	�	� �	�	�  /	� o   c d�O�O 0 	thenumber 	theNumber	� o      �N�N 0 	theeprint 	theEprint	~ 	�	�	� r   h t	�	�	� b   h r	�	�	� n  h p	�	�	� I   i p�M	��L�M 0 arxivurl arxivURL	� 	��K	� n  i l	�	�	� o   j l�J�J 0 arxivabs arxivAbs	�  f   i j�K  �L  	�  f   h i	� o   p q�I�I 0 	theeprint 	theEprint	� o      �H�H 0 theurl theURL	� 	�	�	� r   u �	�	�	� l  u �	��G�F	� I  u ��E	��D
�E .sysoexecTEXT���     TEXT	� b   u |	�	�	� b   u x	�	�	� m   u v	�	� �	�	�  c u r l   "	� o   v w�C�C 0 theurl theURL	� m   x {	�	� �	�	�  "�D  �G  �F  	� o      �B�B 0 s  	� 	�	�	� l  � ��A�@�?�A  �@  �?  	� 	�	�	� l  � ��>	�	��>  	� ) # empty download, handle by last try   	� �	�	� F   e m p t y   d o w n l o a d ,   h a n d l e   b y   l a s t   t r y	� 	�	�	� Z  � �	�	��=�<	� =   � �	�	�	� o   � ��;�; 0 s  	� m   � �	�	� �	�	�  	� R   � ��:�9�8
�: .ascrerr ****      � ****�9  �8  �=  �<  	� 	��7	� l  � ��6�5�4�6  �5  �4  �7  	u R      �3�2�1
�3 .ascrerr ****      � ****�2  �1  	v R   � ��0	�	�
�0 .ascrerr ****      � ****	� b   � �	�	�	� b   � �	�	�	� m   � �	�	� �	�	� D F a i l e d   t o   d o w n l o a d   a r X i v   i n f o   f o r  	� o   � ��/�/ 0 	theeprint 	theEprint	� m   � �	�	� �	�	�  .  	� �.	��-
�. 
errn	� m   � ��,�,��-  	r  	 download   	s �	�	�    d o w n l o a d	p 	�	�	� l  � ��+�*�)�+  �*  �)  	� 	�	�	� l  �d	�	�	�	� Q   �d	�	�	�	� k   �J	�	� 	�	�	� l  � ��(	�	��(  	�    get title and author info   	� �	�	� 4   g e t   t i t l e   a n d   a u t h o r   i n f o	� 	�	�	� l  � ��'	�	��'  	�  
 the title   	� �	�	�    t h e   t i t l e	� 	�	�	� r   � �	�	�	� m   � �	�	� �	�	� r < h 1   c l a s s = " t i t l e " > < s p a n   c l a s s = " d e s c r i p t o r " > T i t l e : < / s p a n > 
	� n     	�	�	� 1   � ��&
�& 
txdl	� 1   � ��%
�% 
ascr	� 	�	�	� r   � �	�	�	� e   � �	�	� n   � �	�	�	� 4   � ��$	�
�$ 
citm	� m   � ��#�# 	� o   � ��"�" 0 s  	� o      �!�! 0 t  	� 	�	�	� r   � �	�	�	� m   � �	�	� �	�	� 
 < / h 1 >	� n     	�	�	� 1   � �� 
�  
txdl	� 1   � ��
� 
ascr	� 	�	�	� r   � �	�	�	� n  � �	�	�	� I   � ��	��� H0 "removesurroundingspacesandnewlines "removeSurroundingSpacesAndNewlines	� 	��	� e   � �	�	� n   � �	�	�	� 4   � ��	�
� 
citm	� m   � ��� 	� o   � ��� 0 t  �  �  	�  f   � �	� o      �� 0 thetitle theTitle	� 	�
 	� l  � ��

�  
   the authors   
 �

    t h e   a u t h o r s
  


 r   � �


 m   � �

 �
	
	 | < d i v   c l a s s = " a u t h o r s " > < s p a n   c l a s s = " d e s c r i p t o r " > A u t h o r s : < / s p a n > 

 n     




 1   � ��
� 
txdl
 1   � ��
� 
ascr
 


 r   � �


 e   � �

 n   � �


 4   � ��

� 
citm
 m   � ��� 
 o   � ��� 0 t  
 o      �� 0 a  
 


 r   �


 m   � �

 �

  < / d i v >
 n     


 1   �
� 
txdl
 1   � �
� 
ascr
 


 r  


 n 
 
!
  I  �
"�� H0 "removesurroundingspacesandnewlines "removeSurroundingSpacesAndNewlines
" 
#�
# e  
$
$ n  
%
&
% 4  �
'
� 
citm
' m  �
�
 
& o  �	�	 0 a  �  �  
!  f  
 o      �� 0 a  
 
(
)
( l �
*
+�  
* , & each author name is between <a> tags    
+ �
,
, L   e a c h   a u t h o r   n a m e   i s   b e t w e e n   < a >   t a g s  
) 
-
.
- r   
/
0
/ m  
1
1 �
2
2  < / a >
0 n     
3
4
3 1  �
� 
txdl
4 1  �
� 
ascr
. 
5
6
5 r  !)
7
8
7 e  !'
9
9 n  !'
:
;
: 2 "&�
� 
citm
; o  !"�� 0 a  
8 o      �� 0 a  
6 
<
=
< r  *5
>
?
> m  *-
@
@ �
A
A  >
? n     
B
C
B 1  04�
� 
txdl
C 1  -0� 
�  
ascr
= 
D
E
D r  6:
F
G
F J  68����  
G o      ���� 0 
theauthors 
theAuthors
E 
H
I
H Y  ;_
J��
K
L��
J r  KZ
M
N
M l 	KW
O����
O l KW
P����
P e  KW
Q
Q n  KW
R
S
R 4  QV��
T
�� 
citm
T m  TU���� 
S n  KQ
U
V
U 4  LQ��
W
�� 
cobj
W o  OP���� 0 i  
V o  KL���� 0 a  ��  ��  ��  ��  
N n      
X
Y
X  ;  XY
Y o  WX���� 0 
theauthors 
theAuthors�� 0 i  
K m  >?���� 
L \  ?F
Z
[
Z l ?D
\����
\ e  ?D
]
] I ?D��
^��
�� .corecnte****       ****
^ o  ?@���� 0 a  ��  ��  ��  
[ m  DE���� ��  
I 
_
`
_ l ``��
a
b��  
a   put them together   
b �
c
c $   p u t   t h e m   t o g e t h e r
` 
d
e
d r  `k
f
g
f m  `c
h
h �
i
i 
   a n d  
g n     
j
k
j 1  fj��
�� 
txdl
k 1  cf��
�� 
ascr
e 
l
m
l r  ls
n
o
n c  lq
p
q
p o  lm���� 0 
theauthors 
theAuthors
q m  mp��
�� 
TEXT
o o      ���� 0 
theauthors 
theAuthors
m 
r
s
r l tt��
t
u��  
t   the Journal   
u �
v
v    t h e   J o u r n a l
s 
w
x
w r  t
y
z
y m  tw
{
{ �
|
| | < d i v   c l a s s = " j o u r n a l " > < s p a n   c l a s s = " d e s c r i p t o r " > J o u r n a l : < / s p a n > 

z n     
}
~
} 1  z~��
�� 
txdl
~ 1  wz��
�� 
ascr
x 

�
 Z  �H
�
���
�
� ?  ��
�
�
� l ��
�����
� I ����
���
�� .corecnte****       ****
� n  ��
�
�
� 2 ����
�� 
citm
� o  ������ 0 t  ��  ��  ��  
� m  ������ 
� k  �
�
� 
�
�
� l ����
�
���  
�   there is a Journal field   
� �
�
� 2   t h e r e   i s   a   J o u r n a l   f i e l d
� 
�
�
� r  ��
�
�
� n ��
�
�
� I  ����
����� H0 "removesurroundingspacesandnewlines "removeSurroundingSpacesAndNewlines
� 
���
� e  ��
�
� n  ��
�
�
� 4  ����
�
�� 
citm
� m  ������ 
� o  ������ 0 t  ��  ��  
�  f  ��
� o      ���� 0 j  
� 
�
�
� r  ��
�
�
� m  ��
�
� �
�
�  < b r   / >
� n     
�
�
� 1  ����
�� 
txdl
� 1  ����
�� 
ascr
� 
�
�
� r  ��
�
�
� e  ��
�
� n  ��
�
�
� 4  ����
�
�� 
citm
� m  ������ 
� o  ������ 0 j  
� o      ���� 0 j  
� 
�
�
� l ����
�
���  
� F @ split in separate fields, expects "Journal Volume (Year) Pages"   
� �
�
� �   s p l i t   i n   s e p a r a t e   f i e l d s ,   e x p e c t s   " J o u r n a l   V o l u m e   ( Y e a r )   P a g e s "
� 
�
�
� l ����
�
���  
�   is there a better way?   
� �
�
� .   i s   t h e r e   a   b e t t e r   w a y ?
� 
�
�
� r  ��
�
�
� m  ��
�
� �
�
�   
� n     
�
�
� 1  ����
�� 
txdl
� 1  ����
�� 
ascr
� 
�
�
� r  ��
�
�
� e  ��
�
� n  ��
�
�
� 4  ����
�
�� 
citm
� m  ��������
� o  ������ 0 j  
� o      ���� 0 thepages thePages
� 
�
�
� r  ��
�
�
� e  ��
�
� n  ��
�
�
� 7 ����
�
�
�� 
ctxt
� m  ������ 
� m  ��������
� l ��
�����
� n  ��
�
�
� 4  ����
�
�� 
citm
� m  ��������
� o  ������ 0 j  ��  ��  
� o      ���� 0 theyear theYear
� 
�
�
� r  ��
�
�
� e  ��
�
� n  ��
�
�
� 4  ����
�
�� 
citm
� m  ��������
� o  ������ 0 j  
� o      ���� 0 	thevolume 	theVolume
� 
���
� r  �
�
�
� c  �
�
�
� l ��
�����
� e  ��
�
� n  ��
�
�
� 7 ����
�
�
�� 
citm
� m  ������ 
� m  ��������
� o  ������ 0 j  ��  ��  
� m  ���
�� 
TEXT
� o      ���� 0 
thejournal 
theJournal��  ��  
� k  H
�
� 
�
�
� l ��
�
���  
�   no Journal found   
� �
�
� "   n o   J o u r n a l   f o u n d
� 
�
�
� r  
�
�
� m  
�
� �
�
�  
� o      ���� 0 thepages thePages
� 
�
�
� r  
�
�
� m  
�
� �
�
�  
� o      ���� 0 	thevolume 	theVolume
� 
�
�
� r  
�
�
� m  
�
� �
�
�  
� o      ���� 0 
thejournal 
theJournal
� 
�
�
� r  *   e  ( n  ( 7 '��
�� 
ctxt m  !#����  m  $&����  o  ���� 0 	thenumber 	theNumber o      ���� 0 theyear theYear
� �� Z  +H	��
 A  +4 c  +0 o  +,���� 0 theyear theYear m  ,/��
�� 
long m  03���� Z	 r  7> b  7< m  7: �  2 0 o  :;���� 0 theyear theYear o      ���� 0 theyear theYear��  
 r  AH b  AF m  AD �  1 9 o  DE���� 0 theyear theYear o      ���� 0 theyear theYear��  
� �� l II��������  ��  ��  ��  	� R      ������
�� .ascrerr ****      � ****��  ��  	� R  Rd��
�� .ascrerr ****      � **** b  Zc b  Z_ !  m  Z]"" �## J F a i l e d   t o   f i n d   b i b l i o g r a p h y   i n f o   f o r  ! o  ]^���� 0 	theeprint 	theEprint m  _b$$ �%%  . ��&��
�� 
errn& m  VY�������  	�   bibTeX string   	� �''    b i b T e X   s t r i n g	� ()( l ee��������  ��  ��  ) *+* l eC,-., Q  eC/01/ k  h)22 343 l hh��56��  5 &   now put everything into BibDesk   6 �77 @   n o w   p u t   e v e r y t h i n g   i n t o   B i b D e s k4 898 l h':;<: O  h'=>= O  s&?@? k  w%AA BCB l ww��DE��  D C = only change the relevant fields, this adds them if not there   E �FF z   o n l y   c h a n g e   t h e   r e l e v a n t   f i e l d s ,   t h i s   a d d s   t h e m   i f   n o t   t h e r eC GHG r  w�IJI o  wx���� 0 
theauthors 
theAuthorsJ n      KLK 1  ����
�� 
fldvL 4  x���M
�� 
bfldM m  |NN �OO  A u t h o rH PQP r  ��RSR o  ������ 0 thetitle theTitleS n      TUT 1  ����
�� 
fldvU 4  ����V
�� 
bfldV m  ��WW �XX 
 T i t l eQ YZY r  ��[\[ o  ������ 0 
thejournal 
theJournal\ n      ]^] 1  ����
�� 
fldv^ 4  ����_
�� 
bfld_ m  ��`` �aa  J o u r n a lZ bcb r  ��ded o  ������ 0 	thevolume 	theVolumee n      fgf 1  ����
�� 
fldvg 4  ���h
� 
bfldh m  ��ii �jj  V o l u m ec klk r  ��mnm o  ���~�~ 0 thepages thePagesn n      opo 1  ���}
�} 
fldvp 4  ���|q
�| 
bfldq m  ��rr �ss 
 P a g e sl tut r  ��vwv o  ���{�{ 0 theyear theYearw n      xyx 1  ���z
�z 
fldvy 4  ���yz
�y 
bfldz m  ��{{ �||  Y e a ru }~} r  ��� o  ���x�x 0 	theeprint 	theEprint� n      ��� 1  ���w
�w 
fldv� 4  ���v�
�v 
bfld� m  ���� ���  E p r i n t~ ��� n ����� I  ���u��t�u 0 linkurl linkURL� ���  g  ��� ��s� o  ���r�r 0 theurl theURL�s  �t  �  f  ��� ��� l ���q���q  �   capitalize the title?   � ��� ,   c a p i t a l i z e   t h e   t i t l e ?� ��� Z  ����p�o� F  ����� o  ���n�n "0 capitalizetitle capitalizeTitle� =  ����� n  ����� 1  ���m
�m 
pcls� o  ���l�l 0 capitalizelib capitalizeLib� m  ���k
�k 
scpt� r   ��� n  
��� I  
�j��i�j 0 
capitalize  � ��h� o  �g�g 0 thetitle theTitle�h  �i  � l 	 ��f�e� o   �d�d 0 capitalizelib capitalizeLib�f  �e  � n      ��� 1  �c
�c 
fldv� 4  
�b�
�b 
bfld� m  �� ��� 
 T i t l e�p  �o  � ��� l �a���a  �   set the cite key   � ��� "   s e t   t h e   c i t e   k e y� ��� r  #��� o  �`�` 0 	theeprint 	theEprint� 1  "�_
�_ 
ckey� ��^� l $$�]�\�[�]  �\  �[  �^  @ o  st�Z�Z 0 thepub thePub> n  hp��� 4  kp�Y�
�Y 
docu� m  no�X�X � m  hk���                                                                                  BDSK   alis    �  Macintosh HD               ũ��H+   CsBibDesk.app                                                     �}Ǝd        ����  	                Debug     ũ��      Ǝ D     Cs � XR 
��  |S  EMacintosh HD:Users:hofman:Development:BuildProducts:Debug:BibDesk.app     B i b D e s k . a p p    M a c i n t o s h   H D  8Users/hofman/Development/BuildProducts/Debug/BibDesk.app  /    ��  ;   doc 1 of Bibdesk   < ��� "   d o c   1   o f   B i b d e s k9 ��W� l ((�V�U�T�V  �U  �T  �W  0 R      �S�R�Q
�S .ascrerr ****      � ****�R  �Q  1 R  1C�P��
�P .ascrerr ****      � ****� b  9B��� b  9>��� m  9<�� ��� B F a i l e d   t o   c h a n g e   B i b T e X   i n f o   f o r  � o  <=�O�O 0 	theeprint 	theEprint� m  >A�� ���  .� �N��M
�N 
errn� m  58�L�L��M  -   BibDesk   . ���    B i b D e s k+ ��K� l DD�J�I�H�J  �I  �H  �K  	/ ��� l     �G�F�E�G  �F  �E  � ��� i  ����� I      �D��C�D $0 downloadabstract downloadAbstract� ��� o      �B�B 0 thepub thePub� ��� o      �A�A 0 
thearchive 
theArchive� ��@� o      �?�? 0 	thenumber 	theNumber�@  �C  � k     ��� ��� l     �>�=�<�>  �=  �<  � ��� Z     ���;�� =     ��� o     �:�: 0 
thearchive 
theArchive� m    �� ���  � r    	��� o    �9�9 0 	thenumber 	theNumber� o      �8�8 0 	theeprint 	theEprint�;  � r    ��� b    ��� b    ��� o    �7�7 0 
thearchive 
theArchive� m    �� ���  /� o    �6�6 0 	thenumber 	theNumber� o      �5�5 0 	theeprint 	theEprint� ��� r     ��� b    ��� n   ��� I    �4��3�4 0 arxivurl arxivURL� ��2� n   ��� o    �1�1 0 arxivabs arxivAbs�  f    �2  �3  �  f    � o    �0�0 0 	theeprint 	theEprint� o      �/�/ 0 theurl theURL� ��� l  ! !�.�-�,�.  �-  �,  � ��� l  ! ����� Q   ! ����� k   $ q�� � � l  $ $�+�+   #  download the abstract string    � :   d o w n l o a d   t h e   a b s t r a c t   s t r i n g   I  $ -�*�)
�* .sysoexecTEXT���     TEXT b   $ ) b   $ '	
	 m   $ % �  c u r l   "
 o   % &�(�( 0 theurl theURL m   ' ( � � "   |   s e d   - e   ' / < b l o c k q u o t e   c l a s s = " a b s t r a c t " > / , / < \ / b l o c k q u o t e > / ! d '   - e   ' / < b l o c k q u o t e   c l a s s = " a b s t r a c t " > / d '   - e   ' / < \ / b l o c k q u o t e > / d '�)    r   . 1 l  . /�'�& 1   . /�%
�% 
rslt�'  �&   o      �$�$ 0 theabstract theAbstract  Z  2 @�#�" =   2 5 o   2 3�!�! 0 theabstract theAbstract m   3 4 �   R   8 <� ��
�  .ascrerr ****      � ****�  �  �#  �"    l  A A����  �  �    r   A F !  m   A B"" �##  < / s p a n >! n     $%$ 1   C E�
� 
txdl% 1   B C�
� 
ascr &'& Z   G f()��( l  G P*��* ?   G P+,+ l  G N-��- I  G N�.�
� .corecnte****       ****. n   G J/0/ 2  H J�
� 
citm0 o   G H�� 0 theabstract theAbstract�  �  �  , m   N O�� �  �  ) r   S b121 l  S `3��3 c   S `454 n   S ^676 7  T ^�89
� 
citm8 m   X Z�
�
 9 m   [ ]�	�	��7 o   S T�� 0 theabstract theAbstract5 m   ^ _�
� 
TEXT�  �  2 o      �� 0 theabstract theAbstract�  �  ' :;: l  g g����  �  �  ; <=< r   g o>?> n  g m@A@ I   h m�B�� H0 "removesurroundingspacesandnewlines "removeSurroundingSpacesAndNewlinesB C� C o   h i���� 0 theabstract theAbstract�   �  A  f   g h? o      ���� 0 theabstract theAbstract= D��D l  p p��������  ��  ��  ��  � R      ������
�� .ascrerr ****      � ****��  ��  � R   y ���EF
�� .ascrerr ****      � ****E b   � �GHG b   � �IJI b   � �KLK b   � �MNM m   � �OO �PP @ F a i l e d   t o   d o w n l o a d   a b s t r a c t   f o r  N o   � ����� 0 	theeprint 	theEprintL m   � �QQ �RR    u s i n g   m i r r o r  J o   � ����� 0 theurl theURLH m   � �SS �TT  .F ��U��
�� 
errnU m   } ��������  �   BibDesk   � �VV    B i b D e s k� WXW l  � ���������  ��  ��  X YZY l  � �[\][ Q   � �^_`^ k   � �aa bcb l  � ���de��  d   now put it into BibDesk   e �ff 0   n o w   p u t   i t   i n t o   B i b D e s kc ghg O  � �iji l 	 � �k����k r   � �lml o   � ����� 0 theabstract theAbstractm n      non 1   � ���
�� 
absto o   � ����� 0 thepub thePub��  ��  j n   � �pqp 4   � ���r
�� 
docur m   � ����� q m   � �ss�                                                                                  BDSK   alis    �  Macintosh HD               ũ��H+   CsBibDesk.app                                                     �}Ǝd        ����  	                Debug     ũ��      Ǝ D     Cs � XR 
��  |S  EMacintosh HD:Users:hofman:Development:BuildProducts:Debug:BibDesk.app     B i b D e s k . a p p    M a c i n t o s h   H D  8Users/hofman/Development/BuildProducts/Debug/BibDesk.app  /    ��  h t��t l  � ���������  ��  ��  ��  _ R      ��u��
�� .ascrerr ****      � ****u o      ���� 0 errormessage errorMessage��  ` R   � ���vw
�� .ascrerr ****      � ****v b   � �xyx b   � �z{z b   � �|}| m   � �~~ � 6 F a i l e d   t o   s e t   a b s t r a c t   f o r  } o   � ����� 0 	theeprint 	theEprint{ m   � ��� ���  .y o   � ����� 0 errormessage errorMessagew �����
�� 
errn� m   � ��������  \ 
  set   ] ���    s e tZ ���� l  � ���������  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� i  ����� I      ������� 0 downloadpdf downloadPDF� ��� o      ���� 0 thepub thePub� ��� o      ���� 0 
thearchive 
theArchive� ���� o      ���� 0 	thenumber 	theNumber��  ��  � k    V�� ��� l     ��������  ��  ��  � ��� Q     ����� k    ��� ��� O   ��� r    ��� 1    
��
�� 
pfol� o      ���� "0 thepapersfolder thePapersFolder� m    ���                                                                                  BDSK   alis    �  Macintosh HD               ũ��H+   CsBibDesk.app                                                     �}Ǝd        ����  	                Debug     ũ��      Ǝ D     Cs � XR 
��  |S  EMacintosh HD:Users:hofman:Development:BuildProducts:Debug:BibDesk.app     B i b D e s k . a p p    M a c i n t o s h   H D  8Users/hofman/Development/BuildProducts/Debug/BibDesk.app  /    ��  � ��� Z    5������ =    ��� o    ���� 0 
thearchive 
theArchive� m    �� ���  � k    �� ��� r    ��� o    ���� 0 	thenumber 	theNumber� o      ���� 0 	theeprint 	theEprint� ���� r    ��� b    ��� o    ���� 0 	thenumber 	theNumber� m    �� ���  . p d f� o      ���� 0 thefilename theFileName��  ��  � k     5�� ��� r     '��� b     %��� b     #��� o     !���� 0 
thearchive 
theArchive� m   ! "�� ���  /� o   # $���� 0 	thenumber 	theNumber� o      ���� 0 	theeprint 	theEprint� ���� r   ( 5��� b   ( 3��� b   ( 1��� b   ( /��� o   ( )���� 0 
thearchive 
theArchive� o   ) .���� 0 	separator  � o   / 0���� 0 	thenumber 	theNumber� m   1 2�� ���  . p d f� o      ���� 0 thefilename theFileName��  � ��� r   6 A��� e   6 ?�� 4   6 ?���
�� 
psxf� l  8 =������ b   8 =��� b   8 ;��� o   8 9���� "0 thepapersfolder thePapersFolder� m   9 :�� ���  /� o   ; <���� 0 thefilename theFileName��  ��  � o      ���� 0 thepath thePath� ��� r   B P��� e   B N�� b   B N��� I   B L������� 0 arxivurl arxivURL� ���� o   C H���� 0 arxivpdf arxivPdf��  ��  � o   L M���� 0 	theeprint 	theEprint� o      ���� 0 theurl theURL� ��� r   Q X��� e   Q V�� 4   Q V���
�� 
psxf� o   S T���� "0 thepapersfolder thePapersFolder� o      ���� 0 	thefolder 	theFolder� ���� Z   Y �������� F   Y h��� >   Y \��� o   Y Z���� 0 
thearchive 
theArchive� m   Z [�� ���  � =   _ f��� o   _ d���� 0 	separator  � m   d e�� ���  /� k   k ��� ��� l  k k������  � &   create a subfolder if necessary   � ��� @   c r e a t e   a   s u b f o l d e r   i f   n e c e s s a r y� ��� O   k ���� k   o ���    Z  o ����� H   o x l  o w���� I  o w����
�� .coredoexbool        obj  n   o s 4   p s��	
�� 
cfol	 o   q r���� 0 
thearchive 
theArchive o   o p���� 0 	thefolder 	theFolder��  ��  ��   l 	 { �
����
 I  { �����
�� .corecrel****      � null��   ��
�� 
kocl m   } ~��
�� 
cfol ��
�� 
prdt K   � � ����
�� 
pnam o   � ����� 0 
thearchive 
theArchive��   ����
�� 
insh n   � �  ;   � � n   � � 2  � ���
�� 
cfol o   � ����� 0 	thefolder 	theFolder��  ��  ��  ��  ��   �� r   � � n   � � 4   � ���
�� 
cfol o   � ����� 0 
thearchive 
theArchive o   � ����� 0 	thefolder 	theFolder o      ���� 0 	thefolder 	theFolder��  � m   k l�                                                                                  sevs   alis    �  Macintosh HD               ũ��H+     uSystem Events.app                                                �y�f�W        ����  	                CoreServices    ũ��      �f�7       u   1   0  :Macintosh HD:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � �� r   � �  b   � �!"! o   � ����� 0 	thenumber 	theNumber" m   � �## �$$  . p d f  o      ���� 0 thefilename theFileName��  ��  ��  ��  � R      ������
�� .ascrerr ****      � ****��  ��  � R   � ���%&
�� .ascrerr ****      � ****% b   � �'(' b   � �)*) m   � �++ �,, L F a i l e d   t o   g e t   v a l i d   P D F   f i l e   p a t h   f o r  * o   � ��� 0 	theeprint 	theEprint( m   � �-- �..  .& �~/�}
�~ 
errn/ m   � ��|�|��}  � 010 l  � ��{�z�y�{  �z  �y  1 232 Q   �4564 k   ��77 898 r   � �:;: b   � �<=< l  � �>�x�w> e   � �?? I  � ��v@A
�v .earsffdralis        afdr@ m   � ��u
�u afdrtempA �tB�s
�t 
rtypB m   � ��r
�r 
TEXT�s  �x  �w  = o   � ��q�q 0 thefilename theFileName; o      �p�p 0 tmppath tmpPath9 CDC l  � ��o�n�m�o  �n  �m  D EFE l  � ��lGH�l  G   download the PDF file   H �II ,   d o w n l o a d   t h e   P D F   f i l eF JKJ T   ��LL k   ��MM NON O  � �PQP l 	 � �R�k�jR r   � �STS I  � ��iUV
�i .aevtdwnlfss ���     TEXTU o   � ��h�h 0 theurl theURLV �gWX
�g 
fdstW o   � ��f�f 0 tmppath tmpPathX �eY�d
�e 
rplcY m   � ��c
�c erplyes �d  T o      �b�b 0 tmpfile tmpFile�k  �j  Q m   � �ZZ                                                                                  uasc   alis    �  Macintosh HD               ũ��H+    a#URL Access Scripting.app                                         �\�f�S        ����  	                ScriptingAdditions    ũ��      �f�3      a#   1   0  GMacintosh HD:System:Library:ScriptingAdditions:URL Access Scripting.app   2  U R L   A c c e s s   S c r i p t i n g . a p p    M a c i n t o s h   H D  :System/Library/ScriptingAdditions/URL Access Scripting.app  / ��  O [\[ l  � ��a]^�a  ] !  see if we got the PDF file   ^ �__ 6   s e e   i f   w e   g o t   t h e   P D F   f i l e\ `a` I  ��`b�_
�` .rdwropenshor       fileb o   � ��^�^ 0 tmpfile tmpFile�_  a cdc r  efe c  ghg l i�]�\i I �[j�Z
�[ .rdwrread****        ****j o  �Y�Y 0 tmpfile tmpFile�Z  �]  �\  h m  
�X
�X 
TEXTf o      �W�W 0 s  d klk I �Vm�U
�V .rdwrclosnull���     ****m o  �T�T 0 tmpfile tmpFile�U  l non Z  �pq�Srp C  sts o  �R�R 0 s  t m  uu �vv  % P D Fq k  ww xyx l �Qz{�Q  z   we got a PDF file   { �|| $   w e   g o t   a   P D F   f i l ey }�P}  S  �P  �S  r k   �~~ � l   �O���O  � "  see if we got a "wait" file   � ��� 8   s e e   i f   w e   g o t   a   " w a i t "   f i l e� ��� r   +��� m   #�� ��� H < m e t a   h t t p - e q u i v = " r e f r e s h "   c o n t e n t = "� n     ��� 1  &*�N
�N 
txdl� 1  #&�M
�M 
ascr� ��� l ,,�L���L  � ' ! this gives an error if it is not   � ��� B   t h i s   g i v e s   a n   e r r o r   i f   i t   i s   n o t� ��� r  ,5��� e  ,3�� n  ,3��� 4  -2�K�
�K 
citm� m  01�J�J � o  ,-�I�I 0 s  � o      �H�H 0 t  � ��� r  6A��� m  69�� ���  "   / >� n     ��� 1  <@�G
�G 
txdl� 1  9<�F
�F 
ascr� ��� r  BO��� c  BM��� l BI��E�D� e  BI�� n  BI��� 4  CH�C�
�C 
citm� m  FG�B�B � o  BC�A�A 0 t  �E  �D  � m  IL�@
�@ 
long� o      �?�? 0 t  � ��� l PP�>���>  � * $ wait the recommended amount of time   � ��� H   w a i t   t h e   r e c o m m e n d e d   a m o u n t   o f   t i m e� ��� r  PW��� I PU�=�<�;
�= .misccurdldt    ��� null�<  �;  � o      �:�: 0 	starttime 	startTime� ��� I Xt�9��
�9 .sysodlogaskr        TEXT� m  X[�� ��� B C r e a t i n g   P D F   f i l e .   P l e a s e   w a i t . . .� �8��
�8 
btns� J  ^f�� ��� m  ^a�� ���  C a n c e l� ��7� m  ad�� ���  O K�7  � �6��
�6 
dflt� m  ij�5�5 � �4��3
�4 
givu� o  mn�2�2 0 t  �3  � ��1� I u��0��/
�0 .sysodelanull��� ��� long� \  u~��� o  uv�.�. 0 t  � l v}��-�,� \  v}��� l v{��+�*� I v{�)�(�'
�) .misccurdldt    ��� null�(  �'  �+  �*  � o  {|�&�& 0 	starttime 	startTime�-  �,  �/  �1  o ��%� l ���$�#�"�$  �#  �"  �%  K ��� l ���!� ��!  �   �  � ��� l ������  � 4 . move the downloaded file to the papers folder   � ��� \   m o v e   t h e   d o w n l o a d e d   f i l e   t o   t h e   p a p e r s   f o l d e r� ��� O  ����� k  ���� ��� r  ����� l ������ e  ���� n  ����� 1  ���
� 
pnam� o  ���� 0 tmpfile tmpFile�  �  � o      �� 0 tmpname tmpName� ��� Z ������� l ������ I �����
� .coredoexbool        obj � n  ����� 4  ����
� 
ditm� o  ���� 0 tmpname tmpName� o  ���� 0 	thefolder 	theFolder�  �  �  � I �����
� .coredelonull���     obj � l ������ e  ���� n  ����� 4  ����
� 
ditm� o  ���
�
 0 tmpname tmpName� o  ���	�	 0 	thefolder 	theFolder�  �  �  �  �  � ��� r  ����� I �����
� .coremoveditm       ditm� o  ���� 0 tmpfile tmpFile� ���
� 
insh� n  �����  ;  ��� n  ����� 2 ���
� 
file� o  ���� 0 	thefolder 	theFolder�  � o      �� 0 thefile theFile�  � m  �����                                                                                  sevs   alis    �  Macintosh HD               ũ��H+     uSystem Events.app                                                �y�f�W        ����  	                CoreServices    ũ��      �f�7       u   1   0  :Macintosh HD:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � �� � l ����������  ��  ��  �   5 R      �� 
�� .ascrerr ****      � ****  o      ���� 0 errormessage errorMessage ����
�� 
errn o      ���� 0 errornumber errorNumber��  6 k  �  l ������   6 0 we got neither PDF nor a wait file, so clean up    � `   w e   g o t   n e i t h e r   P D F   n o r   a   w a i t   f i l e ,   s o   c l e a n   u p 	
	 Q  ���� O �� I ������
�� .coredelonull���     obj  o  ������ 0 tmpfile tmpFile��   m  ���                                                                                  sevs   alis    �  Macintosh HD               ũ��H+     uSystem Events.app                                                �y�f�W        ����  	                CoreServices    ũ��      �f�7       u   1   0  :Macintosh HD:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   R      ������
�� .ascrerr ****      � ****��  ��  ��  
 �� Z  ��� =  �� o  ������ 0 errornumber errorNumber m  �������� R  ����
�� .ascrerr ****      � **** o  ������ 0 errormessage errorMessage ����
�� 
errn m  ����������  ��   R  ���
�� .ascrerr ****      � **** b   b   m  
   �!! @ F a i l e d   t o   d o w n l o a d   P D F   f i l e   f o r   o  
���� 0 	theeprint 	theEprint m  "" �##  . ��$��
�� 
errn$ m  �������  ��  3 %&% l ��������  ��  ��  & '(' Q  T)*+) k  :,, -.- l ��/0��  /   add a linked file   0 �11 $   a d d   a   l i n k e d   f i l e. 2��2 O  :343 O  9565 k  877 898 l ��:;��  : M G if you want to replace existing linked files, uncomment the next line    ; �<< �   i f   y o u   w a n t   t o   r e p l a c e   e x i s t i n g   l i n k e d   f i l e s ,   u n c o m m e n t   t h e   n e x t   l i n e  9 =>= l ��?@��  ?   delete linked files   @ �AA (   d e l e t e   l i n k e d   f i l e s> BCB I 0����D
�� .corecrel****      � null��  D ��EF
�� 
koclE m  "��
�� 
FileF ��G��
�� 
dataG l %*H����H c  %*IJI o  %&���� 0 thefile theFileJ m  &)��
�� 
alis��  ��  ��  C K��K n 18LML I  28��N���� 0 linkfile linkFileN OPO  g  23P Q��Q o  34���� 0 thefile theFile��  ��  M  f  12��  6 o  ���� 0 thepub thePub4 m  RR�                                                                                  BDSK   alis    �  Macintosh HD               ũ��H+   CsBibDesk.app                                                     �}Ǝd        ����  	                Debug     ũ��      Ǝ D     Cs � XR 
��  |S  EMacintosh HD:Users:hofman:Development:BuildProducts:Debug:BibDesk.app     B i b D e s k . a p p    M a c i n t o s h   H D  8Users/hofman/Development/BuildProducts/Debug/BibDesk.app  /    ��  ��  * R      ������
�� .ascrerr ****      � ****��  ��  + R  BT��ST
�� .ascrerr ****      � ****S b  JSUVU b  JOWXW m  JMYY �ZZ 0 F a i l e d   t o   l i n k   f i l e   f o r  X o  MN���� 0 	theeprint 	theEprintV m  OR[[ �\\  .T ��]��
�� 
errn] m  FI�������  ( ^_^ l UU��������  ��  ��  _ `��` l UU��������  ��  ��  ��  � aba l     ��������  ��  ��  b cdc i  ��efe I      ��g���� 0 arxivurl arxivURLg h��h o      ���� 0 thepage thePage��  ��  f k     Mii jkj r     lml b     non b     pqp m     rr �ss  h t t p : / /q l   t����t n    uvu 4    ��w
�� 
cobjw o    ���� (0 arxivmirrorcounter arxivMirrorCounterv o    ���� 0 arxivmirrors arxivMirrors��  ��  o o    ���� 0 thepage thePagem o      ���� 0 theurl theURLk xyx Z    Jz{����z o    ���� (0 rotatearxivmirrors rotateArxivMirrors{ k    F|| }~} r    (� [    "��� o     ���� (0 arxivmirrorcounter arxivMirrorCounter� m     !���� � o      ���� (0 arxivmirrorcounter arxivMirrorCounter~ ���� Z  ) F������� ?   ) 8��� o   ) .���� (0 arxivmirrorcounter arxivMirrorCounter� l  . 7������ I  . 7�����
�� .corecnte****       ****� o   . 3���� 0 arxivmirrors arxivMirrors��  ��  ��  � l 	 ; B������ r   ; B��� m   ; <���� � o      ���� (0 arxivmirrorcounter arxivMirrorCounter��  ��  ��  ��  ��  ��  ��  y ���� L   K M�� o   K L���� 0 theurl theURL��  d ��� l     ��������  ��  ��  � ��� i  ����� I      ������� H0 "removesurroundingspacesandnewlines "removeSurroundingSpacesAndNewlines� ���� o      ���� 0 	thestring 	theString��  ��  � k     ~�� ��� r     ��� n     ��� 1    ��
�� 
leng� o     ���� 0 	thestring 	theString� o      ���� 0 l  � ��� V    @��� k    ;�� ��� Z    5������ ?    ��� o    ���� 0 l  � m    ���� � r   " /��� n   " -��� 7  # -����
�� 
ctxt� m   ' )���� � m   * ,������� o   " #���� 0 	thestring 	theString� o      ���� 0 	thestring 	theString��  � r   2 5��� m   2 3�� ���  � o      ���� 0 	thestring 	theString� ���� r   6 ;��� \   6 9��� o   6 7���� 0 l  � m   7 8���� � o      ���� 0 l  ��  � F   
 ��� ?   
 ��� o   
 ���� 0 l  � m    ����  � E   ��� J    �� ��� 1    �
� 
spac� ��~� o    �}
�} 
ret �~  � l   ��|�{� n    ��� 4    �z�
�z 
cha � m    �y�y � o    �x�x 0 	thestring 	theString�|  �{  � ��� V   A {��� k   W v�� ��� Z   W p���w�� ?   W Z��� o   W X�v�v 0 l  � m   X Y�u�u � r   ] j��� n   ] h��� 7  ^ h�t��
�t 
ctxt� m   b d�s�s � m   e g�r�r��� o   ] ^�q�q 0 	thestring 	theString� o      �p�p 0 	thestring 	theString�w  � r   m p��� m   m n�� ���  � o      �o�o 0 	thestring 	theString� ��n� r   q v��� \   q t��� o   q r�m�m 0 l  � m   r s�l�l � o      �k�k 0 l  �n  � F   E V��� ?   E H��� o   E F�j�j 0 l  � m   F G�i�i  � E  K T��� J   K O�� ��� 1   K L�h
�h 
spac� ��g� o   L M�f
�f 
ret �g  � l  O S��e�d� n   O S��� 4   P S�c�
�c 
cha � m   Q R�b�b��� o   O P�a�a 0 	thestring 	theString�e  �d  � ��`� L   | ~�� o   | }�_�_ 0 	thestring 	theString�`  � ��� l     �^�]�\�^  �]  �\  � ��� i  ����� I      �[��Z�[ 0 linkfile linkFile� ��� o      �Y�Y 0 thepub thePub� ��X� o      �W�W 0 thefile theFile�X  �Z  � k     .�� ��� r     � � n      1    �V
�V 
psxp o     �U�U 0 thefile theFile  o      �T�T 0 thepath thePath� �S O    . O   
 - k    , 	
	 l   �R�R   P J if you want to replace all existing linked files, uncomment the next line    � �   i f   y o u   w a n t   t o   r e p l a c e   a l l   e x i s t i n g   l i n k e d   f i l e s ,   u n c o m m e n t   t h e   n e x t   l i n e
  l   �Q�Q     delete linked files    � (   d e l e t e   l i n k e d   f i l e s �P Z   ,�O�N H     E    l   �M�L e     n     1    �K
�K 
psxp 2   �J
�J 
File�M  �L   o    �I�I 0 thepath thePath l 	  (�H�G I   (�F�E
�F .corecrel****      � null�E   �D 
�D 
kocl m    �C
�C 
File  �B!"
�B 
data! o    �A�A 0 thefile theFile" �@#�?
�@ 
insh# n     $$%$  :   # $% 2    #�>
�> 
File�?  �H  �G  �O  �N  �P   o   
 �=�= 0 thepub thePub m    &&�                                                                                  BDSK   alis    �  Macintosh HD               ũ��H+   CsBibDesk.app                                                     �}Ǝd        ����  	                Debug     ũ��      Ǝ D     Cs � XR 
��  |S  EMacintosh HD:Users:hofman:Development:BuildProducts:Debug:BibDesk.app     B i b D e s k . a p p    M a c i n t o s h   H D  8Users/hofman/Development/BuildProducts/Debug/BibDesk.app  /    ��  �S  � '(' l     �<�;�:�<  �;  �:  ( )*) i  ��+,+ I      �9-�8�9 0 linkurl linkURL- ./. o      �7�7 0 thepub thePub/ 0�60 o      �5�5 0 theurl theURL�6  �8  , O     &121 O    %343 k    $55 676 l   �489�4  8 O I if you want to replace all existing linked URLs, uncomment the next line   9 �:: �   i f   y o u   w a n t   t o   r e p l a c e   a l l   e x i s t i n g   l i n k e d   U R L s ,   u n c o m m e n t   t h e   n e x t   l i n e7 ;<; l   �3=>�3  =   delete linked URLs   > �?? &   d e l e t e   l i n k e d   U R L s< @�2@ Z   $AB�1�0A H    CC E   DED l   F�/�.F e    GG 2   �-
�- 
URL �/  �.  E o    �,�, 0 theurl theURLB l 	   H�+�*H I    �)�(I
�) .corecrel****      � null�(  I �'JK
�' 
koclJ m    �&
�& 
URL K �%LM
�% 
dataL o    �$�$ 0 theurl theURLM �#N�"
�# 
inshN n    OPO  :    P 2   �!
�! 
URL �"  �+  �*  �1  �0  �2  4 o    � �  0 thepub thePub2 m     QQ�                                                                                  BDSK   alis    �  Macintosh HD               ũ��H+   CsBibDesk.app                                                     �}Ǝd        ����  	                Debug     ũ��      Ǝ D     Cs � XR 
��  |S  EMacintosh HD:Users:hofman:Development:BuildProducts:Debug:BibDesk.app     B i b D e s k . a p p    M a c i n t o s h   H D  8Users/hofman/Development/BuildProducts/Debug/BibDesk.app  /    ��  * R�R l     ����  �  �  �       �S    T��UVW9>�XYZ[\]^_`abcdef�  S ��������������
�	��������� ��������� 0 	spiresurl 	spiresURL� 0 mathurl mathURL� 0 arxivabs arxivAbs� 0 arxivpdf arxivPdf� 0 arxivmirrors arxivMirrors� (0 rotatearxivmirrors rotateArxivMirrors� (0 arxivmirrorcounter arxivMirrorCounter� 0 arxivarchives arxivArchives�  0 spiresarchives spiresArchives� 0 matharchives mathArchives�  0 defaultarchive defaultArchive� 0 	separator  � "0 capitalizetitle capitalizeTitle�
 0 capitalizelib capitalizeLib�	 60 queryforeprintidentifiers queryForEprintIdentifiers� 0 	pubeprint 	pubEprint� 0 analyzeeprint analyzeEprint� 0 	isinteger 	isInteger�  0 downloadbibtex downloadBibTeX� 40 downloadbibtexfromspires downloadBibTeXFromSpires� 00 downloadbibtexfrommath downloadBibTeXFromMath� $0 downloadarxivabs downloadArxivAbs� $0 downloadabstract downloadAbstract�  0 downloadpdf downloadPDF�� 0 arxivurl arxivURL�� H0 "removesurroundingspacesandnewlines "removeSurroundingSpacesAndNewlines�� 0 linkfile linkFile�� 0 linkurl linkURLT ��g�� g   & * . 2 6 : > B F J N R V Z ^ b f i
� boovfals� U ��h�� �h �  w {  � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �#'+/37;?CGKOSW[_cgkosw{��������������������������������#'+/37;?CGKOSW[_cgkoswzV ��i�� 	i 	 ���������W ��j�� $j $ ����������������������	!%)-14
� boovfalsX �kk � M a c i n t o s h   H D : U s e r s : h o f m a n : L i b r a r y : S c r i p t i n g A d d i t i o n s : C a p i t a l i z e . s c p tY ��S����lm���� 60 queryforeprintidentifiers queryForEprintIdentifiers��  ��  l ������������������ 0 	arxivlist 	arxivList�� 0 done  �� 0 textreturned textReturned�� 0 buttonpressed buttonPressed�� 	0 parts  �� 0 errornumber errorNumber�� 0 arxivid arxivId�� 0 thepub thePubm %k����tx{�������������������������n����������������������������
�� 
dtxt
�� 
btns
�� 
dflt�� 
�� .sysodlogaskr        TEXT
�� 
rslt
�� 
list
�� 
cobj
�� 
ascr
�� 
txdl
�� 
citm
�� 
TEXT��  n ������
�� 
errn�� 0 errornumber errorNumber��  ����
�� .corecnte****       ****
�� 
docu
�� 
kocl
�� 
bibi
�� 
prdt
�� 
type
�� 
ckey�� 
�� 
insh
�� .corecrel****      � null
�� 
bfld
�� 
fldv��
jvE�OfE�O {h� [��b  
����mv�m� O��&E[�k/EQ�Z[�l/EQ�ZO��  eE�Y hO���,FO�a -EE�Oa ��,FO�a &�6FW X  �a   eE�Y h[OY��O�j j  jvY hOa a k/ e L�[a �l kh *a a a a a a �a a  *a -5� !E�O��a "a #/a $,F[OY��O*[a \[Zk\Z�j 2EOPUOPZ ������op���� 0 	pubeprint 	pubEprint�� ��q�� q  ���� 0 apub aPub��  o �������������� 0 apub aPub�� 0 aneprint anEprint�� 0 	localfile 	localFile�� 	0 parts  �� 0 	anarchive 	anArchive�� 0 anumber aNumberp  ��,��3����JQm�������������������������
�� 
bfld
�� 
fldv��  ��  
�� 
File
�� .corecnte****       ****
�� 
psxp
�� 
ascr
�� 
txdl
�� 
citm
�� 
cobj����
�� 
TEXT��o�i ���/�,EE�O�� �Y hW X  hO ���/�,EE�O�� �Y hW X  hO ��b  
/�,EE�O�� �Y hW X  hO ���/�,EE�O�� �Y hW X  hO ɠ�-Ej j ���k/�,E�O��  	a Y hOa _ a ,FO�a -EE�Ob  a   '�[a \[Za \Zi2E[a k/E�Z[a l/E�ZY 8�a i/EE�Ob  _ a ,FO�[a \[Za \52a &E�O�a i/EE�Oa _ a ,FO�a k/EE�O�a %�%Y hW X  hOa OPUOP[ ��(����rs���� 0 analyzeeprint analyzeEprint�� ��t�� t  ���� 0 aneprint anEprint��  r 	�������������������� 0 aneprint anEprint�� 0 	spacechar 	spaceChar�� 	0 parts  �� 0 anumber aNumber�� 0 	anarchive 	anArchive�� 0 l  �� 0 lastday  �� 0 yy  �� 0 mm  s /������������������I��b��������q���������������������������������������|��
�� 
spac
�� 
tab 
�� 
ret 
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
citm
�� 
TEXT
�� 
leng�� 
�� 
ctxt�� 
�� 
bool�� �� 	�� 
�� 
cha ���������� 0 	isinteger 	isInteger����
�� .misccurdldt    ��� null��  Q�
�� 
sun 
�� 
sat 
�� 
wkdy
�� 
year
�� 
mnth
�� 
nmbr�� 
��� 0���mv[��l kh ���,FO��-EE�O���,FO��&E�[OY��Og� 4��,�	 �[�\[Zk\Z�2a  a & �[�\[Za \62EE�Y hVOa ��,FO��-EE�O�j k  �E�Ob  
E�Y ��l/EE�O��k/EE�O�a   b  
E�Y hO��,EE�O�a  �[�\[Zk\Za 2EE�Oa E�Y hO h�a �a �% O�kE�[OY��O�a   �a �% O�� Y hO�a a /a   �a E�O)�[�\[Za \62Ek+ 	 #�� 
 )�[�\[Zk\Za 2Ek+ a &a & ��a  ~*j  a !E�O ha "a #lv�a $,�a !E�[OY��O�a %,�&[�\[Zm\Za 2EE�O�a &,a '&E�O�a ( a )�%E�Y hO��%[�\[Zk\Za �2E�%E�Y hY a *E�Y �)�k+ 	 b  �a & ��a  �[�\[Zk\Za 2EE�Y ��a  �*j  a !E�O ha "a #lv�a $,�a !E�[OY��O�a %,�&[�\[Zm\Za 2EE�O�a &,a '&E�O�a ( a +�%E�Y hO��%a ,%[�\[Zk\Za �2E�%E�Y hY a -E�Oa .E�O��lvOP\ ��&����uv���� 0 	isinteger 	isInteger�� ��w�� w  ���� 0 astring aString��  u ����� 0 astring aString� 0 c  v 5�~�}�|�{BF�z
�~ 
cha 
�} 
kocl
�| 
cobj
�{ .corecnte****       ****
�z 
bool�� <��  fY hO *��-[��l kh ��
 ���& fY h[OY��Oe] �yR�x�wxy�v�y  0 downloadbibtex downloadBibTeX�x �uz�u z  �t�s�r�q�t 0 thepub thePub�s 0 theurl theURL�r 0 
thearchive 
theArchive�q 0 	thenumber 	theNumber�w  x 
�p�o�n�m�l�k�j�i�h�g�p 0 thepub thePub�o 0 theurl theURL�n 0 
thearchive 
theArchive�m 0 	thenumber 	theNumber�l 0 	theeprint 	theEprint�k "0 thebibtexstring theBibTeXString�j 0 newpubs newPubs�i 0 newpub newPub�h 0 	fieldname 	fieldName�g 0 errormessage errorMessagey 8eo�f�e�d�c�b�a�`�_�^�]��\��[�Z�Y���X��W�V��U�T�Seimqux�R�Q�P�O�N��M�L�K��J����I�H�G�F��
�f 
pcls
�e 
list
�d .corecnte****       ****
�c 
bool
�b 
cobj
�a 
TEXT
�` 
scpt
�_ 
alis
�^ .sysoloadscpt        alis
�] 
rslt�\ $0 startprotectchar startProtectChar�[  0 endprotectchar endProtectChar�Z  �Y  
�X .sysoexecTEXT���     TEXT
�W 
errn�V�
�U 
docu
�T 
from
�S .BDSKImptnull���     docu�R 
�Q 
kocl
�P 
pcnt
�O 
bfld
�N 
fldv�M 0 arxivabs arxivAbs�L 0 arxivurl arxivURL�K 0 linkurl linkURL�J 0 
capitalize  
�I 
ckey
�H .coredelonull���     obj �G 0 errormessage errorMessage�F��v;��  �E�Y 	��%�%E�O��,� 	 �j k�& ��k/�&�%��l/%E�Y �� ��&�%E�Y hOb   I =b  �,� b  �&j 
O�Ec  Y hOb   �*�,FO�*�,FUW X  hY hO )a �%a %j O�E�O�a   	)jhY hOPW X  )a a la �%a %O,a a k/*a �l E�O�j j��k/EE�O� � Ua a a  a !a "a #a $v[a %�l kh �a &,E�O �a '�/a (,E*a '�/a (,FW X  h[OY��O�*a 'a )/a (,FO)*))a *,k+ +�%l+ ,Ob  	 b  �,� �& (b  *a 'a -/a (,Ek+ .*a 'a //a (,FY hO �a 'a 0/a (,E*a 'a 1/a (,FW X  hO�a 2,E*a 2,FUO�j 3Y hOPUOPW -X 4  
�j 3W X  hO)a a 5la 6�%a 7%�%OP^ �E	�D�C{|�B�E 40 downloadbibtexfromspires downloadBibTeXFromSpires�D �A}�A }  �@�?�>�@ 0 thepub thePub�? 0 
thearchive 
theArchive�> 0 	thenumber 	theNumber�C  { �=�<�;�= 0 thepub thePub�< 0 
thearchive 
theArchive�; 0 	thenumber 	theNumber| �:�9�8�: 0 	spiresurl 	spiresURL�9 �8  0 downloadbibtex downloadBibTeX�B )�)�,���+ _ �7	�6�5~�4�7 00 downloadbibtexfrommath downloadBibTeXFromMath�6 �3��3 �  �2�1�0�2 0 thepub thePub�1 0 
thearchive 
theArchive�0 0 	thenumber 	theNumber�5  ~ �/�.�-�/ 0 thepub thePub�. 0 
thearchive 
theArchive�- 0 	thenumber 	theNumber �,�+�*�, 0 mathurl mathURL�+ �*  0 downloadbibtex downloadBibTeX�4 )�)�,���+ ` �)	1�(�'���&�) $0 downloadarxivabs downloadArxivAbs�( �%��% �  �$�#�"�$ 0 thepub thePub�# 0 
thearchive 
theArchive�" 0 	thenumber 	theNumber�'  � �!� ���������������! 0 thepub thePub�  0 
thearchive 
theArchive� 0 	thenumber 	theNumber� 0 	theeprint 	theEprint� 0 theurl theURL� 0 s  � 0 t  � 0 thetitle theTitle� 0 a  � 0 
theauthors 
theAuthors� 0 i  � 0 j  � 0 thepages thePages� 0 theyear theYear� 0 	thevolume 	theVolume� 0 
thejournal 
theJournal� I�����	b�	i��
�		�	���	�	��	���	�	�	����	�� 


1
@����
h��
{
�
���������
�
�
�������"$�����N��W`ir{��������������
� 
pcls
� 
scpt
� 
alis
� .sysoloadscpt        alis
� 
rslt� $0 startprotectchar startProtectChar�  0 endprotectchar endProtectChar�
  �	  � 0 arxivabs arxivAbs� 0 arxivurl arxivURL
� .sysoexecTEXT���     TEXT
� 
errn��
� 
ascr
� 
txdl
� 
citm�  H0 "removesurroundingspacesandnewlines "removeSurroundingSpacesAndNewlines
�� .corecnte****       ****
�� 
cobj
�� 
TEXT����
�� 
ctxt��������
�� 
long�� Z���
�� 
docu
�� 
bfld
�� 
fldv�� 0 linkurl linkURL
�� 
bool�� 0 
capitalize  
�� 
ckey����&Fb   I =b  �,� b  �&j O�Ec  Y hOb   �*�,FO�*�,FUW X 	 
hY hO F��  �E�Y 	��%�%E�O))�,k+ �%E�O�%a %j E�O�a   	)jhY hOPW X 	 
)a a la �%a %O�a _ a ,FO�a l/EE�Oa _ a ,FO)�a k/Ek+ E�Oa _ a ,FO�a l/EE�Oa _ a ,FO)�a k/Ek+ E�Oa _ a ,FO�a -EE�Oa  _ a ,FOjvE�O #k�j !kkh 
�a "�/a l/E�6F[OY��Oa #_ a ,FO�a $&E�Oa %_ a ,FO�a -j !k |)�a l/Ek+ E�Oa &_ a ,FO�a k/EE�Oa '_ a ,FO�a i/EE�O�a a (/[a )\[Zl\Za (2EE�O�a a */EE�O�[a \[Zk\Za +2Ea $&E�Y Ba ,E�Oa -E�Oa .E�O�[a )\[Zk\Zl2EE�O�a /&a 0 a 1�%E�Y 	a 2�%E�OPW X 	 
)a a 3la 4�%a 5%O �a 6a 7k/ �� ��*a 8a 9/a :,FO�*a 8a ;/a :,FO�*a 8a </a :,FO�*a 8a =/a :,FO�*a 8a >/a :,FO�*a 8a ?/a :,FO�*a 8a @/a :,FO)*�l+ AOb  	 b  �,� a B& b  �k+ C*a 8a D/a :,FY hO�*a E,FOPUUOPW X 	 
)a a Fla G�%a H%OPa ������������� $0 downloadabstract downloadAbstract�� ����� �  �������� 0 thepub thePub�� 0 
thearchive 
theArchive�� 0 	thenumber 	theNumber��  � ���������������� 0 thepub thePub�� 0 
thearchive 
theArchive�� 0 	thenumber 	theNumber�� 0 	theeprint 	theEprint�� 0 theurl theURL�� 0 theabstract theAbstract�� 0 errormessage errorMessage� ����������"��������������������OQSs��������~��� 0 arxivabs arxivAbs�� 0 arxivurl arxivURL
�� .sysoexecTEXT���     TEXT
�� 
rslt
�� 
ascr
�� 
txdl
�� 
citm
�� .corecnte****       ****
�� 
TEXT�� H0 "removesurroundingspacesandnewlines "removeSurroundingSpacesAndNewlines��  ��  
�� 
errn���
�� 
docu
�� 
abst�� 0 errormessage errorMessage����� ɡ�  �E�Y 	��%�%E�O))�,k+ �%E�O R�%�%j O�E�O��  	)jhY hO���,FO��-j k �[�\[Zl\Zi2�&E�Y hO)�k+ E�OPW X  )a a la �%a %�%a %O a a k/ 	��a ,FUOPW X  )a a la �%a %�%OPb ������������� 0 downloadpdf downloadPDF�� ����� �  �������� 0 thepub thePub�� 0 
thearchive 
theArchive�� 0 	thenumber 	theNumber��  � �������������������������������������� 0 thepub thePub�� 0 
thearchive 
theArchive�� 0 	thenumber 	theNumber�� "0 thepapersfolder thePapersFolder�� 0 	theeprint 	theEprint�� 0 thefilename theFileName�� 0 thepath thePath�� 0 theurl theURL�� 0 	thefolder 	theFolder�� 0 tmppath tmpPath�� 0 tmpfile tmpFile�� 0 s  �� 0 t  �� 0 	starttime 	startTime�� 0 tmpname tmpName�� 0 thefile theFile�� 0 errormessage errorMessage�� 0 errornumber errorNumber� J��������������������������������#��������+-��������Z����������������u���������������������������������������� "����������Y[
�� 
pfol
�� 
psxf�� 0 arxivurl arxivURL
�� 
bool
�� 
cfol
�� .coredoexbool        obj 
�� 
kocl
�� 
prdt
�� 
pnam
�� 
insh�� 
�� .corecrel****      � null��  ��  
�� 
errn���
�� afdrtemp
�� 
rtyp
�� 
TEXT
�� .earsffdralis        afdr
�� 
fdst
�� 
rplc
�� erplyes �� 
�� .aevtdwnlfss ���     TEXT
�� .rdwropenshor       file
�� .rdwrread****        ****
�� .rdwrclosnull���     ****
�� 
ascr
�� 
txdl
�� 
citm
�� 
long
�� .misccurdldt    ��� null
�� 
btns
�� 
dflt
�� 
givu
�� .sysodlogaskr        TEXT
�� .sysodelanull��� ��� long
�� 
ditm
�� .coredelonull���     obj 
�� 
file
�� .coremoveditm       ditm�� 0 errormessage errorMessage� ����~
�� 
errn� 0 errornumber errorNumber�~  �������
�� 
File
�� 
data
�� 
alis�� 0 linkfile linkFile�����W �� *�,E�UO��  �E�O��%E�Y ��%�%E�O�b  %�%�%E�O*��%�%/EE�O*b  k+ �%E�O*�/EE�O��	 b  � �& B� 2���/j  *��a a �la ��-6a  Y hO���/E�UO�a %E�Y hW X  )a a la �%a %Oa a a l �%E�O �hZa   �a !�a "a #a $ %E�UO�j &O�j 'a &E�O�j (O�a ) Y da *_ +a ,,FO�a -l/EE�Oa ._ +a ,,FO�a -k/Ea /&E�O*j 0E�Oa 1a 2a 3a 4lva 5la 6�a  7O�*j 0�j 8OP[OY�YO� 8�a ,EE�O�a 9�/j  �a 9�/Ej :Y hO�a �a ;-6l <E�UOPW IX = > � �j :UW X  hO] a ?  )a a ?l] Y )a a @la A�%a B%O *� "� *�a Ca D�a E&a $ O)*�l+ FUUW X  )a a Gla H�%a I%OPc �}f�|�{���z�} 0 arxivurl arxivURL�| �y��y �  �x�x 0 thepage thePage�{  � �w�v�w 0 thepage thePage�v 0 theurl theURL� r�u�t
�u 
cobj
�t .corecnte****       ****�z N�b  �b  /%�%E�Ob   0b  kEc  Ob  b  j  kEc  Y hY hO�d �s��r�q���p�s H0 "removesurroundingspacesandnewlines "removeSurroundingSpacesAndNewlines�r �o��o �  �n�n 0 	thestring 	theString�q  � �m�l�m 0 	thestring 	theString�l 0 l  � 	�k�j�i�h�g�f��e�
�k 
leng
�j 
spac
�i 
ret 
�h 
cha 
�g 
bool
�f 
ctxt�e���p ��,E�O 9h�j	 ��lv��k/�&�k �[�\[Zl\Zi2E�Y �E�O�kE�[OY��O 9h�j	 ��lv��i/�&�k �[�\[Zk\Z�2E�Y �E�O�kE�[OY��O�e �d��c�b���a�d 0 linkfile linkFile�c �`��` �  �_�^�_ 0 thepub thePub�^ 0 thefile theFile�b  � �]�\�[�] 0 thepub thePub�\ 0 thefile theFile�[ 0 thepath thePath� �Z&�Y�X�W�V�U�T
�Z 
psxp
�Y 
File
�X 
kocl
�W 
data
�V 
insh�U 
�T .corecrel****      � null�a /��,E�O� %�  *�-�,E� *����*�-5� Y hUUf �S,�R�Q���P�S 0 linkurl linkURL�R �O��O �  �N�M�N 0 thepub thePub�M 0 theurl theURL�Q  � �L�K�L 0 thepub thePub�K 0 theurl theURL� Q�J�I�H�G�F�E
�J 
URL 
�I 
kocl
�H 
data
�G 
insh�F 
�E .corecrel****      � null�P '� #� *�-E� *����*�-5� Y hUU ascr  ��ޭ