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
 * @id TYP_03_06_02_005_PASS_INCR_DECR
 * @expect compile-pass
 * @section 3.6.2
 * @design 自增自减运算前缀/后缀
 * @note 正向用例：++ -- 前后缀
 */
function testIncrDecr(): void {
  let a: int = 10

  let pre: int = ++a    // 11
  let post: int = a++   // 11，运算后 a=12

  let preD: int = --a   // 11
  let postD: int = a--  // 11

  let lo: long = 100
  lo++
  ++lo
  lo--
  --lo
}