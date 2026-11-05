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
 * @id EXP2_17_16_022_RUNTIME_INSTANCEOF_BRANCH
 * @expect runtime
 * @section 17.16
 * @design 运行时验证 instanceof 多分支类型分发
 * @note 运行时用例：通过 instanceof 实现模拟模式匹配，验证各分支正确执行
 */
class Fruit {
  public name: string = 'fruit'
}
class Apple extends Fruit {
  public color: string = 'red'
}
class Banana extends Fruit {
  public color: string = 'yellow'
}

function identify(f: Fruit): string {
  if (f instanceof Apple) {
    return 'apple'
  } else if (f instanceof Banana) {
    return 'banana'
  } else {
    return 'unknown'
  }
}

function main(): void {
  let a: Fruit = new Apple()
  let b: Fruit = new Banana()
  let u: Fruit = new Fruit()

  if (identify(a) != 'apple') {
    throw new Error('FAIL: Apple not identified, got: ' + identify(a))
  }
  if (identify(b) != 'banana') {
    throw new Error('FAIL: Banana not identified, got: ' + identify(b))
  }
  if (identify(u) != 'unknown') {
    throw new Error('FAIL: unknown not identified, got: ' + identify(u))
  }
  console.log('PASS: instanceof branch dispatch correct')
}
