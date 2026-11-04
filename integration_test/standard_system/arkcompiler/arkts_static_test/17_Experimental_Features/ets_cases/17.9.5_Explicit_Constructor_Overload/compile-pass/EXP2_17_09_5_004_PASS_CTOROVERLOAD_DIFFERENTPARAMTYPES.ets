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
 * @id EXP2_17_09_5_004_PASS_CTOROVERLOAD_DIFFERENTPARAMTYPES
 * @expect compile-pass
 * @section 17.9.5
 * @design 多个构造函数按参数类型区分
 * @note 正向用例：不同参数类型的命名构造函数重载
 */
class ValueHolder {
  private val: string
  constructor fromInt(v: int) { this.val = "int:" + v }
  constructor fromStr(v: string) { this.val = "str:" + v }
  constructor fromDbl(v: double) { this.val = "dbl:" + v }
  constructor fromBool(v: boolean) { this.val = "bool:" + v }
  overload constructor { fromInt, fromStr, fromDbl, fromBool }
}
