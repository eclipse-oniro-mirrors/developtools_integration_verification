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
 * @id LEX_02_03_028_FAIL_LOGICAL_AND_SPLIT
 * @expect compile-fail
 * @section 2.3
 * @design 逻辑与 && 中间含 Space 拆为 & & 改变运算符语义，导致语法/语义错误 * @note 反向用例：验证该场景应产生编译时错误

 */
function testLogicalAndSplit(): void {
  let a: boolean = true
  let b: boolean = false
  let c: boolean = a & & b
}
