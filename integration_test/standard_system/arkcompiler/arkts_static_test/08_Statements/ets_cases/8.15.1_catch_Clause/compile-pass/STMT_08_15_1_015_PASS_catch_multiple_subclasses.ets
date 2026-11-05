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
 * @id STMT_08_15_1_015_PASS_catch_multiple_subclasses
 * @expect compile-pass
 * @section 8.15.1
 * @design 验证 catch 块中使用 instanceof 对三个以上 Error 子类型进行类型收窄，代码能够通过编译。
 * @note 正向测试：通过 instanceof 区分 RangeError、TypeError、SyntaxError 等多个子类型，各分支访问 e.message。
 */
class MySyntaxErr extends Error {}

function testCatchMultipleSubclasses(): void {
    try {
        throw new RangeError("range error");
    } catch (e) {
        if (e instanceof RangeError) {
            let msg: string = e.message;
        } else if (e instanceof TypeError) {
            let msg: string = e.message;
        } else if (e instanceof SyntaxError) {
            let msg: string = e.message;
        } else {
            let msg: string = e.message;
        }
    }
}
