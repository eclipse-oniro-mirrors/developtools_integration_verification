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
 * @id EXP_07_35_02_008_PASS_NO_PARAMS_BLOCK_BODY
 * @expect compile-pass
 * @section 7.35.2
 * @design 验证无参数 Lambda 使用块体的正确用法
 * @note 正向用例：无参数 lambda 可以使用块体，块体内要有 return 返回非 void 类型值
 */
function main(): void {
  // 无参 lambda — 块体 + return int
  const f1: () => int = (): int => {
    return 42
  }
  // 无参 lambda — 块体 + return string
  const f2: () => string = (): string => {
    return 'hello'
  }
  // 无参 lambda — 块体多语句
  const f3: () => int = (): int => {
    let a: int = 10
    let b: int = 20
    return a + b
  }

  let r1: int = f1()
  let r2: string = f2()
  let r3: int = f3()

  if (r1 != 42) {
    throw new Error('FAIL: f1()')
  }
  if (r2 != 'hello') {
    throw new Error('FAIL: f2()')
  }
  if (r3 != 30) {
    throw new Error('FAIL: f3()')
  }
console.log('verified')
}
