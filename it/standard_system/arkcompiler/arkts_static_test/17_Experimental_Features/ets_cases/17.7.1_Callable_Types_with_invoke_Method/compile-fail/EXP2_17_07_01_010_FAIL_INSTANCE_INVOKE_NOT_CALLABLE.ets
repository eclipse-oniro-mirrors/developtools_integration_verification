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
 * @id EXP2_17_07_01_010_FAIL_INSTANCE_INVOKE_NOT_CALLABLE
 * @expect compile-fail
 * @section 17.7.1
 * @design 根据 spec，实例 $_invoke 方法不会使类成为可调用类型。尝试以 ClassName() 调用仅含实例 $_invoke 的类应产生编译时错误。
 * @note 反向用例：验证实例 $_invoke 不会使类可调用，ClassName() 应编译失败
 */
class OnlyInstanceInvoke {
    $_invoke(): void {
        console.log('instance invoke only')
    }
}

function testCallFail(): void {
    OnlyInstanceInvoke()
}
