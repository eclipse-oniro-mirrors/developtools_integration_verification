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
 * @id TYP_03_07_008_PASS_MULTIPLE_REFERENCES
 * @expect compile-pass
 * @section 3.7
 * @design 多个变量持有同一对象引用（spec §3.7 关键语义）
 * @note 正向用例：多引用同对象
 */
class Box8 {
  v: int = 0
}

function testMultipleReferences(): void {
  let b1: Box8 = new Box8()
  let b2: Box8 = b1   // 同一对象，两个引用
  let b3: Box8 = b2
}