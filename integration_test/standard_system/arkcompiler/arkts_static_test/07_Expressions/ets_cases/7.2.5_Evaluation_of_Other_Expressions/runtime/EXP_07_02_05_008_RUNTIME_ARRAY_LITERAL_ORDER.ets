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
 * @id EXP_07_02_05_008_RUNTIME_ARRAY_LITERAL_ORDER
 * @expect runtime
 * @section 7.2.5
 * @design 数组字面量元素从左到右求值顺序：[e1, e2, e3] 中每个元素表达式按顺序求值
 * @note 运行时用例：验证 Resizable Array Creation 中数组字面量元素按 XYZ 顺序求值
 */
let trace: string = ''

function track(label: string): int {
  trace = trace + label
  return 1
}

function main(): void {
  let arr: int[] = [track('X'), track('Y'), track('Z')]
  if (trace != 'XYZ') {
    throw new Error('array literal order fail: ' + trace)
  }
  if (arr[0] + arr[1] + arr[2] != 3) {
    throw new Error('array literal value fail')
  }
console.log('verified')
}
