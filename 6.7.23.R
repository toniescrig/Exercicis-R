
getwd()

setwd("C:/Curs R")


gener2019<-read.csv("January 2019 Limpio.csv")


#veure informació de l´estructura, amb str
str(gener2019)


#Substituir el # per un . per poder pasar un text que pot ser numèric a numèric


gener2019$Revenue<-sub("#",".",gener2019$Revenue)

#Que sigui un número

gener2019$Revenue<-as.numeric(gener2019$Revenue)


#com eliminar una columna, la tercera  

gener2019<-gener2019[,-3]

#com eliminar la fila 1

gener2019<-gener2019[-c(1),]

#com eliminar files en funció d´un criteri

gener2019<-gener2019[!(gener2019$Country=="Brazil"),]


#Pràctica 1  Carregar els 3 fitxers 2019.csv
#juntar tots en un de sol anomenat trimestre
#canviar el valor de Brazil per Brasil del camp Country
#Crear un dataframe nou que porti tots els registres que les unitats
#siguin >200 (trimestre>200),
#sobre aquest dataframe calcular la suma
#de Revenue dels registres ques siguin de Panama o de USA (en un text)

#Del dataframe trimestre crear una columna que posi Zona, de manera que si el
#Country es USA o Canada el valor sigui Zona Nort, si es Panama o Venezuela 
#que el valor sigui Zona Centro, pels demes Zona Sur.
#Veure en un text el valor del promig de Revenue de la Zona Nord


gener2019<-read.csv("January 2019 Limpio.csv")
febrer2019<-read.csv("February 2019 Limpio.csv")
març2019<-read.csv("March 2019 Limpio.csv")
trimestre<-rbind(gener2019,febrer2019,març2019)

trimestre$Revenue<-sub("#",".",trimestre$Revenue)
trimestre$Revenue<-as.numeric(trimestre$Revenue)

trimestre$Country<-sub("Brazil","Brasil",trimestre$Country)

trimestreM200<-subset(trimestre,Units>200)

trimestreM200<-subset(trimestreM200,Country=="USA"|Country=="Panama")
print(paste("la suma de Renevue de les unitats >200 es", sum(trimestreM200)))


suma<-sum(trimestreM200$Revenue )


for(i in 1:nrow(trimestre)) {
  if (trimestre[i,"Country"=="USA" | trimestre[i,"Country"=="Canada"
  {trimestre[i,"Zona"]<-"Zona Nord"
    } else if (trimestre[i,"Country"=="Panama" | trimestre[i,"Country"=="Venezuela"
  {trimestre[i,"Zona"]<-"Zona Centre"
  } else {
    trimestre[i,"Zona"]<-"Zona Sur"
  }                                                      
}

trimestreZNord<-subset(trimestre,Zona=="Zona Nord")
print(paste("el promig de Revenue de la zona Nord es de ",mean(trimestre$Revenue)))


#Com desar el data.frame resultan, amb Write primer el dataframe, després
#amb file=nom fitxer amb l´extensió, row.names=FALSE

write.table(trimestreZNord,file="Ventas Zona Nord.xlsx",row.names=FALSE)


#Conectar amb un fitxer d´excel, per poder conectar tinc que tenir instal.alt un paquet de R
# readxl
#Com s´instal.la un paquet?
install.packages("readxl")
#El següent seria cridar el paquet
library(readxl)

telefonia<-read_excel("Datos Telefonia.xlsx",sheet="Datos")

localidad<-read_excel("Datos Telefonia.xlsx",sheet="Localidad")

Satisfacción_cliente<-read_excel("Datos Telefonia.xlsx",sheet="Satisfacción Cliente")


#Com combinar dos data.frames pels mateixos noms de camp

telefonia2<-merge(x=telefonia,y=localidad)

View(telefonia2)


#Practica2: Parint del fitxer  Datos telefonia.xlsx, carregarem 3 data frames
# amb Datos, Localidad, Satisfacción
# Fer les transformacions necessaries per esbrinar la suma de importe de factura
# de les factures de la Zona Centro y que els Clients estan molt satisfets.
#Desarem el resultat del data.frame final (portara tot), en un fitxer d´Excel.


datos<-read_excel("Datos Telefonia.xlsx",sheet="Datos")

localidad<-read_excel("Datos Telefonia.xlsx",sheet="Localidad")

satisfacción_cliente<-read_excel("Datos Telefonia.xlsx",sheet="Satisfacción Cliente")


datos1<-merge(x=datos,y=localidad)


# canviant el nom de la columna, mitjançant una funció que es diu colnames

colnames(satisfacción_cliente)<-c("Satisfacción","Descripción")

#en el merge fer el següent

datos2<-marge(x=datos1,y=satisfacción_cliente,by.x="Satisfacción",by.y="Satisfacción Cliente")








