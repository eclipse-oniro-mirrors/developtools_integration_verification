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
 * @id CLS_09_06_0004_FAIL_DUPLICATE_FIELD_MODIFIER
 * @expect compile-fail
 * @section 9.6
 * @design 重复字段修饰符导致编译错�?
 * @note 反向用例：spec规定字段修饰符不得重�?
 */
class DupModField {
  static static x: int = 0
}
