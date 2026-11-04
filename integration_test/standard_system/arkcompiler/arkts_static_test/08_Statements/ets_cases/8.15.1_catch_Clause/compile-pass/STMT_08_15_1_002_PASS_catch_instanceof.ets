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
 * @id STMT_08_15_1_002_PASS_catch_instanceof
 * @expect compile-pass
 * @section 8.15.1
 * @design 验证 catch 块内使用 instanceof 对 Error 子类型进行类型收窄，分别处理不同类型错误。
 * @note 正向测试：catch 标识符类型为 Error，通过 instanceof 区分 RangeError、TypeError 等子类型。
 */
function testCatchInstanceof(): void {
    try {
        throw new RangeError("range error");
    } catch (e) {
        if (e instanceof RangeError) {
            let rangeMsg: string = e.message;
        } else if (e instanceof TypeError) {
            let typeMsg: string = e.message;
        } else {
            let defaultMsg: string = e.message;
        }
    }
}
