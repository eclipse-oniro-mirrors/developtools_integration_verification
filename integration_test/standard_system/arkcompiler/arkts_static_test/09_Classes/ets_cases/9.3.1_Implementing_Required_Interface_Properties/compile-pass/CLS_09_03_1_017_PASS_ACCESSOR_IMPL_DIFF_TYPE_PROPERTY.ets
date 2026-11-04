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
 * @id CLS_09_03_1_017_PASS_ACCESSOR_IMPL_DIFF_TYPE_PROPERTY
 * @expect compile-pass
 * @section 9.3.1
 * @design getter+setter不同类型的接口属性用accessor pair实现编译通过
 * @note 正向用例：spec规定当接口属性由getter和setter定义且返回类型与参数类型不同时，
 *       可以用getter+setter accessor pair分别实现
 *       Spec依据：spec §9.3.1 示例class E — accessor pair实现不同类型getter/setter
 */
interface IDiffTypeProp017 {
  get n(): number
  set n(v: string)
}
class AccessorImplDiffType implements IDiffTypeProp017 {
  private _n: number = 0
  get n(): number { return this._n }
  set n(v: string) { this._n = Number(v) }
}
