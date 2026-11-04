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
 * @id EXP2_17_11_01_013_RUNTIME_FINAL_CLASS_METHOD_DISPATCH
 * @expect runtime
 * @section 17.11.1
 * @design final 类方法调度运行时验证：验证 final 类中声明的方法可直接调用和间接调用
 * @note 运行时用例：验证 final 类方法的直接和间接（lambda）调用行为
 */
final class Dispatcher { public value: int = 0

  setValue(val: int): void {
    this.value = val
  }

  getValue(): int {
    return this.value
  }

  transform(fn: (x: int) => int): int {
    return fn(this.value)
  }
}

function main(): void {
  let obj: Dispatcher = new Dispatcher()
  obj.setValue(10)
  if (obj.getValue() != 10) {
    throw new Error("assertion failed: expected 10, got " + obj.getValue())
  }
  // Change value
  obj.setValue(25)
  if (obj.getValue() != 25) {
    throw new Error("assertion failed: expected 25, got " + obj.getValue())
  }
  // Lambda transform
  let result: int = obj.transform((x: int): int => { return x * 2 })
  if (result != 50) {
    throw new Error("assertion failed: expected 50, got " + result)
  }
  console.log('verified')}
