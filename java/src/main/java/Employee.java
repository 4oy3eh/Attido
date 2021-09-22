import java.math.BigDecimal;
import java.util.ArrayList;

public class Employee {
    private String firstName;
    private String lastName;
    private int salary;
    private int bonus;

    public int getTax(){

        int salaryNetto, taxable_salary;
        taxable_salary = taxable_salary();
        if (taxable_salary>4000) salaryNetto = (int) ((taxable_salary*0.39) + 1600);
        else if (taxable_salary<=4000 && taxable_salary>500) salaryNetto = (int) (taxable_salary*0.78);
        else salaryNetto = (int) (taxable_salary * 0.9);

        return salaryNetto;
    }


    public String toString() {
        return "Employee: name = " + firstName + " lastName = " + lastName + " salary = " + salary
                + " bonus = " + bonus;
    }


    public Employee(String firstName,String lastName,int salary,int bonus) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.salary = salary;
    this.bonus = bonus;


    }
    //Some constructors
//Task methods

    public int taxable_salary(){
        int salaryBrutto = this.salary;
        int bonus = this.bonus;
        return salaryBrutto + bonus - 100;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public int getBonus() {
        return bonus;
    }

    public void setBonus(int bonus) {
        this.bonus = bonus;
    }
}
