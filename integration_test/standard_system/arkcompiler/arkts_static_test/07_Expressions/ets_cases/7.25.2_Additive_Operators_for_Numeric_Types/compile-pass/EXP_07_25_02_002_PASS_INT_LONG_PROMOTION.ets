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
 * @id EXP_07_25_02_002_PASS_INT_LONG_PROMOTION
 * @expect compile-pass
 * @section 7.25.2
 * @design 验证 int+long→long 类型提升，int-long→long。
 *         spec：结果类型是转换为后最大的类型。
 * @note 正向用例：int/long 混合运算类型提升
 */
function main(): void {
  let i: int = 100
  let l: long = 99999999999

  // int + long → long
  let r1 = i + l
  let t1 = typeof(r1)
  if (t1 != 'long') {
    throw new Error('int+long should be long, got ' + t1)
  }

  // long + int → long
  let r2 = l + i
  let t2 = typeof(r2)
  if (t2 != 'long') {
    throw new Error('long+int should be long, got ' + t2)
  }

  // int - long → long
  let r3 = i - l
  let t3 = typeof(r3)
  if (t3 != 'long') {
    throw new Error('int-long should be long, got ' + t3)
  }
console.log('verified')
}
main()
