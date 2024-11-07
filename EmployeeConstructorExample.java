
class Employee{
	String name;
	int id;
	double gross;
	double basic;
	
Employee(String name, int id ,double basic){
	this.name=name;
	this.id=id;
	this.basic=basic;
}
public void grosssalry() {
	double hra=basic*0.3;
	double da=hra*0.24;
	gross=basic+hra+da;
}
public void display() {
	System.out.println("name:"+name);
	System.out.println("id:"+id);
	System.out.println(gross);
}
	
}
class EmployeeConstructorExample
{
	public static void main(String[] args)
	{ 
		Employee em=new Employee("ram",24,1000);
		em.grosssalry(); 
		em.display();
	}
}
