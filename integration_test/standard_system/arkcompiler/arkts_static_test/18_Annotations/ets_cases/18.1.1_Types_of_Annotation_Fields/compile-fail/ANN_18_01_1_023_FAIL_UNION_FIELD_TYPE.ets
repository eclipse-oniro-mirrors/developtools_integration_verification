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
 * @id ANN_18_01_1_023_FAIL_UNION_FIELD_TYPE
 * @expect compile-fail
 * @section 18.1.1
 * @design 验证联合类型不能作为注解字段类型
 * @note 反向用例：联合类型不是允许的注解字段类型
 */
@interface A {
  val: string | int
}
