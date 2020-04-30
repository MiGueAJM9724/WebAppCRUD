Create table ventas.region(
	                idReg serial not null,
					nomReg varchar(40),
					constraint pkReg Primary key (idReg));
insert into ventas.region(nomReg) values ('Centro');
insert into ventas.region(nomReg) values ('Noroeste');
insert into ventas.region(nomReg) values ('Sureste');
select * from ventas.region;
delete from ventas.region where nomReg='Centro' and idreg =6; 

Create table ventas.sucursal(
	                  idSuc Serial not null,
					  nomSuc varchar(100),
					  cp char(5),
					  idReg int not null,constraint pkSuc Primary key (idSuc),
					 constraint fkReg foreign key (idReg) references ventas.region(idReg));
					 
insert into ventas.sucursal(nomsuc,cp,idreg)values('Americas','38100',1);
insert into ventas.sucursal(nomsuc,cp,idreg)values('Galerias','34130',1);

insert into ventas.sucursal(nomsuc,cp,idreg)values('Parque','38100',2);
insert into ventas.sucursal(nomsuc,cp,idreg)values('Armas','38100',2);

insert into ventas.sucursal(nomsuc,cp,idreg)values('Antares','38102',3);
insert into ventas.sucursal(nomsuc,cp,idreg)values('Almeida','38140',3);
select * from ventas.sucursal;

insert into ventas.sucursal(nomsuc,cp,idreg)values('xxx','35000',3) returning idsuc

 
Create table ventas.departamento(
                          idDepto Serial not null,
	                      NomDepto varchar(100),
                          constraint pkDep primary key (idDepto)
);

insert into ventas.departamento(NomDepto)values('Deportes');
insert into ventas.departamento(NomDepto)values('Hogar');
insert into ventas.departamento(NomDepto)values('Entretenimiento');
select * from ventas.departamento;

Create table ventas.producto(
                       idProd Serial not null,
	                   NomProd varchar(100),
	                   UnidadMed varchar(20),
	                   idDepto int not null,
	                   constraint pkProd primary key (idProd),
	                   constraint fkDep foreign key (idDepto) references ventas.departamento(idDepto)
);


insert into ventas.producto (NomProd,UnidadMed,idDepto)values('Tenis','metros',1);
insert into ventas.producto (NomProd,UnidadMed,idDepto)values('Camisa deportiva','metros',1);
insert into ventas.producto (NomProd,UnidadMed,idDepto)values('Balon','metros',1);
insert into ventas.producto (NomProd,UnidadMed,idDepto)values('Cocina','metros',2);
insert into ventas.producto (NomProd,UnidadMed,idDepto)values('Sarten','metros',2);
insert into ventas.producto (NomProd,UnidadMed,idDepto)values('Refrigerador','metros',2);
insert into ventas.producto (NomProd,UnidadMed,idDepto)values('Television','Pulgadas',3);
insert into ventas.producto (NomProd,UnidadMed,idDepto)values('Camara','Pulgadas',3);
insert into ventas.producto (NomProd,UnidadMed,idDepto)values('Laptop','metros',3);
update ventas.producto set NomProd='Laptop' where NomProd='Tenis' and idProd='9';
Select * from ventas.producto;

Create table ventas.inventario(
                        idProd int not null,
	                    Precio numeric(12,2),
	                    Existencia int,
	                    idSuc int not null,
	                    constraint pkInt primary key (idProd,idSuc),
	                    constraint fkProd foreign key (idProd) references ventas.producto (idProd),
	                    constraint fkSuc foreign key (idSuc) references ventas.sucursal (idSuc)
);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(1,900,500,1);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(2,1000,50,1);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(3,250,100,1);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(4,9000,50,1);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(5,900,500,1);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(6,200,30,1);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(7,5400,100,1);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(8,2500,200,1);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(9,8000,50,1);

insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(1,900,123,2);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(2,1000,134,2);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(3,250,122,2);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(4,9000,554,2);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(5,900,334,2);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(6,200,303,2);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(7,5400,155,2);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(8,2500,203,2);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(9,8000,520,2);

insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(1,900,51,3);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(2,1000,503,3);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(3,250,130,3);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(4,9000,560,3);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(5,900,506,3);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(6,200,50,3);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(7,5400,167,3);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(8,2500,270,3);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(9,8000,58,3);

insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(1,900,570,4);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(2,1000,80,4);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(3,250,180,4);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(4,9000,70,4);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(5,900,590,4);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(6,200,38,4);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(7,5400,700,4);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(8,2500,700,4);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(9,8000,60,4);

insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(1,900,580,5);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(2,1000,59,5);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(3,250,109,5);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(4,9000,53,5);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(5,900,55,5);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(6,200,36,5);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(7,5400,177,5);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(8,2500,255,5);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(9,8000,566,5);

insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(1,900,55,6);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(2,1000,55,6);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(3,250,106,6);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(4,9000,333,6);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(5,900,555,6);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(6,200,36,6);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(7,5400,155,6);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(8,2500,205,6);
insert into ventas.inventario(idProd,Precio,Existencia,idSuc)values(9,8000,55,6);

select * from ventas.inventario;



Create table ventas.cliente (
                      idCte serial not null,
	                  NomCte varchar(70),
	                  DomCte varchar(70),
	                  CorrCte varchar(20),
	                  telCte varchar(12),
	                  idSuc int not null,
                      constraint pkCte primary key (idCte),
	                  constraint fkSuc foreign key (idSuc) references ventas.sucursal(idSuc)
);
drop table ventas.cliente;
insert into ventas.cliente(NomCte,DomCte,CorrCte,TelCte,idSuc)values('Alejandro Vega','alameda 340','luis@gmail.com','4611791344',1);
insert into ventas.cliente(NomCte,DomCte,CorrCte,TelCte,idSuc)values('Cristobal perez','centro 122','cristobal@gmail.com','4611791355',1);
insert into ventas.cliente(NomCte,DomCte,CorrCte,TelCte,idSuc)values('carlos suarez','pinos 30','charlie@gmail.com','4611771344',1);

insert into ventas.cliente(NomCte,DomCte,CorrCte,TelCte,idSuc)values('monica medina','alameda 345','monica@gmail.com','4617771344',2);
insert into ventas.cliente(NomCte,DomCte,CorrCte,TelCte,idSuc)values('carlos vega','centro 340','carlos@gmail.com','4611232444',2);
insert into ventas.cliente(NomCte,DomCte,CorrCte,TelCte,idSuc)values('iker uziel','salvador ortega 30','iker@gmail.com','4611797788',2);

insert into ventas.cliente(NomCte,DomCte,CorrCte,TelCte,idSuc)values('jesus perales','san juan 340','pera@gmail.com','4611398844',3);
insert into ventas.cliente(NomCte,DomCte,CorrCte,TelCte,idSuc)values('dani kons','monte blanco 440','kons@gmail.com','4611555544',3);
insert into ventas.cliente(NomCte,DomCte,CorrCte,TelCte,idSuc)values('kevin merino','jardines 330','kevin@gmail.com','4613331344',3);

insert into ventas.cliente(NomCte,DomCte,CorrCte,TelCte,idSuc)values('flor perez','la luz 30','flor@gmail.com','4611999344',4);
insert into ventas.cliente(NomCte,DomCte,CorrCte,TelCte,idSuc)values('bryan uziel','villas del bajio 50','bryan@gmail.com','4613741344',4);
insert into ventas.cliente(NomCte,DomCte,CorrCte,TelCte,idSuc)values('paola duran','constituyentes 240','pao@gmail.com','4611791399',4);

insert into ventas.cliente(NomCte,DomCte,CorrCte,TelCte,idSuc)values('Fernanda Cortes','centro 140','fer@gmail.com','4611792233',5);
insert into ventas.cliente(NomCte,DomCte,CorrCte,TelCte,idSuc)values('lupita juarez','ejidal 340','lupita@gmail.com','4611111144',5);
insert into ventas.cliente(NomCte,DomCte,CorrCte,TelCte,idSuc)values('fatima sanchez','el cantar 320','fatima@gmail.com','4611112344',5);

insert into ventas.cliente(NomCte,DomCte,CorrCte,TelCte,idSuc)values('karen perez','residencial 110','karen@gmail.com','4618291344',6);
insert into ventas.cliente(NomCte,DomCte,CorrCte,TelCte,idSuc)values('alejandra palma','2 de abril 770','ale@gmail.com','4611791333',6);
insert into ventas.cliente(NomCte,DomCte,CorrCte,TelCte,idSuc)values('dani bustamante','monte blanco 90','dani@gmail.com','4612792244',6);

select * from ventas.cliente;

Create table ventas.venta (
                    FolioVta serial not null,
	                FechVta date,
	                TotalVta numeric(12,2),
	                idSuc int,
	                constraint pkVen Primary key (FolioVta),
	                constraint fkSuc foreign key (idSuc) references ventas.sucursal (idSuc)
);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,1);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('02/02/2020',0,1);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,1);

