 
  
 U S E   G a m e U s e r D B  
 G O  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   D B O . S Y S O B J E C T S   W H E R E   I D   =   O B J E C T _ I D ( N ' [ d b o ] . [ G S P _ C F _ L o a d C u s t o m F a c e ] ' )   a n d   O B J E C T P R O P E R T Y ( I D ,   N ' I s P r o c e d u r e ' )   =   1 )  
 D R O P   P R O C E D U R E   [ d b o ] . [ G S P _ C F _ L o a d C u s t o m F a c e ]  
 G O  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   D B O . S Y S O B J E C T S   W H E R E   I D   =   O B J E C T _ I D ( N ' [ d b o ] . [ G S P _ C F _ I n s e r t C u s t o m F a c e ] ' )   a n d   O B J E C T P R O P E R T Y ( I D ,   N ' I s P r o c e d u r e ' )   =   1 )  
 D R O P   P R O C E D U R E   [ d b o ] . [ G S P _ C F _ I n s e r t C u s t o m F a c e ]  
 G O  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   D B O . S Y S O B J E C T S   W H E R E   I D   =   O B J E C T _ I D ( N ' [ d b o ] . [ G S P _ C F _ D e l e t e C u s t o m F a c e ] ' )   a n d   O B J E C T P R O P E R T Y ( I D ,   N ' I s P r o c e d u r e ' )   =   1 )  
 D R O P   P R O C E D U R E   [ d b o ] . [ G S P _ C F _ D e l e t e C u s t o m F a c e ]  
 G O  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - - �R}�4Y�P 
 C R E A T E     P R O C E D U R E   G S P _ C F _ L o a d C u s t o m F a c e    
 	 @ d w U s e r I D   I N T  
 W I T H   E N C R Y P T I O N   A S  
  
 D E C L A R E   @ U s e r I D   I N T  
 D E C L A R E   @ C u s t o m F a c e I m a g e   V A R B I N A R Y ( M A X )  
 D E C L A R E   @ I m g S i z e   I N T  
  
 B E G I N  
 	 S E L E C T   @ U s e r I D = U s e r I D , @ C u s t o m F a c e I m a g e = C u s t o m F a c e I m a g e   F R O M   C u s t o m F a c e I n f o   W H E R E   U s e r I D = @ d w U s e r I D  
  
 	 S E L E C T   @ I m g S i z e = D A T A L E N G T H ( @ C u s t o m F a c e I m a g e )  
  
 	 S E L E C T   @ U s e r I D   A S   U s e r I D , @ C u s t o m F a c e I m a g e   A S   C u s t o m F a c e I m a g e ,   @ I m g S i z e   A S   I m g S i z e  
 E N D  
 R E T U R N   0  
 G O  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - - �X�R4Y�P 
 C R E A T E     P R O C E D U R E   G S P _ C F _ I n s e r t C u s t o m F a c e    
 	 @ d w U s e r I D   I N T ,  
 	 @ i m g C u s t o m F a c e I m a g e   V A R B I N A R Y ( M A X )  
 W I T H   E N C R Y P T I O N   A S  
  
 B E G I N  
 	 U P D A T E   C u s t o m F a c e I n f o   S E T   C u s t o m F a c e I m a g e = @ i m g C u s t o m F a c e I m a g e   W H E R E   U s e r I D = @ d w U s e r I D  
  
 	 I F   @ @ R O W C O U N T = 0  
 	 B E G I N  
 	 	 I N S E R T   C u s t o m F a c e I n f o   ( U s e r I D , C u s t o m F a c e I m a g e )   V A L U E S ( @ d w U s e r I D , @ i m g C u s t o m F a c e I m a g e )  
 	 E N D  
  
 	 I F   @ @ E R R O R < > 0   R E T U R N   - 1  
  
 	 U P D A T E   A c c o u n t s I n f o   S E T   C u s t o m F a c e V e r = C u s t o m F a c e V e r + 1  
 	 W H E R E   U s e r I D = @ d w U s e r I D 	  
  
 	 D E C L A R E   @ C u s t o m F a c e V e r   I N T  
 	 S E L E C T   @ C u s t o m F a c e V e r = C u s t o m F a c e V e r   F R O M   A c c o u n t s I n f o   W H E R E   U s e r I D = @ d w U s e r I D  
  
 	 - -    g'Y<P 
 	 I F   @ C u s t o m F a c e V e r = 0  
 	 B E G I N  
 	 	 U P D A T E   A c c o u n t s I n f o   S E T   C u s t o m F a c e V e r = 1  
 	 	 W H E R E   U s e r I D = @ d w U s e r I D 	  
 	 E N D  
  
 	 R E T U R N   @ C u s t o m F a c e V e r  
 E N D 	  
 R E T U R N   0  
 G O  
  
  
 - -  Rd�4Y�P 
 C R E A T E     P R O C E D U R E   G S P _ C F _ D e l e t e C u s t o m F a c e    
 	 @ d w U s e r I D   I N T 	  
 W I T H   E N C R Y P T I O N   A S  
  
 B E G I N  
 	 D E L E T E   F R O M   C u s t o m F a c e I n f o   W H E R E   U s e r I D = @ d w U s e r I D  
 	  
 	 U P D A T E   A c c o u n t s I n f o   S E T   C u s t o m F a c e V e r = 0  
 	 W H E R E   U s e r I D = @ d w U s e r I D  
 E N D 	  
 R E T U R N   0  
 G O 