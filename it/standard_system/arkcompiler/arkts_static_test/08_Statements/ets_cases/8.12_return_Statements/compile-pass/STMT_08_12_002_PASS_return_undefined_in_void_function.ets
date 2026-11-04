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
 * @id STMT_08_12_002_PASS_return_undefined_in_void_function
 * @expect compile-pass
 * @section 8.12
 * @design 测试void函数中return undefined语句
 * @note 正向测试：void函数允许使用return undefined，因为undefined可赋值给void返回类型
 */
function testReturnUndefinedInVoidFunction(): void {
    return undefined;
}
