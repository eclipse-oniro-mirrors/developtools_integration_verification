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
 * @id CLS_09_03_2_002_PASS_OPTIONAL_FIELD_IMPL
 * @expect compile-pass
 * @section 9.3.2
 * @design optional字段实现可选属性编译通过
 * @note 正向用例：spec规定可选属性可由optional字段实现
 */
interface IOpt2 {
  num?: number
}
class COpt2 implements IOpt2 {
  num?: number = 42
}
