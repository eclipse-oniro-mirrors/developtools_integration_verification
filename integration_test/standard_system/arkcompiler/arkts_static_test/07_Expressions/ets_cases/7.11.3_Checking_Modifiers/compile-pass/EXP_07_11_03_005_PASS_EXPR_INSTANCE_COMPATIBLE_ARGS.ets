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
 * @id EXP_07_11_03_005_PASS_EXPR_INSTANCE_COMPATIBLE_ARGS
 * @expect compile-pass
 * @section 7.11.3
 * @design expression.identifier 实例方法调用参数兼容性检查：参数类型匹配时通过
 * @note 正向用例：验证 expression 实例方法调用时，参数类型兼容性检查通过
 */
class Wrapper {
    public prefix: string

    constructor(p: string) {
        this.prefix = p
    }

    wrap(msg: string, times: int): string {
        let result: string = ''
        for (let i: int = 0; i < times; i++) {
            result = result + this.prefix + msg
        }
        return result
    }
}

function main(): void {
    let f: Wrapper = new Wrapper('-')
    let r: string = f.wrap('x', 3)
}
