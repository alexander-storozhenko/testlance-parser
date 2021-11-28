
# Readme
# API
## Global variables

- `Q_TITLE` # question title
- `DESCRIPTION` # question description
- `USER_STATUS` # user status
- `NEXT_Q` # next question number
- `Q_TYPE` # question type
- `TEST_TITLE` # test title
- `ANSWERS` # answers
format (table):
```lua
{1 = 'answer1', 2 = 'answer2'}
```
- `TRUE_ANSWERS` # true answers
format (table):
```lua
{1 = 'true'}
```
- `USER_ANSWERS` # user answers
format (table):
```lua
{1 = 'true'}
```
## Global functions
- `date_now(time_zone = false)` # current date 
format (string):
```lua
'mm/dd/yy'
```
- `time_now()` # current time 
format (string):
```lua
'hh:mm:ss'
```
## Helper functions

- `compare_dates(date_1, date_2)` # compare 2 dates. Format: "mm/dd/yy"
return (integer):
   - `-1` if left more than right
   - `1` if right more than left
   - `0` if right equals left

- `compare_times(date_1, date_2)` # compare 2 times. Format: "hh:mm:ss"
return (integer):
   - `-1` if left more than right
   - `1` if right more than left
   - `0` if right equals left
- `string_split(string, template)` # split string by template, return (table)
- `string_join(table, value)` # join string, return (string)

![testlance-logo-title](https://user-images.githubusercontent.com/54493133/126072356-d1b6749d-8320-44c9-9b94-4e8fe4ede9c8.png)

---
*MIT license Copyright (c) 2021 Alexander Storozhenko*
