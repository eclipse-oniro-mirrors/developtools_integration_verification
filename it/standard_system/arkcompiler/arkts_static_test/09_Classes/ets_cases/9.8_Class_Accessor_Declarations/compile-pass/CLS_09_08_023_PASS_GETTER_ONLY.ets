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
 * @id CLS_09_08_023_PASS_GETTER_ONLY
 * @expect compile-pass
 * @section 9.8
 * @design getter-only（无setter）— 只读属性
 * @note 正向用例：仅有getter的accessor编译通过
 */
class ReadOnly {
  private _data: int = 100
  get data(): int { return this._data }
}
