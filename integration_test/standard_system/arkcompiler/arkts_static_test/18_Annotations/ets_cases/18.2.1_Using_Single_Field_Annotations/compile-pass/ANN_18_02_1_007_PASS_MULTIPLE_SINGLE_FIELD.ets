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
 * @id ANN_18_02_1_007_PASS_MULTIPLE_SINGLE_FIELD
 * @expect compile-pass
 * @section 18.2.1
 * @design 验证多个单字段注解可同时使用
 * @note 正向用例：多个简写注解在同一类上
 */
@interface deprecated {
  version: string
}
@interface author {
  name: string
}

@deprecated("2.0")
@author('Alice')
class C {}
