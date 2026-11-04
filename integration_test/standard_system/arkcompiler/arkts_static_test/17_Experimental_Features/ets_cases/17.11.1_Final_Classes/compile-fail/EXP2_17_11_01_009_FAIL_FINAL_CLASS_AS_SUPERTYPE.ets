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
 * @id EXP2_17_11_01_009_FAIL_FINAL_CLASS_AS_SUPERTYPE
 * @expect compile-fail
 * @section 17.11.1
 * @design final 类不能作为父类（supertype）：验证任何类试图以 final 类作为 super 类型时应产生编译时错误
 * @note 反向用例：验证以 final 类作为 extends 目标时产生 ESE0178 编译错误
 */
final class SuperFinal { public data: string = 'sealed'
}

class ChildWithConstructor extends SuperFinal {
  constructor() { super() }}
