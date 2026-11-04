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
 * @id EXP2_17_09_3_009_FAIL_INTERFACEOVERLOAD_OVERRIDEMISSING
 * @expect compile-fail
 * @section 17.9.3
 * @design 实现类 override 接口 overload 但缺少方法 — 编译错误
 * @note 反向用例：实现类 override overload 但方法不完整
 */
interface IService {
  svcInt(a: int): string
  svcStr(a: string): string
  overload service { svcInt, svcStr }
}

class BadService implements IService {
  svcInt(a: int): string { return 'int:' + a }
  svcStr(a: string): string { return 'str:' + a }
  // 缺少 svcStr — 应编译失败
  overload service { svcInt }
}
