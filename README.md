This project was created during the professional course on software development from CodeClan. It was the first individual project, after about 3 weeks of training. The time limit to create proto personas, client needs, client journey, project planning and coding was a week.

The Project description was as follows:

# Programming & Web Fundamentals

Over the next week you have the chance to consolidate and expand on everything you have learned:

- Ruby fundamentals
- TDD (where appropriate)
- OOP
- Web Programming ( REST/MVC )
- Databases with CRUD actions

## MoneyCashboard

You want to start tracking your spending in an attempt to be more frugal with money. You have decided to make a budgeting app to help you see where all of your money is being spent.

You must be able to create new Transactions ( which should include a merchant name, e.g. Tesco, and a value ) which have an associated Tag (e.g. 'food', 'clothes'). Your app would then be able to track a total, and display this in a view.

### MVP:

- Create new transactions
- Display a list of all transactions
- Display total amount spent
- Display total amount spent by tag

### Possible Extensions:

- CRUD actions for the transactions
- Show a warning when the total expenditure is over budget (set a hard coded budget first)
- Add a date to the transactions and view total spending by month
- Any other ideas you might come up with

----------------------------------------------------------------


Due to time limitations the project is not fully functional, the table for budget needed to be expanded and more functionalities were planned .

How to run:

requirements:
you will need, Terminal ,Postgresql, Sinatra and a webBrowser;

Steps :
1- clone the git repo to a folder of your choice;
2- created a Database called Moneydashboard
3- use psql -d Moneydashboard -f db/moneydashboard.sql
4- on the Main folder run : ruby db/seeds.rb
5- on the main folder run : ruby app.rb
6 - open browser on http://localhost:4567/

and now you can explore the application!

If you liked my project or have suggestions or any other questions, please email me at :
jcnequinha@gmail.com

I will get back to you as soon as possible.
