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
 * @id EXP2_17_09_2_007_PASS_METHODOVERLOAD_SPECIALNAMES
 * @expect compile-pass
 * @section 17.9.2
 * @design overload 可包含 $_get, $_set 等特殊名称方法
 * @note 正向用例：特殊方法参与 overload
 */
class MyContainer {
  private value: int = 0
  $_get(key: string): int { return this.value }
  $_getByName(key: string, name: string): int { return this.value + name.length }
  overload $_get { $_get, $_getByName }
}
