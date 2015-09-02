# Description

распарсить файлы из ./inbox/

Имя файла - это <id счета>_<тип>_<дата>
Это не конечный набор и могут быть файлы с названиями не соответствующими этим и их нужно игнорить

Сгруппировать и вывести на экран:
<id счета>
  <дата>
    <тип в порядке [account, activity, position, security]>
Т.е. должно получиться что-то вроде
U79014
  2015-01-12
    account 
    activity
    position
    security
  2015-01-13
    account 
    activity
    position
    security
  ...
U6342
  ...

# Setup
type in console:

```
bundle install
```

# Tests & code style
type:

```
rspec
```
and/or
```
rubocop
```

# Run
and hit the keys with:

```
ruby app.rb
```
