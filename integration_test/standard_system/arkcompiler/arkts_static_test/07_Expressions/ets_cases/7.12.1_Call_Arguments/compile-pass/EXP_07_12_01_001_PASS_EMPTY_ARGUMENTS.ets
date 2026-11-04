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
 * @id EXP_07_12_01_001_PASS_EMPTY_ARGUMENTS
 * @expect compile-pass
 * @section 7.12.1
 * @design 验证空参调用：callArguments 中 argumentSequence 可选，() 合法
 * @note 正向用例：空参数列表函数调用 func()，验证 argumentSequence? 语法规则
 */
function greet(): string {
  return 'hello';
}

function main(): void {
  let s: string = greet();
}
