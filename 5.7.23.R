resta10(80)

area_triangle<-function(base,alçada){
  base*alçada/2
}

area_triangle(10,5)


comp<-function(a,b){
  if (a>b) {
    print(paste("el número",a,"és més gran que el número",b))
  } else if (a<b) {
    print(paste("el número",a,"és més petit que el número",b))
  } else {
    print(paste("el número",a,"és igual que",b))
  }
}



# Pràctica 1; Crear una funció que ens doni l´area d´un cercle.

# Pràctica 2; Crear una funció que ens doni el import de descompte segons el valor,
de manera que si el número està entre 0-5000, li faré un 3,28% Dte., si
està entre 5001-20000, li faré un 4,76, i si és més gran de 20000 li faré un 5,04%



area_cercle<-function(R){
  
  pi*R^2
}
area_cercle(10) 



descompte<-function(X){
  if (X<0) {
    print(0)
  } else if (X<5001) {
         X*3.28/100
       } else if (X>20000) {
         X*5.04/100
         } else {
        X*4.76/100
           }
}
descompte(100000)


#funció switch

resultat<-switch(2,"Primer","Segon","Tercer")
print(resultat)

# Pràctica3     Crear una funció que donat un número entre el 1 i el 12 ens retorni el nom del
mes en lletres

mes<-function(X){
  if (X<1){print("Nombre no permés")
    } else if (X>12) {print("Nombre no permés")
    } else {
      mes<-switch(X,"Gener","Febrer","Març","Abril","Maig","Juny","Juliol","Agost","Setembre","Octubre","Novembre","Desembre")
      print(mes)
      } 
    }
mes(11)  

    
x<-200
f<-"Madrid"

if (x>300 | f=="Barcelona"){
  
  print("OK")
} 


if (x>300 & f=="Barcelona"){
  
  print("OK")
} 

for (i in 1:10){
  print(i)
}

#Pràctica 4. En un bucle for que vagi del valor 100 al 1000 imprimir en un text 
#"el valor de x està entre 75-325"
#si el valor no està en aquest inverval no imprimir


for (i in 100:1000){
  if (i>=275 & i<=325) {print(paste("el valor de",i,"està comprès entre 75-325"))
}
}


setmana<-c("Dilluns","Dimarts","Dimecres")
for (i in setmana){
  print(i)
}

gener2019<-read.csv("January 2019 Limpio.csv")
View(gener2019)

febrer2019<-read.csv("February 2019 Limpio.csv")
març2019<-read.csv("March 2019 Limpio.csv")


gener2019$Units


#Posar el camp mes a cada data.frame

gener2019$Month<-"Gener"


febrer2019$Month<-"Febrer"

març2019$Month<-"Març"

#Juntar els 3 dataframes en un de sol, amb rbind

trimestre<-rbind(gener2019,febrer2019,març2019)

trimestre$Units2<-trimestre$Units+10

sum(trimestre$Units)
mean(trimestre$Units)


max(trimestre$Units)

min(trimestre$Units)

#Com filtar dades d´un data.frame. Vull veure la sumna d´unitats de Canada
# amb subset
trimestre_canada<-subset(trimestre,Country=="Canada")

#Practica5, amb el dataframe trimestre, veure en un text
#que  posi "El total d´unitats és",la suma d´unitats
#de les factures que siguin de Brazil o de USA


#Practica 6, amb  amb el dataframe trimestre, veure en un text
#que  posi "El total d´unitats és",la suma d´unitats2
#que sera igual unitats -10%, solament pel pais Colombia



tri_BraUSA<-subset(trimestre,Country=="Brazil" |  Country=="USA" )
suma_BraUSA<-sum(tri_BraUSA$Units)
print(paste("El total d´unitats es",suma_BraUSA))




Tri_Colombia<-subset(trimestre, Country=="Colombia")
Tri_Colombia$Unitats3<-Tri_Colombia$Units*0.9
print(paste("El total de unitats -10% es",sum(Tri_Colombia$Unitats3)))




trimestre[1,2]

nrow(trimestre)

#Recorre totes les files del dataframe trimestre, per calcular en
#una columna nova que es digui Pac, a on te que dir la descripció ç
#pack, segons les unitats (Units), si està entre 0-50 dira pack 50
#si esta entre 50-150 dira pack 150, entre 150-300 dira pack 300
#i si es mes gran Pack total





for (i in 1:nrow(trimestre)){
  if (trimestre[i,"Units"]<51) { 
    trimestre[i,"Pack"]="Pack 50"
    
  }else if ((trimestre[i,3]<151)) {
    trimestre[i,"Pack"]="Pack 150"
    
  }else if ((trimestre[i,3]<301)) {
    trimestre[i,"Pack"]="Pack 300"
  } else {
    trimestre[i,"Pack"]="Pack total"
  
  }
}




