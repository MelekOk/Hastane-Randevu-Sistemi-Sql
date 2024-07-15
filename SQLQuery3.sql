--Hastalar view i olu�turuldu.
create view Hastalar
as
select Id,Name,Surname,TcNo,Age,Gender,IsDelete from Patient

--insert i�lemi i�in proc olu�turuldu
alter proc HastalarInsertIslemi
@HastalarName nvarchar(50),
@HastalarSurname nvarchar(50),
@HastalarTcNo nvarchar(11),
@HastalarAge int,
@HastalarGender nvarchar(10)
as
begin

--Hata ay�klamak i�in try catch kullan�ld�.
begin try
--��lemde hata olu�ursa geri almak i�in tran kullan�ld�.
begin tran IslemControl


	insert into Hastalar (Name,Surname,TcNo,Age,Gender) 
	values (@HastalarName,@HastalarSurname,@HastalarTcNo,@HastalarAge,@HastalarGender)

	print 'Hasta Bilgileri Kaydedildi.'

commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yap�lan ��lemler Geri Al�nd�.'
end catch

end

--Update i�lemi i�in proc olu�turuldu
alter proc HastalarUpdateIslemi
@HastalarId int,
@HastalarName nvarchar(50),
@HastalarSurname nvarchar(50),
@HastalarTcNo nvarchar(11),
@HastalarAge int,
@HastalarGender nvarchar(10)
as
begin

begin try
begin tran IslemControl
if exists (select 1 from Hastalar where Id=@HastalarId)
begin
	update Hastalar set Name=@HastalarName,Surname=@HastalarSurname,TcNo=@HastalarTcNo,Age=@HastalarAge,Gender=@HastalarGender
	where Id=@HastalarId 

	print 'Hasta Bilgileri G�ncellendi.'
end
else
begin
    print 'G�ncelleme yap�lmad�: Belirtilen HastalarId de�eri mevcut de�il.'
end

commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yap�lan ��lemler Geri Al�nd�.'
end catch
end

--Delete i�lemi i�in proc olu�turuldu
alter proc HastalarDeleteIslemi
@HastalarId int
as
begin

begin try
begin tran IslemControl

if exists (select 1 from Hastalar where Id=@HastalarId)
begin
	update Hastalar set IsDelete=1 where Id=@HastalarId 

	print 'Hasta Bilgileri Silindi.'
end
else
begin
    print 'Silme yap�lmad�: Belirtilen HastalarId de�eri mevcut de�il.'
end

commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yap�lan ��lemler Geri Al�nd�.'
end catch
end

exec HastalarInsertIslemi 'Ali','Ekin','12345678906',58,'Erkek'

exec HastalarUpdateIslemi 2,'Gamze','Y�ld�z','12345678905',29,'Kad�n'

exec HastalarDeleteIslemi  12



alter view Doktorlar
as
select Id,Name,Surname,IsDelete from Doctor

--insert i�lemi i�in proc olu�turuldu
alter proc DoktorlarInsertIslemi
@DoktorlarName nvarchar(50),
@DoktorlarSurname nvarchar(50)
as
begin

--Hata ay�klamak i�in try catch kullan�ld�.
begin try
--��lemde hata olu�ursa geri almak i�in tran kullan�ld�.
begin tran IslemControl

	insert into Doktorlar(Name,Surname) 
	values (@DoktorlarName,@DoktorlarSurname)

	print 'Doktor Bilgileri Kaydedildi.'

commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yap�lan ��lemler Geri Al�nd�.'
end catch
end


alter proc DoktorlarUpdateIslemi
@DoktorlarId int,
@DoktorlarName nvarchar(50),
@DoktorlarSurname nvarchar(50)
as
begin

begin try
begin tran IslemControl

if exists (select 1 from Doktorlar where Id=@DoktorlarId)
begin
	update Doktorlar set Name=@DoktorlarName,Surname=@DoktorlarSurname
	where Id=@DoktorlarId 

	print 'Doktor Bilgileri G�ncellendi.'
end
else
begin
    print 'G�ncelleme yap�lmad�: Belirtilen DoktorlarId de�eri mevcut de�il.'
end

commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yap�lan ��lemler Geri Al�nd�.'
end catch
end

--Delete i�lemi i�in proc olu�turuldu
alter proc DoktorlarDeleteIslemi
@DoktorlarId int
as
begin

begin try
begin tran IslemControl

if exists (select 1 from Doktorlar where Id=@DoktorlarId)
begin
	update Doktorlar set IsDelete=1 where Id=@DoktorlarId 

	print 'Doktor Bilgileri Silindi.'
