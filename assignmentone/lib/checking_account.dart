import 'bank_account.dart';

class CheckingAccount extends BankAccount {
  static const double _overdraftFee = 35.0;

  CheckingAccount(int accountNumber, String name, double balance)
      : super(accountNumber, name, balance);

  @override
  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print("Deposited \$${amount.toStringAsFixed(2)}. New Balance: \$${balance.toStringAsFixed(2)}");
    } else {
      print("Invalid deposit amount!");
    }
  }

  @override
  void withdraw(double amount) {
    balance -= amount;
    if (balance < 0) {
      balance -= _overdraftFee;
      print("Overdraft! \$$_overdraftFee fee applied. Current balance: \$${balance.toStringAsFixed(2)}");
    } else {
      print("Withdrew \$${amount.toStringAsFixed(2)}. Balance: \$${balance.toStringAsFixed(2)}");
    }
  }
}
