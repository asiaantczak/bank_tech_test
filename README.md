Bank tech test

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
### User Stories
```
As a bank account holder
So I can keep my money in a bank
I want to be able to make a deposit
```
```
As a bank account holder
So I can spend my money and enjoy my life
I want to withdraw cash from my account
```
```
As a bank account holder
So I can see how much money I have left on my account
I want to see the balance of each transaction
```
```
As a bank account holder
So I can see all the transactions on my account
I want to be able to print the account statement
```
My approach
---------

I have created 4 classes :
* Transaction: register single transaction for credit or debit.
  I decided to use hashes, and not initialise method with properties, to be able to create 2 different types of transactions - credit and debit;
* TransactionLog: stores all the transactions;
* Account: updates balance, also uses other classes to make (Transaction Class) and save the transaction (TransactionLog) and print statement;
* Statement: gives the statement the required format;

Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

Instruction for user
---------------------
* require files
```
$ irb
2.5.0 :001 > require './lib/account'
 => true
```
* create
```
$ irb
2.5.0 :002 > account = Account.new
 => #<Account:0x00007f803c11c308 @account_balance=0, @transaction_log=#<TransactionLog:0x00007f803c11c2e0 @transactions_list=[]>>
 ```

Main methods
---------
* account.make_deposit(30) - pays the money in, updates the balance
* account.withdraw(10) - withdraw the money, updates the balance
* account.print_statement - print the account statement, each transaction in separate line

Example
```
$ irb
2.5.0 :003 > account.make_deposit(500)
 => [{:credit=>"500.00", :balance=>"500.00", :date=>"20/06/2018"}]

2.5.0 :004 > account.withdraw(100)
=> [{:credit=>"500.00", :balance=>"500.00", :date=>"20/06/2018"}, {:debit=>"100.00", :balance=>"400.00", :date=>"20/06/2018"}]

2.5.0 :006 > account.print_account_statement
      date || credit || debit || balance
      20/06/2018 ||  || 100.00 || 400.00
      20/06/2018 || 500.00 ||  || 500.00
=> [{:debit=>"100.00", :balance=>"400.00", :date=>"20/06/2018"}, {:credit=>"500.00", :balance=>"500.00", :date=>"20/06/2018"}]
```
Testing
--------
Rspec + feature tests

Other gems used
--------
Rubocop for detecting style offences
SimpleCov for code coverage - (100.0%) covered
