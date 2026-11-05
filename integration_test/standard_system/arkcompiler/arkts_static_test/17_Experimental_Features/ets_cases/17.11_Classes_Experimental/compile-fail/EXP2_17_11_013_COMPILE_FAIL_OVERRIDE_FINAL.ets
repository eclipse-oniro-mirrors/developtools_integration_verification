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
 * @id EXP2_17_11_013_COMPILE_FAIL_OVERRIDE_FINAL
 * @expect compile-fail
 * @section 17.11
 * @design 验证重写 final 方法——应报编译错误
 * @note 反向用例：spec §17.11 禁止子类重写父类的 final 方法
 */
class Parent {
  final greet(): void { console.log('hi') }
}

class Child extends Parent {
  override greet(): void { console.log('hello') }
}

function main(): void {}