end
else
begin
    print 'Silme yap�lmad�: Belirtilen DoktorlarId de�eri mevcut de�il.'
end

commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yap�lan ��lemler Geri Al�nd�.'
end catch

end


exec DoktorlarInsertIslemi 'Mustafa','Y�ld�z'

exec DoktorlarUpdateIslemi 2,'Selim','Y�lmaz'

exec DoktorlarDeleteIslemi 2




alter view Departman
as
select Id,Name,IsDelete from Departmen

--insert i�lemi i�in proc olu�turuldu
create proc DepartmanInsertIslemi
@DepartmanName nvarchar(200)
as
begin

--Hata ay�klamak i�in try catch kullan�ld�.
begin try
--��lemde hata olu�ursa geri almak i�in tran kullan�ld�.
begin tran IslemControl

	insert into Departman([Name]) 
	values (@DepartmanName)

	print 'Departman Bilgileri Kaydedildi.'

commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yap�lan ��lemler Geri Al�nd�.'
end catch

end

alter proc DepartmanUpdateIslemi
@DepartmanId int,
@DepartmanName nvarchar(50)
as
begin

begin try
begin tran IslemControl

if exists (select 1 from Departman where Departman.Id=@DepartmanId)
begin

	update Departman set Name=@DepartmanName
	where Id=@DepartmanId 

	print 'Departman Bilgileri G�ncellendi.'

end
else
begin
    print 'G�ncelleme yap�lmad�: Belirtilen DepartmanId de�eri mevcut de�il.'
end

commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yap�lan ��lemler Geri Al�nd�.'
end catch

end

--Delete i�lemi i�in proc olu�turuldu
alter proc DepartmanDeleteIslemi
@DepartmanId int
as
begin
begin try
begin tran IslemControl

if exists (select 1 from Departman where Departman.Id=@DepartmanId)
begin
	update Departman set IsDelete=1 where Id=@DepartmanId 

	print 'Departman Bilgileri Silindi.'
end
else
begin
    print 'Silme yap�lmad�: Belirtilen DepartmanId de�eri mevcut de�il.'
end

commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yap�lan ��lemler Geri Al�nd�.'
end catch
end


exec DepartmanInsertIslemi 'Kulak Burun Bo�az'

exec DepartmanUpdateIslemi 2,'Genel Cerrahi'

exec DepartmanDeleteIslemi 9


create view DoktorDepartman
as
select Id,DepartmentId,DoctorId,IsDelete from DoctorDepartmen


--insert i�lemi i�in proc olu�turuldu
alter proc DoktorDepartmanInsertIslemi
@DepartmanId int,
@DoktorId int
as
begin

--Hata ay�klamak i�in try catch kullan�ld�.
begin try
--��lemde hata olu�ursa geri almak i�in tran kullan�ld�.
begin tran IslemControl

if exists (select 1 from Departman where Departman.Id=@DepartmanId)
begin
   if exists (select 1 from Doktorlar WHERE Doktorlar.Id=@DoktorId)
    begin

	insert into DoktorDepartman(DepartmentId,DoctorId) 
	values (@DepartmanId,@DoktorId)

	print 'Doktor Departman Bilgileri Kaydedildi.'

    end
    else
    begin
        print 'Ekleme yap�lmad�: Belirtilen DoktorId de�eri mevcut de�il.';
    end
end
else
begin
    print 'Ekleme yap�lmad�: Belirtilen DepartmanId de�eri mevcut de�il.';
end

commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yap�lan ��lemler Geri Al�nd�.'
end catch

end

--G�ncelleme i�lemi i�in proc olu�turuldu
alter proc DoktorDepartmanUpdateIslemi
@DoktorDepartmanId int,
@DepartmanId int,
@DoktorId int
as
begin
begin try
begin tran IslemControl

if exists (select 1 from Departman where Departman.Id=@DepartmanId)
begin
   if exists (select 1 from Doktorlar WHERE Doktorlar.Id=@DoktorId)
    begin
        update DoktorDepartman 
        set DoctorId=@DoktorId, DepartmentId=@DepartmanId
        where Id=@DoktorDepartmanId;

        print 'Doktor Departman Bilgileri G�ncellendi.'
    end
    else
    begin
        print 'G�ncelleme yap�lmad�: Belirtilen DoktorId de�eri mevcut de�il.';
    end
end
else
begin
    print 'G�ncelleme yap�lmad�: Belirtilen DepartmanId de�eri mevcut de�il.';
end
commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yap�lan ��lemler Geri Al�nd�.'
end catch
end


