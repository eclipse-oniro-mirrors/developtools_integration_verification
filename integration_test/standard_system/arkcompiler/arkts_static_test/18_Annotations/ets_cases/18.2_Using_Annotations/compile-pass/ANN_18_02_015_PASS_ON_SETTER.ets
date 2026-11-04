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
 * @id ANN_18_02_015_PASS_ON_SETTER
 * @expect compile-pass
 * @section 18.2
 * @design 验证注解可应用于 setter
 * @note 正向用例：注解在 setter 上
 */
@interface Validated {}

class C {
  private _val: int = 0
  @Validated
  set val(v: int) {
    this._val = v
  }
}
