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
 * @id CLS_09_07_007_PASS_OVERRIDE_METHOD
 * @expect compile-pass
 * @section 9.7.5
 * @design 方法重写：override修饰符明确标识重写，保持相同的默认参数值
 * @note 正向用例：正确的override使用，包含带默认参数的重写
 */
class Vehicle007 {
  start(immediate: boolean = false): string {
    if (immediate) {
      return "Started immediately"
    }
    return "Starting..."
  }

  stop(): string {
    return "Stopped"
  }

  getType(): string {
    return "Vehicle"
  }
}

class Car007 extends Vehicle007 {
  // Override with same default parameter value
  override start(immediate: boolean = false): string {
    if (immediate) {
      return "Car started immediately"
    }
    return "Car starting..."
  }

  // Override without default params (none in parent)
  override stop(): string {
    return "Car stopped"
  }

  // Override is optional - without 'override' keyword still works
  getType(): string {
    return "Car"
  }
}

class Truck007 extends Vehicle007 {
  // override keyword is optional but recommended
  start(immediate: boolean = false): string {
    if (immediate) {
      return "Truck started"
    }
    return "Truck starting..."
  }

  override stop(): string {
    return "Truck stopped"
  }
}

function testOverrideMethods(): void {
  let v: Vehicle007 = new Vehicle007()
  v.start()
  v.stop()

  let c: Car007 = new Car007()
  c.start(true)
  c.stop()

  let t: Truck007 = new Truck007()
  t.start(false)
  t.stop()
}
