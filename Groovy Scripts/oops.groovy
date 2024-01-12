//oops
/*
class x{
	 def x(){
	
	println "i am in const "
	}
	def a // Intialize the variable first
	def m1(){
	//def a =10  this will throw error we should intialize
		// a=10   as it is initialized we can do this but this not the best practice
		this.a=10
		
		println "inside x"
	}
	def m2(){
		def b=100
		println "inside x in m2"
		println b
		println a
	}
}
obj= new x()
 obj.m1()
obj.m2()

//parametrized constructor
class x{
	def a
	def b
	def x(a,b){
	this.a=a 
	this.b=b
	println "i am in const "
	}
	
	def m1(){
	
		println "inside ${a+b}"
	}
	def m2(){

		println "inside ${a+b}"
	}
}
obj= new x(10,20)
 obj.m1()
obj.m2()

========================================

//task -bank

class BankApp{
	final bankname="SBI"
	
	def cusname
	def custaccnum
	def bal 
	def add
	
	def BankApp(cusname,custaccnum,bal,add){
		this.cusname=cusname
		this.custaccnum=custaccnum
		this.bal=bal
		this.add=add
	}
	
	def withdraw(amount){
	bal=bal-amount
	println "amount with draw succesfull "
	println "your account balance $bal"
		
	}
	
	def deposit(amount){
		bal=bal+amount
		println "amount deposit succesfull "
		println "your account balance $bal"
		
		
	}
	
	def baleq(){
		println "your account balance $bal"
	}
	
	def customerDetails(){
		println "name: $cusname"
		println "accNo: $custaccnum"
		println "balance: $bal"
		println "addrress: $add"
	}
	
}

println "                Welcome to SBI"
println "*"*40
obj=new BankApp("jeeva",12345671,10000,"6th sector")
obj.deposit(1000)
println "*"*20
obj.baleq()
println "*"*20
obj.customerDetails()
println "*"*20
obj.withdraw(100)
println "*"*20
*/

import test
def obj =new test()
 obj.show()