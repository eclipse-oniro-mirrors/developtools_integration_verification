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
 * @id LEX_02_01_039_FAIL_CHAR_STRING_MISMATCH
 * @expect compile-fail
 * @section 2.1
 * @design 测试因子checklist: 基础类型与转换 - char与string类型混用应编译失败
 * @note 反向用例：验证char类型不能直接赋值给string变量
 */
function main(): void {
  let c: char = c'A'
  let s: string = c  // 错误：char不能隐式转换为string
}