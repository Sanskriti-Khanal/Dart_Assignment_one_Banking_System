import 'savings_account.dart';
import 'checking_account.dart';
import 'premium_account.dart';
import 'bank.dart';

void main() {
  Bank bank = Bank();

  // Create accounts
  var acc1 = SavingsAccount(1001, "Alice", 1000);
  var acc2 = CheckingAccount(1002, "Bob", 500);
  var acc3 = PremiumAccount(1003, "Charlie", 15000);

  // Add accounts to the bank
  bank.addAccount(acc1);
  bank.addAccount(acc2);
  bank.addAccount(acc3);

  // Perform transactions
  acc1.withdraw(200);
  acc1.withdraw(200);
  acc1.withdraw(200); // limit reached

  acc2.withdraw(600); // overdraft
  acc3.deposit(5000);
  acc3.withdraw(8000);

  // Transfer between accounts
  bank.transfer(1003, 1002, 2000);

  // Calculate interest (for interest-bearing accounts)
  print("\nInterest on Savings: \$${acc1.calculateInterest().toStringAsFixed(2)}");
  print("Interest on Premium: \$${acc3.calculateInterest().toStringAsFixed(2)}");

  // Generate full report
  bank.generateReport();
}
