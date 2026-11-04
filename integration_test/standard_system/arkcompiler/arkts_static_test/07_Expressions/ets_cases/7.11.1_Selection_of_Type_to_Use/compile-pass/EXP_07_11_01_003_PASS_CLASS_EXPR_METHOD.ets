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
 * @id EXP_07_11_01_003_PASS_CLASS_EXPR_METHOD
 * @expect compile-pass
 * @section 7.11.1
 * @design expression (class) 形式：类实例表达式调用实例方法
 * @note 正向用例：验证 obj.method() 中 obj 为类类型时编译通过
 */
class Point {
    public x: int = 0
    public y: int = 0
    move(dx: int, dy: int): void {
        this.x = this.x + dx
        this.y = this.y + dy
    }
    distance(): int {
        return this.x * this.x + this.y * this.y
    }
}
let p: Point = new Point()
p.move(3, 4)
let d: int = p.distance()
