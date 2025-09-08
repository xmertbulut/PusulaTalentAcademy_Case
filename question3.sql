--Q1  
SELECT 
    YEAR(A.SatisTarihi) AS Yil,
    B.UrunAdi,
    SUM(A.Adet) AS ToplamAdet,
    SUM(A.Adet * B.Fiyat) AS ToplamTutar
FROM Satis A
JOIN Urun B ON A.UrunID = B.UrunID
GROUP BY YEAR(A.SatisTarihi), B.UrunAdi

--Q2  Her yıl en yüksek satış tutarını görmek için MAX kullandım:
SELECT 
    YEAR(A.SatisTarihi) AS Yil,
    MAX(A.Adet * B.Fiyat) AS EnYuksekSatisTutari
FROM Satis A
JOIN Urun B ON A.UrunID = B.UrunID
GROUP BY YEAR(A.SatisTarihi)

--Q3  --left join kullanıp sonrasında ortak verileri çıkarıyoruz.
SELECT A.UrunAdi
FROM Urun A
LEFT JOIN Satis B ON A.UrunID = B.UrunID
WHERE A.UrunID IS NULL
