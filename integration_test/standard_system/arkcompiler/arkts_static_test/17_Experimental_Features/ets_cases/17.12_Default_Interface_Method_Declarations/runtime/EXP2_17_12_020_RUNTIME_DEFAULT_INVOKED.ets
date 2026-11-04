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
 * @id EXP2_17_12_020_RUNTIME_DEFAULT_INVOKED
 * @expect runtime
 * @section 17.12
 * @design 接口声明默认方法，类不重写，运行时验证默认方法确实被调用并产生预期输出
 * @note 运行时用例：验证默认方法在运行时的实际调用行为
 */
interface IGreeter {
  greet(): string {
    return 'Hello from default'
  }
}

class Person implements IGreeter {
  public name: string = 'Alice'
}

function main(): void {
  let p: Person = new Person()
  let result: string = p.greet()
  if (result != 'Hello from default') {
    throw new Error("FAIL: expected 'Hello from default', got '" + result + ''')
  }
  // 验证可以多次调用
  let result2: string = p.greet()
  if (result2 != 'Hello from default') {
    throw new Error('FAIL: second call mismatch')
  }
  console.log('PASS: default method invoked correctly')
}
