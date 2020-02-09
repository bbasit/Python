 create database webProject

use webProject

create table country(
   country_id int identity(1,1) primary key,
   country_name varchar(30) unique
)

insert into country values('Bangladesh')
insert into country values('Nepal')
insert into country values('China')

select * from country
select * from countryconstitution
create table constitution(
    
	constitution_id int identity(1,1) primary key,
	constitution_name varchar(30) unique ,
	country_id int,

	constraint fk_countryid foreign key (country_id) references country (country_id),
)
insert into constitution values('Bangladesh Constitution',1)
insert into constitution values('Nepal Constitution',2)
insert into constitution values('China Constitution',3)

select * from category

create table category(
     category_id int identity(1,1) primary key,
	 category_name varchar(1000) unique
)

select * from clause

create table clause(
	clause_id int identity(1,1) primary key,
	clause_name varchar(1000) unique     
)

select * from countryconstitution

create table countryconstitution(
	constitution_id int,
	category_id int,
	clause_id int,
	clause text,

	constraint fk_constitution_id foreign key (constitution_id) references constitution (constitution_id),
	constraint fk_category_id foreign key (category_id) references category (category_id),
	constraint fk_clause_id foreign key (clause_id) references clause (clause_id),


	constraint pk_markdetails primary key(constitution_id,category_id,clause_id)

)



truncate table countryconstitution
select * from  countryconstitution where constitution_id=3
select * from clause where category_id is null

delete from category where category_id between 1 and 1000
DBCC CHECKIDENT ('webProject.dbo.clause',RESEED, 0)


update clause
set clause.category_id=countryconstitution.category_id
from 
	clause  inner join countryconstitution on clause.clause_id=countryconstitution.clause_id
		where clause.clause_id=countryconstitution.clause_id

		alter table clause add FOREIGN KEY (category_id)
REFERENCES category(category_id)

select * from clause

declare @existt int;
    select @existt=category_id from category where category_name='THE REPUBLIC';
    if(@existt>0)
        begin
        declare @exist int;
        select @exist=clause_id from clause where clause_name='The Republic';
        if(@exist>0)
            begin
            declare @categoryid int;
            declare @clauseid int;
            select @clauseid=clause_id from clause where clause_name='The Republic';
            select @categoryid=category_id from category where category_name='THE REPUBLIC';
            declare @constitutionCatId int;
            declare @constitutionClauseId int;
            select @constitutionCatId=category_id,@constitutionClauseId=clause_id from countryconstitution where clause_id=@clauseid and category_id=@categoryid;
            if (@constitutionCatId=@categoryid and @constitutionClauseId=@clauseid)
                begin
                update countryconstitution set clause =concat(clause,convert(text,'1. Bangladesh is a unitary, independent, sovereign Republic to be known as the Peoples Republic of Bangladesh.')) where  clause_id=@clauseid and category_id=@categoryid;        end
                else
                begin
                insert into countryconstitution values(1,@categoryid, @clauseid,'1. Bangladesh is a unitary, independent, sovereign Republic to be known as the Peoples Republic of Bangladesh.');
                end
			end
        else 
            begin
            declare @cateid int;




            select @cateid=category_id from category where category_name='THE REPUBLIC';
            insert into clause values('The Republic',@cateid);
            declare @clauid int;
            select @clauid=clause_id from clause where clause_name='The Republic';
            insert into countryconstitution values(1,@cateid, @clauid,'1. Bangladesh is a unitary, independent, sovereign Republic to be known as the Peoples Republic of Bangladesh.');
            end
     end  
    else
    begin
    insert into category values('THE REPUBLIC',1)
    declare @exist1 int;
    select @exist1=clause_id from clause where clause_name='The Republic';
    if(@exist1>0)
        begin
        declare @categoryid1 int;
        declare @clauseid1 int;
        select @clauseid1=clause_id from clause where clause_name='The Republic';
        select @categoryid1=category_id from category where category_name='THE REPUBLIC';
        declare @constitutionCatId1 int;
        declare @constitutionClauseId1 int;
        select @constitutionCatId1=category_id,@constitutionClauseId1=clause_id from countryconstitution where clause_id=@clauseid1 and category_id=@categoryid1;
        if (@constitutionCatId1=@categoryid1 and @constitutionClauseId1=@clauseid1)
            begin
            update countryconstitution set clause =concat(clause,convert(text,'1. Bangladesh is a unitary, independent, sovereign Republic to be known as the Peoples Republic of Bangladesh.')) where  clause_id=@clauseid and category_id=@categoryid;        end
            else
            begin
            insert into countryconstitution values(1,@categoryid1, @clauseid1,'1. Bangladesh is a unitary, independent, sovereign Republic to be known as the Peoples Republic of Bangladesh.');
            end
        end
    else 
        begin
        declare @cateid1 int;
        select @cateid1=category_id from category where category_name='THE REPUBLIC';
        insert into clause values('The Republic',@cateid1);
        declare @clauid1 int;
        select @clauid1=clause_id from clause where clause_name='The Republic';
        insert into countryconstitution values(1,@cateid1, @clauid1,'1. Bangladesh is a unitary, independent, sovereign Republic to be known as the Peoples Republic of Bangladesh.');
        end
    end

