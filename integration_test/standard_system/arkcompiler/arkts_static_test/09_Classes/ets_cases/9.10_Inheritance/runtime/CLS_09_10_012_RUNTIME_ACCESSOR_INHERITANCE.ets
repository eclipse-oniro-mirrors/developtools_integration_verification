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
 * @id CLS_09_10_012_RUNTIME_ACCESSOR_INHERITANCE
 * @expect runtime
 * @section 9.10
 * @design 运行时验证getter/setter继承与重写：派生类可继承和重写访问器
 * @note 运行时用例：基类定义getter/setter，派生类继承并可override，验证运行时行为
 */
class Counter {
  private _value: int = 0

  get value(): int {
    return this._value
  }

  set value(v: int) {
    this._value = v
  }

  public increment(): void {
    this._value = this._value + 1
  }
}

class BoundedCounter extends Counter {
  private _max: int = 100

  get max(): int {
    return this._max
  }

  set max(m: int) {
    this._max = m
  }

  public increment(): void {
    if (this.value < this._max) {
      this.value = this.value + 1
    }
  }
}

function main(): void {
  let c: Counter = new Counter()
  c.value = 10
  if (c.value != 10) {
    throw new Error("Counter getter/setter failed: " + c.value)
  }
  c.increment()
  if (c.value != 11) {
    throw new Error("Counter increment failed: " + c.value)
  }

  let bc: BoundedCounter = new BoundedCounter()
  bc.value = 5
  bc.max = 10
  if (bc.value != 5) {
    throw new Error("inherited getter failed: " + bc.value)
  }
  if (bc.max != 10) {
    throw new Error("own getter failed: " + bc.max)
  }

  bc.increment()
  bc.increment()
  bc.increment()
  bc.increment()
  bc.increment()
  if (bc.value != 10) {
    throw new Error("BoundedCounter increment should stop at max: " + bc.value)
  }

  bc.increment()
  if (bc.value != 10) {
    throw new Error("BoundedCounter should not exceed max: " + bc.value)
  }

  console.log("Accessor inheritance verified")
}
