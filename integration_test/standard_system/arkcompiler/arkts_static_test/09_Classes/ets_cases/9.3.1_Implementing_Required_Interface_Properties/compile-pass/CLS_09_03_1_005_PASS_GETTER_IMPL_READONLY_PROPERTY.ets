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
 * @id CLS_09_03_1_005_PASS_GETTER_IMPL_READONLY_PROPERTY
 * @expect compile-pass
 * @section 9.3.1
 * @design getter实现接口readonly属性编译通过
 * @note 正向用例：spec规定readonly属性可由getter实现
 */
interface IReadProp3 {
  readonly r: number
}
class CGetterRead implements IReadProp3 {
  get r(): number { return 42 }
}
