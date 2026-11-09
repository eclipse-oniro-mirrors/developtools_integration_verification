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

@ObservedV2
class User240 {
  @Trace name: string;
  @Trace age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

@Entry
@ComponentV2
struct Parent240 {
  @Provider('data1') users1: User240 = new User240('XIAOL', 18);

  build() {
    Column() {
      Text(`name: ${this.users1.name}`).fontSize(30)
      Child240()
      Button('add new user')
        .onClick(() => {
          this.users1 = new User240('Molly', 19);//Provider
        })
        .id('btn_add_user')

      Button('change name')
        .onClick(() => {
          this.users1.name = 'Shelly';//Trace
        })
        .id('btn_change_name')
    }
  }
}

@ComponentV2
struct Child240 {
  @Consumer('data1') users1: User240 = new User240('XIAOL', 18);

  build() {
    Column() {
      Text(`age: ${this.users1.age}`).fontSize(30)
      Divider()
    }
  }
}

