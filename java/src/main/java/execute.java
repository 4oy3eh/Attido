import javafx.application.Application;
import javafx.stage.Stage;

import java.util.ArrayList;

public class execute extends Application {

    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage primaryStage) {
        Employee employee1 = new Employee("John", "Johnson", 2000, 500);
        Employee employee2 = new Employee("John", "Johnson", 1000, 100);
        Employee employee3 = new Employee("John", "Johnson", 10000, 100);
        Employee employee4 = new Employee("John", "Johnson", 300, 100);
        Employee employee5 = new Employee("John", "Johnson", 3000, 100);
        Employee employee6 = new Employee("John", "Johnson", 3999, 100);
        Employee employee7 = new Employee("John", "Johnson", 4000, 100);
        Employee employee8 = new Employee("John", "Johnson", 4001, 100);
        Employee employee9 = new Employee("John", "Johnson", 10000, 100);
        Employee employee10 = new Employee("John", "Johnson", 100000, 100);

        test(employee1);
        test(employee2);
        test(employee3);
        test(employee4);
        test(employee5);
        test(employee6);
        test(employee7);
        test(employee8);
        test(employee9);
        test(employee10);


        ArrayList<Employee> employees = new ArrayList<Employee>();
        employees.add(new Employee("John", "Johnson", 2000, 500));
        employees.add(new Employee("Bob", "Bobson", 4000, 200));
        employees.add(new Employee("Bob", "Bobson", 2900, 200));

        System.out.println("before change:");
        for (Employee employee : employees)
            System.out.println(employee);

        ArrayList<Employee> employeesUpdated = updateSalary(employees, 100, 5000, 1.1);
        System.out.println("after change:");
        for (Employee employee : employeesUpdated)
            System.out.println(employee);

    }

    private ArrayList<Employee> updateSalary(ArrayList<Employee> employees, int lowerRate, int upperRate, double coefficient) {

        for (Employee employee : employees) {

            if(employee.taxable_salary() > lowerRate && employee.taxable_salary() < upperRate ) {
                int newSalary;
                // I dont understand the 2nd task
                // Only employees, that have taxable salary less than 3000 EUR; 1) taxable salary is a salary+bonus-100, but you want to use getTax function from 1st task to do 2nd task
                // employee.getTax()< 3000 or employee.taxable_salary() < 3000 ?
                // lowerRate is not used
                // If multiplier will bring salary increase more than current tax amount,
                // salary increase means employee.getSalary() * (coefficient - 1) or final employee.getSalary() * coefficient
                // and what is tax amount?
                if (employee.getTax()< 3000 && (employee.getSalary() * coefficient) < upperRate)
                    newSalary = (int) (employee.getSalary() * coefficient);
                else if (employee.getTax()< 3000 && (employee.getSalary() * coefficient) > upperRate){
                    while (employee.getSalary() * coefficient < upperRate){
                        coefficient-=0.01;
                    }
                    newSalary = (int) (employee.getSalary() * coefficient);
                }
                else newSalary = employee.getSalary();
                Employee updatedEmployee = new Employee(employee.getFirstName(), employee.getLastName(), newSalary, employee.getBonus());
                employees.set(employees.indexOf(employee), updatedEmployee);
            }
        }
        return employees;
    }



    public void test(Employee qwe){
        int tax = qwe.getTax();
        System.out.println(tax);
    }
}
