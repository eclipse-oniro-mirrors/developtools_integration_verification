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
 * @id EXP_07_06_04_003_PASS_MULTIPLE_FIELDS
 * @expect compile-pass
 * @section 7.6.4
 * @design 多字段对象字面量编译通过：5 个字段从左到右排列，验证多字段字面量编译正常
 * @note 正向用例：验证多字段对象字面量编译通过
 */
class Data {
    public a: number = 0
    public b: number = 0
    public c: number = 0
    public d: number = 0
    public e: number = 0
}
let d: Data = {
  a: 1,
  b: 2,
  c: 3,
  d: 4,
  e: 5,
}
