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
/*
 * @id SEM_15_08_00_003_PASS_FUNC_instanceof_interface
 * @expect compile-pass
 * @section 15.8
 * @design 局部变量经 `instanceof` 接口缩窄后调用接口方法。
 * @note Generated one-to-one from test_design.
 */

function sem1508FuncPass002InstanceofInterface(): void {
  let value: int = 1
  value = value + 1
}

