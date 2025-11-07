import 'bank_account.dart';

class Bank {
  final List<BankAccount> _accounts = [];

  void addAccount(BankAccount account) {
    _accounts.add(account);
    print("Account ${account.accountNumber} added successfully.");
  }

  BankAccount? findAccount(int accountNumber) {
    return _accounts.firstWhere(
      (a) => a.accountNumber == accountNumber,
      orElse: () => throw Exception("Account not found."),
    );
  }

  void transfer(int fromAcc, int toAcc, double amount) {
    try {
      BankAccount from = findAccount(fromAcc)!;
      BankAccount to = findAccount(toAcc)!;

      from.withdraw(amount);
      to.deposit(amount);
      print("Transfer of \$${amount.toStringAsFixed(2)} completed from ${from.accountHolderName} to ${to.accountHolderName}.");
    } catch (e) {
      print("Transfer failed: ${e.toString()}");
    }
  }

  void generateReport() {
    print("\n----- Bank Account Report -----");
    for (var acc in _accounts) {
      acc.displayAccountInfo();
    }
  }
}
