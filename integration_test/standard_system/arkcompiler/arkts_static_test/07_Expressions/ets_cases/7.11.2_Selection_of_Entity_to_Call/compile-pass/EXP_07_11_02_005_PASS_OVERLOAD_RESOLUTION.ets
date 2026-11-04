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
 * @id EXP_07_11_02_005_PASS_OVERLOAD_RESOLUTION
 * @expect compile-pass
 * @section 7.11.2
 * @design 重载解析：集合包含多个候选实体时，重载解析根据参数类型选择正确的方法
 * @note 正向用例：验证多个候选时 Overload Resolution 能选择匹配的方法
 */
class Overloaded {
    process(x: int): string {
        return 'int'
    }
    process(x: string): string {
        return 'string'
    }
    process(x: int, y: int): string {
        return 'two ints'
    }
}

function main(): void {
    let obj: Overloaded = new Overloaded()
    let r1: string = obj.process(42)
    let r2: string = obj.process('hello')
    let r3: string = obj.process(1, 2)
}
