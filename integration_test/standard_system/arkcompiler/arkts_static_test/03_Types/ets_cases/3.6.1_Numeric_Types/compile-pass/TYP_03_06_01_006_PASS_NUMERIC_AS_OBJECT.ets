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
 * @id TYP_03_06_01_006_PASS_NUMERIC_AS_OBJECT
 * @expect compile-pass
 * @section 3.6.1
 * @design 数值类型是 Object 子类型，可赋值给 Object 变量
 * @note 正向用例：spec §3.6.1 数值类型可在任何接受 class 的位置使用
 */
function acceptObject(o: Object): void {}

function testNumericAsObject(): void {
  let b: byte = 1
  let s: short = 2
  let i: int = 3
  let l: long = 4
  let f: float = 5.0f
  let d: double = 6.0

  let o1: Object = b
  let o2: Object = s
  let o3: Object = i
  let o4: Object = l
  let o5: Object = f
  let o6: Object = d

  acceptObject(b)
  acceptObject(s)
  acceptObject(i)
  acceptObject(l)
  acceptObject(f)
  acceptObject(d)
}