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
 * @id CLS_09_03_1_016_FAIL_FIELD_IMPL_DIFF_TYPE_PROPERTY
 * @expect compile-fail
 * @section 9.3.1
 * @design getter+setter不同类型的接口属性用单个field实现导致编译错误
 * @note 反向用例：spec规定当接口属性由getter和setter定义且返回类型与参数类型不同时，
 *       不能用单个field实现（field类型无法同时满足getter返回类型和setter参数类型）
 *       Spec依据：spec §9.3.1 示例class D — field类型number不匹配setter参数类型string
 */
interface IDiffTypeProp016 {
  get n(): number
  set n(v: string)
}
class FieldImplDiffType implements IDiffTypeProp016 {
  n: number = 0
}
