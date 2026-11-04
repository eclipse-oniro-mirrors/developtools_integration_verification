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
 * @id LEX_02_08_015_PASS_PUNCTUATORS
 * @expect compile-pass
 * @section 2.8
 * @design 标点符号 ( ) [ ] { } , ; . : 在表达式与语句中的使用
 * @note 正向用例：验证标点符号编译通过
 */
class Point015 {
  x: int = 0
  y: int = 0
}

function testPunctuators(): void {
  let arr: int[] = [1, 2, 3]
  let p: Point015 = new Point015()
  p.x = arr[0]
  p.y = arr[1]
  let val: int = (p.x + p.y) * 2
  for (let i: int = 0; i < arr.length; i++) {
    let item: int = arr[i]
  }
  let block: int = 0
  {
    block = 100
  }
}
