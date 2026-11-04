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
 * @id EXP_07_02_05_011_RUNTIME_INDEX_ASSIGN_ORDER
 * @expect runtime
 * @section 7.2.5
 * @design 索引赋值表达式中数组→索引→值的求值顺序：arr[i] = val 按 A→I→V 顺序
 * @note 运行时用例：验证 Assignments Involving Indexing 的求值顺序
 */
let trace: string = ''

function track(label: string): int {
  trace = trace + label
  return 1
}

let data: int[] = [0, 0, 0]

function getArr(label: string): int[] {
  trace = trace + label
  return data
}

function getIdx(label: string): int {
  trace = trace + label
  return 0
}

function getVal(label: string): int {
  trace = trace + label
  return 42
}

function main(): void {
  // getArr("A") 先求值（数组引用），
  // 然后 getIdx("I") 求值（索引），
  // 最后 getVal("V") 求值（赋值值）
  // trace 应为 "AIV"
  getArr('A')[getIdx('I')] = getVal('V')
  if (trace != 'AIV') {
    throw new Error('index assign order fail: ' + trace)
  }
  if (data[0] != 42) {
    throw new Error('index assign value fail')
  }

  // 复合赋值：arr[i] += val
  trace = ''
  getArr('X')[getIdx('Y')] += getVal('Z')
  if (trace != 'XYZ') {
    throw new Error('compound index assign order fail: ' + trace)
  }
console.log('verified')
}
