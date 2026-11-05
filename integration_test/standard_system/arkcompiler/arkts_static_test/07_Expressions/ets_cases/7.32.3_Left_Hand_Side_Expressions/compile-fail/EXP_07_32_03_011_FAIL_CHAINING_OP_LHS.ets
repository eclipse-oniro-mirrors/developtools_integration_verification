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
 * @id EXP_07_32_03_011_FAIL_CHAINING_OP_LHS
 * @expect compile-fail
 * @section 7.32.3
 * @design 验证包含可选链运算符 ?. 的表达式不能作为左值：obj?.field、obj?.method() 等包含 ?. 的表达式不可出现在赋值左侧
 * @note 反向用例：Spec 明确禁止包含 ?. 运算符的表达式作为左值，应产生 compile-time error
 */

class Data {
  public value: int = 0;
}

function main(): void {
  let x: int = 0;
  let d: Data | undefined = new Data();

  // 可选链字段作为左值（应报错）
  d?.value = x;

  console.log('verified');
}
