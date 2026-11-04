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
 * @id EXP_07_02_01_024_RUNTIME_OBJLIT_TARGET
 * @expect runtime
 * @section 7.2.1
 * @design 对象字面量在 target type 下正确构造
 * @note 运行时用例：验证 object literal with target type 运行时正确
 */
class Point {
  public x: int = 0
  public y: int = 0
}

function main(): void {
  let p: Point = {x: 10, y: 20}
  if (p.x != 10 || p.y != 20) {
    throw new Error('assertion failed: point fields incorrect')
  }
console.log('verified')
}
