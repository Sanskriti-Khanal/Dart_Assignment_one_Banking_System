// Abstract class - demonstrates ABSTRACTION
abstract class BankAccount {
  // ENCAPSULATION: private fields
  final int _accountNumber;
  final String _accountHolderName;
  double _balance;

  // Constructor
  BankAccount(this._accountNumber, this._accountHolderName, this._balance);

  // Getters and Setters
  int get accountNumber => _accountNumber;
  String get accountHolderName => _accountHolderName;
  double get balance => _balance;

  set balance(double newBalance) {
    if (newBalance >= 0) {
      _balance = newBalance;
    } else {
      print("Error: Balance cannot be negative.");
    }
  }

  // Abstract methods - must be implemented by subclasses
  void deposit(double amount);
  void withdraw(double amount);

  // Concrete method - shared by all
  void displayAccountInfo() {
    print("\nAccount Info:");
    print("Account Number: $_accountNumber");
    print("Account Holder: $_accountHolderName");
    print("Balance: \$$_balance");
  }
}
