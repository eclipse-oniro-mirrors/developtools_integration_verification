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
 * @id CLS_09_04_004_FAIL_FIELD_METHOD_SAME_NAME
 * @expect compile-fail
 * @section 9.4
 * @design 同scope中instance字段和方法同名导致编译错�?
 * @note 反向用例：spec规定同scope字段方法同名报错
 */
class ConflictClass {
  data: string = "field"
  data(): string { return "method" }
}
