create view Hastalar
as
select Id,Name,Surname,TcNo,Age,Gender,IsDelete from Patient

alter proc HastalarInsertIslemi
@HastalarName nvarchar(50),
@HastalarSurname nvarchar(50),
@HastalarTcNo nvarchar(11),
@HastalarAge int,
@HastalarGender nvarchar(10)
as
begin

begin try
begin tran IslemControl


	insert into Hastalar (Name,Surname,TcNo,Age,Gender) 
	values (@HastalarName,@HastalarSurname,@HastalarTcNo,@HastalarAge,@HastalarGender)

	print 'Hasta Bilgileri Kaydedildi.'

commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yapilan islemler Geri Alindi.'
end catch

end
	
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

	print 'Hasta Bilgileri Güncellendi.'
end
else
begin
    print 'Güncelleme yapýlmadý: Belirtilen HastalarId deðeri mevcut deðil.'
end

commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yapýlan Ýþlemler Geri Alýndý.'
end catch
end

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
    print 'Silme yapýlmadý: Belirtilen HastalarId deðeri mevcut deðil.'
end

commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yapýlan Ýþlemler Geri Alýndý.'
end catch
end

exec HastalarInsertIslemi 'Ali','Ekin','12345678906',58,'Erkek'

exec HastalarUpdateIslemi 2,'Gamze','Yýldýz','12345678905',29,'Kadin'

exec HastalarDeleteIslemi  12



alter view Doktorlar
as
select Id,Name,Surname,IsDelete from Doctor

alter proc DoktorlarInsertIslemi
@DoktorlarName nvarchar(50),
@DoktorlarSurname nvarchar(50)
as
begin

begin try
begin tran IslemControl

	insert into Doktorlar(Name,Surname) 
	values (@DoktorlarName,@DoktorlarSurname)

	print 'Doktor Bilgileri Kaydedildi.'

commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yapýlan Ýþlemler Geri Alýndý.'
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

	print 'Doktor Bilgileri Güncellendi.'
end
else
begin
    print 'Güncelleme yapýlmadý: Belirtilen DoktorlarId deðeri mevcut deðil.'
end

commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yapýlan Ýþlemler Geri Alýndý.'
end catch
end

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
    print 'Silme yapýlmadý: Belirtilen DoktorlarId deðeri mevcut deðil.'
end

commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yapýlan Ýþlemler Geri Alýndý.'
end catch

end


exec DoktorlarInsertIslemi 'Mustafa','Yýldýz'

exec DoktorlarUpdateIslemi 2,'Selim','Yýlmaz'

exec DoktorlarDeleteIslemi 2




alter view Departman
as
select Id,Name,IsDelete from Departmen

create proc DepartmanInsertIslemi
@DepartmanName nvarchar(200)
as
begin

begin try
begin tran IslemControl

	insert into Departman([Name]) 
	values (@DepartmanName)

	print 'Departman Bilgileri Kaydedildi.'

commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yapýlan Ýþlemler Geri Alýndý.'
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

	print 'Departman Bilgileri Güncellendi.'

end
else
begin
    print 'Güncelleme yapýlmadý: Belirtilen DepartmanId deðeri mevcut deðil.'
end

commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yapýlan Ýþlemler Geri Alýndý.'
end catch

end

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
    print 'Silme yapýlmadý: Belirtilen DepartmanId deðeri mevcut deðil.'
end

commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yapýlan Ýþlemler Geri Alýndý.'
end catch
end


exec DepartmanInsertIslemi 'Kulak Burun Bogaz'

exec DepartmanUpdateIslemi 2,'Genel Cerrahi'

exec DepartmanDeleteIslemi 9


create view DoktorDepartman
as
select Id,DepartmentId,DoctorId,IsDelete from DoctorDepartmen

alter proc DoktorDepartmanInsertIslemi
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

	insert into DoktorDepartman(DepartmentId,DoctorId) 
	values (@DepartmanId,@DoktorId)

	print 'Doktor Departman Bilgileri Kaydedildi.'

    end
    else
    begin
        print 'Ekleme yapýlmadý: Belirtilen DoktorId deðeri mevcut deðil.';
    end
end
else
begin
    print 'Ekleme yapýlmadý: Belirtilen DepartmanId deðeri mevcut deðil.';
end

commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yapýlan Ýþlemler Geri Alýndý.'
end catch

