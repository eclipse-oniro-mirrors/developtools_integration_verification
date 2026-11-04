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
 * @id EXP2_17_07_007_PASS_EXPLICIT_INVOKE_AND_INSTANTIATE
 * @expect compile-pass
 * @section 17.7
 * @design 显式调用形式 C.$_invoke() 和 C.$_instantiate() 也是合法调用
 * @note 正向用例：验证显式调用形式编译通过
 */
class ExplicitInvoke {
  static $_invoke(): string {
    return 'called'
  }
}

class ExplicitInstantiate {
  static $_instantiate(): ExplicitInstantiate {
    return new ExplicitInstantiate()
  }
}

function testExplicitCalls(): void {
  let s: string = ExplicitInvoke.$_invoke()
  let obj: ExplicitInstantiate = ExplicitInstantiate.$_instantiate()
}
