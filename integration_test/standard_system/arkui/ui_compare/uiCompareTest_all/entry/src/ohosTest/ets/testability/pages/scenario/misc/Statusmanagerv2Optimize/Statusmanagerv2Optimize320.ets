/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// 内层类：没有装饰器的普通class
class Address320 {
  public city: string;
  public street: string;

  constructor(city: string, street: string) {
    this.city = city;
    this.street = street;
  }
}

// 外层类：使用@ObservedV2装饰，嵌套没有装饰器的Address类
@ObservedV2
class User320 {
  @Trace name: string;
  @Trace age: number;
  @Trace address: Address320;  // 嵌套没有装饰器的class

  constructor(name: string, age: number, address: Address320) {
    this.name = name;
    this.age = age;
    this.address = address;
  }
}

@Entry
@ComponentV2
struct Parent320 {
  @Provider('data1') user: User320 = new User320('XIAOL', 18, new Address320('Beijing', 'Street 1'));

  build() {
    Column() {
      Text(`Parent - name: ${this.user.name}`).fontSize(30)
      Text(`Parent - age: ${this.user.age}`).fontSize(30)
      Text(`Parent - city: ${this.user.address.city}`).fontSize(30)

      Divider()
      Child320()
    }
  }
}

@ComponentV2
struct Child320 {
  @Consumer('data1') user: User320 = new User320('XIAOL', 18, new Address320('Beijing', 'Street 1'));

  build() {
    Column() {
      Text(`Consumer - name: ${this.user.name}`).fontSize(20)
      Text(`Consumer - city: ${this.user.address.city}`).fontSize(20)

      Button('刷新用户对象')
        .onClick(() => {
          // 实例化赋值刷新@Consumer装饰的状态变量
          this.user = new User320('Molly', 25, new Address320('Shanghai', 'Street 2'));
        })
        .id('btn_refresh_user')
    }
  }
}

