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
 * @id EXP_07_22_004_PASS_STRING_CONCATENATION
 * @expect compile-pass
 * @section 7.22
 * @design 验证字符串拼接 + 的类型组合：
 *          string+string→string, string+int→string,
 *          string+boolean→string, string+null/undefined→string
 * @note 正向用例：+ 对字符串执行拼接，任何类型可转为字符串
 */
function main(): void {
  let s: string = 'hello'
  let t: string = ' world'
  let n: int = 42
  let b: boolean = true

  // string + string → string
  let r1 = s + t
  let r1Type = typeof(r1)
  if (r1Type != 'string') {
    throw new Error('string+string should be string, got ' + r1Type)
  }

  // string + int → string
  let r2 = s + n
  let r2Type = typeof(r2)
  if (r2Type != 'string') {
    throw new Error('string+int should be string, got ' + r2Type)
  }

  // string + boolean → string
  let r3 = s + b
  let r3Type = typeof(r3)
  if (r3Type != 'string') {
    throw new Error('string+boolean should be string, got ' + r3Type)
  }

  // string + null → string
  let r4 = s + null
  let r4Type = typeof(r4)
  if (r4Type != 'string') {
    throw new Error('string+null should be string, got ' + r4Type)
  }

  // string + long → string
  let l: long = 100
  let r5 = s + l
  let r5Type = typeof(r5)
  if (r5Type != 'string') {
    throw new Error('string+long should be string, got ' + r5Type)
  }
console.log('verified')
}
main()
