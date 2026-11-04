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
 * @id CLS_09_02_006_FAIL_EXTENDS_ENUM
 * @expect compile-fail
 * @section 9.2
 * @design extends子句指向枚举类型应编译失败
 * @note 反向用例：spec §9.2规定extends只能指向类类型，不能指向枚举
 */
enum ColorKind {
  Red,
  Green,
  Blue
}
class BadEnumClass extends ColorKind {
}
