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
 * @id CON_06_04_02_002_PASS_SUBTYPING
 * @expect compile-pass
 * @section 6.4.2
 * @design 子类型: int→byte|int (int已是联合成员，无需求 widening)
 * @note 正向用例：值类型已是联合成员，直接子类型赋值
 */
function testSubtyping(): void {
  let i: int = 2
  let u: byte | int = 512
  u = i
}
