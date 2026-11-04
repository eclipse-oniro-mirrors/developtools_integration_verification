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
 * @id EXP_07_11_02_006_PASS_INTERFACE_EXPR_METHOD
 * @expect compile-pass
 * @section 7.11.2
 * @design 接口表达式形式：通过接口类型表达式调用实例方法，候选集合包含接口的实例方法
 * @note 正向用例：验证 expression with interface type 能找到接口 T 中名为 identifier 的实例方法
 */
interface Drawable {
    draw(): string
    getSize(): int
}

class Circle implements Drawable {
    draw(): string {
        return 'Circle'
    }
    getSize(): int {
        return 10
    }
}

function main(): void {
    let d: Drawable = new Circle()
    let s: string = d.draw()
    let sz: int = d.getSize()
}
