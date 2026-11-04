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
 * @id EXP2_17_07_011_FAIL_NO_INVOKE_CLASS_NOT_CALLABLE
 * @expect compile-fail
 * @section 17.7
 * @design 没有声明 $_invoke 或 $_instantiate 的普通类不可作为函数调用
 * @note 反向用例：普通类（无 $_invoke/$_instantiate）尝试 C() 调用应编译失败
 */
class PlainClass {
  public value: int = 0
}

function testPlainClassNotCallable(): void {
  let r: int = PlainClass()
}
