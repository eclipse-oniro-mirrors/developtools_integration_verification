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
 * @id TYP_03_21_06_009_RUNTIME_INDEX
 * @expect runtime
 * @section 3.21.6
 * @design Record 索引读写运行时行为
 * @note 运行时用例
 */
type K9 = 'key1' | 'key2' | 'key3'

function main(): void {
  let x: Record<K9, number> = {'key1': 1, 'key2': 2, 'key3': 4}
  if (x['key2'] != 2) throw new Error("initial value failed")
  x['key2'] = 8
  if (x['key2'] != 8) throw new Error("after write failed")
  console.log("Record index runtime verified")
}