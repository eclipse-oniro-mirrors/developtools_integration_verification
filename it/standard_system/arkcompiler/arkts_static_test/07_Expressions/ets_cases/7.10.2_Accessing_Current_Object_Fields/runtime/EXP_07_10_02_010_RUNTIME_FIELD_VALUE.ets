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
 * @id EXP_07_10_02_010_RUNTIME_FIELD_VALUE
 * @expect runtime
 * @section 7.10.2
 * @design 运行时验证实例字段值：对象创建后字段值正确
 * @note 运行时用例：验证实例字段在运行时具有正确的初始值
 */
class Point {
    public x: int = 3
    public y: int = 4
}
function main(): void {
    let p: Point = new Point()
    if (p.x != 3) {
        throw new Error('assertion failed: x field value')
    }
    if (p.y != 4) {
        throw new Error('assertion failed: y field value')
    }
console.log('verified')
}
