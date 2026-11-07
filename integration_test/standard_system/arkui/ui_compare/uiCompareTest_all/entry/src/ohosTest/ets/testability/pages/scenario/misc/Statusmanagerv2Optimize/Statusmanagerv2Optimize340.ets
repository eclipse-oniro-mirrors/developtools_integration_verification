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
class ClassB {
  @Trace num1: number = 10;
  public num2: number = 20;
}

@ObservedV2
class ClassA {
  b: ClassB = new ClassB();
}

@Entry
@ComponentV2
struct Indexop340 {
  @Local a: ClassA = new ClassA();

  @Computed
  get fullName():number {
    console.info('---------Computed----------');
    return this.a.b.num1 + this.a.b.num2;
  }

  build() {
    Column() {
      Text(`Trace属性计算: ${this.fullName}`) // 自动更新
      Button('changed lastName').onClick(() => {
        this.a.b.num1 = 30;
        this.a.b.num2 = 40;
      })
        .id('btn')
    }
  }
}