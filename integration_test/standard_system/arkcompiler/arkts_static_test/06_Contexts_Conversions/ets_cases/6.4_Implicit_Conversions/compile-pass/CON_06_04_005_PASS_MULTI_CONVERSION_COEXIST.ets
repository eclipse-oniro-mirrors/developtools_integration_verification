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
 * @id CON_06_04_005_PASS_MULTI_CONVERSION_COEXIST
 * @expect compile-pass
 * @section 6.4
 * @design 多种隐式转换在同一函数中共存: widening + enum→numeric + enum→string
 * @note 正向用例：验证多种转换类型可共存
 */
enum Val {
  X = 10,
  Y = 20
}

enum Tag {
  Open = 'open',
  Close = 'close'
}

function testMultiConversionCoexist(): void {
  let a: int = Val.X
  let b: long = a
  let c: string = 'tag: ' + Tag.Open
  let d: int = Val.Y + 5
}
