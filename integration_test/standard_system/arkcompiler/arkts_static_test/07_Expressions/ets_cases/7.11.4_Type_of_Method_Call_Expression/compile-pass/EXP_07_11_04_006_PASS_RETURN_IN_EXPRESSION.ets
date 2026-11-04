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
 * @id EXP_07_11_04_006_PASS_RETURN_IN_EXPRESSION
 * @expect compile-pass
 * @section 7.11.4
 * @design 验证方法返回值在表达式中使用，编译通过
 * @note 正向用例：多个方法返回值参与表达式运算，编译通过
 */
class Point {
  getX(): int {
    return 3;
  }
  getY(): int {
    return 4;
  }
}

function main(): void {
  let p: Point = new Point();
  let sum: int = p.getX() + p.getY();
  let product: int = p.getX() * p.getY();
}
