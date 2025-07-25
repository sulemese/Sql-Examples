--ARÝTMETÝK ÝÞLEMLER

SELECT 20+4 AS 'TOPLAM' ,20-4 AS 'FARK',20*4 AS 'ÇARPIM',20/4 AS 'BÖLÜM'


--2. SINAV NOTU 45 ÝN ALTINDA OLAN ÖÐRENCÝLERE 10 PUAN EKLE.
UPDATE TBLNOTLAR  SET SINAV2=SINAV2+10
WHERE  DERS=1 AND SINAV2<45

--ORTALAMA HESAPLAT (ÇÜNKÜ SINAV2 DEÐERLERÝ DEÐÝÞTÝ)
UPDATE TBLNOTLAR SET ORTALAMA=(SINAV1+SINAV2+SINAV3)/3 
--DURUM HESAPLAT (ORTALAMA DEÐÝÞTÝÐÝ ÝÇÝN)
UPDATE TBLNOTLAR SET DURUM=0 WHERE ORTALAMA<50



--2. SINAV NOTU 100 ÜSTÜNDE OLAN ÖÐRENCÝ VARSA 100E EÞÝTLE
UPDATE TBLNOTLAR SET SINAV2=100
WHERE SINAV2>100


--SINIFIN GENEL ORTALAMASINI HESAPLAT
SELECT DERS,AVG(ORTALAMA) AS [SINIFIN GENEL ORTALAMASI] FROM TBLNOTLAR
GROUP BY DERS


--SINIFIN GENEL ORTALAMASININ ALTINDA OLAN ÖÐRENCÝLERÝN DURUM2 SÜTUNUNA ALTINDA YAZDIRIN. ÜSTÜNDEKÝLERE ÜSTÜNDE YAZDIRIN.
SELECT *, 'ÜSTÜNDE' AS DURUM2 FROM TBLNOTLAR 
WHERE ORTALAMA>(SELECT AVG(ORTALAMA) FROM TBLNOTLAR)


--SUM VE AVERAGE KULLANIMI

--SINAV1 NOTLARINI TOPLA
SELECT SUM(SINAV1) FROM TBLNOTLAR

--1 NOLU ÖÐRENCÝNÝN SINAV1 NOTLARINI TOPLA
SELECT SUM(SINAV1) FROM TBLNOTLAR
WHERE OGRENCI=1

--AYÞE ÇINAR ADLI ÖÐRENCÝNÝN DERS ADLARI ÝLE  SINAV NOTLARINI GÖSTER
SELECT  DERSAD, SINAV1, SINAV2, SINAV3 FROM TBLNOTLAR
JOIN TBL_DERSLER
ON TBLNOTLAR.DERS=TBL_DERSLER.DERSID
WHERE OGRENCI=(SELECT OGRID FROM TBLOGRENCILER WHERE OGRAD='AYÞE' AND OGRSOYAD='ÇINAR')


--AYÞE ÇINAR ADLI ÖÐRENCÝNÝN ALGORÝTMA DERSÝNDE ALMIÞ OLDUÐU 1. SINAV NOTU SINIF ORTALAMASININ ÜSTÜNDE MÝ ALTINDA MI BULAN ALGORÝTMA
SELECT SINAV1,'ÜSTÜNDE' AS DURUM FROM TBLNOTLAR
WHERE OGRENCI=(SELECT OGRID FROM TBLOGRENCILER 
WHERE OGRAD='AYÞE' AND OGRSOYAD='ÇINAR') 
AND DERS=(SELECT DERSID FROM TBL_DERSLER WHERE DERSAD='ALGORÝTMALAR') 
AND SINAV1 > (SELECT AVG(ORTALAMA) FROM TBLNOTLAR)

SELECT SINAV1,'ALTINDA' AS DURUM FROM TBLNOTLAR
WHERE OGRENCI=(SELECT OGRID FROM TBLOGRENCILER WHERE OGRAD='AYÞE' AND OGRSOYAD='ÇINAR') 
AND DERS=(SELECT DERSID FROM TBL_DERSLER WHERE DERSAD='ALGORÝTMALAR') 
AND SINAV1 < (SELECT AVG(ORTALAMA) FROM TBLNOTLAR)


--MATEMATÝKSEL ÝÞLEMLER

SELECT ABS(-10) AS 'MUTLAK'
SELECT POWER(2,4) AS 'ÜS ALMA'
SELECT SQRT(786) AS 'KAREKÖK'
SELECT FLOOR(4.56) AS 'TABAN'
SELECT CEILING(4.56) AS 'TAVAN'
