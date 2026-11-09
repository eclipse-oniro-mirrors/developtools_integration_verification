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

// 内层类：使用@ObservedV2装饰，包含@Trace属性和普通属性
@ObservedV2
class Address330 {
  @Trace city: string;  // 有Trace装饰的属性
  public street: string;        // 没有装饰器的属性

  constructor(city: string, street: string) {
    this.city = city;
    this.street = street;
  }
}

// 外层类：使用@ObservedV2装饰，嵌套被装饰器装饰的Address类
@ObservedV2
class User330 {
  @Trace name: string;
  @Trace age: number;
  @Trace address: Address330;  // 嵌套被装饰器装饰的class

  constructor(name: string, age: number, address: Address330) {
    this.name = name;
    this.age = age;
    this.address = address;
  }
}

@Entry
@ComponentV2
struct Parent330 {
  @Provider('data1') user: User330 = new User330('XIAOL', 18, new Address330('Beijing', 'Street 1'));

  build() {
    Column() {
      Text(`Parent - name: ${this.user.name}`).fontSize(30)
      Text(`Parent - age: ${this.user.age}`).fontSize(30)
      Text(`Parent - city: ${this.user.address.city}`).fontSize(30)
      Text(`Parent - street: ${this.user.address.street}`).fontSize(20)

      Divider()
      Child330()
    }
  }
}

@ComponentV2
struct Child330 {
  @Consumer('data1') user: User330 = new User330('XIAOL', 18, new Address330('Beijing', 'Street 1'));

  build() {
    Column() {
      Text(`Consumer - name: ${this.user.name}`).fontSize(20)
      Text(`Consumer - city: ${this.user.address.city}`).fontSize(20)
      Text(`Consumer - street: ${this.user.address.street}`).fontSize(18)

      Button('刷新用户对象')
        .onClick(() => {
          // 步骤1: 实例化赋值刷新@Consumer装饰的状态变量
          this.user = new User330('Molly', 25, new Address330('Shanghai', 'Street 2'));
        })
        .id('btn_refresh_user')

      Button('刷新Trace属性')
        .onClick(() => {
          // 步骤2: 刷新里层嵌套里被Trace修饰的属性
          this.user.address.city = 'Guangzhou';
        })
        .id('btn_refresh_trace')

      Button('刷新普通属性')
        .onClick(() => {
          // 步骤3: 刷新里层嵌套里未被装饰器修饰的属性
          this.user.address.street = 'New Street 3';
        })
        .id('btn_refresh_normal')
    }
  }
}

