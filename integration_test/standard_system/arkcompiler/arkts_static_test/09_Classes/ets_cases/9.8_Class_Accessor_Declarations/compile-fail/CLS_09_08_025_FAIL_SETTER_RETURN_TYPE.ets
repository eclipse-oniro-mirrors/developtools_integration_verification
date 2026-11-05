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
 * @id CLS_09_08_025_FAIL_SETTER_RETURN_TYPE
 * @expect compile-fail
 * @section 9.8
 * @design setter不能有返回类型 — spec: setter must have no return type
 * @note 反向用例：setter声明返回类型应编译失败
 */
class Bad {
  private _v: int = 0
  set value(v: int): int { this._v = v; return v }
}
