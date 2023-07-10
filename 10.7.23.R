#Com connectar a una base de dades amb RODBC
#per treballar amb RODBC, tenim aque ajustar el Rstudio a 32 bits.
#pestanya Tools/Global Options
#Si no trobo una versió de 32 bits, es pot descarregar d´internet

#descargar r version 4.1.2

#primer instal.lar RODBC

install.packages("RODBC")

#Segon pas carregar el RODBC amb library

library(RODBC)
# Inicialitzar odbc

odbcDataSources()

url<-"https://sites.google.com/site/nubededatosblogspot.com/Neptuno.zip"


#funcionalitat per download

download.file(url,"Neptuno")
#funcionalitat pèr descomprimir

unzip("Neptuno")

canal<-odbcConnectAccess("Neptuno.mdb")

#per veure detalls de la connexió

sqlTables(canal)

setwd("C:/Curs R")


canal<-odbcConnectAccess("Neptuno-2003.mdb")

#Per veure detalls de la connexió
canal

#Per veure les talues de la base de dades
sqlTables(canal)

#Per veure només les taules de sistema

sqlTables(canal.TableType="SYSTEM TABLE")

#pER VEURE nomes les taules d´usuari

sqlTables(canal.TableType="TABLE")

sqlTables(canal.TableType="TABLE")$TABLE_NAME


#Si volem veure l´estructura d´una taula

sqlColumns(canal,"Clientes")

#Per veure només el nom del camp
sqlColumns(canal,"Clientes")$COLUMN_NAME

#dUES MANERES DE CARREGAR un dataframe de RODBC, la primera només amb el nom de la taula, 
#la segona amb una sentencia SQL

pedidos<-sqlFetch(canal,sqtable="Pedidos")

detallepedidos<-sqlFetch(canal,sqtable="Detalles de pedidos")

#Com fer merge d´aquestes dos taules
pedidostotal<-merge(x=pedidos,y=detallepedidos,by=c("IdPedido"))

#Per veure l´estructura d´un datagrama amb str
str(pedidostotal)
#Com carregar un dataframe mitjançant una sentencia SQL
pedidos2<-sqlQuery(canal,"SELECT * FROM Pedidos")
#Com carregar una dataframe mitjançant uns sentencia SQL
pedidos2<-sqlQuery(canal,"Select IdCliente, FechaPedido from ")


#Com carregar una taula que te espais en blanc en el nom  corchetes
pedidos2<-sqlQuery(canal,"SELECT * FROM [Detakkes de pedidos2")

#Per carregar a la vegada pedidos + detalles de pedidos
pedidostotal2<-sqlQuery(canal,"Select * from Pedidos, [Detalles de pedidos] where Pedidos.IdPedido =[Detalles de pedidos].IdPedido")


str(pedidostotal)

#Per treballar amb dates, tinc que convertir el camp POSIXct amb Date

pedidostotal$FechaPedido<-as.Date(pedidostotal$FechaPedido,'%Y/%m/%d')

pedidostotal$FechaEntrega<-as.Date(pedidostotal$FechaEntrega,'%Y/%m/%d')

#Anem a calcular el temps transcorregut entre 2 dates

pedidostotal$tiempo<-pedidostotal$FechaEntrega-pedidostotal$FechaPedido

#Si tenim que fer un calcul, s´ha de convertir la columna de Tiempo a numero

pedidostotal$tiempo<-as.numeric(pedidostotal$tiempo)

#PRACTICA1
#En una columna nov anomenada tiempo2, calcular quans anys han passat de la
#Fecha PEDIDO, FINS el 01/01/2010
#tenint en compte que necessito una variable de temps
data1<-as.Date('2010-01-01')
pedidostotal$tiempo2<-data1-pedidostotal$FechaPedido
pedidostotal$tiempo2<-as.numeric(pedidostotal$tiempo2)
pedidostotal$tiempo2<-round(pedidostotal$tiempo2)/365,)


#PRACTICA2
#tiempo3, quans mesos han passat de la Fecha Pedido fins avui,
data2<-Sys.Date()
pedidostotal$tiempo3<-((Sys.Date()-pedidostotal$FechaPedido)/365)*12


#Com crear columnes noves partint de dates, posar en una columna l´any

pedidostotal$Año<-as.numeric(format(pedidostotal$FechaPedido,'%Y'))

pedidostotal$Mes<-as.numeric(format(pedidostotal$FechaPedido,'%m'))

pedidostotal$Dia<-as.numeric(format(pedidostotal$FechaPedido,'%d'))

#Mes i dia de la setmana en lletres
pedidostotal$Nommes<-format(pedidostotal$FechaPedido,'%B')
pedidostotal$Nomdia<-format(pedidostotal$FechaPedido,'%A')

#com eliminar files en blanc,  NA, primer afegirem una fila en blanc

pedidostotal2[nrow(pedidostotal2)+1,]<-NA
#per qualsevol valor
pedidostotal<-na.omit(pedidostotal)
#per una columna concreta
pedidostotal3<-pedidostotal2[!is.na(pedidostotal2$IdPedido),]

#Anem a veure el primer valor del camp Destinatario
pedidostotal[1,"Destinatario"]

#Per localitzar la posició d´una cadena dins del valor d´una columna 
#farem servir la funció gregexpr
posicion<-gregexpr("a",pedidostotal[1,"Destinatario"])

#tinc que convertir una llista en un vector de dades
resultado<-unlist(posicion)
resultado[3]
#per saber quants elements té un vector de dades. length
length(resultado)

#volem agafar nomes el text entre les dues primeres a, farem servir substring

cadena<-substr(pedidostotal[1,"Destinatario"],resultado[1],resultado[2])
cadena

#el final d´una cadena alfanumèrica s´esbrina amb nchar

nchar(pedidostotal[1,"Destinatario"])


#Agrupar dades d´un dataframe, PaísDestinatario, farem servir
#aggregate, primer el nom del camp que volem resumir, segon una llista amb
#els camps que volem agrupar, el tipus, sum, mean, maxm, min

agrupadopais<-aggregate(pedidostotal$Cantidad,list(pedidostotal$PaísDestinatario), sum)
agrupadopais

colnames(agrupadopais)<-c("País","Promig")

#Suma per pais i Ciutat
agrupadopaisciudad<-aggregate(pedidostotal$Cantidad,list(pedidostotal$PaísDestinatario,pedidostotal$CiudadDestinatario),sum)

View(agrupadopaisciudad)

colnames(agrupadopaisciudad)<-c("Pais","Ciudad","Cantidad")

#endreçar un dataframe, per una o + d´una columna
agrupadopaisciudad<-agrupadopaisciudad[order(agrupadopaisciudad$Pais,agrupadopaisciudad$Ciudad),]

#anem a veure una funció que automaticament ens separa registres per un camp
#un camp, split

dividirpaises<-split(pedidostotal,f=list(pedidostotal$PaísDestinatario))

venezuela<-dividirpaises$Venezuela
estadosunidos<-dividirpaises$'Estados Unidos'

#Desar una taula d´un país concret a la BBDD

sqlSave(canal,estadosunidos,rownames=FALSE)

rm(list = ls())

#instal.lar paquet ggplot2, per fer grafics

install.packages("ggplot2")









