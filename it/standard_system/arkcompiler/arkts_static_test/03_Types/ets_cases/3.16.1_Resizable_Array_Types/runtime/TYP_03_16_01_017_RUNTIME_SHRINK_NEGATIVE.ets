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
 * @id TYP_03_16_01_017_RUNTIME_SHRINK_NEGATIVE
 * @expect runtime
 * @runtime-throws=RangeError
 * @section 3.16.1
 * @design 验证数组长度设置为负数时抛出运行时错误
 * @note 运行时用例：验证负数长度导致运行时错误
 * @note 注意：Spec 声明应为编译时错误，但实现为运行时错误
 */
function main(): void {
  let arr: number[] = [1, 2, 3]
  arr.length = -1  // 应该抛出运行时错误
  console.log("should not reach here")
}