end

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

        print 'Doktor Departman Bilgileri Güncellendi.'
    end
    else
    begin
        print 'Güncelleme yapýlmadý: Belirtilen DoktorId deðeri mevcut deðil.';
    end
end
else
begin
    print 'Güncelleme yapýlmadý: Belirtilen DepartmanId deðeri mevcut deðil.';
end
commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yapýlan Ýþlemler Geri Alýndý.'
end catch
end

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
    print 'Silme yapýlmadý: Belirtilen DoktorDepartmanId deðeri mevcut deðil.';
end
commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yapýlan Ýþlemler Geri Alýndý.'
end catch
end


exec DoktorDepartmanInsertIslemi 1,3

exec DoktorDepartmanUpdateIslemi 3,1,2

exec DoktorDepartmanDeleteIslemi 9

create view HastaRandavu
as
select Id,DepartmentId,DoctorId,PatientId,[Date],[Hour],IsStatus,IsDelete from PatientAppointment

alter proc HastaRandavuInserIslemi
    @DepartmanId int,
    @DoktorId int,
    @HastaId int,
    @Tarih date,
    @SecilenSaat time
as
begin
    begin try
		    if @SecilenSaat<'09:00:00' or @SecilenSaat>'17:00:00'
				begin
					print 'Randevu saatleri dýþýnda seçim yaptýnýz.'
				end
        else
		begin
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
                                print 'Seçilen saat dolu. Randavu '+cast(@EnYakinBosSaat as nvarchar(8))+' saatine oluþturuldu.'
                            end
                            else
                            begin
                                print 'Seçilen saat dolu ve sonraki uygun boþ saat bulunamadý.'
                            end
                        end
                        else
                        begin
                            insert into HastaRandavu (PatientId, DoctorId, DepartmentId, [Date], [Hour])
                            values (@HastaId, @DoktorId, @DepartmanId, @Tarih, @SecilenSaat)
                            print 'Randevu baþarýyla oluþturuldu.'
                        end
                    end
                end
                else
                begin
                    print 'Ekleme yapýlmadý: Belirtilen HastaId deðeri mevcut deðil.'
                end
            end
            else
            begin
                print 'Ekleme yapýlmadý: Belirtilen DoktorId deðeri mevcut deðil.'
            end
        end
        else
        begin
            print 'Ekleme yapýlmadý: Belirtilen DepartmanId deðeri mevcut deðil.'
        end

        commit tran IslemControl
		end
    end try
    begin catch
        rollback tran IslemControl
        print 'Yapýlan Ýþlemler Geri Alýndý.'
    end catch
end

alter proc HastaRandavuUpdateIslemi
@HastaRandavuId int,
@DepartmanId int,
@DoktorId int,
@HastaId int,
@Tarih date,
@SecilenSaat time
as
begin
    begin try
		    if @SecilenSaat<'09:00:00' or @SecilenSaat>'17:00:00'
				begin
					print 'Randevu saatleri dýþýnda seçim yaptýnýz.'
				end
        else
		begin
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
                                print 'Seçilen saat dolu. Randavu '+cast(@EnYakinBosSaat as nvarchar(8))+' saatine güncellendi.'
                            end
                            else
                            begin
                                print 'Seçilen saat dolu ve sonraki uygun boþ saat bulunamadý.'
                            end
                        end
                        else
                        begin
                            update HastaRandavu set PatientId=@HastaId, DoctorId=@DoktorId, DepartmentId=@DepartmanId, [Date]=@Tarih, [Hour]=@SecilenSaat 
						    where HastaRandavu.Id=@HastaRandavuId
                            print 'Randevu baþarýyla güncellendi.'
                        end
                    end
                else
                begin
                    print 'Güncelleme yapýlmadý: Belirtilen HastaId deðeri mevcut deðil.'
                end
            end
            else
            begin
                print 'Güncelleme yapýlmadý: Belirtilen DoktorId deðeri mevcut deðil.'
            end
        end
        else
        begin
            print 'Güncelleme yapýlmadý: Belirtilen DepartmanId deðeri mevcut deðil.'
        end

        commit tran IslemControl
		end
    end try
begin catch
	rollback tran IslemControl
	print 'Yapýlan Ýþlemler Geri Alýndý.'
end catch
end

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
    print 'Silme yapýlmadý: Belirtilen HastaRandavuId deðeri mevcut deðil.'
end
commit tran IslemControl
end try
begin catch
	rollback tran IslemControl
	print 'Yapýlan Ýþlemler Geri Alýndý.'
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





	
