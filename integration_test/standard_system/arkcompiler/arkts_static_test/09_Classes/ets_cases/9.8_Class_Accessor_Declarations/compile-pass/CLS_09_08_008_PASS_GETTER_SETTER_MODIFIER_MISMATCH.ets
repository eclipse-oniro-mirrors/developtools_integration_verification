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
 * @id CLS_09_08_008_PASS_GETTER_SETTER_MODIFIER_MISMATCH
 * @expect compile-pass
 * @section 9.8
 * @design 同名 getter 与 setter 修饰符不同（PDF原文§9.8无此禁止规则）
 * @note 2026-07-17 PDF原文核查：§9.8无getter+setter修饰符一致性规则，此规则来自markdown版本新增。
 *       从compile-fail移回compile-pass。不是编译器bug。
 */
class DataHolder {
  private _data: int = 0
  static get data(): int { return 0 }
  set data(v: int) { // Compile-time error, getter is static but setter is not
    this._data = v
  }
}
