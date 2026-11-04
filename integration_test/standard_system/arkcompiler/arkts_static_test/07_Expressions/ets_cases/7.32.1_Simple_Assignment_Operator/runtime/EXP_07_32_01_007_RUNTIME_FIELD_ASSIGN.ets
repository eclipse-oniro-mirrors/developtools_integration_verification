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
 * @id EXP_07_32_01_007_RUNTIME_FIELD_ASSIGN
 * @expect runtime
 * @section 7.32.1
 * @design 字段赋值运行时验证

 * @note 运行时用例：实际执行验证字段赋值
 */
class C { public f: int = 0}
function main(): void {
  let c: C = new C()
  c.f = 42
  if (c.f != 42) {
    throw new Error('assertion failed: field assignment')
  }
console.log('verified')
}
