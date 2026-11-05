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
 * @id TYP_03_21_06_010_RUNTIME_OBJECT_LITERAL
 * @expect runtime
 * @section 3.21.6
 * @design Record 对象字面量运行时值正确
 * @note 运行时用例
 */
type K10 = 'a' | 'b'

function main(): void {
  let r: Record<K10, string> = {'a': "alpha", 'b': "beta"}
  if (r['a'] != "alpha" || r['b'] != "beta") throw new Error("literal value failed")
  console.log("Record object literal runtime verified")
}