select * from clause,category,countryconstitution
select * from category
select * from countryconstitution


---------------------------------NEPAL

declare @exist int;
    declare @exist2 int;
    select @exist=clause_id from clause where clause_name='1. Constitution as the fundamental law:';
	select @exist2=category_id from category where category_name='Preliminary'
    if(@exist>0 and @exist2>0)
    begin
    declare @categoryid int;
    declare @clauseid int;
    select @clauseid=clause_id from clause where clause_name='1. Constitution as the fundamental law:';
    select @categoryid=category_id from category where category_name='Preliminary';
    declare @constitutionCatId int;
    declare @constitutionClauseId int;
    select @constitutionCatId=category_id,@constitutionClauseId=clause_id from countryconstitution where clause_id=@clauseid and category_id=@categoryid;
        if (@constitutionCatId=@categoryid and @constitutionClauseId=@clauseid)
        begin
        update countryconstitution set clause ='(1) This Constitution is the fundamentallaw of Nepal. Any law inconsistent with this Constitution shall, to the extent ofsuch inconsistency, be void.(2) It shall be the duty of every person to observe this Constitution.' where  clause_id=@clauseid and category_id=@categoryid;        
        end
        else
        begin
        insert into countryconstitution values(2,@categoryid, @clauseid,'(1) This Constitution is the fundamentallaw of Nepal. Any law inconsistent with this Constitution shall, to the extent ofsuch inconsistency, be void.(2) It shall be the duty of every person to observe this Constitution.');
        end
    end
    else if (@exist2>0)
    begin
    declare @cateid int;
    select @cateid=category_id from category where category_name='Preliminary';
    insert into clause values('1. Constitution as the fundamental law:',@cateid);
    
    declare @clauid int;
    select @clauid=clause_id from clause where clause_name='1. Constitution as the fundamental law:';
    
    insert into countryconstitution values(2,@cateid, @clauid,'(1) This Constitution is the fundamentallaw of Nepal. Any law inconsistent with this Constitution shall, to the extent ofsuch inconsistency, be void.(2) It shall be the duty of every person to observe this Constitution.');
    end
	else if(@exist>0) 
	begin
	insert into category(category_name) values('Preliminary',2);
    declare @catid int;
    declare @claid int;
    select @claid=clause_id from clause where clause_name='1. Constitution as the fundamental law:';
    select @catid=category_id from category where category_name='Preliminary';
    insert into countryconstitution values(2,@catid, @claid,'(1) This Constitution is the fundamentallaw of Nepal. Any law inconsistent with this Constitution shall, to the extent ofsuch inconsistency, be void.(2) It shall be the duty of every person to observe this Constitution.');
    end
	else 
	begin
	declare @clid int;
	declare @ctid int;
    insert into category(category_name) values('Preliminary');
    select @ctid=category_id from category where category_name='Preliminary';
	insert into clause(clause_name) values('1. Constitution as the fundamental law:',@ctid);
	
	select @clid=clause_id from clause where clause_name='1. Constitution as the fundamental law:';
    
    insert into countryconstitution values(2,@ctid, @clid,'(1) This Constitution is the fundamentallaw of Nepal. Any law inconsistent with this Constitution shall, to the extent ofsuch inconsistency, be void.(2) It shall be the duty of every person to observe this Constitution.');
	end

	select * from countryconstitution where clause like '%:%' and category_id>97
	select * from clause where  like '%Notwithstandinganything contained in clause (9)%' 
	select * from category
	
		select * from countryconstitution where category_id>96 and constitution_id=2 and clause like '%Notwithstandinganything contained in clause (9)%' 