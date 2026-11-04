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
 * @id EXP2_17_09_4_006_FAIL_NAMECONFLICT_CROSSINHERITANCEFAIL
 * @expect compile-fail
 * @section 17.9.4
 * @design 跨继承层次，父类方法不在子类 overload 列表中 — 编译错误
 * @note 反向用例：子类 overload 名与父类方法同名但未列出父类方法
 */
class Ancestor {
  transform(a: int): string { return 'int:' + a }
  transformStr(a: string): string { return 'str:' + a }
  overload transform { transform, transformStr }
}

class Descendant extends Ancestor {
  transform(a: int): string { return 'override-int:' + a }
  transformStr(a: string): string { return 'override-str:' + a }
  transformBool(a: boolean): string { return 'override-bool:' + a }
  // overload 名 "transform" 与父类方法同名
  // 但列表只包含 transformStr 和 transformBool，不包含 transform — 编译错误
  overload transform { transformStr, transformBool }
}
