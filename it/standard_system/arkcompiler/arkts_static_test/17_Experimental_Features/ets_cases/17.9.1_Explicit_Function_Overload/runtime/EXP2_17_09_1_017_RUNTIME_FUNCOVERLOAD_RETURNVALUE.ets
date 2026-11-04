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
 * @id EXP2_17_09_1_017_RUNTIME_FUNCOVERLOAD_RETURNVALUE
 * @expect runtime
 * @section 17.9.1
 * @design overload 调用返回正确值
 * @note 运行时用例：验证返回值的正确性
 */
function lenStr(s: string): int { return s.length }
function lenArr<T>(arr: T[]): int { return arr.length }
overload lengthOf { lenStr, lenArr }

function main(): void {
  let s: string = 'hello'
  let n: int = lengthOf(s)
  if (n != 5) {
    throw new Error("Expected 5, got " + n)
  }

  let arr: int[] = [1, 2, 3, 4, 5]
  let m: int = lengthOf(arr)
  if (m != 5) {
    throw new Error("Expected 5, got " + m)
  }

  console.log('Return value dispatch verified')
}
