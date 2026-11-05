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
 * @id EXP_07_35_01_005_PASS_RETURN_TYPE_ANNOTATION
 * @expect compile-pass
 * @section 7.35.1
 * @design 验证 Lambda 表达式带显式返回类型注解 (params): ReturnType => body 的多种场景
 * @note 正向用例：验证显式返回类型注解的正确用法
 */
function main(): void {
  // 带返回类型注解的单参数 Lambda
  const f: (x: int) => int = (x: int): int => x * x
  const g: (s: string) => string = (s: string): string => s + s

  // 带返回类型注解的多参数 Lambda
  const add: (a: int, b: int) => int = (x: int, y: int): int => x + y

  // 带返回类型注解的无参 Lambda
  const getVal: () => string = (): string => 'result'

  // 带返回类型注解且返回类型不同于参数类型
  const lenFn: (s: string) => int = (s: string): int => s.length

  // 验证实际调用值正确
  let r1: int = f(6)
  let r2: string = g('hi')
  let r3: int = add(10, 20)
  let r4: string = getVal()
  let r5: int = lenFn('hello')

  if (r1 != 36) { throw new Error('FAIL: f(6)')
}
  if (r2 != 'hihi') { throw new Error('FAIL: g('hi')') }
  if (r3 != 30) { throw new Error('FAIL: add(10,20)')
}
  if (r4 != 'result') { throw new Error('FAIL: getVal()')
}
  if (r5 != 5) { throw new Error('FAIL: lenFn')
}
console.log('verified')
}
