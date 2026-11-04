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
 * @id EXP2_17_09_2_001_PASS_METHODOVERLOAD_ASYNC
 * @expect compile-pass
 * @section 17.9.2
 * @design async overload 包含 async 方法
 * @note 正向用例：所有方法都是 async
 */
class AsyncHandler {
  async handleInt(a: int): Promise<string> { return 'int:' + a }
  async handleStr(a: string): Promise<string> { return 'str:' + a }
  async overload handle { handleInt, handleStr }
}
