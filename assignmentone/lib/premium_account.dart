import 'bank_account.dart';
import 'interest_bearing.dart';

class PremiumAccount extends BankAccount implements InterestBearing {
  static const double _minimumBalance = 10000;
  static const double _interestRate = 0.05;

  PremiumAccount(int accountNumber, String name, double balance)
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
    if (balance - amount < _minimumBalance) {
      print("Cannot withdraw below minimum balance of \$$_minimumBalance.");
    } else {
      balance -= amount;
      print("Withdrew \$${amount.toStringAsFixed(2)}. Remaining Balance: \$${balance.toStringAsFixed(2)}");
    }
  }

  @override
  double calculateInterest() {
    return balance * _interestRate;
  }
}
