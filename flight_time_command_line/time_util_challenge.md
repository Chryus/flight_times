## THE CHALLENGE

You owe a big favor and have agreed to pick up a friend at the airport every Friday night. The airline on which your friend flies is cheap, but terrible with reporting delays and departure/arrival times. You soon realize that the 10pm flight is never on time and is usually late by more than an hour. If the plane has arrived at 11:15pm, 12:03am, 11:30pm, 11:23pm and 11:48pm, what is the average arrival time?

Does the solution still work if your friend changes to a flight arriving 6 hours later? What about 12 hours later?

## Program Output
The output should look something like this when run from the console:
```
>> average_time_of_day(["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"])
=> "12:01am"

>> average_time_of_day(["6:41am", "6:51am", "7:01am"])
=> "6:51am"
```

###Hint
Your digital ways will not help you, time of day is cyclical.
You may need to use the Math and Time classes.
