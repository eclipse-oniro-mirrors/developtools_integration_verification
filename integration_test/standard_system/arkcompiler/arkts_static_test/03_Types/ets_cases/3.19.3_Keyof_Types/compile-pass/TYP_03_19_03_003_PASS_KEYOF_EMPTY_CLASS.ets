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
 * @id TYP_03_19_03_003_PASS_KEYOF_EMPTY_CLASS
 * @expect compile-pass
 * @section 3.19.3
 * @design keyof 空类等价 never，类型声明本身合法
 * @note 正向用例：仅声明不赋值
 */
class EmptyClass3 {}
type KeysOfEmpty3 = keyof EmptyClass3

function testKeyofEmptyClass(): void {
  // 不产生值，仅验证类型定义合法
}