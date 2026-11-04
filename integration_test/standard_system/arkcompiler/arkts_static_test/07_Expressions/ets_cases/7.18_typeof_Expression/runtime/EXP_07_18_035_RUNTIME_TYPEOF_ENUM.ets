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
 * @id EXP_07_18_035_RUNTIME_TYPEOF_ENUM
 * @expect runtime
 * @section 7.18
 * @design 验证 typeof enum 运行时值
 * @note 运行时用例：int 枚举→"int", string 枚举→"string"
 */
enum Color { R, G, B }
enum Direction { UP = 'up', DOWN = 'down' }

function main(): void {
    let c: Color = Color.R
    let tc: string = typeof c
    if (tc != 'int') {
        throw new Error('assertion failed: typeof int enum = ' + tc)
    }

    let d: Direction = Direction.UP
    let td: string = typeof d
    if (td != 'string') {
        throw new Error('assertion failed: typeof string enum = ' + td)
    }
console.log('verified')
}
