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
 * @id EXP2_17_09_5_002_PASS_CTOROVERLOAD_BASIC
 * @expect compile-pass
 * @section 17.9.5
 * @design 构造函数 overload 基本声明（命名构造函数在列表中，匿名构造函数隐式优先）
 * @note 正向用例：基本 constructor overload
 */
class NumericValue {
  private val: int
  constructor fromInt(v: int) { this.val = v }
  constructor fromDbl(v: double) { this.val = new Double(v).toInt() }
  overload constructor { fromInt, fromDbl }
}
