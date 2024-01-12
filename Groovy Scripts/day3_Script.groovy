
/*
//println "heloo"
//regex
fo=new File("day3.txt")
k=fo.readLines() 
for(i in k){
	
	
	if(i=~/ab*c/){
	println i
	}
	
}
println "*"*20
for(i in k){
	
	
	if(i=~/ab+c/){
	println i
	}
	
}
println "*"*20
for(i in k){
	if(i=~/^\w+\s\w+\s\w+$/){
	println i 
	}
}
for(i in k){
	if(i=~/.{2}/){
	println i 
	}
}

//. one character
// .* zero or more character

=============================

name=System.console().readLine "Enter the name: "
phNo=System.console().readLine "Enter the number: "
email=System.console().readLine "Enter the mail: "
if(name=~/[a-zA-Z]{2,}/){
	println "valid name"
	}
	else{
	println "invalid name"}
if(phNo=~/^[6-9]\d{9}$/){
	println "valid number"
	}
	else{
	println "invalid number"}	
	
if(email=~/\w+@\w+\.[a-zA-Z]{2,4}/){
	println "valid mail"
	}
	else{
	println "invalid mail"}
======================================	
// word patter -\b-boundary	

fo=new File("day3.txt")
k=fo.readLines() 
for(i in k){
	
	
	if(i=~/\babc\b/){
	println i
	}
	
}
println "*"*20
for(i in k){
	
	
	if(i=~/^abc$/){
	println i
	}
	
}
println "*"*20
//starting and ending with same word
for(i in k){
	
	
	if(i=~/^\babc\b.*\babc\b$/){
	println i
	}
	
}
=========================================

//fuctions
//without arguments
def f1(){
	println "welcome to fuctions"
}
f1()
//with arguments
def calculator(a,b){
	sum= a+b
	sub= a-b
	mul= a*b
	div= a/b
	println "sum of $a and $b is $sum"
	println "sub of $a and $b is $sub"
	println "mul of $a and $b is $mul"
	println "div of $a and $b is $div"
}

 calculator(10,20)
 //=========================================================
 //def k=10   this is to create a local variabl
 //=========================================================


def f1(){
	//println "welcome to fuctions"
	//def k=10
	a=10
}
println f1()
//println a // this will show output because by default it is global variable
//println k this will give error because this is set to local scope with def keyword

 def f2(){
	
	return a=10 // either we can specify or no need to specify
}
println f1()

def f2(a=10,b){
	println a+b
}
f2(10)

==========================================================

//Modules 

import arithmetic as ar //alias name
result = new ar().sum(10,20)
println result

import groovy.json.JsonSlurper
//import groovy.json.JsonBuilder

fo=new File("js.json")
//def k=fo.readLines() 
def JsonSlurper=new JsonSlurper()
def jsonObject = JsonSlurper.parse(new File('js.json'))
println jsonObject
//println "Name: ${jsonObject.employees}"
//println k.getClass()

import groovy.json.JsonOutput

def filepath= 'js.json'
def jsonData =[name :"pooru",age :21,position:"ASE"]
def jsonContent=JsonOutput.toJson(jsonData)
new File(filepath).text =jsonContent
println "Data succesfullu written on $filepath"

//to know to address location
a=324
println System.identityHashCode(a)


//List are mutable
myList=[12,24,32432,23,12]
println System.identityHashCode(myList[2])


//Command line arguments or positional parameters
host_info =args
host_uname=args[0]
password =args[1]
println args
println host_uname
println password

num1=10
num2=0
try{
	def result=num1/num2
	println "result: $result"
	
}
catch(ArithmeticException e){
	println "ArithmaticException :${e.message}"
}
catch(Exception e){
	println "an :${e.message}"
}

//filenotfoundexception 
try{
	fo=new File("jssss.json")
	k=fo.readLines() 
}
catch(FileNotFoundException e){
	println  "not found"
}

=============================================
*/
//oops
class oops{
	def sum(a,b){
	println a+b
	}
}
obj=new oops()
obj.sum(10,20wwww)