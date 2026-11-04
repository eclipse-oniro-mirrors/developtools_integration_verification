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
 * @id EXP2_17_15_007_FAIL_GETTER_AS_CALL
 * @expect compile-fail
 * @section 17.15
 * @design Getter 作为调用表达式使用（getter()），应编译失败
 * @note 反向用例：getter 不是函数，不能作为调用表达式
 *        编译器报 ESE0289: This expression is not callable
 */
get theAnswer(): int {
  return 42
}

let x: int = theAnswer()
