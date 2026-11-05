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
 * @id CLS_09_09_011_FAIL_CALL_AS_EXPRESSION
 * @expect compile-fail
 * @section 9.9.2
 * @design 显式构造器调用用作表达式 — spec: "Explicit constructor call is used as expression"
 * @note 反向用例：将super()调用赋值给变量，应编译失败
 */
class CLS_09_09_011_Base {
  constructor(x: int) {}
}
class CLS_09_09_011_Derived extends CLS_09_09_011_Base {
  constructor(x: int) {
    let v = super(x)
  }
}
