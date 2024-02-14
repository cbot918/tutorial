Golang 是用 struct資料型態 組合 function 去做 OOP, 滿方便好用的, 以下是簡單介紹

一個 Class (類) 有三個部分：
- Data Member
- Constructor
- Function Member (也稱作 Method)

Class 定義好之後, 接著就是會宣告物件(也稱作create instance), 像是 `user := new(User)`, 而在 go 中, 自己習慣另一種語法(看開源也大多用這種寫法), ` user := &User{}`, 好處是更方便設定初始值


以下是一個簡單寫法的例子
```go
package main

import (
  "fmt"
)

// data member
type User struct{
    Name string
    Email string
    Password string
}

// constructor 
func NewUser(name string, email string, password string) *User{
     return &User{
           Name: name,
           Email: email,
           Password: password,
     }
}

// function member
func (u *User) GetName() string {
      return u.Name
}
func (u *User) SetName(name string) {
      u.Name = name
}

func main(){
   
    user1 := NewUser("yale","yale@gmail.com", "11111")

    fmt.Println(user1.GetName())
    // yale
    user1.SetName("jack")
    fmt.Println(user1.GetName())
    // jack

}
```

上面 constructor 內的內容可以這樣置換
```go
return &User{
  Name: name,
  Email: email,
  Password: password,
}

同義於   
user := new(User)
user.Name = name
user.Email = email
user.Password = password

return user
```