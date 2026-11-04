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
 * @id TYP_03_06_04_008_PASS_BOOLEAN_AS_OBJECT
 * @expect compile-pass
 * @section 3.6.4
 * @design boolean 是 Object 子类型，可作 Object，new boolean → false
 * @note 正向用例：spec §3.6.4 例子原文
 *       注：嵌套函数移到顶层（TYP-002 已知设计问题）
 */
function acceptObject8(p: Object): void {}

function testBooleanAsObject(): void {
  // spec 原例
  let a_boolean = new boolean()
  let o: Object = a_boolean

  // boolean 作 Object 数组元素
  let arr: Object[] = [true, false, true]

  acceptObject8(true)
  acceptObject8(false)
}