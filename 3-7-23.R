x<-5
x
f<-"Dimarts"


X<-35


q<-as.Date("2022-10-05")

avui<-Sys.Date()

dies<-avui-q
#Com esbrinar de quina clase es una variable u objecte, amb la funció class
Class(avui)


#La impressió amb R, mitjançant print
dia<-"Dimecres"
resultat<-paste("Dema serà",dia)
parells<-c(2,4,6,8,10)
class(parells)
num<-1:10
num
semana<-c("Dilluns","Dimarts","Dimecres")
print(semana)
semana[1]
misnum<-25:50
suma= misnum[2]+misnum[4]+misnum[5]
resultat<-paste("El resultat final es",suma)
print(resultat)
semestre<-c("Gener","Febrer","Març","Abril","Maig","Juny")
print(paste("El tercer mes de l´any és",semestre[3]))
misnum*2
misnum>35
sum(misnum)
mean(misnum)
min(misnum)
max(misnum)
median(misnum)
quantile(misnum)
summary(misnum)



numeros1<-c(1,3,5)
numeros2<-c(2,4,6)
numeros3<-c(numeros1,numeros2)
numeros3




alumne1<-c(5.5,7.2,8.2)
alumne2<-c(6.3,5.9,7.9)
alumne3<-c(8.9,7.6,4.2)
alumnes=c(alumne1,alumne2,alumne3)
print(paste("El promig de notes es",round(mean(alumnes),2)))
print(paste("La nota més alta es",max(alumnes)))
print(paste("La nota més baixa es",min(alumnes)))



s<-10

if (s<10) {
  print ("el valor és més petit de 10")
} else {
  print ("el valor és igual o més gran de 10")
}


if (alumne2[2]>6) {
  print ("Matèria aprovada")
} else {
  print ("Matèria no aprovada")
}


if (mean(alumnes)>6) {
  print ("Matèria aprovada")
} else {
  print ("Matèria no aprovada")
}



x<-7.2
if (x<=6) {
  print ("materia aprovada")
} else if (x<=8){
  print ("materia aprovada")
} else {
  print("Excel.lent!")
}


w<-80


if (w<0) {
  print ("número no vàlid")
} else if (w>100) {
  print ("número no vàlid")
} else if (w<=25) {
  print (paste("el número",w,"està comprés entre 0 i 25"))
} else if (w<=50) {
  print (paste("el número",w,"està comprés entre 25 i 50"))
} else if (w<=75) {
  print (paste("el número",w,"està comprés entre 50 i 75"))
} else if (w<=100){
  print (paste("el número",w,"està comprés entre 75 i 100"))
}

resta3<-function(pepe){
  pepe-3
}


resta3(33)



resta3<-function(pepe,carmen){
  pepe-carmen
}

resta3(5,2)

resta10<-function(x){
  x-10
}

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
    print "eñls "
  }
}

