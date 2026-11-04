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
 * @id EXP_07_04_02_009_RUNTIME_INSTANCE_BINDING
 * @expect runtime
 * @section 7.4.2
 * @design 实例绑定运行时验证：验证不同实例的方法引用各自绑定到对应实例
 * @note 运行时用例：m1 绑定到 c1，m2 绑定到 c2，修改 c1.field 后 m1() 返回新值，m2() 返回旧值
 */
class C {
  public field: int = 123
  method(): int {
    return this.field
  }
}

function main(): void {
  let c1 = new C()
  let c2 = new C()
  let m1 = c1.method  // c1 被绑定
  let m2 = c2.method  // c2 被绑定

  c1.field = 42
  let r1 = m1()
  let r2 = m2()

  if (r1 != 42) {
    throw new Error('assertion failed: m1() = ' + r1 + ', expected 42')
  }
  if (r2 != 123) {
    throw new Error('assertion failed: m2() = ' + r2 + ', expected 123')
  }
console.log('verified')
}