--Delete i�lemi i�in proc olu�turuldu
alter proc DoktorDepartmanDeleteIslemi
@DoktorDepartmanId int
as
begin
begin try
begin tran IslemControl
if exists (select 1 from DoktorDepartman where Id=@DoktorDepartmanId)
begin
	update DoktorDepartman set IsDelete=1 where Id=@DoktorDepartmanId 

	print 'Doktor Departman Bilgileri Silindi.'
end
else
begin
    print 'Silme yap�lmad�: Belirtilen DoktorDepartmanId de�eri mevcut de�il.';
end
commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yap�lan ��lemler Geri Al�nd�.'
end catch
end


exec DoktorDepartmanInsertIslemi 1,3

exec DoktorDepartmanUpdateIslemi 3,1,2

exec DoktorDepartmanDeleteIslemi 9

--HastaRandavu view i olu�turuldu
create view HastaRandavu
as
select Id,DepartmentId,DoctorId,PatientId,[Date],[Hour],IsStatus,IsDelete from PatientAppointment

--�nsert i�lemi i�in proc olu�turuldu
alter proc HastaRandavuInserIslemi
    @DepartmanId int,
    @DoktorId int,
    @HastaId int,
    @Tarih date,
    @SecilenSaat time
as
begin
    -- Hata ay�klamak i�in try-catch kullan�ld�.
    begin try
		    if @SecilenSaat<'09:00:00' or @SecilenSaat>'17:00:00'
				begin
					print 'Randevu saatleri d���nda se�im yapt�n�z.'
				end
        else
		begin
		-- ��lemde hata olu�ursa geri almak i�in transaction kullan�ld�.
        begin tran IslemControl
        if exists (select 1 from DoktorDepartman where DoktorDepartman.DepartmentId=@DepartmanId)
        begin
            if exists (select 1 from DoktorDepartman where DoktorDepartman.DoctorId=@DoktorId)
            begin
                if exists (select 1 from Hastalar where Hastalar.Id=@HastaId)
                begin
                    if exists (select 1 from HastaRandavu where PatientId=@HastaId and [Date]=@Tarih and [Hour]=@SecilenSaat)
                    begin
                        print 'Randevunuz mevcut.'
                    end
                    else
                    begin
                        declare @EnYakinBosSaat time
                        if exists (select 1 from HastaRandavu where DoctorId=@DoktorId and [Hour]=@SecilenSaat and [Date]=@Tarih)
                        begin
                            select top 1 @EnYakinBosSaat=[Hour]
                            from (
                                select [Hour]
                                from (
                                    values
                                    ('09:00:00'),
                                    ('10:00:00'),
                                    ('11:00:00'),
                                    ('12:00:00'),
                                    ('13:00:00'),
                                    ('14:00:00'),
                                    ('15:00:00'),
                                    ('16:00:00'),
                                    ('17:00:00')
                                ) as Saatler([Hour])
                                where [Hour]>@SecilenSaat
                                and not exists (
                                    select 1
                                    from HastaRandavu
                                    where [Hour]=Saatler.[Hour]
                                    and [Date]=@Tarih
                                    and DoctorId=@DoktorId
                                )
                            ) as BosSaatler
                            order by [Hour]
                            if @EnYakinBosSaat is not null
                            begin
                                insert into HastaRandavu (PatientId, DoctorId, DepartmentId, [Date], [Hour])
                                values (@HastaId, @DoktorId, @DepartmanId, @Tarih, @EnYakinBosSaat)
                                print 'Se�ilen saat dolu. Randavu '+cast(@EnYakinBosSaat as nvarchar(8))+' saatine olu�turuldu.'
                            end
                            else
                            begin
                                print 'Se�ilen saat dolu ve sonraki uygun bo� saat bulunamad�.'
                            end
                        end
                        else
                        begin
                            insert into HastaRandavu (PatientId, DoctorId, DepartmentId, [Date], [Hour])
                            values (@HastaId, @DoktorId, @DepartmanId, @Tarih, @SecilenSaat)
                            print 'Randevu ba�ar�yla olu�turuldu.'
                        end
                    end
                end
                else
                begin
                    print 'Ekleme yap�lmad�: Belirtilen HastaId de�eri mevcut de�il.'
                end
            end
            else
            begin
                print 'Ekleme yap�lmad�: Belirtilen DoktorId de�eri mevcut de�il.'
            end
        end
        else
        begin
            print 'Ekleme yap�lmad�: Belirtilen DepartmanId de�eri mevcut de�il.'
        end

        commit tran IslemControl
		end
    end try
    begin catch
        rollback tran IslemControl
        print 'Yap�lan ��lemler Geri Al�nd�.'
    end catch
end

