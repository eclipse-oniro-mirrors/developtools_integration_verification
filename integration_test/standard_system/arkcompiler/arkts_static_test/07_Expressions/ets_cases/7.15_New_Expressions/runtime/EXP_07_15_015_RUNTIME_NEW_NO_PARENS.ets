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
 * @id EXP_07_15_015_RUNTIME_NEW_NO_PARENS
 * @expect runtime
 * @section 7.15
 * @design 验证无括号 new A 运行时字段默认值正确
 * @note 运行时用例：无括号 new 表达式值验证
 */
class A {
  public v: int = 100
}

function main(): void {
  let a = new A
  if (a.v != 100) {
    throw new Error('assertion failed: expected 100, got ' + a.v)
  }
console.log('verified')
}
