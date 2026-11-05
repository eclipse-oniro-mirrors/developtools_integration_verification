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
 * @id EXP2_17_14_007_FAIL_NOT_FUNCTION_TYPE
 * @expect compile-fail
 * @section 17.14
 * @design 最后一个参数不是函数类型时，使用 trailing lambda 语法应编译失败
 * @note 反向用例：process 的最后一个参数是 int 而非函数类型，trailing block 不匹配
 *       编译器应报 ESE0140: No matching call signature with trailing lambda
 */
function process(x: int): void {
  console.log(x)
}

process(42) { console.log('should not compile as trailing lambda') }
