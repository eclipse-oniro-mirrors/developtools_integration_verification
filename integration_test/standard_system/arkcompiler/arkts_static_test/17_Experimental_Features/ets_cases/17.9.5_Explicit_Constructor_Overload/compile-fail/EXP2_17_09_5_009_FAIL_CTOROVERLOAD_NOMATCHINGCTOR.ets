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
 * @id EXP2_17_09_5_009_FAIL_CTOROVERLOAD_NOMATCHINGCTOR
 * @expect compile-fail
 * @section 17.9.5
 * @design 调用 constructor overload 但无匹配签名 — 编译错误
 * @note 反向用例：参数类型不匹配任何构造函数
 */
class OnlyInt {
  private v: int
  constructor fromOne(a: int) { this.v = a }
  constructor fromTwo(a: int, b: int) { this.v = a + b }
  overload constructor { fromOne, fromTwo }
}

function main(): void {
  // boolean 不在任何构造函数签名中 — 应编译失败
  let obj: OnlyInt = new OnlyInt(true)
}
