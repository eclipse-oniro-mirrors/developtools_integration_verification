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
 * @id NAM_04_03_009_PASS_INTERFACE_SCOPE
 * @expect compile-pass
 * @section 4.3
 * @design 接口作用域：接口成员在外部可访问（默认 public）
 * @note 正向用例：验证接口级别作用域下成员对外可访问（§4.3 行 327-328）
 */
interface Shape {
    area(): number;
}
class Circle implements Shape {
    area(): number { return 314; }
}
let c: Shape = new Circle();
