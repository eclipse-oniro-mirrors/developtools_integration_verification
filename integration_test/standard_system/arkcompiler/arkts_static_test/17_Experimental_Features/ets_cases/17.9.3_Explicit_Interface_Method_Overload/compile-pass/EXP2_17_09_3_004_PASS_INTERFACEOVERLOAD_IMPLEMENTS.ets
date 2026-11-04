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
 * @id EXP2_17_09_3_004_PASS_INTERFACEOVERLOAD_IMPLEMENTS
 * @expect compile-pass
 * @section 17.9.3
 * @design 实现类 override 接口 overload，包含所有方法
 * @note 正向用例：实现类正确 override
 */
interface IFoo {
  fooInt(a: int): string
  fooStr(a: string): string
  overload foo { fooInt, fooStr }
}

class FooImpl implements IFoo {
  fooInt(a: int): string { return 'int:' + a }
  fooStr(a: string): string { return 'str:' + a }
  overload foo { fooInt, fooStr }
}
