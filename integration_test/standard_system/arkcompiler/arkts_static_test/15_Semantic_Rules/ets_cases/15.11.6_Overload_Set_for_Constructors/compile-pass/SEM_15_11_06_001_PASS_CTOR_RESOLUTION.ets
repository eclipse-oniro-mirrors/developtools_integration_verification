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
 * @id SEM_15_11_06_001_PASS_CTOR_RESOLUTION
 * @expect compile-pass
 * @section 15.11.6
 * @design 验证构造函数重载解析
 * @note 正向用例：构造函数根据实参类型选择正确的重载
 */
class Point {
  constructor(x: int, y: int) {}
  constructor(x: int) {}
}
function main(): void {
  let p = new Point(1);
}
