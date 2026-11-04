/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
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
/**
 * @id CLS_09_10_002_PASS_MULTI_LEVEL_INHERITANCE
 * @expect compile-pass
 * @section 9.10
 * @design 多层继承链：祖父类→父类→子类，子类继承所有祖先的非静态可访问成员
 * @note 正向用例：多级继承，子类可访问所有祖先的public/protected成员
 */
class Vehicle {
  public wheels: int = 0
  protected speed: int = 0

  public getWheels(): int {
    return this.wheels
  }

  public move(): string {
    return "moving at " + this.speed
  }
}

class Car extends Vehicle {
  public brand: string = ""

  public setSpeed(s: int): void {
    this.speed = s
  }

  public getSpeed(): int {
    return this.speed
  }
}

class SportsCar extends Car {
  public turbo: boolean = true

  public getDescription(): string {
    let desc: string = this.brand + " with " + this.wheels + " wheels"
    return desc
  }

  public move(): string {
    this.speed = this.speed + 50
    return "sports car " + super.move()
  }
}

function testMultiLevel(): void {
  let sc: SportsCar = new SportsCar()
  sc.brand = "Porsche"
  sc.wheels = 4
  sc.setSpeed(100)
  let desc: string = sc.getDescription()
  let m: string = sc.move()
  let w: int = sc.getWheels()
}
