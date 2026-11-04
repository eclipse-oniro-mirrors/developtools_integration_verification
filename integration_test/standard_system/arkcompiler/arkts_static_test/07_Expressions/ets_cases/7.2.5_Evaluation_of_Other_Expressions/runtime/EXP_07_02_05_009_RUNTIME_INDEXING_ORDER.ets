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
 * @id EXP_07_02_05_009_RUNTIME_INDEXING_ORDER
 * @expect runtime
 * @section 7.2.5
 * @design 索引表达式中数组引用先于索引求值：arr[idx] 中 arr 先求值再求 idx
 * @note 运行时用例：验证 Indexing Expression 中数组引用先于索引求值
 */
let trace: string = ''

function track(label: string): int {
  trace = trace + label
  return 1
}

let data: int[] = [10, 20, 30]

function getArr(label: string): int[] {
  trace = trace + label
  return data
}

function getIdx(label: string): int {
  trace = trace + label
  return 0
}

function main(): void {
  // getArr("A") 先求值（数组引用），然后 getIdx("I") 求值（索引）
  // trace 应为 "AI"
  let v: int = getArr('A')[getIdx('I')]
  if (trace != 'AI') {
    throw new Error('indexing order fail: ' + trace)
  }
  if (v != 10) {
    throw new Error('indexing value fail')
  }

  // 重置 trace 测试嵌套索引：arr[arr[idx]]
  trace = ''
  let v2: int = getArr('X')[getIdx('Y')]
  if (trace != 'XY') {
    throw new Error('nested indexing order fail: ' + trace)
  }
console.log('verified')
}
