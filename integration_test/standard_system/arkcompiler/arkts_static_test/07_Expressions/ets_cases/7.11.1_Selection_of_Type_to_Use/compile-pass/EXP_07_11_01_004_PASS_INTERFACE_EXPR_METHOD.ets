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
 * @id EXP_07_11_01_004_PASS_INTERFACE_EXPR_METHOD
 * @expect compile-pass
 * @section 7.11.1
 * @design expression (interface) 形式：接口类型表达式调用方法
 * @note 正向用例：验证 obj.method() 中 obj 为接口类型时编译通过
 */
interface Drawable {
    draw(): void
}
class Circle implements Drawable {
    draw(): void {
        // empty
    }
    area(): int {
        return 3
    }
}
function render(d: Drawable): void {
    d.draw()
}
let c: Circle = new Circle()
let d: Drawable = c
d.draw()
render(d)
