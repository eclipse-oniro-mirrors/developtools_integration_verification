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
 * @id EXP_07_10_02_001_PASS_BASIC_FIELD_ACCESS
 * @expect compile-pass
 * @section 7.10.2
 * @design 基本实例字段访问：通过 obj.field 语法读取实例字段
 * @note 正向用例：验证实例字段访问时 objectReference 采用 primaryExpression 形式
 */
class Point {
    public x: int = 10
    public y: int = 20
}
let p: Point = new Point()
let px: int = p.x
let py: int = p.y
