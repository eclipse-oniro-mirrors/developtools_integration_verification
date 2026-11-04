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
 * @id EXP_07_25_02_003_PASS_INT_FLOAT_PROMOTION
 * @expect compile-pass
 * @section 7.25.2
 * @design 验证 int+float→float 浮点提升，int-float→float。
 *         spec：如果提升类型是 float 或 double，则执行浮点算术。
 * @note 正向用例：int/float 混合运算浮点提升
 */
function main(): void {
  let i: int = 10
  let f: float = Double.toFloat(3.14)

  // int + float → float
  let r1 = i + f
  let t1 = typeof(r1)
  if (t1 != 'float') {
    throw new Error('int+float should be float, got ' + t1)
  }

  // float + int → float
  let r2 = f + i
  let t2 = typeof(r2)
  if (t2 != 'float') {
    throw new Error('float+int should be float, got ' + t2)
  }

  // int - float → float
  let r3 = i - f
  let t3 = typeof(r3)
  if (t3 != 'float') {
    throw new Error('int-float should be float, got ' + t3)
  }
console.log('verified')
}
main()
