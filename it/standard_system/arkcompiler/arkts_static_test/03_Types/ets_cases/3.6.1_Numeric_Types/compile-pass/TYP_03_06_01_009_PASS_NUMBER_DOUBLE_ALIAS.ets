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
 * @id TYP_03_06_01_009_PASS_NUMBER_DOUBLE_ALIAS
 * @expect compile-pass
 * @section 3.6.1
 * @design number 是 double 的别名，二者完全等价
 * @note 正向用例：number 与 double 互换使用
 */
function testNumberDoubleAlias(): void {
  let n: number = 3.14
  let d: double = n      // 完全互换
  let n2: number = d

  // Number 别名
  let cap: Number = 1.0
  let cap2: number = cap
}