// println "hi"

/* while loop exercise================
crtpin ='123'
i=0
while(i<3){
	pin=System.console().readLine "Enter pin"
	if(pin == crtpin){
		println" succefully logged in"
		break
	}
	else{
		i++
		println "wrong pin"
			if(i==3){
				println "password limit exceeded"
			
			}
	}
	
	
}
================================================== 

//For loop and for in loop=======================
for (i in "sample") {
	println i

}
println "="*20
mylist=[10,"20"*3]
for (i in mylist){
	println i
}
println "="*20
for(i in 1..10){
	println i
}
println "="*20
for(i=0;i<10;i++){
	if(i==5 || i==7){
		continue
	}
	println i
}
===================================================

//for loop exercise
for( i in 1..50){
	if(i%3==0 && i%5==0){
		println "FizzBuzz"
	}
	else if(i%3==0){
		println "Fizz"
	}
	else if(i%5==0){
		println "buzz"
	}
	else
	{
		println i
	}
}


System.console().readLine ""
=====================================================

//Switch case
key=System.console().readLine "Enter the number"
key=key.toInteger()
switch(key)
{
	case 1..2:
	println "The entered number is 1 or 2"
	break
	case 3:
	println "The entered number is 3"
	break
	case 4:
	println "The entered number is 4"
	break
	case 5:
	println "The entered number is 5"
	break
	default:
	println "The entered number is invalid"
}
===================================================

// Switch case with regex
key=System.console().readLine "Enter the string: "
switch(key){
	case ~/[a-zA-z]+/ :
	println "alphabet"
	break
	case ~"[0-9]+":
	println "number"
	break
	case ~"[^a-zA-Z0-9]+":
	println "special char"
	break
	deafult:
	println"none"
	
}
=====================================================

//Arrays or list
mylist=[10,"20",3.4,"Groovy",89,10,20,8101,3829.1,2920]
len=mylist.size()
println "size: $len"
println mylist[0,3]
println mylist[0..3] //this is for range 
println mylist
mylist[3]="linux"
println mylist

mylist.length()
======================================================

// array methods
mylist=[10,"20",3.4,"Groovy",89,10,20,8101,3829.1,2920]
println mylist.size()
println mylist.count(10)
println mylist.remove(2)
println mylist.pop()
println mylist.sort()
println mylist.reverse()
mylist.add(7878)
println mylist
println mylist.contains(20)
mylist.push(68)
println mylist
println mylist.drop(3)
println mylist
======================================================

//hash map or dictionary or map
emp_det=[1:"Jhon",102:"sjs",103:"siri"]
empdet2=[1:["jon",344,232],2:"ddf"]
println emp_det[1]
println empdet2[1]
println empdet2[1][1]
empdet2[1][1]=5000
println empdet2

=====================================================

//dict exercise
car_info=["RollsRoyce":["black","spector","1000000"],"Ford":["black","MustangGt","infinite"],"Benz":["black","s class","1000000"]]
println car_info["Ford"]
println car_info.getClass()
for (i in car_info){
println i
}
=====================================================

//dict methods
car_info=["RollsRoyce":["black","spector","1000000"],"Ford":["black","MustangGt","infinite"],"Benz":["black","s class","1000000"]]
println car_info.keySet()
println car_info.values()
println car_info.size()
println car_info.containsKey("Ford")

car_info=["RollsRoyce":["black","spector","1000000"],"Ford":["black","MustangGt","infinite"],"Benz":["black","s class","1000000"]]
k=car_info.keySet()
for (i in k){
	println i +" => "+ car_info[i]
}
====================================================

// File handling
fo=new File("new 1.txt")
if(fo.exists()){
	println "file exists"
}
else{
	println "file doesnt exists"
}
//k=fo.getText() // this is for small text file and reads as a string 
//println k
*/


fo=new File("new 1.txt")
k=fo.readLines() // this is for reading large files in list format
for(i in k){
	
	
	if(i=~/^groovy$/){
	println i
	}
}
//println k[2..3]