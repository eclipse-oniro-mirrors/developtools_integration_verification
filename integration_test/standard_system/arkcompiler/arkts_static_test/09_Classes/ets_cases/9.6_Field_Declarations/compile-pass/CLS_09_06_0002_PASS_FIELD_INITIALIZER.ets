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
 * @id CLS_09_06_0002_PASS_FIELD_INITIALIZER
 * @expect compile-pass
 * @section 9.6
 * @design 字段初始化器表达式编译通过
 * @note 正向用例：验证字段使用表达式初始化器
 */
class FieldInit {
  a: int = 10 + 5
  b: string = "hello"
  c: double = 3.14
}