--G�ncelleme i�lemi i�in proc olu�turuldu
alter proc HastaRandavuUpdateIslemi
@HastaRandavuId int,
@DepartmanId int,
@DoktorId int,
@HastaId int,
@Tarih date,
@SecilenSaat time
as
begin
  -- Hata ay�klamak i�in try-catch kullan�ld�.
    begin try
		    if @SecilenSaat<'09:00:00' or @SecilenSaat>'17:00:00'
				begin
					print 'Randevu saatleri d���nda se�im yapt�n�z.'
				end
        else
		begin
		-- ��lemde hata olu�ursa geri almak i�in transaction kullan�ld�.
        begin tran IslemControl
        if exists (select 1 from DoktorDepartman where DoktorDepartman.DepartmentId=@DepartmanId)
        begin
            if exists (select 1 from DoktorDepartman where DoktorDepartman.DoctorId=@DoktorId)
            begin
                if exists (select 1 from Hastalar where Hastalar.Id=@HastaId)
                begin
                        declare @EnYakinBosSaat time
                        if exists (select 1 from HastaRandavu where DoctorId=@DoktorId and [Hour]=@SecilenSaat and [Date]=@Tarih)
                        begin
                            select top 1 @EnYakinBosSaat=[Hour]
                            from (
                                select [Hour]
                                from (
                                    values
                                    ('09:00:00'),
                                    ('10:00:00'),
                                    ('11:00:00'),
                                    ('12:00:00'),
                                    ('13:00:00'),
                                    ('14:00:00'),
                                    ('15:00:00'),
                                    ('16:00:00'),
                                    ('17:00:00')
                                ) as Saatler([Hour])
                                where [Hour]>@SecilenSaat
                                and not exists (
                                    select 1
                                    from HastaRandavu
                                    where [Hour]=Saatler.[Hour]
                                    and [Date]=@Tarih
                                    and DoctorId=@DoktorId
                                )
                            ) as BosSaatler
                            order by [Hour]
                            if @EnYakinBosSaat is not null
                            begin
                                update HastaRandavu set PatientId=@HastaId, DoctorId=@DoktorId, DepartmentId=@DepartmanId, [Date]=@Tarih, [Hour]=@EnYakinBosSaat 
								where HastaRandavu.Id=@HastaRandavuId
                                print 'Se�ilen saat dolu. Randavu '+cast(@EnYakinBosSaat as nvarchar(8))+' saatine g�ncellendi.'
                            end
                            else
                            begin
                                print 'Se�ilen saat dolu ve sonraki uygun bo� saat bulunamad�.'
                            end
                        end
                        else
                        begin
                            update HastaRandavu set PatientId=@HastaId, DoctorId=@DoktorId, DepartmentId=@DepartmanId, [Date]=@Tarih, [Hour]=@SecilenSaat 
						    where HastaRandavu.Id=@HastaRandavuId
                            print 'Randevu ba�ar�yla g�ncellendi.'
                        end
                    end
                else
                begin
                    print 'G�ncelleme yap�lmad�: Belirtilen HastaId de�eri mevcut de�il.'
                end
            end
            else
            begin
                print 'G�ncelleme yap�lmad�: Belirtilen DoktorId de�eri mevcut de�il.'
            end
        end
        else
        begin
            print 'G�ncelleme yap�lmad�: Belirtilen DepartmanId de�eri mevcut de�il.'
        end

        commit tran IslemControl
		end
    end try
begin catch
	rollback tran IslemControl
	print 'Yap�lan ��lemler Geri Al�nd�.'
end catch
end


--Delete i�lemi i�in proc olu�turuldu
alter proc HastaRandavuDeleteIslemi
@HastaRandavuId int
as
begin
begin try
begin tran IslemControl
if exists (select 1 from HastaRandavu where Id=@HastaRandavuId)
begin
	update HastaRandavu set IsDelete=1 where Id=@HastaRandavuId 

	print 'Hasta Randavu Bilgileri Silindi.'
end
else
begin
    print 'Silme yap�lmad�: Belirtilen HastaRandavuId de�eri mevcut de�il.'
end
commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yap�lan ��lemler Geri Al�nd�.'
end catch
end


exec HastaRandavuInserIslemi
    @DepartmanId = 4,
    @DoktorId = 2,
    @HastaId = 1,
    @Tarih = '2024-07-14',
    @SecilenSaat = '16:00:00'

exec HastaRandavuUpdateIslemi
    2,
    @DepartmanId = 4,
    @DoktorId = 2,
    @HastaId = 1,
    @Tarih = '2024-07-14',
    @SecilenSaat = '11:00:00'

exec HastaRandavuDeleteIslemi 2





	
