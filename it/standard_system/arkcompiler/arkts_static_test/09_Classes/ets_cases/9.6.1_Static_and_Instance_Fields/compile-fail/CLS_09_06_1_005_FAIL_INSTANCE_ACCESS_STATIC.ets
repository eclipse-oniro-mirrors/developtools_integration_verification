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
 * @id CLS_09_06_1_005_FAIL_INSTANCE_ACCESS_STATIC
 * @expect compile-fail
 * @section 9.6.1
 * @design 子类实例直接访问基类static成员（不继承）导致编译错�?
 * @note 反向用例：spec规定static成员不继承，需用类名访�?
 */
class StaticBase6 {
  static sVal: int = 1
}
class StaticSub6 extends StaticBase6 {
  useStatic(): void {
    let v: int = this.sVal
  }
}
