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
 * @id EXP2_17_10_02_010_FAIL_NATIVE_ABSTRACT_COMBINATION
 * @expect compile-fail
 * @section 17.10.2
 * @design native 与 abstract 不能组合使用：验证 native abstract 方法产生编译错误 ESE0047
 * @note 反向用例：验证该场景应产生编译时错误 - an abstract method can't have ... native modifier
 */
class BadCombination {
  native abstract foo(): void
}
