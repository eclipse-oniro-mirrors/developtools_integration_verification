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
 * @id EXP2_17_09_4_001_PASS_NAMECONFLICT_CROSSINHERITANCE
 * @expect compile-pass
 * @section 17.9.4
 * @design overload 名与父类方法同名，跨继承层次工作
 * @note 正向用例：子类中 overload 名与父类方法同名
 */
class Parent {
  handle(a: int): string { return 'parent-int:' + a }
  handleStr(a: string): string { return 'parent-str:' + a }
  overload handle { handle, handleStr }
}

class Child extends Parent {
  handleBool(a: boolean): string { return 'child-bool:' + a }
  // overload 名 "handle" 与父类方法同名，跨继承层次
  overload handle { handle, handleStr, handleBool }
}
