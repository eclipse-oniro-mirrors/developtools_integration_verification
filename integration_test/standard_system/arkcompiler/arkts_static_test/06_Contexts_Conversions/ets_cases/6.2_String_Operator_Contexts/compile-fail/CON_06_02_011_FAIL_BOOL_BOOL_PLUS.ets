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
 * @id CON_06_02_011_FAIL_BOOL_BOOL_PLUS
 * @expect compile-fail
 * @section 6.2
 * @design '+' 运算符两侧均为 boolean 且无 string 操作数，应编译失败
 * @note 反向用例：两个非 string 且非数值类型间 '+' 无定义，应产生编译时错误
 */
function testNoStringOperandFail(): void {
  let s: string = true + false
}