insert into ventas.venta(FechVta,TotalVta,idSuc)values('03/02/2020',0,2);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('01/02/2020',0,2);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('03/02/2020',0,2);

insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,3);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,3);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,3);

insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,4);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,4);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,4);

insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,5);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,5);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,5);

insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,6);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,6);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,6);

insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,1);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,1);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,1);

insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,2);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,2);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,2);

insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,3);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,3);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,3);

insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,4);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,4);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2020',0,4);

insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,5);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,5);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,5);

insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,6);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,6);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,6);

insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,1);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,1);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,1);

insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,2);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,2);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,2);

insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,3);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,3);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,3);

insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,4);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,4);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,4);

insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,5);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,5);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,5);

insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,6);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,6);
insert into ventas.venta(FechVta,TotalVta,idSuc)values('04/02/2040',0,6);

select * from ventas.venta;

Create table ventas.detalleventa(
                     FolioVta int not null,
	                 idProd int not null,
	                 CantVta int,
	                 PrecioVta numeric(12,2),
	                 Importe numeric(12,2),
	                 constraint pkDet Primary key (FolioVta,idProd),
	                 constraint fkVen foreign key (FolioVta) references ventas.venta (FolioVta),
	                 constraint fkProd foreign key (idProd) references ventas.producto (idProd)
);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(1,1,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(1,2,13,900,15000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(2,5,9,1400,12090);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(2,6,1,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(3,1,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(3,2,14,700,14500);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(4,1,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(4,4,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(5,5,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(5,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(6,6,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(6,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(7,7,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(7,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(8,7,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(8,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(9,4,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(9,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(10,1,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(10,6,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(11,5,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(11,2,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(12,1,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(12,3,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(13,1,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(13,5,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(14,5,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(14,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(15,5,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(15,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(16,7,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(16,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(17,2,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(17,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(18,1,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(18,7,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(19,4,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(19,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(20,5,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(20,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(21,6,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(21,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(22,4,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(22,5,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(23,1,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(23,3,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(24,5,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(24,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(25,1,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(25,5,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(26,1,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(26,6,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(27,7,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(27,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(28,7,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(28,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(29,6,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(29,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(30,5,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(30,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(31,4,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(31,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(32,1,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(32,2,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(33,1,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(33,4,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(34,3,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(34,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(35,3,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(35,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(36,5,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(36,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(37,2,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(37,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(38,4,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(38,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(39,5,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(39,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(40,4,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(40,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(41,3,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(41,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(42,2,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(42,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(43,6,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(43,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(44,7,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(44,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(45,3,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(45,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(46,5,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(46,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(47,4,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(47,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(48,6,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(48,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(49,7,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(49,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(50,2,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(50,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(51,4,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(51,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(52,2,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(52,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(53,4,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(53,1,12,900,12000);

insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(54,5,12,900,12000);
insert into ventas.detalleventa(FolioVta, idProd,CantVta,PrecioVta,Importe)values(54,1,12,900,12000);

select * from ventas.detalleventa;

create table ventas.detallevta(
   idsuc int not null,
   foliovta int not null,
   idprod int not null,
   cantvta int,
	preciovta numeric(12,2),
	importe numeric(12,2)
);
drop table ventas.detalleventa;
insert into ventas.detallevta(idsuc,foliovta,idprod,cantvta,preciovta,importe) 
select 6, foliovta,idprod,cantvta,preciovta,importe from ventas.detalleventa;

alter table ventas.detallevta add constraint pkdv primary key (idsuc,foliovta,idprod);
alter table ventas.detallevta add constraint fkdt1 foreign key (foliovta)
references ventas.venta(foliovta);
alter table ventas.detallevta add constraint fkdt2 foreign key (idsuc,idprod)
references ventas.inventario(idsuc,idprod);

select nomreg, nomsuc,nomcte,nomprod, sum(cantvta), sum(importe) from ventas.region a inner join ventas.sucursal b on(a.idreg = b.idreg)
inner join ventas.cliente c on (b.idsuc = c.idsuc)
inner join ventas.venta d on (c.idcte = c.idcte)
inner join ventas.detallevta e on (d.foliovta = e.foliovta)
inner join ventas.inventario f on (e.idprod = f.idprod)
inner join ventas.producto g on (f.idprod = g.idprod)
where fechvta between '2020/01/01' and '2020/02/01' group by nomreg,nomsuc,nomcte, nomprod;

alter table ventas.venta add idcte int;
alter table ventas.venta add constraint fkctel foreign key (idcte) references ventas.cliente(idcte);