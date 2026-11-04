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
 * @id EXP2_17_09_3_008_FAIL_INTERFACEOVERLOAD_NOTIMPLEMENTALL
 * @expect compile-fail
 * @section 17.9.3
 * @design 实现接口 overload 但未实现该方法 — 编译错误
 * @note 反向用例：类不实现接口方法但声称实现了接口
 */
interface IRequired {
  reqInt(a: int): string
  reqStr(a: string): string
  overload required { reqInt, reqStr }
}

class IncompleteImpl implements IRequired {
  reqInt(a: int): string { return 'int:' + a }
  // 缺少 reqStr 实现 — 应编译失败
  overload required { reqInt }
}
