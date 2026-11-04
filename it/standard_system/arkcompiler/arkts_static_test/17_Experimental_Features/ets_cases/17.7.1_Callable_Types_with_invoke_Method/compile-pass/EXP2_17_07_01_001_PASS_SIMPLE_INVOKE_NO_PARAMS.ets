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
 * @id EXP2_17_07_01_001_PASS_SIMPLE_INVOKE_NO_PARAMS
 * @expect compile-pass
 * @section 17.7.1
 * @design 定义无参数的 static $_invoke 方法，使类成为可调用类型。短形式 ClassName() 和显式 ClassName.$_invoke() 均可编译通过。
 * @note 正向用例：验证无参 static $_invoke 的基本定义和两种调用形式均可编译
 */
class SimpleInvoke {
    static $_invoke(): void {
        console.log('SimpleInvoke called')
    }
}

function testSimpleInvoke(): void {
    SimpleInvoke()
    SimpleInvoke.$_invoke()
}
