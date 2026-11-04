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
 * @id EXP_07_15_005_PASS_PAREN_NEW_METHOD
 * @expect compile-pass
 * @section 7.15
 * @design 验证带括号的 new 后调用方法 (new A).method()
 * @note 正向用例：括号包裹 new 表达式再调用方法
 */
class A {
  getVal(): int { return 42 }
}
let v: int = (new A).getVal()
