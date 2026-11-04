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
 * @id EXP2_17_10_006_PASS_NATIVE_MULTI_DECL
 * @expect compile-pass
 * @section 17.10
 * @design 验证多个 native 声明编译通过
 * @note 正向用例：一个类中混?native 函数、方法、构造器的声?
 */
native function initLib(): void

class Service {
  native connect(url: string): boolean
  native constructor()
}

function main(): void {
  let s: Service = new Service()
  console.log('multiple native declarations')
}

