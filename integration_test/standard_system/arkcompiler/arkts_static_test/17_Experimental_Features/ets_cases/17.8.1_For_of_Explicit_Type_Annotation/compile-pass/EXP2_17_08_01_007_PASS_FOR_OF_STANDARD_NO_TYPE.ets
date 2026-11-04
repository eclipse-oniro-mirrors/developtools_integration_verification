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
 * @id EXP2_17_08_01_007_PASS_FOR_OF_STANDARD_NO_TYPE
 * @expect compile-pass
 * @section 17.8.1
 * @design 标准 for-of 循环无显式类型标注（对照）：验证标准 for-of 形式仍然正常工作
 * @note 正向用例：验证该特性编译通过的正确用法（对照基线）
 */
function testForOfStandardNoType(): void {
  let arr: int[] = [1, 2, 3]
  let sum: int = 0
  for (let v of arr) {
    sum = sum + v
  }
  console.log(sum)
}
