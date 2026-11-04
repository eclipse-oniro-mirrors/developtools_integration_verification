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
 * @id EXP2_17_09_3_005_PASS_INTERFACEOVERLOAD_INHERIT
 * @expect compile-pass
 * @section 17.9.3
 * @design 实现类不 override，继承接口 overload
 * @note 正向用例：实现类不显式定义 overload
 */
interface IFormat {
  fmtInt(a: int): string
  fmtStr(a: string): string
  overload fmt { fmtInt, fmtStr }
}

abstract class AbstractFmt implements IFormat {
  fmtInt(a: int): string { return 'int:' + a }
  fmtStr(a: string): string { return 'str:' + a }
  // 不显式声明 overload，继承接口的
}
