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
 * @id EXP2_17_09_2_006_PASS_METHODOVERLOAD_PUBLICACCESS
 * @expect compile-pass
 * @section 17.9.2
 * @design public overload → 所有方法必须 public
 * @note 正向用例：所有方法都是 public
 */
class AccessDemo {
  public methodA(a: int): int { return a }
  public methodB(a: string): int { return a.length }
  public methodC(a: double): int { return new Double(a).toInt() }
  public overload transform { methodA, methodB, methodC }
}
