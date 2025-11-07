import 'bank_account.dart';
import 'interest_bearing.dart';

class SavingsAccount extends BankAccount implements InterestBearing {
  static const double _minimumBalance = 500;
  static const double _interestRate = 0.02;
  int _withdrawalCount = 0;
  static const int _withdrawalLimit = 3;

  SavingsAccount(int accountNumber, String name, double balance)
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
    if (_withdrawalCount >= _withdrawalLimit) {
      print("Withdrawal limit reached (3 per month).");
      return;
    }
    if (balance - amount < _minimumBalance) {
      print("Cannot withdraw. Minimum balance of \$$_minimumBalance required.");
    } else {
      balance -= amount;
      _withdrawalCount++;
      print("Withdrew \$${amount.toStringAsFixed(2)}. Remaining Balance: \$${balance.toStringAsFixed(2)}");
    }
  }

  @override
  double calculateInterest() {
    return balance * _interestRate;
  }
}
