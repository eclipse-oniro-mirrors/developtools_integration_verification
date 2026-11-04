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
 * @id CLS_09_06_5_009_FAIL_LATE_INIT_NULLISH_TYPE
 * @expect compile-fail
 * @section 9.6.5
 * @design late init字段为nullish类型导致编译错误
 * @note 反向用例：spec规定late init字段不能为nullish类型（包括T | null、T | undefined等）
 *       Spec依据：spec §9.6.5 "Field with late initialization cannot be of a
 *       nullish type. Otherwise, a compile-time error occurs."
 *       注：CLS_09_06_5_005已测试optional(?)的nullish形式，
 *       本用例补充测试显式union类型的nullish形式
 */
class LateInitNullish {
  val!: number | null
}
