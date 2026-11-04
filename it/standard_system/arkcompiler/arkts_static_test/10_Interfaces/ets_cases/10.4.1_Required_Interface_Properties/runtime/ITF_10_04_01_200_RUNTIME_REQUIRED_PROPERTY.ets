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
 * @id ITF_10_04_01_200_RUNTIME_REQUIRED_PROPERTY
 * @expect runtime
 * @section 10.4.1
 * @design 必需属性运行时验证
 * @note 运行时用例：验证必需属性在运行时正确
 */
interface Point {
    x: number;
    y: number;
}
class Coord implements Point {
    x: number = 10;
    y: number = 20;
}
function main(): void {
    let c: Coord = new Coord();
    if (c.x != 10 || c.y != 20) throw new Error("assertion failed");

    console.log("verified");
}