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
 * @id CLS_09_05_3_002_PASS_IMPLICIT_PUBLIC
 * @expect compile-pass
 * @section 9.5.3
 * @design 无修饰符默认public编译通过
 * @note 正向用例：无修饰符成员隐式为public
 */
class ImplicitPub {
  field: int = 0
  method(): void {}
}
function useImplicit(i: ImplicitPub): void {
  i.field = 1
  i.method()
}
