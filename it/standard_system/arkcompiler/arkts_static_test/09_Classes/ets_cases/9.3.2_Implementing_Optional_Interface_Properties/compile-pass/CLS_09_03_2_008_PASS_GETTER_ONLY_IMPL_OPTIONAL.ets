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
 * @id CLS_09_03_2_008_PASS_GETTER_ONLY_IMPL_OPTIONAL
 * @expect compile-pass
 * @section 9.3.2
 * @design 只有getter实现可选接口属性编译通过
 * @note 正向用例：spec规定可选接口属性可以只用getter实现，
 *       不实现setter也是合法的
 *       Spec依据：spec §9.3.2 示例 — 可选属性可用getter-only实现
 */
interface IOptGetter8 {
  n?: number
}
class CGGetterOnly implements IOptGetter8 {
  get n(): number { return 42 }
}
