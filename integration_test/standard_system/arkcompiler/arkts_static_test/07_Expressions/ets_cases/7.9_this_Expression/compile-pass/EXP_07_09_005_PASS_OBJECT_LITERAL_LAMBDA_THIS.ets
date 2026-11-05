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
 * @id EXP_07_09_005_PASS_OBJECT_LITERAL_LAMBDA_THIS
 * @expect compile-pass
 * @section 7.9
 * @design 对象字面量中 lambda 的 this 引用：lambda 体内 this 引用包围类（非对象字面量类型）
 * @note 正向用例：验证对象字面量中 lambda 的 this 指向包围类而非字面量
 */
interface IObj {
    method(): void
    getField: () => int
}
class Enclosing {
    public value: int = 77
    makeObj(): IObj {
        let obj: IObj = {
            method(): void {},
            getField: (): int => {
                return this.value
            }
        }
        return obj
    }
}
let e: Enclosing = new Enclosing()
let obj: IObj = e.makeObj()
let v: int = obj.getField()
