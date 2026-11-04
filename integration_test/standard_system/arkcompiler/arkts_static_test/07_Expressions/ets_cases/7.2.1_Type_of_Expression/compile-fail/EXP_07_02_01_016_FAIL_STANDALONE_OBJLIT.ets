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
 * @id EXP_07_02_01_016_FAIL_STANDALONE_OBJLIT
 * @expect compile-fail
 * @section 7.2.1
 * @design standalone 对象字面量无法推断类型，应编译时错误
 * @note 反向用例：验证 standalone object literal 无法推断类型，参考 spec: `let x = {x: 10, y: 10}` 报错
 */
class Point {
  public x: int = 0
  public y: int = 0
}

function testStandaloneObjLit(): void {
  let p = {x: 10, y: 10}
}
