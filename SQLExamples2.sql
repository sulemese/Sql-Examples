
--B�RLE�T�RMELER


SELECT OGRAD+' '+OGRSOYAD AS [OGRENCI],DERSAD,SINAV1,SINAV2,SINAV3,ORTALAMA,DURUM FROM TBLNOTLAR
JOIN TBL_DERSLER 
ON TBLNOTLAR.DERS=TBL_DERSLER.DERSID
JOIN TBLOGRENCILER
ON TBLNOTLAR.OGRENCI=TBLOGRENCILER.OGRID


--ALT SORGULAR

/*DERSLER TABLOSUNDA �SM� MATEMAT�K OLAN DERSE A�T SINAV NOTLARINI G�R�NT�LEMEK �ST�YORUZ*/

SELECT * FROM TBLNOTLAR
WHERE DERS=(SELECT DERSID FROM TBL_DERSLER WHERE DERSAD='MATEMAT�K')

/*DERSLER TABLOSUNDA ALGOR�TMA DERS�NE A�T EN Y�KSEK SINAV 1 NOTUNU GET�R */
SELECT MAX(SINAV1) AS [1. SINAV EN Y�KSEK NOTU] FROM TBLNOTLAR
WHERE DERS=(SELECT DERSID FROM TBL_DERSLER WHERE DERSAD='T�RK�E')


