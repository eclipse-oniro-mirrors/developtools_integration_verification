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
 * @id SEM_15_08_00_203_RUNTIME_SMART_GLOBAL_overload_declared_base_top_level
 * @expect runtime
 * @section 15.8
 * @design 椤跺眰/鍏ㄥ眬 Base receiver 淇濆瓨 Derived 瀵硅薄鍚庤皟鐢?overload锛屽簲鎸?Base 澹版槑绫诲瀷瑙ｆ瀽銆?
 * @note Cross-cutting smart type scope case: global/function-scope behavior per section.
 */

class OverBase {
  overload pick { pickNumber, pickString }
  pickNumber(p: number): string { return 'base-number' }
  pickString(p: string): string { return 'base-string' }
}

class OverDerived extends OverBase {
  pickInt(p: int): string { return 'derived-int' }
  overload pick { pickInt, pickNumber, pickString }
}

let globalDerived: OverDerived = new OverDerived()
let globalBase: OverBase = globalDerived
let globalResult: string = globalBase.pick(9)

function main(): void {
  arktest.assertEQ(globalResult, 'base-number')
}



