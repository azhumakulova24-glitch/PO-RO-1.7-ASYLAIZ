//AsylaiZH
//OOP TASK
class Student
{
    public string Name;
    public int Grade1;
    public int Grade2;
    public int Grade3;
    public double GetAverage()
    {
        return (Grade1 + Grade2 + Grade3) / 3.0;
    }
    public string GetLetterGrade()
    {
        double avg = GetAverage();
        if (avg >= 90)
            return "A";
        else if (avg >= 75)
            return "B";
        else if (avg >= 60)
            return "C";
        else
            return "F";
    }
    public void Print()
    {
        Console.WriteLine(Name + ": average = " + GetAverage() + ", grade = " + GetLetterGrade());
    }
}
class Program
{
    static void Main()
    {
        Student[] roster = new Student[4];
        roster[0] = new Student { Name = "Asylai", Grade1 = 90, Grade2 = 85, Grade3 = 88 };
        roster[1] = new Student { Name = "Aiken", Grade1 = 70, Grade2 = 75, Grade3 = 72 };
        roster[2] = new Student { Name = "Aruzhan", Grade1 = 70, Grade2 = 92, Grade3 = 96 };
        roster[3] = new Student { Name = "Moldir", Grade1 = 60, Grade2 = 65, Grade3 = 58 };
        foreach (Student s in roster)
        {
            s.Print();
        }
        Student best = roster[0];
        foreach (Student s in roster)
        {
            if (s.GetAverage() > best.GetAverage())
            {
                best = s;
            }
        }
        Console.WriteLine("\nStudent with biggest average is: " + best.Name);
    }
}

//Task2
class BankAccount
{
    public string Owner { get; }
    public decimal Balance { get; private set; }
    public BankAccount(string owner, decimal initialDeposit)
    {
        if (initialDeposit < 0)
            throw new ArgumentException();

        Owner = owner;
        Balance = initialDeposit;
    }
    public void Deposit(decimal amount)
    {
        if (amount <= 0)
            throw new ArgumentException();

        Balance = Balance + amount;
    }
    public void Withdraw(decimal amount)
    {
        if (amount <= 0)
            throw new ArgumentException();

        if (amount > Balance)
            throw new InvalidOperationException("Insufficient funds");

        Balance = Balance - amount;
    }
    public void PrintStatement()
    {
        Console.WriteLine("Owner: " + Owner);
        Console.WriteLine("Balance: " + Balance);
    }
}
class Program
{
    static void Main()
    {
        BankAccount acc = new BankAccount("asylai", 100m);
        acc.Deposit(50m);
        acc.Withdraw(30m);
        try
        {
            acc.Withdraw(1000m);
        }
        catch (Exception e)
        {
            Console.WriteLine(e.Message);
        }
        // acc.Balance = 9999m;
        acc.PrintStatement();
    }
}

//Task3
class Temperature
{
    private double _celsius;
    public double Celsius
    {
        get { return _celsius; }
        set
        {
            if (value < -273.15) throw new ArgumentException();
            _celsius = value;
        }
    }
    public double Fahrenheit
    {
        get { return _celsius * 9 / 5 + 32; }
        set { Celsius = (value - 32) * 5 / 9; }
    }
    public Temperature(double celsius)
    {
        Celsius = celsius;
    }
    public void Print()
    {
        Console.WriteLine(Celsius + "°C / " + Fahrenheit + "°F");
    }
}
class Program
{
    static void Main()
    {
        Temperature t = new Temperature(25);
        t.Print();
        t.Fahrenheit = 100;
        t.Print();
        try
        {
            t.Celsius = -300;
        }
        catch (Exception e)
        {
            Console.WriteLine(e.Message);
        }
    }
}