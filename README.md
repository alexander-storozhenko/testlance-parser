
# Readme
# API
## Global variables

- `G_Q_TITLE` # question title
- `G_DESCRIPTION` # question description
- `G_USER_STATUS` # user status
- `G_NEXT_Q` # next question number
- `G_Q_TYPE` # question type
- `G_TEST_TITLE` # test title
- `G_ANSWERS` # answers
format (table):
```lua
{1 = 'answer1', 2 = 'answer2'}
```
- `G_TRUE_ANSWERS` # true answers
format (table):
```lua
{1 = 'true'}
```
- `G_USER_ANSWERS` # user answers
format (table):
```lua
{1 = 'true'}
```
## Global functions
- `g_date_now(time_zone = false)` # current date 
format (string):
```lua
'mm/dd/yy'
```
- `g_time_now()` # current time 
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

![testlance-logo-title](https://user-images.githubusercontent.com/54493133/126072356-d1b6749d-8320-44c9-9b94-4e8fe4ede9c8.png)

---
*MIT license Copyright (c) 2021 Alexander Storozhenko*
